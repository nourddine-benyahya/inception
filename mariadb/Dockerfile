FROM debian:12

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server -y

COPY ./setup.sh .

RUN chmod 777 setup.sh && ./setup.sh

CMD ["mariadbd", "--user=mysql", "--bind-address", "0.0.0.0"]
