FROM debian:12

RUN apt-get update && \
    apt-get install -y php php-mysql wget 

COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh


CMD ["sh", "/tmp/setup.sh"]