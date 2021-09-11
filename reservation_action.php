
<?php 
    define('location','#');
    define('navbar_position','navbar-fixed-top');
    include('./functions/init.php');
    if(isset($_SESSION['admin'])){
        redirect('admin/');
    }
    if(!isset($_SESSION['email'])){
      redirect('index.php');
    }
    ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FoodOrdering</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/mediaqueries.css">
    <style>
        .trans{
            width: 100%;
            margin: 0;
            overflow: hidden;
        }
        .res-img{
            width: 100%;
            height: auto;
            transform: scale(1.10);
            transition: transform 0.5s;
            
        }
        .res-img:hover{
            transform: scale(1.01);
        }
        .banner{
            margin-top:-20px;
        }
    </style>
</head>
<body>
    <div id="snackbar"></div>
<?php 
    include('includes/nav.php');


  $rid = $_GET['id'];
  $table = $_POST['tid'];
  $chair = $_POST['chairno'];
  $phone = $_POST['number'];
  $date = $_POST['date'];
  $time = $_POST['time'];
  $email = $_SESSION['email'];
      
  $c = "";
  foreach($chair as $ch){
    $c .= $ch;  
    $c .= ',';
  }

  $sql = "INSERT INTO `reservation_detail`(`reservation_date`, `time`, `cust_mail`, `phone`, `res_id`, `table_id`,`chair_id`, `status`) VALUES ('$date','$time','$email','$phone','$rid','$table','$c','0')";
  $result = $con->query($sql);

  
//   echo $c;

//   $char = explode(',',$c);
  
//   echo sizeof($char);


?>
<div class="container text-center">
  <div class="row">
    <div class="col-lg-12"><h2 class="text-primary">Your Booking has been added. You will soon receve message of confirmation.</h2></div>
    <a href="index.php" class="btn btn-default">Continue</a>
  </div>
</div>
<hr>
<br>

<div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-3">
            <b>WE'RE FOODORDERING</b>
            <p>About Us</p>
            <p>Available Areas</p>
            <p>Delivery Charges</p>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <b>GET HELP</b> 
            <p>How to Order?</p>
            <p>FAQs</p>
            <p>Contact Us</p>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <b>CALL US</b>
            <p>441442, 444120</p> 
            <p>980298832</p>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
        <b>CONNECT WITH US</b> <br>
            <i class="fab fa-twitter fa-2x"></i>
            <i class="fab fa-twitter fa-2x"></i>
            <i class="fab fa-instagram fa-2x"></i>
            <i class="fab fa-youtube fa-2x"></i>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12"></div>
        <div class="col-md-12  col-sm-12 col-xs-12">
            <b>SERVICE HOUR</b>
            <p>11:00 AM to 8:30 PM(NST)</p>
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12"> </div>
    </div>
    <div class="row b-top">
        <div class="col-md-6 col-sm-6 col-xs-6">
            <p>Terms of Usage and Privacy Policy</p>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
            <p>&copy; 2019 FoodOrdering Pvt. Ltd. All Rights Reserved</p>
        </div>
    </div>

</div>
<?php include('includes/footer.php'); ?>