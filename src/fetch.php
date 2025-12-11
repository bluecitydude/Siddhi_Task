<?php 
    include 'db.php';
    header('Content-Type: application/json');
    $method=$_SERVER['REQUEST_METHOD'];

    if($method=='GET'){
        if(isset($_GET['id'])){
            $id=$_GET['id'];
            // This SQL works for both MySQL and PostgreSQL
            $sql="SELECT * FROM students WHERE id=$id";
            $stmt = $conn->query($sql);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            echo json_encode($data);

        } else {
            $sql="SELECT * FROM students";
            $stmt = $conn->query($sql);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($data);
        }
    }    
?>
