<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'DM_Vet30');

$link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if ($link) {echo 'Connected to server...<br>';}

$connect=mysqli_select_db($link,DB_NAME);
if ($connect) {echo 'Connected to database...<br>';}

$sql = "SELECT Owner.firstname, Owner.lastname, Pet.name AS pet_name, Pet.species, Pet.weight, Pet.birthdate
        FROM Owner 
        INNER JOIN Pet ON Owner.id = Pet.ownerid";

$results = mysqli_query($link, $sql);

if ($results) {
    echo '<h1>Owners and Pets</h1>';
    while ($result = mysqli_fetch_array($results)) {
        echo '<div style="border: 2px solid #e4e4e4; padding: 15px; margin-bottom: 10px;">';
        echo '<p><strong>Owner:</strong> ' . $result['firstname'] . ' ' . $result['lastname'] . '</p>';
        
        if (!empty($result['pet_name'])) {
            echo '<p><strong>Pet:</strong> ' . (!empty($result['pet_name']) ? $result['pet_name'] : 'No pets') . '</p>';
            echo '<p><strong>Pet Species:</strong> ' . (!empty($result['species']) ? $result['species'] : 'Unknown') . '</p>';
            echo '<p><strong>Pet Weight:</strong> ' . (!empty($result['weight']) ? $result['weight'] . ' grams' : 'Unknown') . '</p>';
            echo '<p><strong>Pet Birthdate:</strong> ' . (!empty($result['birthdate']) ? $result['birthdate'] : 'Unknown') . '</p>';
        } else {
            echo '<p><strong>Pet:</strong> No pets</p>';
        }
        echo '</div>';
    }
}

mysqli_close($link);
?>