FROM php:8.2-apache

# Install MySQL server + PHP extensions
RUN apt-get update && apt-get install -y default-mysql-server default-mysql-client
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy app files
COPY . /var/www/html/

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Apache
EXPOSE 80

# Run startup script at container boot
CMD ["/start.sh"]
