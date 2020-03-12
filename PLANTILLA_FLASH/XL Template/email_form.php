<?

//name = name_txt
//email = email_txt
//cmessage = message_txt


$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
$headers .= 'From: User Name  Goes here' . "\r\n" .'Reply-To: demo@demo.com Goes here' . "\r\n";



$ToEmail = "demo@demo.com";

$ToName = "To Name Goes here";
$ToSubject = "Subject Goes here";

$EmailBody = "<table width='716' height='207' border='1' bgcolor='#090909'>
  <tr>
    <td><font size='2' face='Arial' color='#999999'>Sent By: $name_txt \nSenders Email: $email_txt\n Message Sent:\n$message_txt</font></td>
  </tr>
</table>";

$EmailFooter="\n©2007 Company Name 2007.";

$Message = $EmailBody.$EmailFooter;

mail($ToName." <".$ToEmail.">",$ToSubject, $Message, $headers);


Print "_root.Status=success";

?>



