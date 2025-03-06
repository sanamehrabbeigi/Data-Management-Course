<?php
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASSWORD','');
define('DB_NAME','DM_Demo');
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if ($link) {echo 'Connected to server...<br>';}
$connect=mysqli_select_db($link,DB_NAME);
if ($connect) {echo 'Connected to database...<br>';}
$first= $_POST['first'];
$last= $_POST['last'];
$sql="INSERT INTO dm_demo (first,last) VALUES ('$first','$last')";
if (mysqli_query($link,$sql)) {echo 'Row inserted!<br>';}
mysqli_close($link);
?>


