FROM debian:12

# Install vsftpd
RUN apt-get update && apt-get install -y vsftpd

# Copy vsftpd configuration
COPY ./tools/vsftpd.conf /etc/vsftpd.conf

# Start vsftpd
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]