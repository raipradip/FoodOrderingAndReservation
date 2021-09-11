<?php include('functions/init.php');

        //adding items according to product id
        if(isset($_POST['addToCart'])){
            if(isset($_SESSION['email'])){
            $p_id = $_POST['prodId'];
            $email = $_SESSION['email'];
            $sel_sql = "SELECT * FROM cart WHERE pid = '$p_id' AND email = '$email'";
            $runQuery = query($sel_sql);
            $count = num_rows($runQuery);
            if($count > 0){// if item already exist in cart
                echo 'Product Already Added To Cart';
            }
            else{// if item doesnot exist in cart then we add it to cart
                $sql = "SELECT * FROM items WHERE pid = '$p_id'";
                $runQuery = query($sql);
                $row = fetch_array($runQuery);
                    $email = $_SESSION['email'];
                    $pid = $row['pid'];
                    $rid = $row['rid'];
                    $prod_name= $row['name'];
                    $price = $row['price'];
                    $rname = $row['rname'];
                    $i = 1;
                    $sql2 = "INSERT INTO cart(pid, email,pname,rname,qty,price,total) VALUES('$pid', '$email', '$prod_name','$rname','$i', '$price', '$price')";
                    
                    if(query($sql2)){
                        echo 'Product Added Successfully';
                        // for cart show
                    }
            }
        }
        else{
            echo 'Please Login First.';
        }
    }

    if(isset($_POST['get_cart_product']) || isset($_POST['cart_checkout']) || isset($_POST['location'])){
        $email = $_SESSION['email'];
        $sql = "SELECT * FROM cart WHERE email = '$email'";
        $runQuery = query($sql);
        $dataNumber = num_rows($runQuery);
        if($dataNumber>0){
            $index = 1;
            $total_amt = 0;
            if(isset($_POST['get_cart_product'])){
            echo '
                <thead class="thead-dark">
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Restaurant</th>
                </thead>
            ';}
            while($row = fetch_array($runQuery)){
                $product_id = $row['pid'];
                $prodTitle = $row['pname'];
                $price = $row['price'];
                $qty = $row['qty'];
                $total = $row['total'];
                $rname = $row['rname'];
                $price_array = array($total);//creates array of every prices on the cart
                $total_sum = array_sum($price_array);//adds every items on cart
                $total_amt = $total_amt + $total_sum;
                
                if(isset($_POST['get_cart_product'])){
                    echo '
                        
                        <tr>
                        <td>'.$prodTitle.'</td>
                        <td>'.$qty.'</td>
                        <td>Rs.'.$price.'</td>
                        <td>'.$rname.'</td>
                        </tr>
                                                
                    ';
                    $index++;
                }
                elseif(isset($_POST['cart_checkout'])){//for cart checkout
                    echo '
					<div class="row">
                        <div class="col-md-2 col-xs-2 col-sm-2">'.$prodTitle.'</div>
                        <div class="col-md-3 col-xs-3 col-sm-3">'.$rname.'</div>
						<div class="col-md-1 col-xs-1 col-sm-1"><input type="text" size="5" class="form-control qty" pid="'.$product_id.'" id="qty-'.$product_id.'" value="'.$qty.'" ></div>
						<div class="col-md-2 col-xs-2 col-sm-2"><input type="text" class="form-control price"  size="5" pid="'.$product_id.'" id="price-'.$product_id.'" value="'.$price.'" disabled></div>
						<div class="col-md-2 col-xs-2 col-sm-2"><input type="text" class="form-control total" pid="'.$product_id.'" id="total-'.$product_id.'" value="'.$total.'" disabled></div>
						<div class="col-md-2 col-xs-2 col-sm-2">
							<div class="btn-group">
								<a href="#" remove_id="'.$product_id.'" class="btn btn-danger remove"><span class="glyphicon glyphicon-trash"></span></a>
								<a href="" update_id="'.$product_id.'" class="btn btn-success update"><span class="glyphicon glyphicon-ok-sign"></span></a>
							</div>
						</div>
					</div><hr />
					';
                }
                
            }
            // gives the total sum of amount
			if(isset($_POST['cart_checkout'])){
				echo '
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h4><b id="total" data-id="'.$total_amt.'">Total Rs.'.$total_amt.'</b></h4>
                        
					</div>
                    <div class="col-md-4">
                        <div id="location" style="display: inline-block"></div>
                        <button class="btn btn-sm btn-warning" id="getlocation">Give Location</button>
                    </div>
                </div>
					<div class="row">
						<div class="col-md-8"><input id="long" type="hidden" value=""><input id="lat" type="hidden" value=""></div>
                        <div class="col-md-4">
                            <div id="location" style="display: inline-block"></div>
							<button class="btn btn-primary" onclick="window.print();"><i class="glyphicon glyphicon-print"></i> Print</button>
						</div>
                       
					</div>


				';
            }
            
            //location
            if(isset($_POST['location'])){
                $lat = $_POST['lat'];
                $long = $_POST['long'];
                $total = $_POST['total'];
                echo '<a class="btn btn-success" href="purchase.php?lat='.$lat.'&long='.$long.'&total='.$total.'"><i class="glyphicon glyphicon-floppy-saved"></i> Checkout</a>';
            }
        }
    }

    // removing items
	if(isset($_POST['removeFromCart'])){
		$pid = $_POST['removeId'];
		$email = $_SESSION['email'];
		$sql = "DELETE FROM cart WHERE email = '$email' AND pid = '$pid'";
		$runQuery = query($sql);
		if($runQuery){
			echo 'Product Removed';
		}
    }
    
    //updating products
	if(isset($_POST['updateProduct'])){
		$email = $_SESSION['email'];
		$pid = $_POST['updateId'];
		$qty = $_POST['qty'];
		$price = $_POST['price'];
		$total = $_POST['total'];
		$sql = "UPDATE cart SET qty='$qty',price='$price',total='$total' WHERE email='$email' AND pid='$pid'";
		$runQuery = query($sql);
		if($runQuery){
			echo 'Product Updated';
		}
    }


    
?>