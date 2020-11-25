<!DOCTYPE html>
<html>
	<head>
		<title>Volunteer Contact Information</title>
	</head>
	<body>
		<h2>Volunteer Contact Information (View)</h2>
		<h4>Author: Denis Roman</h4>
		<h4>Description</h4>
		<p>text here</p>
		<h4>Justification</h4>
		<p>text here</p>
		<h4>Expected Execution</h4>
		<p>text here</p>
<?php
require_once '../dbconfig-paws.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

$sql = new mysqli($hostname, $username, $password, $schema);
if ($sql->connect_errno) {
	echo 'Connection failed: ' . $sql->connect_errno;
} else {
	$result = $sql->query('SELECT * FROM v_volunteer_contact;');
	
	echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Volunteer Id</th>';
	echo '<th>Volunteer Last Name</th>';
	echo '<th>Volunteer First Name</th>';
	echo '<th>Volunteer Phone Number</th>';
	echo '<th>Volunteer Email</th>';
	echo '</tr>';
	
	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['volunteer_id'] . '</td>';
		echo '<td>' . $row['volunteer_last_name'] . '</td>';
		echo '<td>' . $row['volunteer_first_name'] . '</td>';
		echo '<td>' . $row['volunteer_phone'] . '</td>';
		echo '<td>' . $row['volunteer_email'] . '</td>';
		echo '</tr>';
	}
	
	echo '</table>';
	$result->free_result();
	$sql->close();
}
?>
	</body>
</html>
