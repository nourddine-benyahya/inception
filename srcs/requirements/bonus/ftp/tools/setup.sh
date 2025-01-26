#!/bin/bash

export $(cat /run/secrets/credentials | xargs)

if [ -z "$FTP_USER" ] || [ -z "$FTP_PASSWORD" ]; then
    echo "Error: FTP_USER or FTP_PASSWORD is not set."
    exit 1
fi

useradd -M -d /var/www/html/wordpress -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress
chmod -R a-w /var/www/html/wordpress

mkdir -p /var/run/vsftpd/empty
chown -R $FTP_USER:$FTP_USER /var/run/vsftpd/empty
chmod -R a-w /var/run/vsftpd/empty

exec /usr/sbin/vsftpd /etc/vsftpd.conf