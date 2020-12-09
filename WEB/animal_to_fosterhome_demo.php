<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
<head>
<title>Animal to Foster Home</title>
</head>

<body>
<div id="bar">
<div class="link"><a href="LandingPage.html">Landing Page</a></div>
<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
</div>

<h2>Animal to Foster Home (trigger and procedure)</h2>
<h3>Author: Benjamin Mosier</h3>
<br>
<h4>Description</h4>
<p>This page uses the v_fostered_animals (view), animal_to_fosterhome (procedure), and the fosterhome_animal_BEFORE_INSERT (trigger) to<br />
assign an animal to a foster home.
</p>
<br>
<h4>Justification</h4>
<p>This page can be used by shelter staff to assign an animal to a foster home.</p>
<br>
<h4>Expected Execution</h4>
<p>
The procedure will insert a record into the fosterhome_animal bridge table and the trigger will set the is_fostered attribute on the animal record to<br />
 TRUE – this Boolean value is referenced by the fostered animals view to determine which animals populate the table.<br />
 The view will be updated when a POST is made.<br /><br />
Try assigning any of the animals with ID’s 801–805 to Fosterhome 550. There should be plenty of room. Animals can be removed from a fosterhome <a href="animal_to_shelter_demo.php">here</a>.
</p>
<br>

<form method="post">
<label for="animal_ID">Animal ID: </label>
<input type="number" name="animal_ID" id="animal_ID" />
<br>

<label for="foster_ID">Foster ID: </label>
<input type="number" name="foster_ID" id="foster_ID"/>
<br />
<input type="submit" value="Submit" />
</form>

<?php
require_once '../dbconfig-paws.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

$sql = new mysqli($hostname, $username, $password, $schema);
if ($sql->connect_errno) {
	echo 'Connection failed: ' . $sql->connect_errno;
} else {
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		$animal_ID = $_POST['animal_ID'];
		$foster_ID = $_POST['foster_ID'];
		$sql->query('CALL animal_to_fosterhome(' . $animal_ID . ', ' . $foster_ID . ');');
		
	}
	
	$result = $sql->query('SELECT * FROM v_fostered_animals;');
	echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Animal Id</th>';
	echo '<th>Name</th>';
	echo '<th>Animal Date of Birth</th>';
	echo '<th>Species</th>';
	echo '<th>Breed</th>';
	echo '<th>Sex</th>';
	echo '<th>Volunteer First Name</th>';
	echo '<th>Volunteer Last Name</th>';
	echo '<th>Volunteer Email</th>';
	echo '<th>Phone</th>';
	echo '</tr>';
	
	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['animal_ID'] . '</td>';
		echo '<td>' . $row['name'] . '</td>';
		echo '<td>' . $row['animal_DOB'] . '</td>';
		echo '<td>' . $row['animal_species'] . '</td>';
		echo '<td>' . $row['animal_breed'] . '</td>';
		echo '<td>' . $row['animal_sex'] . '</td>';
		echo '<td>' . $row['volunteer_first_name'] . '</td>';
		echo '<td>' . $row['volunteer_last_name'] . '</td>';
		echo '<td>' . $row['volunteer_email'] . '</td>';
		echo '<td>' . $row['foster_phone'] . '</td>';
		
		echo '</tr>';
	}
	
	echo '</table>';
	$result->free_result();
	
	$sql->close();
}
?>
</body>
</html>
