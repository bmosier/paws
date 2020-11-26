<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Animal Adoption Information</title>
	</head>

	<body>
		<h2>Animals currently available for adoption (View)</h2>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>

		<h4>Author: Samuel James</h4>
		<h4>Description</h4>
		<p>this is a view for all animal currently available for adoption</p>
		<h4>Justification</h4>
		<p>this allows customers to easily and quickly view all animals available for adoption</p>
		<h4>Expected Execution</h4>
		<p>All animals that have not been adopted shall be returned</p>
<?php
	require_once '/home/SOU/jamess1/dbconfig.php';
	error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	ini_set('display_errors', '1');

	 //animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, 
	//animal_is_sterilized, animal_description, Shelter_or_Foster_name, 
	//city, street, state, phone, zipcode

	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
	$result = $sql->query('SELECT * FROM v_animal_info;');
	
	echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Animal Id</th>';
	echo '<th>Name</th>';
	echo '<th>Animal Date of Birth</th>';
	echo '<th>Breed</th>';
	echo '<th>Animal Species</th>';
	echo '<th>Gender</th>';
	echo '<th>Shelter/Fosterhome name</th>';
	echo '<th>Animal Brief Description</th>';
	echo '<th>City</th>';
	echo '<th>Street</th>';
	echo '<th>State</th>';
	echo '<th>phone</th>';
	echo '<th>Zipcode</th>';
	echo '</tr>';
	
	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['animal_ID'] . '</td>';
		echo '<td>' . $row['name'] . '</td>';
		echo '<td>' . $row['animal_DOB'] . '</td>';
		echo '<td>' . $row['animal_breed'] . '</td>';
		echo '<td>' . $row['animal_species'] . '</td>';
		echo '<td>' . $row['animal_sex'] . '</td>';
		echo '<td>' . $row['Shelter_or_Foster_name'] . '</td>';
		echo '<td>' . $row['animal_description'] . '</td>';
		echo '<td>' . $row['city'] . '</td>';
		echo '<td>' . $row['street'] . '</td>';
		echo '<td>' . $row['state'] . '</td>';
		echo '<td>' . $row['phone'] . '</td>';
		echo '<td>' . $row['zipcode'] . '</td>';
		echo '</tr>';
	}
	
	echo '</table>';
	$result->free_result();
	$sql->close();
}
?>
	</body>
</html>
