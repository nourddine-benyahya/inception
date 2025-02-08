#!/bin/bash

mkdir -p /var/www/html 

rm -rf /var/www/html/index.php

wget https://www.adminer.org/latest.php -O /var/www/html/index.php

chown -R www-data:www-data /var/www/html/

chmod -R 755 /var/www/html/

exec php -S  0.0.0.0:9090 -t /var/www/html