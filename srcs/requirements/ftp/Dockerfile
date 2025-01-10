FROM debian:12

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/setup.sh ./

EXPOSE 21

CMD ["bash", "./setup.sh"]