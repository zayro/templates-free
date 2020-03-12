<?php
$name = $_POST["id"];
$from = $_POST["from"];
$message = $_POST["msg"];
$subject = "wh0w | Contact | " . $_POST["objet"];
$msg = utf8_decode($msg);
$msg = str_replace("\\", "", $msg);
$msg = stripslashes($msg);
$msg .= "\n";
$body = "Message de : " . $name . ", " . $from . "\n\n"; 
$body .= $msg;

mail("contact@wildwisemedia.com",$subject,$body);
echo "statut=ok";
?>