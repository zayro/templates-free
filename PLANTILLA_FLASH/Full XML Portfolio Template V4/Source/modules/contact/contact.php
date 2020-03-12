<?php
# Send to your email address
$sendTo = "youremailaddress@yourdomain.com";
# Subject line
$subject = "Information Request";
# Send from address
$sendFrom = "FROM: info@yourdomain.com";
# Body 
$body = "A user has left the following information \n \n Name: " . stripslashes($_POST["yourName_txt"]) . " \n Phone #: " . stripslashes($_POST["phone_txt"]) . "\n Email Address: " . stripslashes($_POST["email_txt"]) . "\n Comments: " . stripslashes($_POST["comments_txt"]);
# Send mail
mail($sendTo, $subject, $body, $sendFrom);
?>