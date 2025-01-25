#!/bin/bash

# Create the FTP user and set the password
FTP_USER="ftpuser"
FTP_PASS="ftppassword"

# Create the user without creating the home directory
useradd -M -d /var/www/html/wordpress -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress
chmod -R a-w /var/www/html/wordpress

mkdir -p /var/run/vsftpd/empty
chown -R $FTP_USER:$FTP_USER /var/run/vsftpd/empty
chmod -R a-w /var/run/vsftpd/empty

# Start vsftpd
/usr/sbin/vsftpd /etc/vsftpd.conf