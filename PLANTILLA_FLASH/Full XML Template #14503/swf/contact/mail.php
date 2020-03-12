<?php

/* ---------------------------
Note: most servers require that one of the emails (sender or receiver) to be an email hosted by same server, 
so make sure your email is one hosted on same server.
--------------------------- */


// Taking variables from flash
$subjectmsg = $_POST["subject"];
$surnamename = $_POST["nume"];
$email = $_POST["mail"];
$msg = $_POST["mesaj"];
$phone = $_POST["tel"];
$address = $_POST["addr"];
$contentmsg = "Name: ".$surnamename."\nEmail: ".$email."\nPhone: ".$phone."\nAddress: ".$address."\nMessage: \n".$msg;

//Variables for notifying
$subjectrecep = "Thank you for your message!";
$contentrecep = "You've used my contact form and it works perfectly! Your message was sent. Thank you!";



// Mail setup
$to="bogdan@codelines.ro"; //Put your email here
$subject="".$subjectmsg.""; 

$headers .= "From: ".$email."\n";


//Notify that the message was sent
 $headers2 .= "From: ".$to."\n";


mail($to,$subject,$contentmsg,$headers);
mail($email,$subjectrecep,$contentrecep,$headers2);

?>