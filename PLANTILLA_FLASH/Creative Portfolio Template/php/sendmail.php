<?php
	$extra_info = true;
	
	$myKey = 'geheim'; 

if( !empty($_POST) ){
	
	$yourMail = $_POST['youremail'];
	$sendName = $_POST['name'];
	$sendMail = $_POST['mail'];
	$sendMessage = $_POST['message'];
	$verzenderNaam = $sendMail;
	$verzender = 'From: '.$verzenderNaam.' <'.$yourMail.'>'; 

	//de headers
    $mailHeader .= 'Reply-To: '.$sendName.' <'.$sendMail.'>'."\r\n"; 
    $mailHeader .= $verzender."\r\n"; 
    $mailHeader .= 'X-Mailer: PHP/'. phpversion() . "\r\n";
    $mailHeader .= 'X-Priority: 1'."\r\n"; 
    $mailHeader .= 'Priority: Urgent'."\r\n";


	$sendDay = date("d.m.Y");
	$sendTime = date("H:i:s");

	if ($extra_info == true) { 
		$ip = $_SERVER['REMOTE_ADDR'];
		$hostmask = gethostbyaddr($ip); 
		$taal = ( $HTTP_SERVER_VARS['HTTP_ACCEPT_LANGUAGE'] != '' ) ? $HTTP_SERVER_VARS['HTTP_ACCEPT_LANGUAGE'] : 'Detectie mislukt...';
		$browser = ( $_SERVER['HTTP_USER_AGENT'] != '' ) ? $HTTP_SERVER_VARS['HTTP_USER_AGENT'] : 'Detectie mislukt...';
		
		$sendXtraInfo = '
		IP-adres: '.$ip.'('.$hostmask.')
		Taal: '.$taal.'
		Browser: '.$browser;
	}

	$mailContent = '
Message date = '.$sendDay.' at '.$sendTime.'
____________________________________________________________________________
From: '.$sendName.'
Email: '.$sendMail.'
____________________________________________________________________________
Message: '.$sendMessage.'

'.$sendXtraInfo;

	if ($_POST['myKey'] == $myKey ) {
		$versturen = mail($yourMail, $sendName.' contacts you', $mailContent, $mailHeader);
	} else {
		$versturen = false; 
	}

	$mailResult = ( $versturen ) ? true : false;
	echo '&mailResult='.$mailResult.'&';

} 
?>