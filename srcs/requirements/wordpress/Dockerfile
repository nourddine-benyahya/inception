FROM debian:12

RUN apt-get clean && apt-get update && apt-get install -y \
    php-cgi \
    php-common \
    php-fpm \
    php-mbstring \
    php-mysql \
    php-zip \
    curl \
    wget 
# RUN curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

COPY ./tools/setup.sh .

RUN chmod 777 setup.sh

EXPOSE 9000

CMD [ "bash", "setup.sh" ]
