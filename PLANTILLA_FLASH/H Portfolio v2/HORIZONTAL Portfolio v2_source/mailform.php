<?
function parse($valeur){
        return stripslashes(nl2br(utf8_decode($valeur)));
}
$sujetmsg = parse($_POST['sujet']);
$nomprenom = parse($_POST['nomprenom']);
$mail = parse($_POST['mail']);
$message = parse($_POST['msg']);
$contentmsg = "<b>Name, Surname: </b>".$nomprenom."<b><br />Mail address: </b>".$mail."<b><br /><br />Message SEND FOR SITE: <br /></b>".$message;
//GUEST MAIL INFORMATION/////////////////////////////////////////
$sreception = "Thank you for website";
$creception = "Your message is send  <br><br> Thanks...";
////// HERE MAIL ADRES WRITE/////////////////////////////////////
$email="your@yourdomainname.com"; 
////// HERE your SITENAME////////////////////////////////////////
$sujet="Message in YOURSITENAME : ".$sujetmsg." "; 
$headers = "MIME-Version: 1.0\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\n"; 
$headers .= "From: ".$mail."\n";
////////////////////////////////////////////////////////////////7
$headers2 = "MIME-Version: 1.0\n";
$headers2 .= "Content-type: text/html; charset=iso-8859-1\n"; 
$headers2 .= "From: ".$email."\n";
/////////////////////////////////////////////////////////////////
mail($email,$sujet,$contentmsg,$headers);
mail($mail,$sreception,$creception,$headers2);

?>