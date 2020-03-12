<?php

// plugin root folder
$fscb_base_dir = get_bloginfo('template_url') . '/functions/includes/shortcodes/';

// Buttons shortcode
function button_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'url' => '#',
		'title' => '',
		'text' => '',
		'align' => 'none',
		'color' => 'black',
		'target' => '_self',
		'size' => 'medium',
	), $atts));
	$class = $code;
	$wrap_left = $wrap_right = '';
	$style = '';
	switch($align) {
		case 'left':
			$class .= ' alignleft';
			$wrap_left = '<p>';
			$wrap_right = '</p>';
		break;
		case 'right':
			$class .= ' alignright';
			$wrap_left = '<p>';
			$wrap_right = '</p>';
		break;
		break;
		case 'center':
			$wrap_left = '<p style="margin: 0 auto; text-align:center;">';
			$wrap_right = '</p>';
			$style = 'display:inline-block;';
		break;
		default:
			$style = 'display:inline-block;';
		break;
	}
	$class .= ' '.$size ;
	$class .= ' '.$color ;
	return "{$wrap_left}<a href=\"{$url}\" target=\"{$target}\" title=\"{$title}\" class=\"{$class}\" style=\"{$style}\">{$text}{$content}</a>{$wrap_right}<span class=\"clear\"></span>";
}
add_shortcode('button', 'button_shortcode');

// Image Shortcode
function img_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'align' => '',
		'w' => 0,
		'h' => 0,
		'alt' => '',
		'title' => '',
		'mtop' => '',
		'mright' => '',
		'mbottom' => '',
		'mleft' => '',
		'url' => '',
		'lightbox' => '',
	), $atts));
	if (empty($content))
		return;
	$styles = array();
	if ($align == 'left') {
		$styles['float'] = 'left';
		$styles['margin-right'] = '1.5em';
		$styles['margin-bottom'] = '0.5em';
	} elseif ($align == 'right') {
		$styles['float'] = 'right';
		$styles['margin-left'] = '1.5em';
		$styles['margin-bottom'] = '0.5em';
	} elseif ($align == 'center') {
		$styles['display'] = 'block';
		$styles['margin'] = '0 auto 1.5em';
	}
	if (!empty($mtop) && is_numeric($mtop)) {
		$styles['margin-top'] = $mtop.'px';
	}
	if (!empty($mbottom) && is_numeric($mbottom)) {
		$styles['margin-bottom'] = $mbottom.'px';
	}
	if (!empty($mright) && is_numeric($mright)) {
		$styles['margin-right'] = $mright.'px';
	}
	if (!empty($mleft) && is_numeric($mleft)) {
		$styles['margin-left'] = $mleft.'px';
	}
	$styles['width'] = $w;
	$styles['height'] = $h;
	$src = get_bloginfo('template_url') . "/timthumb.php?src={$content}";
	if (!empty($w))
		$src .= "&amp;w={$w}";
	if (!empty($h))
		$src .= "&amp;h={$h}";
	$src .= "&amp;zc=1";
	
	$style = '';
	foreach ($styles as $key => $val) {
		$style .= $key.': '.$val.'; ';
	}
	if (!empty($url))
		$out .= "<a href=\"{$url}\">";
	if (!empty($lightbox))
		$out .= "<a href=\"{$lightbox}\" data-rel=\"prettyPhoto\" title=\"{$title}\">";
	$out .= "<img src=\"{$src}\" style=\"{$style}\" class=\"pic\"";
	$out .= " alt=\"{$alt}\"";
	if (!empty($title))
		$out .= " title=\"{$title}\"";
	$out .= " width=\"{$w}\"";
	$out .= " height=\"{$h}\"";
	$out .= ' />';
	if (!empty($lightbox))
		$out .= "</a>";
	if (!empty($url))
		$out .= "</a>";
	return $out;
}
add_shortcode('img', 'img_shortcode');

// load button css
function buttons_css() 
{
        // the path to our root plugin folder
	global $fscb_base_dir;
	wp_enqueue_style('buttons', $fscb_base_dir . 'includes/css/buttons.css');
}
add_action('wp_print_styles', 'buttons_css');

// registers the buttons for use
function register_buttons($buttons) {
	// inserts a separator between existing buttons and our new one
	// "button" is the ID of our button
	array_push($buttons, "|", "button");
	return $buttons;
}

// registers the buttons for use
function register_imgs($imgs) {
	// inserts a separator between existing buttons and our new one
	// "button" is the ID of our button
	array_push($imgs, "|", "img");
	return $imgs;
}
 
// filters the tinyMCE buttons and adds our custom buttons
function shortcode_buttons() {
	// Don't bother doing this stuff if the current user lacks permissions
	if ( ! current_user_can('edit_posts') && ! current_user_can('edit_pages') )
		return;
 
	// Add only in Rich Editor mode
	if ( get_user_option('rich_editing') == 'true') {
		// filter the tinyMCE buttons and add our own
		add_filter("mce_external_plugins", "add_tinymce_plugin");
		add_filter('mce_buttons', 'register_buttons');
		add_filter('mce_buttons', 'register_imgs');
	}
}
// init process for button control
add_action('init', 'shortcode_buttons');
 
// add the button to the tinyMCE bar
function add_tinymce_plugin($plugin_array) {
	global $fscb_base_dir;
	$plugin_array['button'] = $fscb_base_dir . 'shortcode-buttons.js';
	$plugin_array['img'] = $fscb_base_dir . 'shortcode-buttons.js';
	return $plugin_array;
}

?>