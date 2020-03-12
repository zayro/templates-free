<?php
$meta_box_link = array(
	'id' => 'meta-box-link',
	'title' => __("Partner's Website Link", TEMPLATENAME),
	'page' => 'partners',
	'context' => 'normal',
	'priority' => 'high',
	'fields' => array(
		array(
			'name' => __('Link to partners website', TEMPLATENAME),
			'desc' => __('Type the link into the field below for this partner.', TEMPLATENAME),
			'id' => 'partner_link',
			'type' => 'text',
			'std' => '',
		),
	)
);
 
add_action('admin_menu', 'mytheme_add_box_link');
 
// Add meta box
function mytheme_add_box_link() {
	global $meta_box_link;

	add_meta_box($meta_box_link['id'], $meta_box_link['title'], 'mytheme_show_box_link', $meta_box_link['page'], $meta_box_link['context'], $meta_box_link['priority']);
}

// Callback function to show fields in meta box
function mytheme_show_box_link() {
	global $meta_box_link, $post;
 
	// Use nonce for verification
	echo '<input type="hidden" name="mytheme_meta_box_nonce" value="', wp_create_nonce(basename(__FILE__)), '" />';
 
	echo '<table class="form-table">';
 
	foreach ($meta_box_link['fields'] as $field) {
		// get current post meta data
		$meta = get_post_meta($post->ID, $field['id'], true);
		switch ($field['type']) {
 

//If Text		
			case 'text':
			
			echo '<tr><td>';
			echo '<input type="text" name="', $field['id'], '" id="', $field['id'], '" value="', $meta ? $meta : stripslashes(htmlspecialchars(( $field['std']), ENT_QUOTES)), '" size="30" style="width:45%;" />';
			echo '</td></tr>';
			break;
		}
		
	}
 
	echo '</table>';
}

add_action('save_post', 'mytheme_save_data_link');

// Save data from meta box

function mytheme_save_data_link($post_id) {
	global $meta_box_link;
 
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
 
	foreach ($meta_box_link['fields'] as $field) {
		$old = get_post_meta($post_id, $field['id'], true);
		$new = $_POST[$field['id']];
 
		if ($new && $new != $old) {
			update_post_meta($post_id, $field['id'], stripslashes(htmlspecialchars($new)));
		} elseif ('' == $new && $old) {
			delete_post_meta($post_id, $field['id'], $old);
		}
	}
}

function my_admin_styles_link() {
wp_enqueue_style('thickbox');
}
add_action('admin_print_styles', 'my_admin_styles_link');

?>