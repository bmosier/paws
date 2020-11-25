<!DOCTYPE html>
<html>
	<head>
		<title>Month Adoption Count</title>
	</head>
	<body>
		<h2>Month Adoption Count (Stored Function)</h2>
		<h4>Author: Denis Roman</h4>
		<p><b>Description:</b> text here</p>
		<p><b>Justification:</b> text here</p>
		<p><b>Expected Execution:</b> text here</p>
		
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
	</body>
</html>
