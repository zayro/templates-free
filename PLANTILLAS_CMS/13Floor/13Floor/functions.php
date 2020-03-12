<?php 
add_action( 'after_setup_theme', 'et_setup_theme' );
if ( ! function_exists( 'et_setup_theme' ) ){
	function et_setup_theme(){
		global $themename, $shortname;
		$themename = "13floor";
		$shortname = "13floor";
	
		require_once(TEMPLATEPATH . '/epanel/custom_functions.php'); 

		require_once(TEMPLATEPATH . '/includes/functions/comments.php'); 

		require_once(TEMPLATEPATH . '/includes/functions/sidebars.php'); 

		load_theme_textdomain('13floor',get_template_directory().'/lang');

		require_once(TEMPLATEPATH . '/epanel/options_13floor.php');

		require_once(TEMPLATEPATH . '/epanel/core_functions.php'); 

		require_once(TEMPLATEPATH . '/epanel/post_thumbnails_13floor.php');
		
		include(TEMPLATEPATH . '/includes/widgets.php');
		
		add_action( 'pre_get_posts', 'et_home_posts_query' );
	}
}

add_action('wp_head','et_portfoliopt_additional_styles',100);
function et_portfoliopt_additional_styles(){ ?>
	<style type="text/css">
		#et_pt_portfolio_gallery { margin-left: -15px; }
		.et_pt_portfolio_item { margin-left: 9px; }
		.et_portfolio_small { margin-left: -55px !important; }
		.et_portfolio_small .et_pt_portfolio_item { margin-left: 25px !important; }
		.et_portfolio_large { margin-left: -8px !important; }
		.et_portfolio_large .et_pt_portfolio_item { margin-left: 6px !important; }
		.et_pt_portfolio_item h2 { color: #fff; }
		.et_portfolio_large .et_pt_portfolio_item { width: 412px; }
		.et_portfolio_large .et_portfolio_more_icon { left: 168px; }
		.et_portfolio_large .et_portfolio_zoom_icon { left: 208px; }
	</style>
<?php }

function register_main_menus() {
	register_nav_menus(
		array(
			'primary-menu' => __( 'Primary Menu' )
		)
	);
};
if (function_exists('register_nav_menus')) add_action( 'init', 'register_main_menus' );

/**
 * Filters the main query on homepage
 */
function et_home_posts_query( $query = false ) {
	/* Don't proceed if it's not homepage or the main query */
	if ( ! is_home() || ! is_a( $query, 'WP_Query' ) || ! $query->is_main_query() ) return;
		
	/* Set the amount of posts per page on homepage */
	$query->set( 'posts_per_page', et_get_option( '13floor_homepage_posts', '6' ) );
	
	/* Exclude categories set in ePanel */
	$exclude_categories = et_get_option( '13floor_exlcats_recent', false );
	if ( $exclude_categories ) $query->set( 'category__not_in', $exclude_categories );
}

if ( ! function_exists( 'et_list_pings' ) ){
	function et_list_pings($comment, $args, $depth) {
		$GLOBALS['comment'] = $comment; ?>
		<li id="comment-<?php comment_ID(); ?>"><?php comment_author_link(); ?> - <?php comment_excerpt(); ?>
	<?php }
} ?>