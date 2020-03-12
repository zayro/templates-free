<?php
sd_register_post_type('partners', array(
	'labels' => array(
		'name' => _x('Partners', 'post type general name'),
		'singular_name' => _x('Partner', 'post type singular name'),
		'add_new' => _x('Add New', 'project'),
		'add_new_item' => __('Add New Item'),
		'edit_item' => __('Edit Item'),
		'new_item' => __('New Item'),
		'view_item' => __('View Item'),
		'search_items' => __('Search Items'),
		'not_found' =>  __('No items found'),
		'not_found_in_trash' => __('No items found in Trash'),
		'parent_item_colon' => ''
	),
	'public' => true,
	'show_ui' => true,
	'hierarchical' => false,
	'capability_type' => 'post',
	'exclude_from_search' => false,
	'show_in_nav_menus' => false,
	//'has_archive' => 'partners',
	'supports' => array(
		'title',
		'excerpt',
		'thumbnail'
	),
	'taxonomies' => array('groups'),
), 'partners', 'partners_post_limits');

function register_partners_taxonomies() {
	$labels = array(
		'name' => _x( 'Groups', 'taxonomy general name' ),
		'singular_name' => _x( 'Group', 'taxonomy singular name' ),
		'search_items' =>  __( 'Search Groups' ),
		'all_items' => __( 'All Groups' ),
		'parent_item' => __( 'Parent Group' ),
		'parent_item_colon' => __( 'Parent Group:' ),
		'edit_item' => __( 'Edit Group' ),
		'update_item' => __( 'Update Group' ),
		'add_new_item' => __( 'Add New Group' ),
		'new_item_name' => __( 'New Group Name' ),
	);
	register_taxonomy(
		'groups',
		'partners',
		array(
			'hierarchical' => true,
			'labels' => $labels,
			'query_var' => true,
			'rewrite' => true,
		)
	);
}
add_action('init', 'register_partners_taxonomies');

function partners_post_limits( $limit )
{
	if (is_partners()) {
		$old_limit = $limit;
		$limit = get_option('partners_rows');
		$limit = $limit * 4;
		}
	if ( !$limit )
		$limit = $old_limit;
	elseif ( $limit == '-1' )
		$limit = '18446744073709551615';
	return $limit;
}

function set_partners_columns($columns) {
	$columns = array(
		'cb' => '<input type="checkbox" />',
		'title' => __('Items', TEMPLATENAME),
		'groups' => __('Groups', TEMPLATENAME),
		'thumbnail' => __('Thumbnail', TEMPLATENAME),
	);
	return $columns;
}
add_filter('manage_edit-partners_columns', 'set_partners_columns');

function display_partners_columns($column_name, $post_id) {
	global $post;
	if ($post->post_type == 'partners') {
		if (in_array($column_name, array('groups')))
			echo get_partners_taxs($column_name);
		elseif ($column_name == 'thumbnail') {
			if ( has_post_thumbnail() ) {
				the_post_thumbnail('small_thumb');
			} else {
				echo __('No Thumbnail');
			}
		}
	}
}
add_action('manage_posts_custom_column',  'display_partners_columns', 10, 2);

function get_partners_taxs($cat_name) {
	global $post;
	$categories = get_the_terms(null, $cat_name);
	if ( !empty( $categories ) ) {
		$out = array();
		foreach ( $categories as $c )
			$out[] = "<a href='edit.php?post_type={$post->post_type}&amp;{$cat_name}={$c->slug}'> " . esc_html(sanitize_term_field('name', $c->name, $c->term_id, $cat_name, 'display')) . "</a>";
			return join( ', ', $out );
	} else {
		return ($cat_name == 'groups') ? __('Uncategorized') : __('No Tags');
	}
}

function is_partners() {
	$post_type = get_query_var('post_type');
	$groups = get_query_var('groups');
	return ($post_type == 'partners' || !empty($groups)) ? true : false;
}

require_once (TEMPLATEPATH . '/functions/metaboxes/partners.php');
?>