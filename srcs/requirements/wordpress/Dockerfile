FROM debian:12

RUN apt-get update && apt-get install -y \
    php-cgi \
    php-common \
    php-fpm \
    php-redis \
    php-mbstring \
    php-mysql \
    php-zip \
    curl 

COPY ./tools/setup.sh .

RUN chmod 777 setup.sh

CMD [ "bash", "setup.sh" ]
