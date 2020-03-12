<?PHP
$to = "YOUR EMAIL HERE (MAKE SURE TO LEAVE QUOTES)";
$subject = "NAME OF YOUR PAGE HERE (MAKE SURE TO LEAVE QUOTES)";
$e = $_POST['email_txt'];
$message = "Name: " . $_POST['name_txt'];
$message .= "\nE-mail: " . $e;
$message .= "\nPhone: " . $_POST['phone_txt'];
$message .= "\n\nMessage: " . $_POST['message_txt'];
$headers = "From: $e";
$headers .= "\nReply-To: $e";
$sentOk = mail($to,$subject,$message,$headers);
echo "sentOk=" . $sentOk;
?>
