<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API TESTING</title>
</head>
<body>
    <form action="../src/add.php" method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <br><br>
        <label for="class">class</label>
        <input type="text" id="class" name="class" required>

         
        <br><br> 
        
        <label for='login'>Login Time</label>
        <input type="datetime-local" id="login" name="login_time" required><br><br>

        <label for="device">Device</label>
        <input type="text" id="device" name="device" required>
        <button type="submit">Submit</button>
    </form>

    <p>Want a student by id? <a href="fetch_student.php">Click here</a></p>
        
</body>
</html>