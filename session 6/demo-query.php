<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'world');
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if ($link) {echo 'Connected to server...<br>';}
$connect=mysqli_select_db($link,DB_NAME);
if ($connect) {echo 'Connected to database...<br>';}


$sql = "SELECT" * FROM country";
$results=mysqli_query($link,$sql);
if($results)
    { echo '<h1>Country Table</h1>';
     while($result=mysqli_fetch_array($results)) {
        echo '<div style = " border: 2px solid #e4e4e4; padding: 15px; " > ' ;
        echo '<p>Name: '.$result['Name'].'</p>';
        echo '<p>Continent: '.$result['Continent'].'</p>';
        echo '<p>Region: '.$result['Region'].'</p>';
        echo '</div>';}
    }
?>
