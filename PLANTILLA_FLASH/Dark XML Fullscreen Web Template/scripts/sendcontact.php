<?php
	//get vars from flash
	$toEmail = $_REQUEST["toEmail"];
	$getName = $_REQUEST["getName"];
	$getEmail = $_REQUEST["getEmail"];
	$getMsg = $_REQUEST["getMsg"];
	//gets rid of unwanted chars
	$toEmail = stripslashes($toEmail); 
	$getName = stripslashes($getName); 
	$getEmail = stripslashes($getEmail); 
	$getMsg = stripslashes($getMsg); 
	//subject
	$yourSubject = $getName." sent you a message.";
	//put all info in the message body
	$body = $getMsg;
	//puts from in correct format
	$from = "From: $getEmail\r\n";
	//send the email
	mail($toEmail, $yourSubject, $body, $from);
?>
