<?php
$nam= $_POST['nam'];
$ema = $_POST['ema'];
$mes = $_POST['mes'];
$temat = substr($wiadomosc,0,15)."...";

$do  = "somemail@mail.com"; //put here your email

$wiadomosc_mail = '<html>'.
'<head>'.
'<style type="text/css">'.
'#nam {color:red;}'.
'#mes {color:black;}'.
'</style>'.
'</head>'.
'<body>'.
'<p id="nam">nam:'.$nam.
'<p>ema:'.$ema.
'<p id="mes">mes:'.$mes.'</p>'.
'</body>'.
'</html>';

$naglowki  = "MIME-Version: 1.0\r\n";
$naglowki .= "Content-type: text/html; charset=UTF-8\r\n";
$naglowki .= "From: MAIL";
mail($do, $temat, $wiadomosc_mail, $naglowki);
echo '&content=Thanks!';
?>
