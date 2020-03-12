<?

//name = _namex
//email = _emailx
//phone = _phonex
//comments = _commx


$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
$headers .= 'From: Studio Mail Form' . "\r\n" .'Reply-To: you@yourdomain.com' . "\r\n";



$ToEmail = "you@yourdomain.com";

$ToName = "kmajszki";
$ToSubject = "Studio Mail Form";

$EmailBody = "<table width='716' height='207' border='1' bgcolor='#090909'>
  <tr>
    <td><font size='2' face='Arial' color='#999999'>Sent By: $_namex \nSenders Email: $_emailx\n Message Sent:\n$_commx</font></td>
  </tr>
</table>";

$EmailFooter="\nThis message was sent by: $_namex from $REMOTE_ADDR ";

$Message = $EmailBody.$EmailFooter;

mail($ToName." <".$ToEmail.">",$ToSubject, $Message, $headers);


Print "_root.Status=success";

?>



