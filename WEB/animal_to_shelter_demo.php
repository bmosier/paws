<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Animal to Shelter (procedure)</title>
	</head>

	<body>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>

		<h2>Fostered Animal to Shelter</h2>
		<h3>Author: Benjamin Mosier</h3>
		<br>
		<h4>Description</h4>
		<p>This page uses the v_fostered_animals (view) and the animal_to_fosterhome (procedure). When an animal is moved from a foster home back to a shelter,<br />
		 the record in the fosterhome_animal bridge table is preserved as historical data, but the Boolean value on the Animal record will be set to false, removing<br />
		 it from the fostered animals view. Changing this Boolean is all that is required to determine whether an animal is currently fostered, and the most recent<br />
		 fosterhome_animal record will indicate which foster home is housing the animal. The animal_to_shelter procedure could also be used to change an animal’s assigned<br />
		 shelter, even if they are not currently in a foster home. Note: An animal must be at located at a shelter in order to be adopted (not enforced here).</p>
		<br>
		<h4>Justification</h4>
		<p>This page can be used by shelter staff to assign an animal to a foster home. </p>
		<br>
		<h4>Expected Execution</h4>
		<p>Choose any of the listed foster animals (by animal_ID) to move into the shelter, and one of the available choices in the foster_ID drop down. The shelter_ID has<br />
		been pre-selected to be each animal’s registered shelter.</p>
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
