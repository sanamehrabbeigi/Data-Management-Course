<?php
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASSWORD','');
define('DB_NAME','DM_Vet30');
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if ($link) {echo 'Connected to server...<br>';}
$connect=mysqli_select_db($link,DB_NAME);
if ($connect) {echo 'Connected to database...<br>';}
$firstname= $_POST['firstname'];
$lastname= $_POST['lastname'];
$email= $_POST['email'];
$sql="INSERT INTO Owner (firstname, lastname, email) VALUES ('$firstname','$lastname','$email')";
if (mysqli_query($link,$sql)) {echo 'Row inserted!<br>';}
mysqli_close($link);
?>