FROM debian:12

RUN apt-get update && apt-get install redis-server -y
RUN sed -i 's/^bind 127.0.0.1 -::1/bind 0.0.0.0/' /etc/redis/redis.conf
EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
