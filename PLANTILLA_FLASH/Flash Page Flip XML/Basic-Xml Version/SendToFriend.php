<?php
$file="Config.php";
include $file;
$userEmail=$_POST["userEmail"];
$userFriendEmail=$_POST["userFriendEmail"];
$userMessage=$_POST["userMessage"];
if ($userMessage=="") $userMessage="...";

$mBody="<font style='color:#000000;font-family:tahoma;font-size:11px'>";
$mBody=$mBody."<b>Your Friend :</b> <a href='mailto:" . $userEmail . "'>" . $userEmail . "</a><br/><br/>";
$mBody=$mBody."<b>thought you might be interested in :</b> <a href='" . $StfLink . "'>" . $StfLink . "</a><br/><br/>";
$mBody=$mBody."<b>Your Friend's Message :</b> " . $userMessage . " <br><br>";
$mBody=$mBody."</font>";

$headers="From: " . $fromName;
$headers .= "<" . $senderEmail .">\r\n";
$headers .= "Reply-To: " . $userEmail .">\r\n";
$headers .="Content-Type: text/html; charset='iso-" . $Charset ."'";

if (mail($userFriendEmail, $StfSubject, $mBody, $headers)){
	echo "sending=1";
}else{
    echo "sending=0";
} 
?>