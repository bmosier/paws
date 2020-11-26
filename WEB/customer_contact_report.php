<!DOCTYPE html>
<html>
	<head>
		<title>Customer Contact Report</title>
	</head>
	<body>
		<h2>Customer Contact Report (Procedure)</h2>
		<h4>Author: Denis Roman</h4>
		<p><b>Description:</b> This page allows you to view the phone numbers of customers who had an adoption within the specified date range (inclusive).
		It also states whether or not the adopted animal has had a wellness check. This uses the customer_contact_report procedure.</p>
		<p><b>Justification:</b> This page is useful to shelter staff who need to make sure that all newly adopted animals get wellness checks shortly after being adopted.
		A staff member can input a date range and see which adopted animals haven't gotten wellness checks.</p>
		<p><b>Expected Execution:</b> Upon inputting a date range, animals adopted in that timeframe will be displayed, along with whether or not they had wellness checks, and who the adopting customer is and how to contact them.
		For example, if you input a start date of 10/23/2020 and an end date of 10/26/2020,
		there should be 4 rows in the table, with all of the animals there having been adopted between 10/23/2020 and 10/26/2020,
		and having had wellness checks.</p>
		<form method="post">
			<label for="start_date">Start Date: </label>
			<input type="date" name="start_date" id="start_date"<?php
if (isset($_POST['start_date'])) {
	echo ' value="' . $_POST['start_date'] . '"';
}
?> />
			<br />
			<label for="end_date">End Date: </label>
			<input type="date" name="end_date" id="end_date"<?php
if (isset($_POST['end_date'])) {
	echo ' value="' . $_POST['end_date'] . '"';
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
	
	$start_date = $_POST['start_date'];
	$end_date = $_POST['end_date'];
	
	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
		
		$p_date1 = "STR_TO_DATE('" . $sql->real_escape_string($start_date) . "', '%Y-%m-%d')";
		$p_date2 = "STR_TO_DATE('" . $sql->real_escape_string($end_date) . "', '%Y-%m-%d')";
		
		$result = $sql->query('CALL customer_contact_report(' . $p_date1 . ', ' . $p_date2 . ');');
		
		echo '<table border="1" align="center">';
		echo '<tr>';
		echo '<th>Customer Last Name</th>';
		echo '<th>Customer First Name</th>';
		echo '<th>Customer Phone Number</th>';
		echo '<th>Adoption Date</th>';
		echo '<th>Animal Name</th>';
		echo '<th>Animal Had Wellness Check</th>';
		echo '</tr>';
		
		while ($row = $result->fetch_assoc()) {
			echo '<tr>';
			echo '<td>' . $row['customer_last_name'] . '</td>';
			echo '<td>' . $row['customer_first_name'] . '</td>';
			echo '<td>' . $row['customer_phone'] . '</td>';
			echo '<td>' . $row['adoption_date'] . '</td>';
			echo '<td>' . $row['animal_name'] . '</td>';
			echo '<td>' . $row['had_wellness_check'] . '</td>';
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
