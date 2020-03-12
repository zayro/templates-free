<?php

$recipients = "modular_flash@yahoo.com" . ",";
$subject = "The Message";
$sendKey  = $_POST['key'];

if($sendKey == "email") {
	
	$name = $_POST['name'];
	$email = $_POST['email'];
	$message = $_POST['message'];
		
	$date = date("F j, Y", time());

	$email_info .= "Below is the visitors contact info and message.\n\n";
	$email_info .= "Visitor's Info:\n";
	$email_info .= "-----------------------------------------\n";
	$email_info .= "Name:  " . $name . "\n";
	$email_info .= "Email:  " . $email . "\n";
	$email_info .= "Date Sent:  " . $date . "\n\n";
	$email_info .= "Message\n";	
	$email_info .= "-----------------------------------------\n";
	$email_info .= "" . $message . "\n";

	$mailheaders = "From: modular_flash@yahoo.com <> \n";
	$mailheaders .= "Reply-To: " . $email . "\n\n";

	if(mail($recipients, $subject, $email_info, $mailheaders)) {		
		print "&success=true";
	}
}

?>