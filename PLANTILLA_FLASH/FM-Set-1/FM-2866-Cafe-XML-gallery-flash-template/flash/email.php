<?php
//Type the receiever's e-mail address
$emailAddress = "info@email.com";
//Type your Site Name
$siteName = "Company Name";

$contact_name = $_POST['name'];
$contact_email = $_POST['email'];
$contact_subject = $_POST['subject'];
$contact_message = $_POST['message'];

if( $contact_name == true ) {
	$sender = $contact_email;
	$receiver = $emailAddress;
	$client_ip = $_SERVER['REMOTE_ADDR'];

	$email_body = "The Name Of The Sender: $contact_name \nEmail: $sender \n\nSubject: $contact_subject
\n\nMessage: \n\n$contact_message \n\nIP ADDRESS: $client_ip \n\n$siteName";

	$emailAutoReply = "Hi $contact_name, \n\nWe have just received your E-Mail. We will get
in touch in a few days. Thank you!  \n\n$siteName ";

	$extra = "From: $sender\r\n" . "Reply-To: $sender \r\n" . "X-Mailer: PHP/" . phpversion();
	$autoReply = "From: $receiver\r\n" . "Reply-To: $receiver \r\n" . "X-Mailer: PHP/" . phpversion();

	mail( $sender, "Auto Reply: $contact_subject", $emailAutoReply, $autoReply );

	if( mail( $receiver, "New E-Mail - $contact_subject", $email_body, $extra ) ) {
		echo "success=yes";
	} else {
		echo "success=no";
	}
}
?>