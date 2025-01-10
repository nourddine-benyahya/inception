FROM debian:12

RUN apt-get update && apt-get install redis-server -y

COPY ./tools/setup.sh ./
EXPOSE 6379

CMD ["bash", "./setup.sh"]
