FROM debian:12

RUN apt-get update \
    && apt-get install nginx -y curl openssl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/CN=nourddine.benyahya02.com"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
