<?
$f1=$_POST['f1'];
$f2=$_POST['f2'];
$f3=$_POST['f3'];
$f4=$_POST['f4'];
if($_POST['f1']){
	$sendto="name@yourdomain.com";   
	$subject="$f3";   
	$message="By: $f1\nE-mail: $f2\n\n$f4\n";
	$from="From: $f1<$f2>"; 
	mail($sendto, $subject, $message, $from);
	echo "&done=done";
}
?>