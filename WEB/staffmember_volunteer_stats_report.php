<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
	<head>
		<title>Staffmember and Volunteer Contact Report</title>
	</head>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
      		</div>

	<body>
		<h2>Customer Staff Statistics Report (Procedure)</h2>
		<h4>Author: Samuel James</h4>
		<p><b>Description:</b> This page allows shelter managers a way to view the amount of volunteers and staff members currently working for them and the staff or volunteer contact information</p>
		<p><b>Justification:</b> This page is useful to shelter managers who need to view the amount of staff and volunteers they currently have working and how to contact them as well as being useful for staff to contact other staff members to cover shifts.</p>
		<p><b>Expected Execution:</b> Upon inputting a shelter name the contact information for each staff member or volunteer working for the given shelter 
		If the shelter name "Medford Animal Shelter" was input the information for all staff and volunteers tied to that shelter shall be displayed.</p>
		<form method="post">
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
	$result = $sql->query("CALL staff_stats('" . $shelter_name . "');");
		
	echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Staff/Volunteer First Name</th>';
	echo '<th>Staff/Volunteer Last Name</th>';
	echo '<th>Staff/Volunteer Phone Number</th>';
	echo '<th>Staff/Volunteer Phone Ext or Email</th>';
	echo '<th>Shelter Name</th>';
	echo '</tr>';

	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['Firstname'] . '</td>';
		echo '<td>' . $row['LastName'] . '</td>';
		echo '<td>' . $row['phone'] . '</td>';
		echo '<td>' . $row['email_or_phone_extension'] . '</td>';
		echo '<td>' . $row['shelter_name'] . '</td>';
		echo '</tr>';
	}
	echo '</table>';
	$result->free_result();
	$sql->close();
	}
}
?>
	</body>
</html>
