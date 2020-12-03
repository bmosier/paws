<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
		<div id="bar">
        		<div class="link"><a href="LandingPage.html">Landing Page</a></div>
      		</div>

	<body>
		<h2>Animals Available By Attribute Report (Procedure)</h2>
		<h3>Author: Samuel James</h3>
		<br>
		<p><b>Description:</b> This page allows users a way to view animals currently up for adoption by breed, gender and species.</p>
		<br>
		<p><b>Justification:</b> This page is useful to users for in-depth searching for animals they would like to adopt</p>
		<br>
		<p><b>Expected Execution:</b> Upon inputting an animal breed, animal species and gender all matching animals currently up for adoption shall be displayed</p>
		<br>
		<form method="post">
			Species:
			<select name="species" width=300 STYLE="width: 350px">
  				<option value="Dog">Dog</option>
  				<option value="Cat">Cat</option>
				<option value="Snake">Snake</option>
			</select>
			<br />

			Breed:
			<select name="breed" width=300 STYLE="width: 350px">
  				<option value="Pitbull">Pitbull</option>
  				<option value="Maine Coon">Maine Coon</option>
				<option value="German Shepard">German Shepard</option>
				<option value="Tuxedo">Tuxedo</option>
  				<option value="Gardner">Gardner</option>
				<option value="Labrador">Labrador</option>
				<option value="Daschund">Daschund</option>
  				<option value="Black Labrador">Black Labrador</option>
				<option value="Australian Shepard">Australian Shepard</option>
				<option value="Calico">Calico</option>
  				<option value="Tabby">Tabby</option>
				<option value="Siamese">Siamese</option>
		
			</select>
			<br />
			
			Gender:
			<select name="gender" width=300 STYLE="width: 350px">
  				<option value="M">M</option>
  				<option value="F">F</option>
			</select>
			<br />


			<input type="submit" value="Submit" />
		</form>
<?php
require_once '../dbconfig.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$species = $_POST['species'];
	$breed = $_POST['breed'];
	$gender = $_POST['gender'];
	
	$sql = new mysqli($hostname, $username, $password, $schema);
	if ($sql->connect_errno) {
		echo 'Connection failed: ' . $sql->connect_errno;
	} else {
	$result = $sql->query("CALL Adopt_By_Attribute('" . $breed . "','" . $gender . "','" . $species . "');");	
	echo '<table border="1" align="center">';
	echo '<tr>';
	echo '<th>Animal Name</th>';
	echo '<th>Animal DOB</th>';
	echo '<th>Animal Species</th>';
	echo '<th>Animal Breed</th>';
	echo '<th>Animal Gender</th>';
	echo '<th>Description</th>';
	echo '<th>Shelter or Fosterhome Name</th>';
	echo '<th>City</th>';
	echo '<th>Street</th>';
	echo '<th>State</th>';
	echo '<th>Phone</th>';
	echo '<th>Zipcode</th>';
	echo '</tr>';

	while ($row = $result->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['name'] . '</td>';
		echo '<td>' . $row['animal_DOB'] . '</td>';
		echo '<td>' . $row['animal_species'] . '</td>';
		echo '<td>' . $row['animal_breed'] . '</td>';
		echo '<td>' . $row['animal_sex'] . '</td>';
		echo '<td>' . $row['animal_description'] . '</td>';
		echo '<td>' . $row['Shelter_or_Foster_name'] . '</td>';
		echo '<td>' . $row['city'] . '</td>';
		echo '<td>' . $row['street'] . '</td>';
		echo '<td>' . $row['state'] . '</td>';
		echo '<td>' . $row['phone'] . '</td>';
		echo '<td>' . $row['zipcode'] . '</td>';
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
