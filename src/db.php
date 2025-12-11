<?php
$host = getenv("DB_HOST");
$user = getenv("DB_USER");
$pass = getenv("DB_PASS");
$name = getenv("DB_NAME");

$conn = mysqli_connect($host, $user, $pass, $name);

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
