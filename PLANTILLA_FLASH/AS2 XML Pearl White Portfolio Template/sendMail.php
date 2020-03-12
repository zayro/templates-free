<?php

// vars from the form

$form_name = $_POST["form_name"];$form_email = $_POST["form_email"];$form_body = $_POST["form_body"];$form_admin_email = $_POST["form_admin_email"];

// I check if all the variables are set and if not I end the script and print an error

if (!isset(

	$form_name,
	$form_email,
	$form_body,
	$form_admin_email

	)) {

	exit("operationResult=KO");

}

// admin message object

$admin_message_object = "Message from website by $form_name";

// admin header information

$admin_headers = "From: Message from website by $form_name <$form_email>";

// admin message

$admin_message = "
Data from website:

Name:
$form_name

Email:
$form_email

Message:
$form_body
";

// user message object

$user_message_object = "Thank you for contacting us";

// user header information

$user_headers = "From: Company Name <$form_admin_email>";

// user message

$user_message = "

Thank you for contacting us.
Your message and contact information here.
";

// if all the variables are set I can send the messages to the admin email and to the admin phone

if (	mail($form_admin_email, $admin_message_object, $admin_message, $admin_headers) &&
	mail($form_email, $user_message_object, $user_message, $user_headers)) {

	exit("operationResult=OK");

}

?>