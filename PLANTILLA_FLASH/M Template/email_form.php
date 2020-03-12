<? 
$from = "From: " . $_POST['emname'] . " -> E-mail: " . $_POST['ememail'];
$text="Message text: " . $_POST['emmessage'];
$message=$from . "\r\n" . $text;
ini_set("SMTP", "mail.yourwebsite.com");//Place your server info here
ini_set ("sendmail_from","postmaster@yourwebsite.com");//Place your server info here
$headers = "From:" . $_POST['emnome'] . "<postmaster@yourwebsite.com>" . "\r\n" .//Place your server info here
   		   'Reply-To: ' . $_POST['ememail'] . "\r\n" .
           'X-Mailer: PHP/' . phpversion();
if (mail('mail@yourwebsite.com', 'Contact m template', $message, $headers))//Place your receiving e-mail here
{
		echo "fromPHP=Mail sent. Thank you for contacting us.";
} 
else 
{
		echo "fromPHP=Mail error. Please try again.";
}
?> 