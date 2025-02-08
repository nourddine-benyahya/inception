FROM debian:12

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

CMD ["/usr/local/bin/setup.sh"]
