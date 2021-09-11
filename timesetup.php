<?php
  include('functions/init.php');
?>
<?php 
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
            elseif($r['reservation_date']==$nowdate){

            }
        }
        // $tim = '1:00pm';
        // $def = strtotime($tim);
        
        // date_default_timezone_set('Asia/Kathmandu');
        // $currtime = date('H:i a');
        // $newtim = strtotime($currtime);
        // if($newtim>$def){
        //     echo 'greater';
        
        // }
        // else{ echo 'less';};
    ?>