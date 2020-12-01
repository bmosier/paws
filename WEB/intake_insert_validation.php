<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">

<title>Intake Insert Validation</title>
</head>
	<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
      		</div>

	</br>
	<body>
		<h2>Intake Insert Validation (Trigger)</h2>
		<br>

		<h3>Author: Samuel James</h3>
		<br>
		<p><b>Description:</b> This page demonstrates that the intake_BEFORE_INSERT trigger is functional and correct.
		This trigger ensures that a shelter's maximum number of animals is not exceeded when creating an intake record.</p>
		<br>
		<p><b>Justification:</b> A shelter cannot house more animals than its maximum capacity, this trigger enforces the maximum shelter capacity.</p>
		<br>
		<p><b>Expected Execution:</b> 
		Input the data for a new intake record to be inserted into the database. Try inserting
		a record with an intake ID of 001, an Animal ID of 90, a Shelter of 10, A customer ID of 6001, a staff IF of 9050003 and any date with the "SURRENDERED" intake type.
 		The insert should be successful display the data. 
		The shelter with a shelter ID of 10 is now at maximum capacity (5 animals). </br> 
		Now try inserting a record
		with an intake ID of 002, an Animal ID of 91, a Shelter of 10, A customer ID of 6002, a staff IF of 9050017 and any date with the "BABY" intake type.
		This will fail and give the appropriate error message generated by my trigger.</p>
		<br>
		<h3>Please enter the following information for the new Intake Record entity:</h3>

		<form method="post">
			Intake ID:
			<select name="intake_ID" width=300 STYLE="width: 350px">
  				<option value="001">001</option>
  				<option value="002">002</option>
			</select>
			
			</br>
			Shelter ID:
			<select name="shelter_ID" width=300 STYLE="width: 350px">
  				<option value="10">10</option>
			</select>
			
			</br>
			Animal ID:
			<select name="animal_ID" width=300 STYLE="width: 350px">
  				<option value="90">90</option>
				<option value="91">91</option>
			</select>

			</br>
			Customer ID:
			<select name="customer_ID" width=300 STYLE="width: 350px">
  				<option value="6001">6001</option>
				<option value="6002">6002</option>
			</select>

			</br>
			Staff Member ID:
			<select name="staff_ID" width=300 STYLE="width: 350px">
  				<option value=9050003>9050003</option>
				<option value=9050017>9050017</option>
			</select>

			<br />
			<label for="intake_date">Intake Date: </label>
			<input type="date" name="intake_date" id="intake_date" />
			<br />

			</br>
			Staff Member ID:
			<select name="intake_type" width=300 STYLE="width: 350px">
  				<option value="BABY">BABY</option>
				<option value="SURRENDERED">SURRENDERED</option>
			</select>
			</br>
			<input type="submit" value="Insert" />

		</form>
<?php
require_once '../dbconfig.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	$shelter_ID = $_POST['shelter_ID'];
	$staff_ID = $_POST['staff_ID'];
	$animal_ID = $_POST['animal_ID'];
	$customer_ID = $_POST['customer_ID'];
	$intake_ID = $_POST['intake_ID'];
	$intake_type = $_POST['intake_type'];
	$intake_date = $_POST['intake_date'];
	
	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
	$sqlquery = 'INSERT INTO intake (intake_ID, animal_ID, customer_ID, staff_ID, shelter_ID, intake_date, intake_type)
						VALUES (' . $sql->real_escape_string($intake_ID) . ',
						' . $sql->real_escape_string($animal_ID) . ',
						' . $sql->real_escape_string($customer_ID) . ',
						' . $sql->real_escape_string($staff_ID) . ',
						' . $sql->real_escape_string($shelter_ID) . ",
						STR_TO_DATE('" . $sql->real_escape_string($intake_date) . "', '%Y-%m-%d'),
 						' $intake_type ')";
	if ($sql->query($sqlquery)) {
			// insert successful
			
			$sqlquery = 'SELECT intake_ID, animal_ID, intake_date, intake_type FROM intake
							WHERE intake_ID = ' . $sql->real_escape_string($intake_ID) . ';';
		
			$result = $sql->query($sqlquery);
			
			if ($result) {
				
				// fetch single result
				$row = $result->fetch_assoc();
				
				echo '<p>Intake ID: ' . $row['intake_ID'] . '</p>';
				echo '<p>Animal ID: ' . $row['animal_ID'] . '</p>';
				echo '<p>Intake Date: ' . $row['intake_date'] . '</p>';
				echo '<p>Intake Type: ' . $row['intake_type'] . '</p>';
				
				$result->free_result();
				
			} else {
				echo '<p>' . $sql->error . '</p>';
			}
		} else {
			echo '<p>' . $sql->error . '</p>';
		}
		
		$sql->close();
	}
}
?>

	</body>
</html>
