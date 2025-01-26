FROM debian:12

RUN apt-get update && apt-get install mariadb-server -y

COPY ./tools/setup.sh .

RUN chmod 777 ./setup.sh

CMD ["sh", "setup.sh"]