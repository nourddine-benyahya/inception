#!/bin/bash

DB_ROOT_PASSWORD=$(cat "/run/secrets/db_root_password")
DB_PASSWORD=$(cat "/run/secrets/db_password")

mkdir /run/mysqld/
chown -R mysql:mysql /run/mysqld/
chmod 777 /run/mysqld/
chown -R mysql:mysql /var/lib/mysql
chmod -R 777 /var/lib/mysql

if [ ! -d /var/lib/mysql/${DB_NAME} ]; then

cat << EOF > init.sql
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
mariadbd --user=mysql --bootstrap < init.sql
rm -fr init.sql

fi

rm -fr setup.sh
mariadbd --user=mysql --bind-address 0.0.0.0