<?PHP

if (!get_magic_quotes_gpc()) {
  foreach($_POST as $key=>$value) {
    $temp = addslashes($value);
    $_POST[$key] = $temp;
    }
  }

$to = 'YOUR EMAIL ADDRESS GOES HERE';
$subject ='MAIL CONTACT FORM:'.$_POST['subject'];

$name = 'Name: '.$_POST['name'];
$email = 'Email: '.$_POST['email'];
$telephone = 'Telephone Number: '.$_POST['telephone'];
$theMessage = $_POST['theMessage'];
$additionalHeaders = "From: ".$_POST['name']."<".$_POST['email'].">\n";
$additionalHeaders .= "Reply-To: $_POST[email]";

$messagetosend = 'You have recieved an email via your website from:'."\n\n";
$messagetosend .= $name."\n";
$messagetosend .= $email."\n";
$messagetosend .= $telephone."\n\n";
$messagetosend .= 'Here is the message:'."\n\n";
$messagetosend .= $theMessage."\n\n";
$messagetosend .= 'You can reply to this mesage to respond'."\n\n";


$OK = mail($to, $subject, $messagetosend, $additionalHeaders);
//
if ($OK) {
$flashreply = 'Email Message Sent';
echo 'sentSuccess='.urlencode($flashreply);
} else {
}

?>