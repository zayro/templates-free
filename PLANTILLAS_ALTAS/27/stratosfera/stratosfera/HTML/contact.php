<?php
	
	$admin_email = 'test@test.com'; //Your email
	$subject = 'Contact form'; //Email subject
	
	$name = isset($_POST['name']) && $_POST['name'] ? $_POST['name'] : ''; //Name sent by form
	$email = isset($_POST['email']) && $_POST['email'] ? $_POST['email'] : ''; //Email sent by form
	$message = isset($_POST['message']) && $_POST['message'] ? $_POST['message'] : ''; //Message sent by form
	$website = isset($_POST['website']) && $_POST['website'] ? $_POST['website'] : ''; //Message sent by form
	
	$full_message = 'Website: '.$website. "\r\n\r\n Message:".$message;

	if($name && $email && $message)
	{
		$headers = 'From: '.$name.' <'.$email.'>' . "\r\n" .
		'Reply-To: '.$email.'' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();
		$headers .= 'Content-type: text/plain; charset=UTF-8' . "\r\n";
			
		//------------------------------------------------
		// Send out email to site admin
		//------------------------------------------------
		if(@mail($admin_email, $subject, $full_message, $headers))
			die("success");
		else
			die("error");
	}
	else
	{
		die("error");
	}
	
?>
