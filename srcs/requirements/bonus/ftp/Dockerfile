FROM debian:12

# Install vsftpd
RUN apt-get update && apt-get install -y vsftpd

# Copy configuration and setup files
COPY ./tools/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/setup.sh

# Run the setup script and start vsftpd
CMD ["/usr/local/bin/setup.sh"]
