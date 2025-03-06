<?php
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASSWORD','');
define('DB_NAME','DM_Vet30');
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if ($link) {echo 'Connected to server...<br>';}
$connect=mysqli_select_db($link,DB_NAME);
if ($connect) {echo 'Connected to database...<br>';}
$name= $_POST['name'];
$species= $_POST['species'];
$weight= $_POST['weight'];
$birthdate= $_POST['birthdate'];
$ownerid= $_POST['ownerid'];
$sql="INSERT INTO Pet (name, species, weight, birthdate, ownerid) VALUES ('$name','$species','$weight','$birthdate','$ownerid')";
if (mysqli_query($link,$sql)) {echo 'Row inserted!<br>';}
mysqli_close($link);
?>