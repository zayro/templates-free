<?php require_once( '../../../../wp-load.php' );
	Header("Content-type: text/css");
	$font_family = get_option('font_family', 'Arial,Helvetica,Garuda,sans-serif');
	echo "body {font-family:{$font_family};}";
	echo stripslashes(get_option('custom_css'));
//	if (theme_check_custom_background()) {
//		echo 'body { background:url(../images/bg_dark.png) #1c1d20; }';
//	}
	if (get_option('use_custom_body_bg', true)):
		echo 'body {background-color:';
		echo get_option('custom_body_bg');
		echo ' !important;}';
	endif;
	
	$bg_header = get_option('custom_header_bg');
	if (get_option('default_header_pattern') == '0'):
		echo '.header_full {background-color:';
		echo $bg_header;
		echo ';}';
	else:
		echo '';
	endif;
