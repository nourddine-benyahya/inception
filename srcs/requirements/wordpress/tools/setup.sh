#!/bin/bash

#load environment
DB_ROOT_PASSWORD=$(cat "/run/secrets/db_root_password")
DB_PASSWORD=$(cat "/run/secrets/db_password")
export $(cat /run/secrets/credentials | xargs)

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_ROOT_PASSWORD" ] || [ -z "$DB_PASSWORD" ] \
    || [ -z "$WP_TITLE" ] || [ -z "$WP_ADMIN_USERNAME" ] || [ -z "$WP_ADMIN_PASSWORD" ] \
    || [ -z "$WP_ADMIN_EMAIL" ] || [ -z "$WP_USER_USERNAME" ] || [ -z "$WP_USER_EMAIL" ] || [ -z "$WP_USER_PASSWORD" ]  ; then
    echo "Error: DB_NAME or DB_USER or DB_ROOT_PASSWORD or DB_PASSWORD is not set."
    exit 1
fi

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

# install wp-cli
curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /bin/wp

# install and configure wordpress
wp core download --path=/var/www/html/wordpress --allow-root
cd /var/www/html/wordpress
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb:3306 --allow-root
wp config set WP_CACHE true --raw --type=constant --allow-root
wp core install --url="localhost" --title=${WP_TITLE} --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
wp user create ${WP_USER_USERNAME} ${WP_USER_EMAIL} --role=subscriber --user_pass=${WP_USER_PASSWORD} --allow-root
wp theme install twentytwentyfour --allow-root
wp theme activate twentytwentyfour --allow-root

chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# configure php-fpm

fi

sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F