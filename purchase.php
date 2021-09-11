<?php 
    define('location','#');
    define('navbar_position','');
    include('includes/header.php');
    if(!isset($_SESSION['email'])){
        redirect('index.php');
    }
    $email = $_SESSION['email'];
    $lat = $_GET['lat'];
    $long = $_GET['long'];
    $totalset = $_GET['total'];

    $sql = "SELECT * FROM cart WHERE email = '$email'";
    $result = query($sql);
    if(num_rows($result)>0){
        while($row = fetch_array($result)){
            $pname=$row['pname'];
            $rname=$row['rname'];
            $qty=$row['qty'];
            $price=$row['price'];
            $total=$row['total'];
            
            $sql1 = "INSERT INTO purchase(email,pname,rname,qty,price,total,lat,longt,date_purchase) VALUES('$email','$pname','$rname','$qty','$price','$total',$lat,$long,NOW())";
            $result1 = query($sql1);

        }
    }

    $sql2 = "DELETE FROM cart WHERE email='$email'";
    $result2 = query($sql2);
    $link = "esewapay.php?total=".$totalset;
    redirect($link);
?>