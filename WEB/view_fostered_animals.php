<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Fostered Animals View</title>
	</head>

	<body>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>

		<h2>Fostered Animals (View)</h2>
		<h3>Author: Benjamin Mosier</h3>
		<br>
		<h4>Description</h4>
		<p>Animal to Foster Home uses the v_fostered_animals (view) to provide a listing of all animals that are being fostered. </p>
		<br>
		<h4>Justification</h4>
		<p>This page is useful to staff and volunteers who need to see which animals are currently in foster care. Foster homes are used because<br />
		of limited space and staffing of shelters (especially during puppy and kitten season). Each foster home is managed by one volunteer.<br />
		The page provides information that can be used to quickly identify an animal as well as the contact info for that foster home.</p>
		<br>
		<h4>Expected Execution</h4>
		<p>All animals currently in foster care will be automatically displayed.</p>
		<br>
<?php
	require_once '../dbconfig-paws.php';
	error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	ini_set('display_errors', '1');

	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
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
