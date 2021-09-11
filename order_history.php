

<?php 
    define('location','index.php');
    define('navbar_position','');
    include('includes/header.php');

    $email = $_SESSION['email'];

?>
    <div class="container">
        <div class="row">
                
        <?php
            $com = ',';
          $sql = "SELECT `date_purchase` FROM `purchase` WHERE `email` ='$email' ;";
          $result = $con->query($sql);
           
          foreach ($result as $r) { 
              $date = $r['date_purchase'];
              $cutdate= substr($date,0,-9);
              $newdate .= $cutdate . $com;
          }
          
        $string = explode(',',$newdate);
        $unique = array_unique($string);
        // $size = sizeof($unique)-1;
       
        foreach($unique as $un){
            // $str = $unique[$i];
            $c = '%';
            if($un!=''){
            ?>
            <div class="col-lg-12">
            <table class="table table-dark">
                <h5>Date: <?php echo $un?></h5>
                <thead>
                    <tr class='danger'>
                    <th scope="col">#</th>
                    <th scope="col">Item Name</th>
                    <th scope="col">Restaurant</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
            <?php
            $sql1 = "SELECT * FROM `purchase` WHERE `date_purchase` LIKE '$un".$c."'";
            $result1 = $con->query($sql1);
            $i = 1;
            foreach ($result1 as $r) {
        
        ?>
        
            <tr class="info">
                <th><?php echo $i++; ?></th>
                <td><?php echo $r['pname']; ?></td>
                <td><?php echo $r['rname']; ?></td>
                <td><?php echo $r['qty']; ?></td>
                <td><?php echo $r['price']; ?></td>
                <td><?php echo $r['total']; ?></td>
            </tr>
        
          <?php   }}else{};
        echo '</tbody>
        </table>
            </div>';  
        }
                    ?>
                   
        </div>
    </div>
<?php

    include('includes/footer.php');
?>