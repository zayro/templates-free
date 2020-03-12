<?

//name = input0
//email = input1
//comments = input2


$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
$headers .= 'From: User Name  Goes here' . "\r\n" .'Reply-To: demo@demo.com Goes here' . "\r\n";



$ToEmail = "demo@demo.com";

$ToName = "To Name Goes here";
$ToSubject = "Subject Goes here";

$EmailBody = "<table width='716' height='207' border='1' bgcolor='#090909'>
  <tr>
    <td><font size='2' face='Arial' color='#999999'>Sent By: $input0 \nSenders Email: $input1\n Message Sent:\n$input2</font></td>
  </tr>
</table>";

$EmailFooter="\n©2007 Company Name 2007.";

$Message = $EmailBody.$EmailFooter;

mail($ToName." <".$ToEmail.">",$ToSubject, $Message, $headers);


Print "_root.Status=success";

?>



