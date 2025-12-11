#!/bin/bash

# Start MySQL server manually (this works in Docker)
mysqld --user=mysql &

# Wait for MySQL to fully start
sleep 10

# Check if database exists
DB_EXISTS=$(mysql -u root -e "SHOW DATABASES LIKE 'siddhi_tasks';" | grep siddhi_tasks)

if [ -z "$DB_EXISTS" ]; then
    echo "Initializing database..."

    mysql -u root -e "CREATE DATABASE siddhi_tasks;"

    mysql -u root siddhi_tasks -e "
        CREATE TABLE students (
          id int(11) NOT NULL,
          Name varchar(50) NOT NULL,
          Class varchar(50) NOT NULL,
          Contact_Details bigint(10) NOT NULL,
          login_time timestamp NOT NULL DEFAULT current_timestamp(),
          device varchar(50) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

        INSERT INTO students (id, Name, Class, Contact_Details, login_time, device) VALUES
        (1, 'Tejendra Purohit', 'BCA V SEM', 7424911886, '2025-12-10 12:27:08', ''),
        (2, 'TP', 'BCA III year', 1234567810, '2025-12-10 12:29:51', '');

        ALTER TABLE students ADD PRIMARY KEY (id);
        ALTER TABLE students MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
    "

else
    echo "Database already exists. Skipping initialization."
fi

echo "Starting Apache server..."
apache2-foreground
