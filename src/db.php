<?php

$host = "127.0.0.1";   // MySQL inside the same container
$user = "root";
$pass = "";            // default MySQL root password inside container
$name = "siddhi_tasks";
$port = 3306;

$conn = mysqli_connect($host, $user, $pass, $name, $port);

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
