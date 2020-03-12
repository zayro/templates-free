<?php

// Enter your contact email address here
$adminaddress = "write@attique.it";

// Enter the address of your website here include http://www.
$siteaddress ="http://www.youportfolio.cc";

// Enter your company name or site name here
$sitename = "YourPortfolio";

$action=isset($_REQUEST['action'])?$_REQUEST['action']:'action';
$name1=isset($_REQUEST['name1'])?$_REQUEST['name1']:'name1';
$email1=isset($_REQUEST['email1'])?$_REQUEST['email1']:'email1';
$phone1=isset($_REQUEST['phone1'])?$_REQUEST['phone1']:'phone1';
$city1=isset($_REQUEST['city1'])?$_REQUEST['city1']:'city1';
$text1=isset($_REQUEST['text1'])?$_REQUEST['text1']:'text1';

$date = date("m/d/Y H:i:s");

if ($_SERVER['REMOTE_ADDR'] == "") $ip = "no ip";
else $ip = getHostByAddr($_SERVER['REMOTE_ADDR']);


if ($action != ""):
mail("$adminaddress","MAIL FROM YOURSITE",

"Mail sent by $sitename:

The user

$name1
$email1
phone:$phone1
city:$city1

message:
-----------------------------------
$text1


-----------------------------------


Visitors Info and IP :
-----------------------------------
Using: ".$_SERVER['HTTP_USER_AGENT']."
Hostname: $ip
IP address: ".$_SERVER['REMOTE_ADDR']."
Date/Time:  $date","FROM:$adminaddress");


//answer to the user
mail("$email1","thanks for your mail at $sitename",

"Dear $name1

thanks for your interest in $sitename

We'll answer as soon as possible

$sitename
$siteaddress","FROM:$adminaddress");

$sendresult = "Thanks for your interest.
We'll answer as soon as possible. ";
$send_answer = "answer=$sendresult";
echo "$send_answer";

endif;

?>

