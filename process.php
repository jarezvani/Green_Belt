<?php 
	session_start();
	require('new_connection.php');

	if(isset($_POST['action']) && $_POST['action'] == 'add_poll')
	{

		if(empty($_POST['title']))
		{
			$_SESSION['error'][] = "You must enter a title for this poll.";
		}
		if(empty($_POST['description']))
		{
			$_SESSION['error'][] = "This poll must have a description.";
		}
		if(empty($_POST['option1']))
		{
			$_SESSION['error'][] = "You must create four options for this poll.";
		}
		elseif(empty($_POST['option2']))
		{
			$_SESSION['error'][] = "You must create four options for this poll.";
		}
		elseif(empty($_POST['option3']))
		{
			$_SESSION['error'][] = "You must create four options for this poll.";
		}
		elseif(empty($_POST['option4']))
		{
			$_SESSION['error'][] = "You must create four options for this poll.";
		}

		if(isset($_SESSION['error']))
		{
			header("location: add_poll.php");
			die();
		}

		else
		{
			$esc_title = escape_this_string($_POST['title']);
			$esc_description = escape_this_string($_POST['description']);
			$esc_option1 = escape_this_string($_POST['option1']);
			$esc_option2 = escape_this_string($_POST['option2']);
			$esc_option3 = escape_this_string($_POST['option3']);
			$esc_option4 = escape_this_string($_POST['option4']);


			$poll_query = "INSERT INTO green_belt.polls (name, description, created_at, updated_at) VALUES ('{$esc_title}', '{$esc_description}', NOW(), NOW())";
			$poll_id = run_mysql_query($poll_query);
			$option1_query = "INSERT INTO green_belt.poll_options (name, poll_id, updated_at, created_at) VALUES ('{$esc_option1}', {$poll_id}, NOW(), NOW())";
			$option2_query = "INSERT INTO green_belt.poll_options (name, poll_id, updated_at, created_at) VALUES ('{$esc_option2}', {$poll_id}, NOW(), NOW())";
			$option3_query = "INSERT INTO green_belt.poll_options (name, poll_id, updated_at, created_at) VALUES ('{$esc_option3}', {$poll_id}, NOW(), NOW())";
			$option4_query = "INSERT INTO green_belt.poll_options (name, poll_id, updated_at, created_at) VALUES ('{$esc_option4}', {$poll_id}, NOW(), NOW())";

			$option1_id = run_mysql_query($option1_query);
			$option2_id = run_mysql_query($option2_query);
			$option3_id = run_mysql_query($option3_query);
			$option4_id = run_mysql_query($option4_query);
			
			header("location: index.php");
		}

	}
	elseif(isset($_POST['action']) && $_POST['action'] == 'vote')
	{
		if(empty($_POST['opt']))
		{
			unset($_SESSION['error']);
			$_SESSION['error'][] = "You did not select an option.";
			header("location: index.php");
		}
		else
		{

			$result_id = $_POST['opt'];
			$poll_id = $_POST['poll_id'];
			$result_query = "INSERT INTO green_belt.poll_results (poll_id, poll_option_id, created_at, updated_at) VALUES ({$poll_id}, {$result_id}, NOW(), NOW())";
			$result = run_mysql_query($result_query);

			unset($_SESSION['error']);
			header("location: index.php");
		}
	}
	else
	{
		session_destroy();
		header("location: index.php");
		die();
	}


 ?>