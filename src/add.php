<?php 
    include "db.php";
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = mysqli_real_escape_string($conn, $_POST['name']);

        $class = mysqli_real_escape_string($conn, $_POST['class']);
        
        $login_time = mysqli_real_escape_string($conn, $_POST['login_time']);

        $device = mysqli_real_escape_string($conn, $_POST['device']);

        $sql = "INSERT INTO students (name, class, login_time, device) VALUES ('$name', '$class', '$login_time',$device)";

        if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }

        mysqli_close($conn);
    } else {
        echo "Invalid request method.";
    }
?>