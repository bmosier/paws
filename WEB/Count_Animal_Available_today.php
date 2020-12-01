<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Count Animals Available for Adoption function</title>
	
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
      		</div>
	</head>
	<body>
		<h2>Count Animals Currently Available (Stored Function)</h2>
		<h4>Author: Samuel James</h4>
		<br>
		<p><b>Description:</b> This page allows shelter managers a way to view the amount animals currently up for adoption for a given shelter name</p>
		<br>
		<p><b>Justification:</b> This page is useful to shelter managers who need to view the amount of animals currently in their shelter</p>
		<br>
		<p><b>Expected Execution:</b> Upon inputting a shelter name the count of all animals ready for adoption at the given shelter or foster name shall be displayed.</p>
		<form method="post">
			Shelter Name:
			<select name="shelter_name" width=300 STYLE="width: 350px">
  				<option value="Happy Cats Animal Shelter">Happy Cats Animal Shelter</option>
  				<option value="Medford Animal Shelter">Medford Animal Shelter</option>
				<option value="Southern Oregon Animal Rescue">Southern Oregon Animal Rescue</option>
  				<option value="Oregon Animal Sanctuary">Oregon Animal Sanctuary</option>
				<option value="Pets R Us">Pets R Us</option>
  				<option value="Animal Savers">Animal Savers</option>
				<option value="Petcompany">Petcompany</option>
  				<option value="Animals INC">Animals INC</option>
				<option value="We Help Shelter">We Help Shelter</option>
  				<option value="Cats the shelter">Cats the shelter</option>

			</select>
			<br />
			<input type="submit" value="Submit" />
		</form>
<?php
require_once '../dbconfig.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$shelter_name = $_POST['shelter_name'];
	
	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
	$qry = "SELECT count_animal_available_today('" . $shelter_name . "') AS Count;";
	$result = $sql->query($qry);
	echo '<th> ' . $shelter_name . ' </th>';
	echo '<th>Amount Of Animals Ready For Adoption: </th>';
	echo '<tr> ' . ($result->fetch_assoc())['Count'] . '</tr>';

	$result->free_result();
	$sql->close();
	}
}
?>
	</body>
</html>

