<?php


/*** CONTACT INFO WIDGET
###############################################*/

function sys_contact_info( $atts, $content = null ) {
    extract(shortcode_atts(array(
        'name'      => '',
        'address'      => '',
		'city'      => '',
		'state'      => '',
		'zip'      => '',
		'phone'      => '',
		'email'      => '',
    ), $atts));
$out .= '<div class="contactinfo">';
$out .= '<span class="author-icon">' .$name. '</span><br />';
$out .= '<span class="address-icon">' .$address. '</span><br />';
$out .= '<span>' .$state. '</span><br />';
$out .= '<span>' .$city. '</span><br />';
$out .= '<span>' .$zip. '</span><br />';
$out .= '<span class="phone-icon">' .$phone. '</span><br />';
$out .= '<span class="email-icon">' .$email. '</span><br />';
$out .= '</div>';
  return $out;
}
add_shortcode('contact_info', 'sys_contact_info');
?>