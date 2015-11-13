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

?>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Polls</title>
	<meta name="description" value="index">
	<link rel="stylesheet" type="text/css" href="index_css.css">
</head>
<body>
	<form action="add_poll.php">
		<input type="submit" value="Add a poll">
	</form>
	<?php 

		$polls = fetch_all("SELECT * FROM green_belt.polls ORDER BY created_at DESC");

		foreach ($polls as $poll) 
		{
			$options = fetch_all("SELECT * FROM green_belt.poll_options WHERE poll_id = {$poll['id']}");
			$total_results = count(fetch_all("SELECT * FROM green_belt.poll_results WHERE poll_id = {$poll['id']}"));

	
			echo '

					<div class="container">
	 					<div class="poll">
	 						<h3>' . $poll['name'] . '</h3>
	 						<p class="id">ID: ' . $poll['id'] . '</p>
	 						<p>' . $poll['description'] . '</p>
					 		<form action="process.php" method="post">
					 			<input type="hidden" name="action" value="vote">
					 			<input type="hidden" name="poll_id" value="'. $poll['id'] .'">
					';


						foreach ($options as $option) 
						{
							echo '<label><input type="radio" name="opt" value="' . $option['id'] . '">' . $option['name'] . '</label>';
						}


			echo		 '		
					 			<input type="submit" value="Submit">
					 		</form>
					 	</div>
					 	<p>Results: </p>';

					 	foreach($options as $option)
					 	{
					 		$results = count(fetch_all("SELECT * FROM green_belt.poll_results WHERE poll_option_id = {$option['id']}"));
					 		
					 		if($total_results == 0)
					 		{
					 			$percent = 0;
					 		}
					 		else
					 		{
					 			$percent = $results * 100/$total_results;
					 		}
					 		echo "<p>" . $option['name'] . ":  " . $percent . "%</p>";
					 	}

			echo		 '
					 </div>

					 ';

		}



	 ?>


</body>
</html>
