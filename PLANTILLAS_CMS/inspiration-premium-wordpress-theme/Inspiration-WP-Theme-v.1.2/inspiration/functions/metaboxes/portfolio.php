<?php
$config = array(
	'title' => __('Target Link', TEMPLATENAME),
	'id' => 'portfolio_link_box',
	'pages' => array('portfolio'),
	'callback' => '',
	'context' => 'normal',
	'priority' => 'high',
);
$options = array(
	array(
		'name' => __('URL (optional)', TEMPLATENAME),
		'desc' => __('The url that the portfolio post linked to.', TEMPLATENAME),
		'id' => 'target_link',
		'default' => '',
		'type' => 'superlink',
	),
//	array(
//		'name' => __('Video (optional)', TEMPLATENAME),
//		'desc' => __('The video file url show in portfolio.', TEMPLATENAME),
//		'id' => 'video_link',
//		'default' => '',
//		'type' => 'text',
//		'class' => 'large-text',
//	),
);

$meta_box = array(
	'id' => 'meta-box',
	'title' => __('Secondary Images for rotator', TEMPLATENAME),
	'page' => 'portfolio',
	'context' => 'normal',
	'priority' => 'high',
	'fields' => array(
		array(
			'name' =>  __('Portfolio Type', TEMPLATENAME),
			'desc' => __('Choose the type of portfolio post you wish to display.', TEMPLATENAME),
			'id' => 'switch',
			"type" => "select",
			'std' => 'video',
			'options' => array('image rotator', 'video', 'audio'),
		),
		array(
			'name' => __('Secondary Image 1', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image1',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button1',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 2', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image2',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button2',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 3', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image3',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button3',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 4', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image4',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button4',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 5', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image5',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button5',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 6', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image6',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button6',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 7', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image7',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button7',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 8', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image8',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button8',
			'type' => 'button',
			'std' => 'Browse',
		),
		array(
			'name' => __('Secondary Image 9', TEMPLATENAME),
			'desc' => __('Select an image from media library or upload a new one', TEMPLATENAME),
			'id' => 'portfolio_image9',
			'type' => 'text',
			'std' => '',
		),
		array(
			'name' => '',
			'desc' => '',
			'id' => 'upload_image_button9',
			'type' => 'button',
			'std' => 'Browse',
		),
	)
);

$meta_box_portfolio_video = array(
	'id' => 'meta-box-portfolio-video',
	'title' => __('Video Settings', TEMPLATENAME),
	'page' => 'portfolio',
	'context' => 'normal',
	'priority' => 'high',
	'fields' => array(
		array( "name" => __('M4V File URL',TEMPLATENAME),
				"desc" => __('The URL to the .m4v video file',TEMPLATENAME),
				"id" => "video_m4v",
				"type" => "text",
				'std' => '',
			),
		array( "name" => __('OGV File URL',TEMPLATENAME),
				"desc" => __('The URL to the .ogv video file',TEMPLATENAME),
				"id" => "video_ogv",
				"type" => "text",
				'std' => '',
			),
		array(
			'name' => __('Embedded Code', TEMPLATENAME),
			'desc' => __('If you are using something other than self hosted video such as Youtube or Vimeo, paste the embed code here. Width is best at 545px with any height.<br><br> This field will override the above.', TEMPLATENAME),
			'id' => 'portfolio_embed_code',
			'type' => 'textarea',
			'std' => '',
		)
	),
	
);

$meta_box_portfolio_audio = array(
	'id' => 'meta-box-portfolio-audio',
	'title' =>  __('Audio Settings', TEMPLATENAME),
	'page' => 'portfolio',
	'context' => 'normal',
	'priority' => 'high',
	'fields' => array(
		array( "name" => __('MP3 File URL',TEMPLATENAME),
				"desc" => __('The URL to the .mp3 audio file',TEMPLATENAME),
				"id" => "audio_mp3",
				"type" => "text",
				'std' => '',
			),
		array( "name" => __('OGA File URL',TEMPLATENAME),
				"desc" => __('The URL to the .oga, .ogg audio file',TEMPLATENAME),
				"id" => "audio_ogg",
				"type" => "text",
				'std' => '',
			)
	),
	
	
);

add_action('admin_menu', 'mytheme_add_box');
 
// Add meta box
function mytheme_add_box() {
	global $meta_box, $meta_box_portfolio_video, $meta_box_portfolio_audio;

	add_meta_box($meta_box['id'], $meta_box['title'], 'mytheme_show_box', $meta_box['page'], $meta_box['context'], $meta_box['priority']);

	add_meta_box($meta_box_portfolio_video['id'], $meta_box_portfolio_video['title'], 'show_box_portfolio_video', $meta_box_portfolio_video['page'], $meta_box_portfolio_video['context'], $meta_box_portfolio_video['priority']);

	add_meta_box($meta_box_portfolio_audio['id'], $meta_box_portfolio_audio['title'], 'show_box_portfolio_audio', $meta_box_portfolio_audio['page'], $meta_box_portfolio_audio['context'], $meta_box_portfolio_audio['priority']);
}
 
// Callback function to show fields in meta box
function mytheme_show_box() {
	global $meta_box, $post;
 
	echo '<p style="padding:10px 0 0 10px;">'.__('Upload an image and then click "insert into post". To delete an image, simply clear the field.', TEMPLATENAME).'</p>';
	
	// Use nonce for verification
	echo '<input type="hidden" name="mytheme_meta_box_nonce" value="', wp_create_nonce(basename(__FILE__)), '" />';
 
	echo '<table class="form-table">';
 
	foreach ($meta_box['fields'] as $field) {
		// get current post meta data
		$meta = get_post_meta($post->ID, $field['id'], true);
		switch ($field['type']) {
 

//If Text		
			case 'text':
			
			echo '<tr style="border-top:1px solid #eeeeee;">',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style=" display:block; color:#999; margin:5px 0 0 0; line-height: 18px;">'. $field['desc'].'</span></label></th>',
				'<td>';
			echo '<input type="text" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : stripslashes(htmlspecialchars(( $field['std']), ENT_QUOTES)), '" size="30" style="width:75%; margin-right: 20px; float:left;" />';
			
			break;
 
//If Button	
			case 'button':
				echo '<input style="float: left;" type="button" name="', $field['id'], '" id="', $field['id'], '"value="', $meta ? $meta : $field['std'], '" />';
				echo 	'</td>',
			'</tr>';
			
			break;
			
//If Select	
			case 'select':
			
				echo '<tr>',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style=" display:block; color:#999; margin:5px 0 0 0;">'. $field['desc'].'</span></label></th>',
				'<td>';
			
				echo'<select name="'.$field['id'].'">';
			
				foreach ($field['options'] as $option) {
					
					echo'<option';
					if ($meta == $option ) { 
						echo ' selected="selected"'; 
					}
					echo'>'. $option .'</option>';
				
				}
				
				echo'</select>';
			
			break;
		}
		
	}
 
	echo '</table>';
}

function show_box_portfolio_video() {
	global $meta_box_portfolio_video, $post;
 	
	echo '<p style="padding:10px 0 0 10px;">'.__('These settings enable you to embed videos into your portfolio pages.', TEMPLATENAME).'</p>';
	// Use nonce for verification
	echo '<input type="hidden" name="mytheme_meta_box_nonce" value="', wp_create_nonce(basename(__FILE__)), '" />';
 
	echo '<table class="form-table">';
 
	foreach ($meta_box_portfolio_video['fields'] as $field) {
		// get current post meta data
		$meta = get_post_meta($post->ID, $field['id'], true);
		switch ($field['type']) {
 
			
			//If Text		
			case 'text':
			
			echo '<tr style="border-top:1px solid #eeeeee;">',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style="line-height:20px; display:block; color:#999; margin:5px 0 0 0;">'. $field['desc'].'</span></label></th>',
				'<td>';
			echo '<input type="text" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'],'" size="30" style="width:75%; margin-right: 20px; float:left;" />';
			
			break;
			
			//If textarea		
			case 'textarea':
			
			echo '<tr style="border-top:1px solid #eeeeee;">',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style="line-height:18px; display:block; color:#999; margin:5px 0 0 0;">'. $field['desc'].'</span></label></th>',
				'<td>';
			echo '<textarea name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'], '" rows="8" cols="5" style="width:100%; margin-right: 20px; float:left;">', $meta ? $meta : $field['std'], '</textarea>';
			
			break;
 
			//If Button	
			case 'button':
				echo '<input style="float: left;" type="button" name="', $field['id'], '" id="', $field['id'], '"value="', $meta ? $meta : $field['std'], '" />';
				echo 	'</td>',
			'</tr>';
			
			break;
		}

	}
 
	echo '</table>';
}

function show_box_portfolio_audio() {
	global $meta_box_portfolio_audio, $post;
 	
	echo '<p style="padding:10px 0 0 0;">'.__('These settings enable you to embed videos into your portfolio pages.', TEMPLATENAME).'</p>';
	// Use nonce for verification
	echo '<input type="hidden" name="mytheme_meta_box_nonce" value="', wp_create_nonce(basename(__FILE__)), '" />';
 
	echo '<table class="form-table">';
 
	foreach ($meta_box_portfolio_audio['fields'] as $field) {
		// get current post meta data
		$meta = get_post_meta($post->ID, $field['id'], true);
		switch ($field['type']) {
 
			
			//If Text		
			case 'text':
			
			echo '<tr style="border-top:1px solid #eeeeee;">',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style="line-height:20px; display:block; color:#999; margin:5px 0 0 0;">'. $field['desc'].'</span></label></th>',
				'<td>';
			echo '<input type="text" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'],'" size="30" style="width:75%; margin-right: 20px; float:left;" />';
			
			break;
			
			//If textarea		
			case 'textarea':
			
			echo '<tr style="border-top:1px solid #eeeeee;">',
				'<th style="width:25%"><label for="', $field['id'], '"><strong>', $field['name'], '</strong><span style="line-height:18px; display:block; color:#999; margin:5px 0 0 0;">'. $field['desc'].'</span></label></th>',
				'<td>';
			echo '<textarea name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : $field['std'], '" rows="8" cols="5" style="width:100%; margin-right: 20px; float:left;">', $meta ? $meta : $field['std'], '</textarea>';
			
			break;
 
			//If Button	
			case 'button':
				echo '<input style="float: left;" type="button" name="', $field['id'], '" id="', $field['id'], '"value="', $meta ? $meta : $field['std'], '" />';
				echo 	'</td>',
			'</tr>';
			
			break;
		}

	}
 
	echo '</table>';
}
 
add_action('save_post', 'mytheme_save_data');
 
// Save data from meta box

function mytheme_save_data($post_id) {
	global $meta_box, $meta_box_portfolio_video, $meta_box_portfolio_audio;
 
	// verify nonce
	if (!wp_verify_nonce($_POST['mytheme_meta_box_nonce'], basename(__FILE__))) {
		return $post_id;
	}
 
	// check autosave
	if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
		return $post_id;
	}
 
	// check permissions
	if ('page' == $_POST['post_type']) {
		if (!current_user_can('edit_page', $post_id)) {
			return $post_id;
		}
	} elseif (!current_user_can('edit_post', $post_id)) {
		return $post_id;
	}
 
	foreach ($meta_box['fields'] as $field) {
		$old = get_post_meta($post_id, $field['id'], true);
		$new = $_POST[$field['id']];
 
		if ($new && $new != $old) {
			update_post_meta($post_id, $field['id'], $new);
		} elseif ('' == $new && $old) {
			delete_post_meta($post_id, $field['id'], $old);
		}
	}
	
	foreach ($meta_box_portfolio_video['fields'] as $field) {
		$old = get_post_meta($post_id, $field['id'], true);
		$new = $_POST[$field['id']];
 
		if ($new && $new != $old) {
			update_post_meta($post_id, $field['id'], stripslashes(htmlspecialchars($new)));
		} elseif ('' == $new && $old) {
			delete_post_meta($post_id, $field['id'], $old);
		}
	}
	
	foreach ($meta_box_portfolio_audio['fields'] as $field) {
		$old = get_post_meta($post_id, $field['id'], true);
		$new = $_POST[$field['id']];
 
		if ($new && $new != $old) {
			update_post_meta($post_id, $field['id'], stripslashes(htmlspecialchars($new)));
		} elseif ('' == $new && $old) {
			delete_post_meta($post_id, $field['id'], $old);
		}
	}
}
 
function my_admin_scripts() {
wp_enqueue_script('media-upload');
wp_enqueue_script('thickbox');
wp_register_script('my-upload', get_bloginfo('template_url') . '/functions/metaboxes/upload-script.js', array('jquery','media-upload','thickbox'));
wp_enqueue_script('my-upload');
}
function my_admin_styles() {
wp_enqueue_style('thickbox');
}
add_action('admin_print_scripts', 'my_admin_scripts');
add_action('admin_print_styles', 'my_admin_styles');
 
new metaboxesGenerator($config,$options,$meta_box,$meta_box_portfolio_video,$meta_box_portfolio_audio);