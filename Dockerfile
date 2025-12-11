FROM php:8.2-apache

# Install MySQL + PHP Extensions
RUN apt-get update && apt-get install -y default-mysql-server default-mysql-client
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy project files
COPY . /var/www/html/

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Apache port
EXPOSE 80

# Start the startup script
CMD ["/start.sh"]
