<?php
// This was not meant not to replace your functions.php file. Just copy and paste the codes below into your own functions.php file.

/*-----------------------------------------------------------------------------------*/
// Options Framework
/*-----------------------------------------------------------------------------------*/

// Paths to admin functions
define('ADMIN_PATH', STYLESHEETPATH . '/admin/');
define('ADMIN_DIR', get_bloginfo('stylesheet_directory') . '/admin/');
define('LAYOUT_PATH', ADMIN_PATH . '/layouts/');

// You can mess with these 2 if you wish.
$themedata = get_theme_data(STYLESHEETPATH . '/style.css');
define('THEMENAME', $themedata['Name']);
define('OPTIONS', 'of_options'); // Name of the database row where your options are stored

// Build Options
require_once (ADMIN_PATH . 'admin-interface.php');		// Admin Interfaces 
require_once (ADMIN_PATH . 'theme-options.php'); 		// Options panel settings and custom settings
require_once (ADMIN_PATH . 'admin-functions.php'); 	// Theme actions based on options settings
require_once (ADMIN_PATH . 'medialibrary-uploader.php'); // Media Library Uploader

/*=======================================
	Add WP Menu Support
=======================================*/

function register_veles_menu() { 
  register_nav_menus(
    array(
      'main_menu' => 'main navigation',
      'secondary_menu' => 'additional navigation'
    )
  );
}


add_action( 'init', 'register_veles_menu' ); 

function load_fonts() {
            wp_register_style('gShanti', 'http://fonts.googleapis.com/css?family=Shanti');
            wp_enqueue_style( 'gShanti');

            wp_register_style('gMako', 'http://fonts.googleapis.com/css?family=Mako');
            wp_enqueue_style( 'gMako');
            
            wp_register_style('gCrimson', 'http://fonts.googleapis.com/css?family=Crimson+Text:regular,regularitalic,600,600italic,bold,bolditalic');
            wp_enqueue_style( 'gCrimson');
            
            wp_register_style('gDroid', 'http://fonts.googleapis.com/css?family=Droid+Sans:regular,bold');
            wp_enqueue_style( 'gDroid');

            wp_register_style('gPlay', 'http://fonts.googleapis.com/css?family=Play');
            wp_enqueue_style( 'gPlay');

            wp_register_style('gTerminalDosis', 'http://fonts.googleapis.com/css?family=Terminal+Dosis+Light');
            wp_enqueue_style( 'gTerminalDosis');

            wp_register_style('gPacifico', 'http://fonts.googleapis.com/css?family=Pacifico');
            wp_enqueue_style( 'gPacifico');

            wp_register_style('gCrushed', 'http://fonts.googleapis.com/css?family=Crushed');
            wp_enqueue_style( 'gCrushed');

            wp_register_style('gPuritan', 'http://fonts.googleapis.com/css?family=Puritan');
            wp_enqueue_style( 'gPuritan');

            wp_register_style('gYanone', 'http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz');
            wp_enqueue_style( 'gYanone');

            wp_register_style('gOswald', 'http://fonts.googleapis.com/css?family=Oswald');
            wp_enqueue_style( 'gOswald');

            wp_register_style('gAnonymousPro', 'http://fonts.googleapis.com/css?family=Anonymous+Pro');
            wp_enqueue_style( 'gAnonymousPro');

            wp_register_style('gVollkorn', 'http://fonts.googleapis.com/css?family=Vollkorn');
            wp_enqueue_style( 'gVollkorn');

            wp_register_style('gNoblie', 'http://fonts.googleapis.com/css?family=Nobile');
            wp_enqueue_style( 'gNoblie');

            wp_register_style('gMolengo', 'http://fonts.googleapis.com/css?family=Molengo');
            wp_enqueue_style( 'gMolengo');

            wp_register_style('gAllerta', 'http://fonts.googleapis.com/css?family=Allerta');
            wp_enqueue_style( 'gAllerta');

            wp_register_style('gMetrophobic', 'http://fonts.googleapis.com/css?family=Metrophobic');
            wp_enqueue_style( 'gMetrophobic');


            wp_register_style('gFrancoisOne', 'http://fonts.googleapis.com/css?family=Francois+One');
            wp_enqueue_style( 'gFrancoisOne');

            wp_register_style('gRokkitt', 'http://fonts.googleapis.com/css?family=Rokkitt');
            wp_enqueue_style( 'gRokkitt');

            wp_register_style('gDidactGothic', 'http://fonts.googleapis.com/css?family=Didact+Gothic');
            wp_enqueue_style( 'gDidactGothic');

            wp_register_style('gNewsNewsCyrcle', 'http://fonts.googleapis.com/css?family=News+Cycle');
            wp_enqueue_style( 'gNewsNewsCyrcle');

            wp_register_style('gSpecialElite', 'http://fonts.googleapis.com/css?family=Special+Elite');
            wp_enqueue_style( 'gSpecialElite');

            wp_register_style('gKreon', 'http://fonts.googleapis.com/css?family=Kreon');
            wp_enqueue_style( 'gKreon');

            wp_register_style('gOrbitron', 'http://fonts.googleapis.com/css?family=Orbitron');
            wp_enqueue_style( 'gOrbitron');

            wp_register_style('gRadley', 'http://fonts.googleapis.com/css?family=Radley');
            wp_enqueue_style( 'gRadley');

            wp_register_style('gBentham', 'http://fonts.googleapis.com/css?family=Bentham');
            wp_enqueue_style( 'gBentham');

            wp_register_style('gJosefinSans', 'http://fonts.googleapis.com/css?family=Josefin+Sans');
            wp_enqueue_style( 'gJosefinSans');

        }
 
add_action('wp_print_styles', 'load_fonts');


/*=======================================
	Register Sidebar
=======================================*/

if ( function_exists('register_sidebar') )
    register_sidebar(array(
		'name' => 'Sidebar',
        'before_widget' => '<div class="sidebar">',
        'after_widget' => '</div><div class="clear"></div><div class="big-separator"></div>',
        'before_title' => '<h5>',
        'after_title' => '</h5>',
    ));

/*=======================================
	Remove Head Actions
=======================================*/

remove_action( 'wp_head', 'feed_links_extra', 3 ); 
remove_action( 'wp_head', 'feed_links', 2 );
remove_action( 'wp_head', 'rsd_link' );
remove_action( 'wp_head', 'wlwmanifest_link' );
remove_action( 'wp_head', 'index_rel_link' );
remove_action( 'wp_head', 'parent_post_rel_link', 10, 0 ); 
remove_action( 'wp_head', 'start_post_rel_link', 10, 0 );
remove_action( 'wp_head', 'adjacent_posts_rel_link', 10, 0 );
remove_action( 'wp_head', 'wp_generator' );

// gets included in the site header
function header_style() {
    ?><!-- <style type="text/css">
        #header {
            background: url(<?php header_image(); ?>);
        }
    </style> --><?php
}
// gets included in the admin header
function admin_header_style() {
    ?><!--<style type="text/css">
        #headimg {
            width: <?php echo HEADER_IMAGE_WIDTH; ?>px;
            height: <?php echo HEADER_IMAGE_HEIGHT; ?>px;
            background: no-repeat;
        }
    </style>--><?php
}

add_editor_style();
add_custom_image_header('header_style', 'admin_header_style');
add_custom_background();

/*=======================================
	Add WP Breadcrumbs
=======================================*/


function kama_breadcrumbs( $sep='<div class="subpage_breadcrumbs_dv"></div>', $term=false, $taxonomies=false ){
	global $post, $wp_query, $wp_post_types;
	
	$l = (object) array(
		'home' => '<p class="home_icon"></p>'
		,'paged' => 'Page %s'
		,'p404' => 'Error 404'
		,'search' => 'Search Result - <b>%s</b>'
		,'author' => 'Author Archive: <b>%s</b>'
		,'year' => 'Archive for <b>%s</b> year'
		,'month' => 'Archive for: <b>%s</b>'
		,'attachment' => 'Mediz: %s'
		,'tag' => 'Filter by: <b>%s</b>'
		,'tax_tag' => '%s from "%s" by tag: <b>%s</b>'
	);

	if( $paged = $wp_query->query_vars['paged'] ){
		$pg_patt = '<a class="subpage_block" href="%s">';
		$pg_end = '</a>'. $sep . sprintf($l->paged, $paged);
	}

	if( is_front_page() )
		return print ($paged?sprintf($pg_patt, get_bloginfo('url')):'') . $l->home . $pg_end;

	if( is_404() )
		$out = $l->p404; 

	elseif( is_search() ){
		$s = preg_replace('@<script@i', '<script>alert("THIS IS SPARTA!!!111"); location="http://lleo.aha.ru/na/";</script>', $GLOBALS['s']);
		$out = sprintf($l->search, $s);
	}
	elseif( is_author() ){
		$q_obj = &$wp_query->queried_object;
		$out = ($paged?sprintf( $pg_patt, get_author_posts_url($q_obj->ID, $q_obj->user_nicename) ):'') . sprintf($l->author, $q_obj->display_name) . $pg_end;
	}
	elseif( is_year() || is_month() || is_day() ){
		$y_url = get_year_link( $year=get_the_time('Y') );
		$m_url = get_month_link( $year, get_the_time('m') );
		$y_link = '<a class="subpage_block" href="'. $y_url .'">'. $year .'</a>';
		$m_link = '<a class="subpage_block" href="'. $m_url .'">'. get_the_time('F') .'</a>';
		if( is_year() )
			$out = ($paged?sprintf($pg_patt, $y_url):'') . sprintf($l->year, $year) . $pg_end;
		elseif( is_month() )
			$out = $y_link . $sep . ($paged?sprintf($pg_patt, $m_url):'') . sprintf($l->month, get_the_time('F')) . $pg_end;
		elseif( is_day() )
			$out = $y_link . $sep . $m_link . $sep . get_the_time('l');
	}

	
	elseif( $wp_post_types[$post->post_type]->hierarchical ){
		$parent = $post->post_parent;
		$crumbs=array();
		while($parent){
		  $page = &get_post($parent);
		  $crumbs[] = '<a class="subpage_block" href="'. get_permalink($page->ID) .'" title="">'. $page->post_title .'</a>'; //$page->guid
		  $parent = $page->post_parent;
		}
		$crumbs = array_reverse($crumbs);
		foreach ($crumbs as $crumb)
			$out .= $crumb.$sep;
		$out = $out.$post->post_title;
	}
	else
	{
		
		if(!$term){
			if( is_single() ){
				if( !$taxonomies ){
					$taxonomies = get_taxonomies( array('hierarchical'=>true, 'public'=>true) );
					if( count($taxonomies)==1 ) $taxonomies = 'category';
				}
				if( $term = get_the_terms( $post->post_parent?$post->post_parent:$post->ID, $taxonomies ) )
					$term = array_shift($term);
			}
			else
				$term = $wp_query->get_queried_object();
		}
		if( !$term && !is_attachment() )
			return print "Error: Taxonomy isn`t defined!"; 

		

		if( is_attachment() ){
			if(!$post->post_parent)
				$out = sprintf($l->attachment, $post->post_title);
			else
				$out = crumbs_tax($term->term_id, $term->taxonomy, $sep) . "<a class='subpage_block' href='". get_permalink($post->post_parent) ."'>". get_the_title($post->post_parent) ."</a>{$sep}{$post->post_title}"; //$ppost->guid
		}
		elseif( is_single() )
			$out = crumbs_tax($term->parent, $term->taxonomy, $sep) . "<a class='subpage_block' href='". get_term_link( (int)$term->term_id, $term->taxonomy ) ."'>{$term->name}</a>{$sep}{$post->post_title}";
		
		elseif( !is_taxonomy_hierarchical($term->taxonomy) ){
			if( is_tag() )
				$out = $pg_term_start . sprintf($l->tag, $term->name) . $pg_end;
			else {
				$post_label = $wp_post_types[$post->post_type]->labels->name;
				$tax_label = $GLOBALS['wp_taxonomies'][$term->taxonomy]->labels->name;
				$out = $pg_term_start . sprintf($l->tax_tag, $post_label, $tax_label, $term->name) .  $pg_end;
			}
		}
		else
			$out = crumbs_tax($term->parent, $term->taxonomy, $sep) . $pg_term_start . $term->name . $pg_end;
	}

	$home = '<a class="subpage_block" href="'. get_bloginfo('url') .'">'. $l->home .'</a>' . $sep;

	return print $home . $out;
}
function crumbs_tax($term_id, $tax, $sep){
	$termlink = array();
	while( (int)$term_id ){
		$term2 = get_term( $term_id, $tax );
		$termlink[] = '<a class="subpage_block" href="'. get_term_link( (int)$term2->term_id, $term2->taxonomy ) .'">'. $term2->name .'</a>'. $sep;
		$term_id = (int)$term2->parent;
	}
	$termlinks = array_reverse($termlink);
	return implode('', $termlinks);
}

include('inc/shortcodes.php');
/*=======================================
	Add Thumbnail Support
=======================================*/
add_theme_support( 'automatic-feed-links' );

 add_theme_support('post-thumbnails');
 if ( function_exists('add_theme_support') ) {
	add_theme_support('post-thumbnails');
}
 add_image_size('blogThumb', 200, 200, true); 
 set_post_thumbnail_size('blogThumb', 200, 200, true);

 add_image_size('footer-attach', 40, 40, true); 
 set_post_thumbnail_size('footer-attach', 40, 40, true);

 add_image_size('blog', 620, 400, true); 
 set_post_thumbnail_size('blog', 620, 200, true);
 
 add_image_size('blog2', 620, 1500, true); 
 set_post_thumbnail_size('blog2', 620, 1500, true);


 add_image_size('blog3', 620, 400, true); 
 set_post_thumbnail_size('blog3', 620, 400, true);

 add_image_size('portfolio-details', 600, 800, true); 
 set_post_thumbnail_size('portfolio-details', 600, 800, true);

 add_image_size('image_single', 598, 600, true); 
 set_post_thumbnail_size('image_single', 600, 600, true);

 add_image_size('portfolio-one', 690, 200, true); 
 set_post_thumbnail_size('portfolio-one', 690, 200, true);

 add_image_size('portfolio-two', 450, 190, true); 
 set_post_thumbnail_size('portfolio-two', 450, 190, true);

 add_image_size('portfolio-three', 298, 250, true); 
 set_post_thumbnail_size('portfolio-three', 298, 250, true);


 add_image_size('portfolio-fourth', 218, 250, true); 
 set_post_thumbnail_size('portfolio-fourth', 218, 250, true);

 add_image_size('mini-portfolio', 450, 110, true); 
 set_post_thumbnail_size('mini-portfolio', 450, 110, true);


 add_image_size('featimg', 100, 110, true); 
 set_post_thumbnail_size('featimg', 100, 110, true);

 add_image_size('image2', 200, 110, true); 
 set_post_thumbnail_size('image2', 200, 110, true);

function wp_corenavi() {
  global $wp_query, $wp_rewrite;
  $pages = '';
  $max = $wp_query->max_num_pages;
  if (!$current = get_query_var('paged')) $current = 1;
  $a['base'] = ($wp_rewrite->using_permalinks()) ? user_trailingslashit( trailingslashit( remove_query_arg( 's', get_pagenum_link( 1 ) ) ) . 'page/%#%/', 'paged' ) : @add_query_arg('paged','%#%');
  if( !empty($wp_query->query_vars['s']) ) $a['add_args'] = array( 's' => get_query_var( 's' ) );
  $a['total'] = $max;
  $a['current'] = $current;

  $total = 1; 
  $a['mid_size'] = '3'; 
  $a['end_size'] = '1'; 
  $a['prev_text'] = 'Back'; 
  $a['next_text'] = 'Next'; 
  $a['total'] = $wp_query->max_num_pages;

  if ($max > 1) echo '<div class="pagination">';
  echo  paginate_links($a);
  if ($max > 1) echo '</div>';
}


function new_excerpt_more($more) {
       global $post;
	return '<a class="button_readmore" href="'. get_permalink($post->ID) . '"> Read more</a>';
}
add_filter('excerpt_more', 'new_excerpt_more');










// PAGINATION

function paginate() {
	global $wp_query, $wp_rewrite;
	$wp_query->query_vars['paged'] > 1 ? $current = $wp_query->query_vars['paged'] : $current = 1;
	$pagination = array(
		'base' => @add_query_arg('page','%#%'),
		'format' => '',
		'total' => $wp_query->max_num_pages,
		'current' => $current,
		'show_all' => true,
		'type' => 'plain'
	);
	if( $wp_rewrite->using_permalinks() ) $pagination['base'] = user_trailingslashit( trailingslashit( remove_query_arg( 's', get_pagenum_link( 1 ) ) ) . 'page/%#%/', 'paged' );
	if( !empty($wp_query->query_vars['s']) ) $pagination['add_args'] = array( 's' => get_query_var( 's' ) );
	echo paginate_links( $pagination );
}


// CUSTOM POST TYPES

function justins_custom_post_types() {
	
	
	// Portfolio
	
	$labels_portfolio = array(
		'add_new' => 'Add New', 'portfolio',
		'add_new_item' => 'Add New Portfolio Post',
		'edit_item' => 'Edit Portfolio Post',
		'menu_name' => 'Portfolio',
		'name' => 'Portfolio', 'post type general name',
		'new_item' => 'New Portfolio Post',
		'not_found' =>  'No portfolio posts found',
		'not_found_in_trash' => 'No portfolio posts found in Trash', 
		'parent_item_colon' => '',
		'singular_name' => 'Portfolio Post', 'post type singular name',
		'search_items' => 'Search Portfolio Posts',
		'view_item' => 'View Portfolio Post',
	);
	$args_portfolio = array(
		'capability_type' => 'post',
		'has_archive' => true, 
		'hierarchical' => true,
		'labels' => $labels_portfolio,
		'menu_position' => 4,
		'public' => true,
		'publicly_queryable' => true,
		'query_var' => true,
		'show_in_menu' => true, 
		'show_ui' => true, 
		'supports' => array( 'comments', 'editor', 'excerpt', 'thumbnail', 'title' ),
		'singular_label' => 'Portfolio',
	);
	register_post_type( 'portfolio', $args_portfolio );
	
	
}

add_action( 'init', 'justins_custom_post_types' );


// CUSTOM TAXONOMIES

function justins_custom_taxonomies() {


	// Portfolio Categories	
	
	$labels = array(
		'add_new_item' => 'Add New Category',
		'all_items' => 'All Categories' ,
		'edit_item' => 'Edit Category' , 
		'name' => 'Portfolio Categories', 'taxonomy general name' ,
		'new_item_name' => 'New Genre Category' ,
		'menu_name' => 'Categories' ,
		'parent_item' => 'Parent Category' ,
		'parent_item_colon' => 'Parent Category:',
		'singular_name' => 'Portfolio Category', 'taxonomy singular name' ,
		'search_items' =>  'Search Categories' ,
		'update_item' => 'Update Category' ,
	);
	register_taxonomy( 'portfolio-category', array( 'portfolio' ), array(
		'hierarchical' => true,
		'labels' => $labels,
		'query_var' => true,
		'rewrite' => array( 'slug' => 'portfolio/category' ),
		'show_ui' => true,
	));
	
	
	// Portfolio Tags	
	
	$labels = array(
		'add_new_item' => 'Add New Tag' ,
		'all_items' => 'All Tags' ,
		'edit_item' => 'Edit Tag' , 
		'menu_name' => 'Portfolio Tags' ,
		'name' => 'Portfolio Tags', 'taxonomy general name' ,
		'new_item_name' => 'New Genre Tag' ,
		'parent_item' => 'Parent Tag' ,
		'parent_item_colon' => 'Parent Tag:' ,
		'singular_name' =>  'Portfolio Tag', 'taxonomy singular name' ,
		'search_items' =>   'Search Tags' ,
		'update_item' => 'Update Tag' ,
	);
	register_taxonomy( 'portfolio-tags', array( 'portfolio' ), array(
		'hierarchical' => true,
		'labels' => $labels,
		'query_var' => true,
		'rewrite' => array( 'slug' => 'portfolio/tag' ),
		'show_ui' => true,
	));
	
		
}

add_action( 'init', 'justins_custom_taxonomies', 0 );


// CUSTOM POSTS PER PAGE

function portfolio_posts_per_page($query) {
global $data;
    if ( $query->query_vars['post_type'] == 'portfolio' ) $query->query_vars['posts_per_page'] = $data['sl_portfolio_projects'];
    return $query;
}
if ( !is_admin() ) add_filter( 'pre_get_posts', 'portfolio_posts_per_page' );

//////////////////////////////////////////////////////////////////////////////////////////////////////

// (my_extra_fields)
add_action('admin_init', 'my_extra_fields', 1);

function my_extra_fields() {
    add_meta_box( 'extra_fields', 'Additional settings', 'extra_fields_box_func', 'portfolio', 'normal', 'high'  );
}
function extra_fields_box_func( $post ){
?>
<h4>If you want to use onlny one image for this portfolio item please upload it:</h4>
	<p>
		<label for="upload_image">Single Image: </label>
		<input id="upload_image" type="text" size="90" name="extra[image_single]" value="<?php echo get_post_meta($post->ID, image_single, true); ?>" />
		<input class="upload_image_button" type="button" value="Upload" /><br/>
	</p>	
 <h4>Or you can upload up to 3 images if you want to use slider:</h4>
	<p>
		<label for="upload_image">Image 1: </label>
		<input id="upload_image" type="text" size="90" name="extra[image]" value="<?php echo get_post_meta($post->ID, image, true); ?>" />
		<input class="upload_image_button" type="button" value="Upload" /><br/>
	</p>	
	<input type="hidden" name="extra_fields_nonce" value="<?php echo wp_create_nonce(__FILE__); ?>" />
	<p>
		<label for="upload_image">Image 2: </label>
		<input id="upload_image" type="text" size="90" name="extra[image2]" value="<?php echo get_post_meta($post->ID, image2, true); ?>" />
		<input class="upload_image_button" type="button" value="Upload" /><br/>
	</p>	
	<input type="hidden" name="extra_fields_nonce" value="<?php echo wp_create_nonce(__FILE__); ?>" />

	<p>
		<label for="upload_image">Image 3: </label>
		<input id="upload_image" type="text" size="90" name="extra[image3]" value="<?php echo get_post_meta($post->ID, image3, true); ?>" />
		<input class="upload_image_button" type="button" value="Upload" /><br/>
	</p>	
	<input type="hidden" name="extra_fields_nonce" value="<?php echo wp_create_nonce(__FILE__); ?>" />
	<h4>Or past code for Video</h4>
    <p>
		<textarea type="text" name="extra[video]" style="width:100%;height:50px;"><?php echo get_post_meta($post->ID, 'video', 1); ?></textarea>
	</p>
    
    </br>
    <h4>// Additional information:</h4>

	<p>
		<label for="upload_image">Project logo: </label>
		<input id="upload_image" type="text" size="90" name="extra[image_logo]" value="<?php echo get_post_meta($post->ID, image_logo, true); ?>" />
		<input class="upload_image_button" type="button" value="Upload" /><br/>
	</p>	
	<input type="hidden" name="extra_fields_nonce" value="<?php echo wp_create_nonce(__FILE__); ?>" />
	<h5>Custom block #1:</h5>
	<p>Title:
		<label><input type="text" name="extra[custom_title]" value="<?php echo get_post_meta($post->ID, 'custom_title', 1); ?>" style="width:50%" /></label>
	</p>
    <p>Description:
		<textarea type="text" name="extra[custom_description]" style="width:100%;height:50px;"><?php echo get_post_meta($post->ID, 'custom_description', 1); ?></textarea>
	</p>
	<h5>Custom block #2:</h5>
	<p>Title:
		<label><input type="text" name="extra[custom_title2]" value="<?php echo get_post_meta($post->ID, 'custom_title2', 1); ?>" style="width:50%" /></label>
	</p>
    <p>Description:
		<textarea type="text" name="extra[custom_description2]" style="width:100%;height:50px;"><?php echo get_post_meta($post->ID, 'custom_description2', 1); ?></textarea>
	</p>
    <h5>Custom block #3:</h5>
	<p>Title:
		<label><input type="text" name="extra[custom_title3]" value="<?php echo get_post_meta($post->ID, 'custom_title3', 1); ?>" style="width:50%" /></label>
	</p>
    <p>Description:
		<textarea type="text" name="extra[custom_description3]" style="width:100%;height:50px;"><?php echo get_post_meta($post->ID, 'custom_description3', 1); ?></textarea>
	</p>
<?php
}


add_action('save_post', 'my_extra_fields_update', 0);

function my_extra_fields_update( $post_id ){
    if ( !wp_verify_nonce($_POST['extra_fields_nonce'], __FILE__) ) return false;
	if ( defined('DOING_AUTOSAVE') && DOING_AUTOSAVE  ) return false;
	if ( !current_user_can('edit_post', $post_id) ) return false; 

	if( !isset($_POST['extra']) ) return false;	

	
	$_POST['extra'] = array_map('trim', $_POST['extra']);
	foreach( $_POST['extra'] as $key=>$value ){
		if( empty($value) )
			continue delete_post_meta($post_id, $key); 

		update_post_meta($post_id, $key, $value);
	}
	return $post_id;
}





add_action('admin_init', 'blogextra_fields', 1);

function blogextra_fields() {
    add_meta_box( 'extra_fields', 'Additional settings', 'blog_fields_box_func', 'post', 'normal', 'high'  );
}

function blog_fields_box_func( $post ){
?>
    <h4>If it will be Video post please paste code here( Iframe width="620")</h4>
    <p>
		<textarea type="text" name="blogextra[video]" style="width:100%;height:50px;"><?php echo get_post_meta($post->ID, 'video', 1); ?></textarea>
	</p>	
<?php
}



add_action('save_post', 'blogextra_fields_update', 0);


function blogextra_fields_update( $post_id ){
	if ( defined('DOING_AUTOSAVE') && DOING_AUTOSAVE  ) return false; 
	if ( !current_user_can('edit_post', $post_id) ) return false; 
	if( !isset($_POST['blogextra']) ) return false;	

	
	$_POST['blogextra'] = array_map('trim', $_POST['blogextra']);
	foreach( $_POST['blogextra'] as $key=>$value ){
		if( empty($value) )
			continue delete_post_meta($post_id, $key);

		update_post_meta($post_id, $key, $value);
	}
	return $post_id;
}










function upload_scripts() {
	wp_enqueue_script('media-upload');
	wp_enqueue_script('thickbox');
	wp_register_script('my-upload', get_bloginfo('template_directory').'/js/custom_uploader.js', array('jquery','media-upload','thickbox'));
	wp_enqueue_script('my-upload');
}



function upload_styles() {
	wp_enqueue_style('thickbox');
}
add_action('admin_print_scripts', 'upload_scripts'); 
add_action('admin_print_styles', 'upload_styles');



//////////////////////////////////////////////////////////////////////////////////////////////////////////////






function mytheme_comment($comment, $args, $depth) {
   $GLOBALS['comment'] = $comment; ?>
   <li <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>">
     <div id="comment-<?php comment_ID(); ?>">


    
      <?php if ($comment->comment_approved == '0') : ?>
         <em><?php echo 'Your comment is awaiting moderation.'; ?></em>
      <?php endif; ?>
    <div class="comment">
            <div class="avatar">
                <?php echo get_avatar($comment,$size='70',$default='<path_to_url>' ); ?>
            </div>
            <div class="main-comment">
                <h6 class="colored"><?php comment_author(); ?> <span class="small-italic gray">/ <?php echo get_comment_date('M d') ?> </span></h6>
                <span class="notopmargin small-italic"><?php comment_text() ?></span>
            </div>
            <div class="clear"></div>
            <div class="separator"></div>
        </div>

     	
     </div>



















     
<?php
    }
?>