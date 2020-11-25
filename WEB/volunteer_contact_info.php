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
	echo 'Connected successfully.';
}
$sql->close();
?>
	</body>
</html>
