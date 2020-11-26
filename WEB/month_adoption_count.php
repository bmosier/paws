<!DOCTYPE html>
<html>
	<head>
		<title>Month Adoption Count</title>
	</head>
	<body>
		<h2>Month Adoption Count (Stored Function)</h2>
		<h4>Author: Denis Roman</h4>
		<p><b>Description:</b> This page allows you to view how many adoptions occurred in the month
		of a specified date. This uses the month_adoption_count stored function.</p>
		<p><b>Justification:</b> Staff members, and perhaps the front-end of a user-accessible website,
		can use this information to display a statistic of how many animals have been adopted so far this month,
		as well as in any past month.</p>
		<p><b>Expected Execution:</b> Upon inputting a date, the stored function will return a count of all adoptions that
		occurred within the month of that date. For example, if you input 10/15/2020 as the date, a message should appear
		stating that 10 adoptions occurred the month which 10/15/2020 is in.</p>
		
		<form method="post">
			<label for="date">Date: </label>
			<input type="date" name="date" id="date"<?php
if (isset($_POST['date'])) {
	echo ' value="' . $_POST['date'] . '"';
}
?> />
			<br />
			<input type="submit" value="Submit" />
		</form>
<?php
require_once '../dbconfig-paws.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	
	$date = $_POST['date'];
	
	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
		$sqlquery = "SELECT month_adoption_count(STR_TO_DATE('" . $sql->real_escape_string($date) . "', '%Y-%m-%d')) AS adoption_count;";
		
		$result = $sql->query($sqlquery);
		
		// result only has a single row
		echo '<p>Adoption count for month of specified date: ' . ($result->fetch_assoc())['adoption_count'] . '</p>';
		$result->free_result();
		$sql->close();
	}
}
?>
	</body>
</html>
