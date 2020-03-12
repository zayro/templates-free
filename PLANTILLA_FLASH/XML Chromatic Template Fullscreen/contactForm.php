<?
// YOU DONT NEED TO CHANGE ANY OF THIS..... MAKE ALL CHANGES IN THE XML FILE ... MAKE CHANGES ON THIS ONLY IF YOU KNOW ABOUT PHP MAIL FORMS
$date = date("m/d/Y H:i:s");// TAKE THE HOUR FORM THE SERVER

// TAKE USER IP
if ($REMOTE_ADDR == "") $ip = "no ip";
else $ip = getHostByAddr($REMOTE_ADDR);

//PROCESS THE INFORMATION AND SEND 2 MAILS ONE FOR YOU AND ONE FOR THE USER AS CONFIRMATION
if ($accion != ""):
mail("$Menvia","$Mtitulo",
" $Mtexto \n
Name: $nombre
Email: $email
Message: $mensaje

User Information :
------------------------------
plataform: $HTTP_USER_AGENT
Hostname: $ip
IP address: $REMOTE_ADDR
Date/Hour:  $date","OF:$Menvia");

//MAIL FO RTHE USER
mail("$email","$confirmT",
"Hello $nombre,\n
 $confirmM!\n
Regards,
$Menvia
$Mtitulo","De:$Menvia");

//SEND A VARIABLE TO FLASH
Print "&enviado=1";
endif;

?>