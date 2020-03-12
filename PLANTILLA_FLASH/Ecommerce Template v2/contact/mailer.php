<?php

$subject = $_REQUEST["subject"];
$message = $_REQUEST["message"];
$sender = $_REQUEST["sender"];


$full_message = $_SERVER['REMOTE_ADDR'] . "\n\n" . $message;
$message= $full_message;

$message = stripslashes($message); 
$subject = stripslashes($subject); 
$sender = stripslashes($sender); 

$subject = "Contact form ". $subject;

if(isset($message) and isset($subject) and isset($sender)){
	mail("info@tpnwebdesign.com", $subject, $message, "From: $sender");
}
?>