<?
	if(!empty($_POST['p_nm']) || !empty($_POST['p_em']) || !empty($_POST['p_ms']))
	{
		$to = "test@yourwebsite.com";
		$subject = stripslashes('Website contact request');
		$body = stripslashes($_POST['p_ms']);
		$body .= "\n\n---------------------------\n";
		$body .= "Mail sent by: " . $_POST['p_nm'] . " <" . $_POST['p_em'] . ">\n";
		$header = "From: " . $_POST['p_nm'] . " <" . $_POST['p_em'] . ">\n";
		$header .= "Reply-To: " . $_POST['p_nm'] . " <" . $_POST['p_em'] . ">\n";
		$header .= "X-Mailer: PHP/" . phpversion() . "\n";
		$header .= "X-Priority: 1";
		@mail($to, $subject, $body, $header);
	}
?>