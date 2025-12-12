<?php 
    include "db.php"; // This now uses the PostgreSQL PDO connection

    // Ensure the connection variable is named $conn as in the db.php file
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        
        // Data is taken directly from $_POST and bound securely later
        $name = $_POST['name'];
        $class = $_POST['class'];
        $device = $_POST['device'];

        // Use placeholders (?) instead of inserting variables directly into the SQL string
        $sql = "INSERT INTO students (name, class, device) VALUES ('$name', '$class', '$device')";
        
        try {
            // Prepare the statement
            $stmt = $conn->prepare($sql);
            
            // Bind parameters and execute
            // The types are inferred, but you can explicitly define them if needed
            $stmt->execute([$name, $class, $device]);

            echo "New record created successfully";

        } catch (PDOException $e) {
            // Catch any database errors securely
            echo "Error: " . $e->getMessage();
        }

        // Close connection
        $conn = null; // Setting PDO connection to null closes it

    } else {
        echo "Invalid request method.";
    }
?>




