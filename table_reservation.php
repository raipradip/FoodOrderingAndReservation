<?php 

    define('location','index.php');
    define('navbar_position','');
    include('./functions/init.php');
    if(!isset($_SESSION['email'])){
      echo '<script>
      alert("You must login first to reserve a table");
      window.location.replace("index.php");</script>';
  }
    $resid = $_GET['id'];
    $tid;
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
        .app {
          max-width: 300px;
        
        }
        article {
          position: relative;
          width: 140px;
          height: 100px;
          margin: 5px;
          float: left;
          border: 2px solid #50bcf2;
          border-radius: 50%;
          box-sizing: border-box;
          
        }

        article div {
          width: 100%;
          height: 100%;
          line-height: 25px;
          transition: .5s ease;
          display: flex;
          justify-content: center;
          align-items: center;
         
        }

        article input {
          position: absolute;
          top: 0;
          left: 0;
          width: 140px;
          height: 100px;
          opacity: 0;
          cursor: pointer;
          
        }

        input[type=checkbox]:checked ~ div {
          background-color: #50bcf2;
          border-radius: 50%;
          color :white;
        }


        .blue-color {
          color: #50bcf2;
        }

        .gray-color {
          color: #555;
        }

    </style>
</head>
<body>
    <div id="snackbar"></div>
<?php 
    include('includes/nav.php');

    $id = $_GET['id'];

    
    $query = "SELECT * FROM restaurant WHERE id = $id";
    $result = query($query);
    if(num_rows($result)>0){
        while($row = fetch_array($result)){
            $image = $row['image'];
            $rname = $row['rname'];
            $address = $row['address'];
            echo'
                <div class="restaurant_banner">
                    <div class="container this">
                        <div class="row">
                            <div class="col-md-2">
                                <img class="responsive" width="150px" src="'.$image.'" alt="">
                            </div>
                            <div class="col-md-3">
                                 <h3>'.$rname.'</h3>
                                 <span class="glyphicon glyphicon-map-marker"></span>&nbsp;'.$address.'
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                Delivery Hours:<br> 
                                10:00 AM - 9:00 PM
                            </div>
                        </div>
                    </div>
                </div>
';}} ?>
<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu">Reservation Details</a></li>
    </ul>
    <div class="tab-content">
        <div id="menu" class="tab-pane fade in active">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-offset-3"><h2 class="text-primary">Choose a Table and Chairs</h2></div>
                </div>
                <div class="row">
                  <form action="reservation.php?id=<?php echo $id?>" method="POST">
                    <h3>Choose Your Table and chairs</h3>
                  <?php
                        $sql = "SELECT * FROM `table_detail` WHERE res_id ='$resid' ;";
                        $result = $con->query($sql);
                        $i=0;
                        foreach ($result as $r) { 
                            $tid = $r['id'];
                            $i++;
                            
                    ?>
                    <section class="app">
                      <article class="feature">
                      <input type="checkbox" id="feature" name="table[]" value=<?php echo "'".$tid."'"?>/>
                      <div>
                      <span class="">Table <?php
                        echo $i;
                      ?>
                        </span>
                      </div>
                    </article>

                    <?php
                      $sql2 = "SELECT * FROM `chair_detail` WHERE table_id ='$tid' ;";
                      $result2 = $con->query($sql2);
                      foreach ($result2 as $r) { 
                        $cid = $r['id'];
                    ?>
                    <?php 
                            if($r['booked']==0){
                                echo '<article class="feature<?php echo $cid?>" >
                                <input type="checkbox"  id="feature<?php echo $cid?>" name="chair[]" value="'.$cid.'">
                                <div>
                                <span class="glyphicon glyphicon-cutlery">
                                    </span>
                                </div>
                                </article>
                            </section>';
                            }
                            else{
                                echo '<article class="feature<?php echo $cid?>" style="background-color: orange">
                                <input type="checkbox" disabled  id="feature<?php echo $cid?>" name="chair[]" value="'.$cid.'">
                                <div>
                                <span class="glyphicon glyphicon-cutlery">
                                    </span>
                                </div>
                                </article>
                            </section>';
                            }
                        ?>
                      
                  <?php
                      };
                      
                    }
                    ?>
                        <div class="col-lg-12">
                            <input type="submit" class="btn btn-success reserve" name="reserve" value="Reserve">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="container" style="border-top:2px solid black;padding-top: 10px">
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
            <i class="fab fa-facebook fa-2x"></i>
            <i class="fab fa-twitter fa-2x"></i>
            <i class="fab fa-instagram fa-2x"></i>
            <i class="fab fa-youtube fa-2x"></i>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12"></div>
        <div class="col-md-12 col-sm-12 col-xs-12">
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

<?php include("script.php");?>
<?php include('includes/footer.php'); ?>
