<?php 
    include 'db.php';
    header('Content-Type: application/json');
    $method=$_SERVER['REQUEST_METHOD'];

    if($method=='GET'){
        if(isset($_GET['id'])){
            $id=$_GET['id'];
            $sql="SELECT * FROM students WHERE id=$id";
            $result=$conn->query($sql);
            $data=$result->fetch_assoc();
            echo json_encode($data);
        } else {
            $sql="SELECT * FROM students";
            $result=$conn->query($sql);
            $data=array();
            while($row=$result->fetch_assoc()){
                $data[]=$row;
            }
            echo json_encode($data);
        }
    }    



?>