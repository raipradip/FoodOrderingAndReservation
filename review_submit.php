<?php 
    include('functions/init.php');
    $id = $_GET['id'];
    $msg = $_POST['msg'];
    $email = $_SESSION['email'];
    
    $sql = "INSERT INTO reviews(email,rid,msg) VALUES('$email','$id','$msg')";
    $result = query($sql);
    redirect("restaurant.php?id=$id");

?>