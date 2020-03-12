<?php
function awesome_add_menu_desc_add_fields() {
	if (function_exists('add_meta_box')) {
		add_meta_box('page_lists_plus_box', 'Add Menu Sub Title', 'awesome_page_lists_plus_inner', 'page', 'side', 'low');
	}
}

function awesome_page_lists_plus_inner() {
	global $post, $add_menu_desc; ?>
	<?php
	echo'<div class="postoptions">';
	echo'<div class="metabox">';	
	?>
	<h5>Top Menu Sub Title</h5>
	<div class="box-info">This text will be used as subtitle for top menu parent lists. If you are using wordpress 3.0 Menu manager then leave this field empty.</div>
	<input type="text" class="smallinput" id="add_menu_desc" name="add_menu_desc" value="<?php echo $post->add_menu_desc; ?>" /> </p>
	<p><input type="hidden" name="manual_save" value="manual_save" /></p>
	<?php
	echo'</div></div>';
	?>
	<?php
}

// SAVE DATA

function awesome_save_menu_desc() {

	global $wpdb;
	$posts_table = $wpdb->prefix . 'posts';
		global $wpdb;
	$posts_table = $wpdb->prefix . 'posts';
	
	// If any changes are made here, then PLP_DB_VERSION constant should be incremented
	mysql_query("ALTER TABLE " . $posts_table . " ADD add_menu_desc VARCHAR(250) AFTER post_title");
	
		
	if ($_POST[manual_save] == 'manual_save') {
		/* ****add_menu_desc save**** */
		if ($_POST[add_menu_desc] == "") {
			mysql_query("UPDATE " . $posts_table . " SET add_menu_desc = null WHERE ID = $_POST[ID]");
		} else{
			mysql_query("UPDATE " . $posts_table . " SET add_menu_desc = '" . $_POST[add_menu_desc] . "' WHERE ID = $_POST[ID]");
		}	
	}	/* ****add_menu_desc save**** */
	
	
}

// REPLACEMENTS IN WP-LIST-PAGES RESULTS

function awesome_page_lists_plus($output) {	
	global $wpdb;
	$posts_table = $wpdb->prefix . 'posts';

	/* ****add_menu_desc replace**** */

		$add_menu_desc_data = mysql_query("SELECT post_title, add_menu_desc FROM " . $posts_table . " WHERE add_menu_desc IS NOT NULL AND post_status = 'publish'");
		while ($row = @mysql_fetch_assoc($add_menu_desc_data)) {
			extract($row);
			$post_title = wptexturize($post_title);
		$output = str_replace('>' . $post_title , '>' . $post_title . '<span>' . $add_menu_desc . '</span>', $output);
		}
	
	/* ****add_menu_desc replace**** */	
	return $output;
}



add_action('admin_menu', 'awesome_add_menu_desc_add_fields');
add_action('save_post', 'awesome_save_menu_desc');
add_filter('wp_list_pages', 'awesome_page_lists_plus');
?>