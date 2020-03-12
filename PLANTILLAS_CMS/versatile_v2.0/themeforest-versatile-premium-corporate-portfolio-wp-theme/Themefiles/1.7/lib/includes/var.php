<?php      
/* This code retrieves all our admin options. */
global $options,$themename;
foreach ($options as $value) {
	if (get_option( $value['id'] ) === FALSE) 
	{ $$value['id'] = $value['std']; 
	}else 
	{ $$value['id'] = get_settings( $value['id'] ); 
	}
}
$slidervisble=get_option("slidervisble");	
$sys_homepages = get_option("sys_homepages");
$homepageslider=get_option('sys_choose_slider');
$teaserbox=get_option('teaserbox');
$timthumboption = get_option("timthumboption");
$footerwidgetcounts=get_option("footerwidgetcount");
$homeurl = get_bloginfo('template_directory');

	/* Background Position Switch Case*/
	switch ($bg_position):
	case 'left_top':
	   	$bgposition = "left top";	
    break;
	case 'left_center':
	   	$bgposition = "left center";	
    break;
	case 'left_bottom':
	   	$bgposition = "left bottom";	
    break;
	case 'right_top':
	   	$bgposition = "right top";	
    break;
	case 'right_center':
	   	$bgposition = "right center";	
    break;
	case 'right_bottom':
	   	$bgposition = "right bottom";	
    break;
	case 'center_top':
	   	$bgposition = "center top";	
    break;
	case 'center_center':
	   	$bgposition = "center center";	
    break;
	case 'center_bottom':
	   	$bgposition = "center bottom";	
    break;
	endswitch;
?>