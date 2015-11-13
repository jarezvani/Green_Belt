<?php 
session_start();
require('new_connection.php');

if(!isset($_SESSION['error']))
{
	$_SESSION['error'] = [];
}
else
{
	foreach ($_SESSION['error'] as $message) 
	{
		echo $message . "<br>";
	}
}

unset($_SESSION['error']);
?>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Add Poll</title>
	<meta name="poll" value="index">
	<link rel="stylesheet" type="text/css" href="success_css.css">
</head>
<body>
	<div id="container">
		<h3>Add Poll</h3>
		<form action="process.php" method="post">
			<input type="hidden" name="action" value="add_poll">
			<label>Title: </label>
			<input type="text" name="title">
			<label>Description: </label>
			<textarea rows="10"cols="60" name="description"></textarea>
			<label>Options: </label>
			<input type="text" name="option1" placeholder="Option 1">
			<input type="text" name="option2" placeholder="Option 2">
			<input type="text" name="option3" placeholder="Option 3">
			<input type="text" name="option4" placeholder="Option 4">
			<input type="submit" value="Add Poll">
		</form>
		<form action="index.php">
			<input type="submit" value="Cancel">
		</form>
	</div>
</body>
</html>