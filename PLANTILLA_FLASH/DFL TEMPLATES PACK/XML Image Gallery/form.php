<?php

//Values
$address="your@mail.com";
$name = $_POST['name'];
$phone = $_POST['phone'];
$mail =$_POST['mail'];
$messages =$_POST['messages'];
$subject =$_POST['subject'];

$title= "From: $name <$mail>\n";
$sub="You have a mail!";


foreach($_REQUEST as $key=>$val){
	$$key = iconv("UTF-8","ISO-8859-9",$val);
}

$data="Name: $name \n\n Telephone : $phone \n\n Mail : $mail \n\n Subject : $subject \n\n Message : $messages";

$title .= 'Content-type: text/html; charset=iso-8859-9' . "\r\n";
if (@mail($address, $sub, $data, $title))
?>