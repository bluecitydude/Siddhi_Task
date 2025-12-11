FROM php:8.2-apache

# Install MySQL server and PHP extensions
RUN apt-get update && apt-get install -y default-mysql-server default-mysql-client
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy project files
COPY . /var/www/html/

# Start MySQL, create DB, create table, insert data (embedded SQL)
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS siddhi_tasks;" && \
    mysql siddhi_tasks -e "\
        CREATE TABLE \`students\` ( \
          \`id\` int(11) NOT NULL, \
          \`Name\` varchar(50) NOT NULL, \
          \`Class\` varchar(50) NOT NULL, \
          \`Contact_Details\` bigint(10) NOT NULL, \
          \`login_time\` timestamp NOT NULL DEFAULT current_timestamp(), \
          \`device\` varchar(50) NOT NULL \
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; \
        \
        INSERT INTO \`students\` (\`id\`, \`Name\`, \`Class\`, \`Contact_Details\`, \`login_time\`, \`device\`) VALUES \
        (1, 'Tejendra Purohit', 'BCA V SEM', 7424911886, '2025-12-10 12:27:08', ''), \
        (2, 'TP', 'BCA III year', 1234567810, '2025-12-10 12:29:51', ''); \
        \
        ALTER TABLE \`students\` ADD PRIMARY KEY (\`id\`); \
        ALTER TABLE \`students\` MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3; \
    "

# Expose Apache port
EXPOSE 80

# Start MySQL + Apache when container starts
CMD service mysql start && apache2-foreground
