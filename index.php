<?php 
    define('location','#');
    define('navbar_position','navbar-fixed-top');
    include('includes/header.php');
    if(isset($_SESSION['admin'])){
        redirect('admin/');
    }
    if(isset($_SESSION['rname'])){
        redirect('restaurant/restaurant_admin.php');
    }
       
    // for date expire
        $nowdate = date('Y-m-d');
        $expireSql = "SELECT * FROM `reservation_detail`";
        $res = $con->query($expireSql);
		foreach ($res as $r) {
            $id = $r['id'];
            if($r['reservation_date']<$nowdate){
                $chairs= $r['chair_id'];
                $ex = explode(',',$chairs);
                $i =0;
                $size = sizeof($ex) -1;
                //updating chairs
                for($i;$i<$size;$i++){
                    $chid = $ex[$i];
                    $sql2 = "UPDATE `chair_detail` SET `booked`='0' WHERE id='$chid'";
                    $result2=$con->query($sql2);
                }
                $sql3 = "DELETE FROM `reservation_detail` WHERE id='$id'";
                $result3=$con->query($sql3);
            }
        }
    ?>

    <!-- checking for table reservation if expired -->
   
    
<div class="banner">
    <form method="POST" action="search.php">
        <h2 class="col-lg-12 text-center  col-sm-12 col-md-12 col-xs-12">Order food from the widest range of restaurants.</h2>
        <div class="input-group col-md-6 col-sm-6 col-xs-6 banner-text">
            <input type="text" size="30" class="form-control" placeholder="Restaurant, Food, location" name="q">
            <div class="input-group-btn">
            <button class="btn btn-default btn-success" name="search">
                Search
            </button>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <div class="row">
        <h2 class="col-lg-12 col-xs-12 col-md-12 col-sm-12 text-center" style="color: #F79420;font-size: 400%;font-weight:bold;letter-spacing:-5px;"><span style="color:#8458B3">~~~~~</span>Restaurants<span style="color:#8458B3">~~~~~</span></h2>
        <!--  -->
        <?php 
            $query = "SELECT * FROM restaurant";
            $result = query($query);
            if(num_rows($result)>0){
                while($row = fetch_array($result)){
                    $id =$row['id'];
                    $name = $row['rname'];
                    $address = $row['address'];
                    $email = $row['email'];
                    $image = $row['image'];

                    echo '
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="thumbnail noborder trans">
                            <a href="restaurant.php?id='.$id.'">
                                <img src="'.$image.'" alt="" style="" class="res-img">
                                <div class="caption">
                                    <center><p class="rest-cap">'.$name.'</p></center>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    ';
                }
                }
        ?>
        <!--  -->
    </div>
</div>
<div class="container-fluid">
    <div class="row about">
            <div class="col-md-12">
                <div class="about_us">
                    <p>
                        <h2>About Us</h2>
                        <span class="banner-text">
                        FoodOrdering is the fastest, easiest and most convenient way to enjoy the best food of your favourite restaurants at home, at the office or wherever you want to.<br>We know that your time is valuable and sometimes every minute in the day counts. That’s why we deliver! So you can spend more time doing the things you love.</span>
                    </p>	
                </div>
                
            </div>
        </div>
    </div>
</div>

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

<?php include("./script.php");?>
<?php include('includes/footer.php'); ?>