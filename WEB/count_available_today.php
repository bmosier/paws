<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Count Animals Available for Adoption function</title>
	
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>
	</head>
	<body>
		<h2>Customer Staff Statistics Report (Procedure)</h2>
		<h4>Author: Samuel James</h4>
		<br>
		<p><b>Description:</b> This page allows shelter managers a way to view the amount animals currently up for adoption for a given shelter name</p>
		<br>
		<p><b>Justification:</b> This page is useful to shelter managers who need to view the amount of animals currently in their shelter</p>
		<br>
		<p><b>Expected Execution:</b> Upon inputting a shelter name the count of all animals ready for adoption at the given shelter or foster name shall be displayed.</p>
		<form method="post">
			<br>
			<label for="sheltername">Shelter Name: </label>
			<input type="text" name="shelter_name" id="shelter_name"<?php
if (isset($_POST['shelter_name'])) {
	echo ' value="' . $_POST['shelter_name'] . '"';
}
?> />
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
