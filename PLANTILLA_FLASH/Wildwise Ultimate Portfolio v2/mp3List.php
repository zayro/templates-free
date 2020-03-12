<?php
$file_path = "mp3";
$rep = opendir($file_path);
while ($file = readdir($rep)) {
  if (ereg(".mp3",$file)) {
    $img[] = $file;
  }
}
closedir($rep);
clearstatcache();
asort($img);
$virgule = 0;
$file_name = "";
foreach ($img as $file){
  if ($virgule){
		$file_name .= "|";
	}
	$file_name .= "mp3/" . $file;
	$virgule = 1;
}


$rString = "&file_name=" . $file_name . "&";
$rString = utf8_encode($rString);
echo $rString ;
?>