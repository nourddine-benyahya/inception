FROM debian:12

WORKDIR /nginx

RUN apt-get update && apt-get install nginx -y

COPY testServer.html /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
