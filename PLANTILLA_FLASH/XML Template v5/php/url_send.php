<?php



$SENDTO =$_POST['SENDTO']; ///your e-mail adresse ( change in configuration xml file)
$message.=$_POST['HEADLINE']."\r\n\r\n\r\n";  /////entrance e-mail ( change in configuration xml file)
$KEY_SUBJECT=$_POST['KEY_SUBJECT'];  /////  ( change in configuration xml file)
$KEY_RETURNABLE_EMAIL=$_POST['KEY_RETURNABLE_EMAIL'];  ///// ( change in configuration xml file)





/////////////////////////////////////////////////////////////code send e-mail

foreach ($_POST as $varname => $varvalue) {
$array_value=explode(":",$varvalue);
$array[$varname][0]=$array_value[0];
$array[$varname][1]=$array_value[1];
}

$array=array_reverse($array);   

foreach ($array as $varname => $varvalue) {
if($varname!="onLoad"&&$varname!="SENDTO"&&$varname!="HEADLINE"&&$varname!="KEY_SUBJECT"&&$varname!="KEY_RETURNABLE_EMAIL"){
$message.=$varvalue[0]." : \r\n ".$varvalue[1]."\r\n\r\n\n\n";
}
}

$subject =$array[$KEY_SUBJECT][1];  /////subject
$email_from=$array[$KEY_RETURNABLE_EMAIL][1];

$header = "From:$email_from <$email_from>\n";
$header .= "MIME-Version: 1.0\r\n"."Content-type: text/plain; charset=utf-8\r\n";
$header .= "Content-Type: text/plain;\n";
$header .= "\tcharset=\"iso-8859-2\"\n";
$header .= "Content-Transfer-Encoding: quoted-printable\n\n";

mail($SENDTO,$subject,$message,$header);
echo "&senden=ok&";

/////////////////////////////////////////////////////////end code

?>
