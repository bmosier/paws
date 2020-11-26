<!DOCTYPE html>
<html>
	<head>
		<title>Volunteer Contact Information</title>
	</head>
	<body>
		<h2>Volunteer Contact Information (View)</h2>
		<h4>Author: Denis Roman</h4>
		<p><b>Description:</b> This page allows you to view the contact information of all volunteers. This uses the v_volunteer_contact view.</p>
		<p><b>Justification:</b> This page is useful to shelter staff who wish to contact a volunteer and need the contact information.</p>
		<p><b>Expected Execution:</b> There should be a table with the volunteer IDs, last names, first names, phone numbers, and emails, for all volunteers.</p>
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
	echo '<th>Volunteer ID</th>';
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
