FROM debian:12

# Set the working directory
WORKDIR /wordpress

# Install necessary packages
RUN apt-get update && apt-get install -y php-fpm php-mysql wget tar curl

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Configure php-fpm
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/*/fpm/php-fpm.conf && \
    sed -i 's/listen = \/run\/php\/php.*-fpm.sock/listen = 9000/' /etc/php/*/fpm/pool.d/www.conf

# Expose the port for php-fpm
EXPOSE 9000

# Start php-fpm
CMD ["yes", "> /dev/null | php-fpm"]