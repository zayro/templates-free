<?php

	//please put your own email address inside the double quotes in the following line
	$to = "";
	
	$name = $_POST['name_value'];
	$email = $_POST['email_value'];
	$subject = $_POST['subject_value'];
	$message = $_POST['message_value'];
	$msg = "Sender: $name\nE-Mail: $email\nMessage: $message";
	
	$headers = "From:$email\n";
	$headers .= "Reply-To:$email\n";
	$mail_status = mail($to,$subject,$msg,$headers);
	
	if($mail_status){
		echo "returnVal=success";
	}
	else{
		echo "returnVal=error";
	}


?>
