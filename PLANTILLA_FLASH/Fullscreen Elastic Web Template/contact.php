<?php

$sendTo = "your@mail.com";
$subject = $_GET['csubject'];
$message = $_GET['cmessage'];
$email = $_GET['cemail'];
$name = $_GET['cname'];
$phone=$_GET['cphone'];
	

//send mail info
	$headers  = "From: $email\r\n";
	//$headers .= 'MIME-Version: 1.0' . "\r\n";
	//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    	$msg = "\n\n Name:".$name."\n\n Phone:".$phone."\n\n E-Mail:".$email."\n\n Message:".$message."";

//send mail	
	mail($sendTo, $subject, $msg, $headers);
?>