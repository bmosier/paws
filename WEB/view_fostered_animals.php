<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Animal Adoption Information</title>
	</head>

	<body>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>

		<h2>Animals currently in fosterhomes (View)</h2>
		<h3>Author: Benjamin Mosier</h3>
		<br>
		<h4>Description</h4>
		<p>Displays currently fostered animals and their associated foster homes.</p>
		<br>
		<h4>Justification</h4>
		<p>Provides FosterHome and animal info for staff to help them determine appropriate arrangements.</p>
		<br>
		<h4>Expected Execution</h4>
		<p>All animals that have not been adopted shall be returned</p>
		<br>
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
	$result = $sql->query('SELECT * FROM v_fostered_animals;');

    echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Animal Id</th>';
	echo '<th>Name</th>';
	echo '<th>Animal Date of Birth</th>';
	echo '<th>Species</th>';
	echo '<th>Breed</th>';
	echo '<th>Sex</th>';
	echo '<th>Spayed/Neutered</th>';
	echo '<th>Age Descriptor</th>';
	echo '<th>Volunteer</th>';
	echo '<th>Volunteer email</th>';
	echo '<th>Phone</th>';
	echo '<th>Street</th>';
	echo '<th>City</th>';
	echo '<th>State</th>';
	echo '<th>Zipcode</th>';
	echo '<th>Registered Shelter</th>';
	echo '</tr>';
	
	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['animal_ID'] . '</td>';
		echo '<td>' . $row['name'] . '</td>';
		echo '<td>' . $row['animal_DOB'] . '</td>';
		echo '<td>' . $row['animal_species'] . '</td>';
		echo '<td>' . $row['animal_breed'] . '</td>';
		echo '<td>' . $row['animal_sex'] . '</td>';
		echo '<td>' . $row['animal_is_sterilized'] . '</td>';
		echo '<td>' . $row['age'] . '</td>';
        echo '<td>' . $row['volunteer'] . '</td>';
		echo '<td>' . $row['volunteer_email'] . '</td>';
		echo '<td>' . $row['foster__phone'] . '</td>';
		echo '<td>' . $row['foster_street'] . '</td>';
		echo '<td>' . $row['foster_city'] . '</td>';
		echo '<td>' . $row['foster_state'] . '</td>';
		echo '<td>' . $row['foster_zipcode'] . '</td>';
		echo '<td>' . $row['registered_shelter'] . '</td>';
		echo '</tr>';
    }
    
	echo '</table>';
	$result->free_result();
	$sql->close();
}
?>
	</body>
</html>
