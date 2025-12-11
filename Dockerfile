FROM php:8.2-apache

# Enable mysqli and pdo_mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-install sockets


# Copy project files into Apache web root
COPY . /var/www/html/

# Expose port
EXPOSE 80

# Set the working directory
WORKDIR /var/www/html/

# Start Apache server
CMD ["apache2-foreground"]
