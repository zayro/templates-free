<? 
$from = "De: " . $_POST['emname'] . " -> E-mail: " . $_POST['ememail'];
$texto="Texto da mensagem: " . $_POST['emmessage'];
$message=$from . "\r\n" . $texto;
ini_set("SMTP", "mail.yourwebsite.com");
ini_set ("sendmail_from","postmaster@yourwebsite.com");
$headers = "From:" . $_POST['emnome'] . "<postmaster@yourwebsite.com>" . "\r\n" .
   		   'Reply-To: ' . $_POST['ememail'] . "\r\n" .
           'X-Mailer: PHP/' . phpversion();
if (mail('mail@yourwebsite.com', 'Contact Calendar Template', $message, $headers))
{
		echo "fromPHP=Mail sent. Thank you for contacting us.";
} 
else 
{
		echo "fromPHP=Mail error. Please try again.";
}
?> 