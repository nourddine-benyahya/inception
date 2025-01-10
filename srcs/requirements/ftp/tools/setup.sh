#!/bin/sh

sed -i 's/^#anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf
sed -i 's/^#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/^#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf
# //allow writable chroot
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
#min and max port
echo "pasv_min_port=30000" >> /etc/vsftpd.conf
echo "pasv_max_port=30010" >> /etc/vsftpd.conf

#create ftp user
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
adduser ftpuser
usermod -d /var/www/html/wordpress ftpuser
usermod -aG www-data ftpuser

#bind 0.0.0.0
echo "listen=YES" >> /etc/vsftpd.conf
echo "listen_ipv6=NO" >> /etc/vsftpd.conf
echo "listen_address=0.0.0.0" >> /etc/vsftpd.conf


/usr/sbin/vsftpd /etc/vsftpd.conf
yes > /dev/null