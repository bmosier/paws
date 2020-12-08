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
        <p>This page uses the get_age_descriptor function. Depending on whether the animal is a dog or cat, they can receive a descriptor based on their<br />
         current age. (< 8/10 weeks = baby, < 12mo puppy/kitten, < 2 years = young cat/dog, >2 years = adult cat/dog, else senior).
		</p>
		<br>
		<h4>Justification</h4>
		<p>This is relevant to customers browsing animals. Major pet adoption sites already do this.</p>
		<br>
		<h4>Expected Execution</h4>
		<p>The page will automatically run a simple query to pull a few animal records that should demonstrate the function.</p>
		<br>
<?php
	require_once '../dbconfig-paws.php';
	error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	ini_set('display_errors', '1');

	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
	$result = $sql->query('SELECT animal_ID, name, animal_DOB, animal_species, animal_breed, get_age_descriptor(animal_ID) AS age_desc FROM animal
    order by name
    limit 10;');

    echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Animal Id</th>';
	echo '<th>Name</th>';
	echo '<th>Animal Date of Birth</th>';
	echo '<th>Species</th>';
	echo '<th>Age Descriptor</th>';
	echo '</tr>';
	
	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['animal_ID'] . '</td>';
		echo '<td>' . $row['name'] . '</td>';
		echo '<td>' . $row['animal_DOB'] . '</td>';
		echo '<td>' . $row['animal_species'] . '</td>';
        echo '<td>' . $row['age_desc'] . '</td>';
		echo '</tr>';
    }
    
	echo '</table>';
	$result->free_result();
	$sql->close();
}
?>
	</body>
</html>
