<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">

<title>Intake Insert Validation</title>
	<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
            		<div class="link"><a href="PAWS.html">PAWS Homepage</a></div>
      		</div>

</head>
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
		a record with an intake ID of 001, an Animal ID of 90, a Shelter of 10, A customer ID of 6001, a staff IF of 9050003 and any date with any intake type.
 		The insert should be successful display the data. 
		The shelter with a shelter ID of 10 is now at maximum capacity (5 animals). Now try inserting a record
		with an intake ID of 002, an Animal ID of 90, a Shelter of 10, A customer ID of 6001, a staff IF of 9050003 and any date with any intake type.
		This will fail and give the appropriate error message generated by my trigger.</p>
		<br>
		<h3>Please enter the following information for the new Intake Record entity:</h3>

		<form method="post">
			<br />
			<label for="intake_ID">Intake ID: </label>
			<input type="number" name="intake_ID" id="intake_ID" />
			<br />

			<br />
			<label for="shelter_ID">Shelter ID: </label>
			<input type="number" name="shelter_ID" id="shelter_ID" />
			<br />
			
			<br />
			<label for="animal_ID">Animal ID: </label>
			<input type="number" name="animal_ID" id="animal_ID" />
			<br />

			<br />
			<label for="customer_ID">Customer ID: </label>
			<input type="number" name="customer_ID" id="customer_ID" />
			<br />
			
			<br />
			<label for="staff_ID">Staff ID: </label>
			<input type="number" name="staff_ID" id="staff_ID" />
			<br />

			<br />
			<label for="intake_date">Intake Date: </label>
			<input type="date" name="intake_date" id="intake_date" />
			<br />

			<br />
			<label for="intake_type">Intake Type: </label>
			<input type="text" name="intake_type" id="intake_type" />
			<br />
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