<form action='pet-insert.php' method="post">
<p>Name: <input type="text" name="name"></p>
<p>Species: <input type="text" name="species"></p>
<p>Weight: <input type="number" name="weight"></p>
<p>Birth Data: <input type="date" name="birthdate"></p>
<p>Owner:
<select id="ownerid" name="ownerid">
    <option value="">Select an Owner</option>
    <?php
        $mysqli = new mysqli('localhost', 'root', '', 'DM_Vet30');
        if ($mysqli->connect_error) { die("Connection failed: " . $mysqli->connect_error); }
        $result = $mysqli->query("SELECT id, firstname, lastname FROM Owner");
        while ($row = $result->fetch_assoc()) { 
            echo "<option value='" . $row['id'] . "'>" . $row['firstname'] . " " . $row['lastname'] . "</option>"; 
        }
        $mysqli->close();
    ?>
</select><br><br>
<button type="submit">Add Pet</button>
</form>
