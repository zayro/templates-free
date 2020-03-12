<?php
$name = $_POST["id"];
$from = $_POST["from"];
$message = $_POST["msg"];
$subject = "My website | Contact | " . $_POST["objet"];
$msg = utf8_decode($msg);
$msg = str_replace("\\", "", $msg);
$msg = stripslashes($msg);
$msg .= "\n";
$body = "Message from : " . $name . ", " . $from . "\n\n"; 
$body .= $msg;

mail("yourmail@yoursite.com",$subject,$body);
echo "statut=ok";
?>