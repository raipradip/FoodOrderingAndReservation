<?php 
    include('../functions/init.php');

    $rname = $_SESSION['rname'];
    if(isset($_POST['add'])){
        $tblno = $_POST['tblno'];
        $rid = $_POST['rid'];
        for($i=0;$i<$tblno;$i++){
            $sql = "INSERT INTO `table_detail` (`id`, `res_id`, `booked`) VALUES (NULL, '$rid', '0');";
			$result = $con->query($sql);
        }
        redirect('table_manage.php');
    }
	
?>