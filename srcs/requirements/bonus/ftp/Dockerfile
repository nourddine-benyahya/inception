FROM debian:12

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    apt-get clean

# Copy configuration and setup files
COPY ./tools/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/setup.sh

# Expose FTP port
EXPOSE 21

# Run the setup script and start vsftpd
CMD ["/usr/local/bin/setup.sh"]
