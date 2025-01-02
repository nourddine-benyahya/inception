#!/bin/bash

mkdir /run/mysqld/
chmod 777 /run/mysqld/
chown -R mysql:mysql /run/mysqld/
chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

<< EOF cat > init.sql
use mysql;
flush privileges; 
create database wordpress;
grant all privileges on wordpress.* TO 'n0urddine'@'%' identified by 'password';
flush privileges;
EOF

mariadbd --user=mysql --bootstrap < init.sql

