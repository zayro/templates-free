<?php
	
	/* ==================================================
	
	Swift Framework Main Functions
	
	================================================== */
	
	define('SF_TEMPLATE_PATH', get_template_directory());
	define('SF_INCLUDES_PATH', SF_TEMPLATE_PATH . '/includes');
	define('SF_WIDGETS_PATH', SF_INCLUDES_PATH . '/widgets');
	define('SF_LOCAL_PATH', get_template_directory_uri());
	
	
	/* INCLUDES
	================================================== */
	
	/* Add custom post types */
	require_once(SF_INCLUDES_PATH . '/custom-post-types/portfolio-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/showcase-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/team-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/clients-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/testimonials-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/jobs-type.php');
	require_once(SF_INCLUDES_PATH . '/custom-post-types/faqs-type.php');
	
	/* Add image resizer */
	require_once(SF_INCLUDES_PATH . '/plugins/aq_resizer.php');
	
	/* Include page builder */
	include(SF_INCLUDES_PATH . '/page-builder/js_composer.php');
	
	/* Add meta boxes */
	include(SF_INCLUDES_PATH . '/meta-box/meta-box.php');
	include(SF_INCLUDES_PATH . '/meta-boxes.php');
	
	/* Add shortcodes */
	include(SF_INCLUDES_PATH . '/shortcodes.php');
	
	/* Dropdown menu support */
	include(SF_INCLUDES_PATH . '/plugins/dropdown-menus.php');
	
	/* Include plugins */
	include(SF_INCLUDES_PATH . '/plugin-includes.php');	
	include(SF_INCLUDES_PATH . '/plugins/slider-plugin/slider.php');
	include(SF_INCLUDES_PATH . '/plugins/love-it-pro/love-it-pro.php');
	
	/* Include widgets */
	include(SF_WIDGETS_PATH . '/widget-flickr.php');
	include(SF_WIDGETS_PATH . '/widget-twitter.php');
	include(SF_WIDGETS_PATH . '/widget-video.php');
	
	/* Include theme updater */
	require_once(SF_INCLUDES_PATH . '/wp-updates-theme.php');
	new WPUpdatesThemeUpdater( 'http://wp-updates.com/api/1/theme', 81, basename(get_template_directory()) );
	
	
	/* THEME OPTIONS FRAMEWORK
	================================================== */  
	
	require_once (SF_INCLUDES_PATH . '/sf-options.php');
	
	
	/* CUSTOMIZER OPTIONS
	================================================== */ 
	
	require_once (SF_INCLUDES_PATH . '/sf-customizer-options.php');
	

	/* THEME SUPPORT
	================================================== */  
	
	add_theme_support( 'post-formats', array('quote') );
	add_theme_support( 'automatic-feed-links' );
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 220, 150, true);
	add_image_size( 'thumb-image', 420, 315, true);
	add_image_size( 'blog-image', 640, 9999);
	add_image_size( 'full-width-image', 1000, 563, true);
	
	
	/* CONTENT WIDTH
	================================================== */
	
	if ( ! isset( $content_width ) ) $content_width = 940;
	
	
	/* LOAD THEME LANGUAGE
	================================================== */
	
	load_theme_textdomain('swiftframework', SF_TEMPLATE_PATH.'/language');
	
	$locale = get_locale();
	$locale_file = SF_TEMPLATE_PATH."/language/$locale.php";
	
	if (is_readable($locale_file)) {
		require_once($locale_file);
	}
	
	
	/* LOAD STYLES & SCRIPTS
	================================================== */
		
	function sf_enqueue_styles() {  
		
		$options = get_option('sf_pinpoint_options');
		$enable_responsive = $options['enable_responsive'];
			
	    wp_register_style('base-css', SF_LOCAL_PATH . '/css/base.css', array(), '1.0', 'screen');  
	    wp_register_style('skeleton-css', SF_LOCAL_PATH . '/css/skeleton.css', array(), '1.0', 'screen');  
	    wp_register_style('fontawesome-css', SF_LOCAL_PATH . '/css/font-awesome.min.css', array(), '3.0', 'screen');  
	    wp_register_style('main-css', SF_LOCAL_PATH . '/style.css', array(), '1.0', 'screen');  
	    wp_register_style('layout-css', SF_LOCAL_PATH . '/css/layout.css', array(), '1.0', 'screen');
	    wp_register_style('custom-css', SF_LOCAL_PATH . '/css/custom-styles.css.php', array(), '1.0', 'screen');
	
	    wp_enqueue_style('base-css');  
	    if ($enable_responsive) {
	    wp_enqueue_style('skeleton-css');  
	    }
	    wp_enqueue_style('fontawesome-css'); 
	    wp_enqueue_style('main-css');  
	    if ($enable_responsive) {
	    wp_enqueue_style('layout-css');  
	    }
	    wp_enqueue_style('custom-css');
	
	}
	
	add_action('wp_enqueue_scripts', 'sf_enqueue_styles');  
	
	function sf_enqueue_scripts() {
	    
	    wp_register_script('flexslider', get_template_directory_uri() . '/js/jquery.flexslider-min.js', 'jquery', '2.1', TRUE);
	    wp_register_script('isotope', get_template_directory_uri() . '/js/jquery.isotope.min.js', 'jquery', '1.0', TRUE);
	    wp_register_script('superfish', get_template_directory_uri() . '/js/jquery.superfish.js', 'jquery', '1.3', TRUE);
	    wp_register_script('hoverIntent', get_template_directory_uri() . '/js/jquery.hoverIntent.min.js', 'jquery', '1.0', TRUE);
	    wp_register_script('easing', get_template_directory_uri() . '/js/jquery.easing.1.3.js', 'jquery', '1.3', TRUE);
	    wp_register_script('jcarousel', get_template_directory_uri() . '/js/jquery.jcarousel.min.js', 'jquery', '0.2.8', TRUE); 
	    wp_register_script('jqueryUI', get_template_directory_uri() . '/js/jquery-ui-1.9.2.custom.min.js', 'jquery', '1.9.2', TRUE);
		wp_register_script('fancybox', get_template_directory_uri() . '/js/jquery.fancybox.pack.js', 'jquery', '2.1.1', TRUE);
		wp_register_script('viewjs', get_template_directory_uri() . '/js/view.min.js?auto', 'jquery', TRUE);
	    wp_register_script('fitvids', get_template_directory_uri() . '/js/jquery.fitvids.js', 'jquery', '1.0', TRUE);
	    wp_register_script('maps', 'http://maps.google.com/maps/api/js?sensor=false', 'jquery', TRUE);
	    wp_register_script('respond', get_template_directory_uri() . '/js/respond.min.js', 'jquery', '1.0', TRUE);
	    wp_register_script('functions', get_template_directory_uri() . '/js/functions.js.php', 'jquery', '1.0', TRUE);
		
	    wp_enqueue_script('jquery');
		wp_enqueue_script('superfish');
		wp_enqueue_script('hoverIntent');
		wp_enqueue_script('easing');
		wp_enqueue_script('jqueryUI');
	    wp_enqueue_script('flexslider');
	    wp_enqueue_script('fancybox');
	    wp_enqueue_script('viewjs');
	    wp_enqueue_script('fitvids');
	    wp_enqueue_script('respond');
	    	    
	    if (!is_admin()) {
	    	wp_enqueue_script('functions');
	    }
	    
	    if (is_singular()) {
	    	wp_enqueue_script( "comment-reply" );
	    }
		
	}
	
	add_action('wp_enqueue_scripts', 'sf_enqueue_scripts');
	
	function sf_admin_scripts() {
	    wp_register_script('admin-functions', get_template_directory_uri() . '/js/sf-admin.js', 'jquery', '1.0', TRUE);
		wp_enqueue_script('admin-functions');
	}
	add_action('admin_init', 'sf_admin_scripts');
	
	
	function sf_load_custom_script() {
		global $include_maps;
		global $include_isotope;
		global $include_carousel;
		
		if ($include_maps) {
			wp_print_scripts('maps');
		}
		
		if ($include_isotope) {
			wp_print_scripts('isotope');
		}
		
		if ($include_carousel) {
			wp_print_scripts('jcarousel');
		}
		
	}
	
	add_action('wp_footer', 'sf_load_custom_script');
	
	/* WOOCOMMERCE FILTER HOOKS
	================================================== */
		
	/************************************************
	*	WooCommerce Functions		       	     	* 
	/************************************************/
	
	remove_action( 'woocommerce_before_main_content', 'woocommerce_output_content_wrapper', 10);
	remove_action( 'woocommerce_after_main_content', 'woocommerce_output_content_wrapper_end', 10);
	add_action('woocommerce_before_main_content', 'my_theme_wrapper_start', 10);
	add_action('woocommerce_after_main_content', 'my_theme_wrapper_end', 10);
	 
	function my_theme_wrapper_start() {
	  echo '<div class="page-content clearfix">';
	}
	 
	function my_theme_wrapper_end() {
	  echo '</div>';
	}		
	
	
	/* RESPONSIVE DISABLED STYLES
	================================================== */
	
	function sf_custom_styles() {
		$options = get_option('sf_pinpoint_options');
		$enable_responsive = $options['enable_responsive'];
		
		if (!$enable_responsive) {
		echo "<style type='text/css'>";
		echo "[class*='span'],
		.row-fluid [class*='span'] {
		  float: left!important;
		  margin-left: 23px!important;
		}
		.row-fluid [class*='span']:first-child {
	 	  margin-left: 0!important;
		}
		.row-fluid .span12 {
		  width: 100%!important;
		  *width: 100%!important;
		}
		.row-fluid .full-width, .row-fluid .full-width:first-child {
			width: 1000px!important;
			margin: 0 -30px!important;
		}
		.has-left-sidebar .pagination-wrap {
			width: 700px!important;
			margin: 30px -30px 0!important;
		}
		.has-right-sidebar .pagination-wrap {
			width: 700px!important;
		}
		.has-both-sidebars .pagination-wrap {
			width: 520px!important;
			margin: 30px -30px 0!important;
		}
		.row-fluid .span9 {
		  width: 696px!important;
		  *width: 694px!important;
		}
		.row-fluid .span8 {
		  width: 616px!important;
		  *width: 614px!important;
		}
		.row-fluid .span6 {
		  width: 458px!important;
		  *width: 457px!important;
		}
		.row-fluid .span4 {
		  width: 296px!important;
		  *width: 295px!important;
		}
		.row-fluid .span3 {
		  width: 214px!important;
		  *width: 214px!important;
		}
		.rev_slider_wrapper, .rev_slider {
			width: 100%!important;
			height: 500px!important;
			max-height:500px!important;
		}
		";
		echo "</style>";
		}
	}
	
	add_action('wp_head', 'sf_custom_styles');
		
	
	/* CUSTOM ADMIN MENU ITEMS
	================================================== */
	
	if(!function_exists('sf_admin_bar_menu')) {
				
		function sf_admin_bar_menu() {
		
			global $wp_admin_bar;
				
			$theme_options = array(
				'id' => '1',
				'title' => __('Pinpoint Options'),
				'href' => admin_url('/admin.php?page=sf_theme_options'),
				'meta' => array('target' => 'blank')
			);
			
			$wp_admin_bar->add_menu($theme_options);
			
			$theme_customizer = array(
				'id' => '2',
				'title' => __('Color Customizer'),
				'href' => admin_url('/customize.php'),
				'meta' => array('target' => 'blank')
			);
			
			$wp_admin_bar->add_menu($theme_customizer);
			
		}
		
		add_action('admin_bar_menu', 'sf_admin_bar_menu', 99);
	}
	

	/* ADMIN CUSTOM POST TYPE ICONS
	================================================== */
	
	add_action( 'admin_head', 'sf_admin_css' );
	function sf_admin_css() {
	    ?>
	    	    
	    <style type="text/css" media="screen">
	        #menu-posts-portfolio .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/portfolio.png) no-repeat 6px 7px!important;
	        	background-size: 17px 15px;
	        }
	        #menu-posts-portfolio:hover .wp-menu-image, #menu-posts-portfolio.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/portfolio_rollover.png) no-repeat 6px 7px!important;
	        }
	        #menu-posts-showcase .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/showcase.png) no-repeat 6px 7px!important;
	        	background-size: 17px 15px;
	        }
	        #menu-posts-showcase:hover .wp-menu-image, #menu-posts-showcase.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/showcase_rollover.png) no-repeat 6px 7px!important;
	        }
	        #menu-posts-team .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/team.png) no-repeat 6px 11px!important;
	        	background-size: 18px 9px;
	        }
	        #menu-posts-team:hover .wp-menu-image, #menu-posts-team.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/team_rollover.png) no-repeat 6px 11px!important;
	        }
	        #menu-posts-clients .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/clients.png) no-repeat 7px 6px!important;
	        	background-size: 15px 16px;
	        }
	        #menu-posts-clients:hover .wp-menu-image, #menu-posts-clients.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/clients_rollover.png) no-repeat 7px 6px!important;
	        }
	        #menu-posts-testimonials .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/testimonials.png) no-repeat 8px 7px!important;
	        	background-size: 15px 14px;
	        }
	        #menu-posts-testimonials:hover .wp-menu-image, #menu-posts-testimonials.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/testimonials_rollover.png) no-repeat 8px 7px!important;
	        }
	        #menu-posts-jobs .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/jobs.png) no-repeat 7px 8px!important;
	        	background-size: 16px 14px;
	        }
	        #menu-posts-jobs:hover .wp-menu-image, #menu-posts-jobs.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/jobs_rollover.png) no-repeat 7px 8px!important;
	        }
	        #menu-posts-faqs .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/faqs.png) no-repeat 7px 7px!important;
	        	background-size: 15px 16px;
	        }
	        #menu-posts-faqs:hover .wp-menu-image, #menu-posts-faqs.wp-has-current-submenu .wp-menu-image {
	            background: url(<?php echo get_template_directory_uri(); ?>/images/wp/faqs_rollover.png) no-repeat 7px 7px!important;
	        }
	        #menu-posts-slide .wp-menu-image img {
	        	width: 16px;
	        }
	        #toplevel_page_sf_theme_options .wp-menu-image img {
	        	width: 11px;
	        	margin-top: -2px;
	        	margin-left: 3px;
	        }
	        .toplevel_page_sf_theme_options #adminmenu li#toplevel_page_sf_theme_options.wp-has-current-submenu a.wp-has-current-submenu, .toplevel_page_sf_theme_options #adminmenu #toplevel_page_sf_theme_options .wp-menu-arrow div, .toplevel_page_sf_theme_options #adminmenu #toplevel_page_sf_theme_options .wp-menu-arrow {
	        	background: #222;
	        	border-color: #222;
	        }
	        #wpbody-content {
	        	min-height: 815px;
	        }
		</style>
		
		<?php 
		$options = get_option('sf_pinpoint_options');
		$enable_adv_rev_options = $options['enable_adv_rev_options'];
		if ($enable_adv_rev_options) {
		?>
		<style type="text/css" media="screen">
			#slider_size_row #cellWidth, #slider_size_row th[scope="row"] {
		    	display: table-cell;
		    }
		    #responsitive_row, #hr2_row {
		    	display: table-row;
		    }
		    #slider_size_row td#cellWidthInput input {
		    	display: block;
		    }
		</style>
		<?php } ?>
	<?php }
	
	
	/* SHORTCODE PANEL SETUP
	================================================== */
	
	// Create TinyMCE's editor button & plugin for Swift Framework Shortcodes
	add_action('init', 'sf_sc_button'); 
	
	function sf_sc_button() {  
	   if ( current_user_can('edit_posts') &&  current_user_can('edit_pages') )  
	   {  
	     add_filter('mce_external_plugins', 'add_tinymce_plugin');  
	     add_filter('mce_buttons', 'register_button');  
	   }  
	} 
	
	function register_button($button) {  
	    array_push($button, 'separator', 'swiftframework_shortcodes' );  
	    return $button;  
	}
	
	function add_tinymce_plugin($plugins) {  
	    $plugins['swiftframework_shortcodes'] = get_template_directory_uri() . '/includes/sf_shortcodes/tinymce.editor.plugin.js';  
	    return $plugins;  
	} 
	
	function custom_mce_styles( $init ) {
	    $init['theme_advanced_buttons2_add_before'] = 'styleselect';
	    $init['theme_advanced_styles'] = 'Impact Text=impact-text';
	    return $init;
	}
	 
	add_filter( 'tiny_mce_before_init', 'custom_mce_styles'  );
	 
	function my_mce_css() {
	    return SF_LOCAL_PATH . '/css/editor-style.css';
	}
	 
	add_filter( 'mce_css', 'my_mce_css' );
	

	/* WORDPRESS GALLERY MODS
	================================================== */
	
	add_filter( 'wp_get_attachment_link', 'sant_lightboxadd');
	 
	function sant_lightboxadd ($content) {
	    $content = preg_replace("/<a/","<a class=\"view\"",$content,1);
	    return $content;
	}
	
	add_filter( 'gallery_style', 'custom_gallery_styling', 99 );
	
	function custom_gallery_styling() {
	    return "<div class='gallery'>";
	}
	
	
	/* WORDPRESS TAG CLOUD WIDGET MODS
	================================================== */
	
	add_filter( 'widget_tag_cloud_args', 'sf_tag_cloud_args' );
	
	function sf_tag_cloud_args( $args ) {
		$args['largest'] = 12;
		$args['smallest'] = 12;
		$args['unit'] = 'px';
		return $args;
	}
	
	/* WORDPRESS CATEGORY WIDGET MODS
	================================================== */
	
	add_filter('wp_list_categories', 'sf_category_widget_mod');
	
	function sf_category_widget_mod($output) {
		$output = str_replace('</a> (',' <span>(',$output);
		$output = str_replace(')',')</span></a> ',$output);
		return $output;
	}
	
	/* WORDPRESS ARCHIVES WIDGET MODS
	================================================== */
	
	add_filter('wp_get_archives', 'sf_archives_widget_mod');
	
	function sf_archives_widget_mod($output) {
		$output = str_replace('</a> (',' <span>(',$output);
		$output = str_replace(')',')</span></a> ',$output);
		return $output;
	}
	
	
	/* GET CUSTOM POST TYPE TAXONOMY LIST
	================================================== */

	function get_category_list( $category_name, $parent='' ){
		
		if ( empty($parent) ) { 
		
			$get_category = get_categories( array( 'taxonomy' => $category_name	));
			$category_list = array( '0' => 'All');
			
			foreach( $get_category as $category ){
				$category_list[] = $category->cat_name;
			}
				
			return $category_list;
			
		} else {
			
			$parent_id = get_term_by('name', $parent, $category_name);
			$get_category = get_categories( array( 'taxonomy' => $category_name, 'child_of' => $parent_id->term_id	));
			$category_list = array( '0' => $parent );
			
			foreach( $get_category as $category ){
				$category_list[] = $category->cat_name;
			}
				
			return $category_list;		
		
		}
	}
	
	
	/* VIDEO EMBED FUNCTIONS
	================================================== */
	
	function video_embed($url, $width = 640, $height = 480) {
		if (strpos($url,'youtube')){
			return video_youtube($url, $width, $height);
		} else {
			return video_vimeo($url, $width, $height);
		}
	}
	
	function video_youtube($url, $width = 640, $height = 480){
	
		preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $video_id);
		
		return '<iframe src="http://www.youtube.com/embed/'. $video_id[1] .'?wmode=transparent" width="'. $width .'" height="'. $height .'" ></iframe>';
				
	}
	
	function video_vimeo($url, $width = 640, $height = 480){
	
		preg_match('/http:\/\/vimeo.com\/(\d+)$/', $url, $video_id);		
		
		return '<iframe src="http://player.vimeo.com/video/'. $video_id[1] .'?title=0&amp;byline=0&amp;portrait=0?wmode=transparent" width="'. $width .'" height="'. $height .'"></iframe>';
		
	}
	
	
	/* MAP EMBED FUNCTIONS
	================================================== */
	
	function map_embed($address){
	    if (!is_string($address))die("All Addresses must be passed as a string");
	    $_url = sprintf('http://maps.google.com/maps?output=js&q=%s',rawurlencode($address));
	    $_result = false;
	    $ch = curl_init();
	    curl_setopt ($ch, CURLOPT_URL, $_url);
	    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
	    $contents = curl_exec($ch);
	    curl_close($ch);
	    
	    if($_result = $contents) {
	        if(strpos($_result,'errortips') > 1 || strpos($_result,'Did you mean:') !== false) return false;
	        preg_match('!center:\s*{lat:\s*(-?\d+\.\d+),lng:\s*(-?\d+\.\d+)}!U', $_result, $_match);
	        $_coords['lat'] = $_match[1];
	        $_coords['long'] = $_match[2];
	    }
	    return $_coords;
	}
	
		
	/* FEATURED IMAGE TITLE
	================================================== */
	
	function sf_featured_img_title() {
	  global $post;
	  $sf_thumbnail_id = get_post_thumbnail_id($post->ID);
	  $sf_thumbnail_image = get_posts(array('p' => $sf_thumbnail_id, 'post_type' => 'attachment', 'post_status' => 'any'));
	  if ($sf_thumbnail_image && isset($sf_thumbnail_image[0])) {
	    return $sf_thumbnail_image[0]->post_title;
	  }
	}
	
	
	/* LANGUAGE FLAGS
	================================================== */
	
	function language_flags(){
		if (function_exists('icl_get_languages')) {
		    $languages = icl_get_languages('skip_missing=0&orderby=code');
		    if(!empty($languages)){
		        echo '<ul id="header-language-flags" class="clearfix">';
		        foreach($languages as $l){
		            echo '<li>';
		            if($l['country_flag_url']){
		                if(!$l['active']) {
		                	echo '<a href="'.$l['url'].'"><img src="'.$l['country_flag_url'].'" height="12" alt="'.$l['language_code'].'" width="18" /></a>';
		                } else {
		                	echo '<div class="current-language"><img src="'.$l['country_flag_url'].'" height="12" alt="'.$l['language_code'].'" width="18" /></div>';
		                }
		            }
		            echo '</li>';
		        }
		        echo '</ul>';
		    }
	    } else {
	    	echo "<p>WPML not installed and activated.</p>";
	    }
	}
	
	
	/* PAGINATION
	================================================== */
	
	function pagination() {
		global $wp_query;
		
		$big = 999999999; // need an unlikely integer
		
		return paginate_links( array(
			'base' => str_replace( $big, '%#%', get_pagenum_link( $big ) ),
			'format' => '?paged=%#%',
			'current' => max( 1, get_query_var('paged') ),
			'total' => $wp_query->max_num_pages
		) );
	}
	
	
	/* LATEST TWEET FUNCTION
	================================================== */
	
	function latestTweet($twitterID){ 
	    include_once(ABSPATH.WPINC.'/class-simplepie.php'); 
	    add_filter( 'wp_feed_cache_transient_lifetime', create_function( '$a', 'return 300;' ) );
	
	    $tweet = fetch_feed("http://search.twitter.com/search.atom?q=from:" .$twitterID . "&rpp=1"); 
	 	$tweet_content = "";
	 	
	 	$maxitems = 0;
	 	
	    if (!is_wp_error( $tweet ) ) : 
	        $maxitems = $tweet->get_item_quantity(1);  
	        $rss_items = $tweet->get_items(0, $maxitems);  
	    endif; 
	 
	    if ($maxitems == 0) {
	    	return '<div class="latest-tweet"><p>'.sprintf(__('Could not return a tweet :(', 'swiftframework')).'</p></div>';
	    } else {
	    	foreach ( $rss_items as $item ) { 
		        $content = str_replace("<em>", "", html_entity_decode($item->get_content()));
		        $content = str_replace("</em>", "", $content);
		        $link = html_entity_decode($item->get_permalink());    
		        $date = $item->get_date('U'); // retrives the tweets date and time in Unix Epoch terms
		        $blogtime = current_time('U'); // retrives the current browser client date and time in Unix Epoch terms
		        $dago = human_time_diff($date, $blogtime) . ' ' . sprintf(__('ago', 'swiftframework')); // calculates and outputs the time past in human readable format
		        $tweet_content = '<div class="latest-tweet"><span class="twitter-bird"><i class="icon-twitter"></i></span><span class="tweet-text">'.$content.'</span><a class="tweet-date" href='.$link.' target="_blank">'.$dago.'</a></div>'; 
		    }
	    	return $tweet_content;
	    }
	}
	
	
	/* CONTENT RETURN FUNCTIONS
	================================================== */
	
	function get_the_content_with_formatting() {
	    $content = get_the_content();
	    $content = apply_filters('the_content', $content);
	    $content = str_replace(']]>', ']]&gt;', $content);
	    return $content;
	}
	
	
	/* SHORTCODE FIX
	================================================== */
	
	function sf_shortcode_fix($content){   
	    $array = array (
	        '<p>[' => '[', 
	        ']</p>' => ']', 
	        ']<br />' => ']'
	    );
	
	    $content = strtr($content, $array);
	    return $content;
	}
	add_filter('the_content', 'sf_shortcode_fix');
	
	
	/* CUSTOM MENU SETUP
	================================================== */
	
	add_action( 'after_setup_theme', 'setup_menus' );
	function setup_menus() {
		// This theme uses wp_nav_menu() in four locations.
		register_nav_menus( array(
		'Main_Navigation' => __( 'Main Menu', "swiftframework" )
		) );
	}
	add_filter('nav_menu_css_class', 'mbudm_add_page_type_to_menu', 10, 2 );
	//If a menu item is a page then add the template name to it as a css class 
	function mbudm_add_page_type_to_menu($classes, $item) {
	    if($item->object == 'page'){
	        $template_name = get_post_meta( $item->object_id, '_wp_page_template', true );
	        $new_class =str_replace(".php","",$template_name);
	        array_push($classes, $new_class);
	    }   
	    return $classes;
	}
	
	
	/* CUSTOM POST TYPES ARCHIVES
	================================================== */
	
	add_filter('pre_get_posts', 'query_post_type');
	function query_post_type($query) {
	  if(is_category() || is_tag()) {
	    $post_type = get_query_var('post_type');
	    if($post_type)
	        $post_type = $post_type;
	    else
	        $post_type = array('nav_menu_item','post','portfolio');
	    $query->set('post_type',$post_type);
	    return $query;
	    }
	}
	
	
	/* EXCERPT
	================================================== */
	
	function new_excerpt_length($length) {
	    return 60;
	}
	add_filter('excerpt_length', 'new_excerpt_length');
	
	// Blog Widget Excerpt
	function excerpt($limit) {
	      $excerpt = explode(' ', get_the_excerpt(), $limit);
	      if (count($excerpt)>=$limit) {
	        array_pop($excerpt);
	        $excerpt = implode(" ",$excerpt).'...';
	      } else {
	        $excerpt = implode(" ",$excerpt).'';
	      } 
	      $excerpt = preg_replace('`\[[^\]]*\]`','',$excerpt);
	      return '<p>' . $excerpt . '</p>';
	    }
	
	function content($limit) {
	      $content = explode(' ', get_the_content(), $limit);
	      if (count($content)>=$limit) {
	        array_pop($content);
	        $content = implode(" ",$content).'...';
	      } else {
	        $content = implode(" ",$content).'';
	      } 
	      $content = preg_replace('/\[.+\]/','', $content);
	      $content = apply_filters('the_content', $content); 
	      $content = str_replace(']]>', ']]&gt;', $content);
	      return $content;
	}
	
	function custom_excerpt($custom_content, $limit) {
		$content = explode(' ', $custom_content, $limit);
		if (count($content)>=$limit) {
		  array_pop($content);
		  $content = implode(" ",$content).'...';
		} else {
		  $content = implode(" ",$content).'';
		} 
		$content = preg_replace('/\[.+\]/','', $content);
		$content = apply_filters('the_content', $content); 
		$content = str_replace(']]>', ']]&gt;', $content);
		return $content;
	}	
	
	/* REGISTER SIDEBARS
	================================================== */
	
	if ( function_exists('register_sidebar')) {
	
		$options = get_option('sf_pinpoint_options');
		if (isset($options['footer_layout'])) {
		$footer_config = $options['footer_layout'];
		} else {
		$footer_config = 'footer-1';
		}
	    register_sidebar(array(
	        'name'=>'Sidebar One',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h3>',
	        'after_title' => '</h3></div>',
	    ));
	    register_sidebar(array(
	        'name'=>'Sidebar Two',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h3>',
	        'after_title' => '</h3></div>',
	    ));
		register_sidebar(array(
			'name'=>'Sidebar Three',
			'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
			'after_widget' => '</section>',
			'before_title' => '<div class="widget-heading clearfix"><h3>',
			'after_title' => '</h3></div>',
		));
		register_sidebar(array(
			'name'=>'Sidebar Four',
			'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
			'after_widget' => '</section>',
			'before_title' => '<div class="widget-heading clearfix"><h3>',
			'after_title' => '</h3></div>',
		));
		register_sidebar(array(
		    'name'=>'Sidebar Five',
		    'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
		    'after_widget' => '</section>',
		    'before_title' => '<div class="widget-heading clearfix"><h3>',
		    'after_title' => '</h3></div>',
		));
		register_sidebar(array(
		    'name'=>'Sidebar Six',
		    'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
		    'after_widget' => '</section>',
		    'before_title' => '<div class="widget-heading clearfix"><h3>',
		    'after_title' => '</h3></div>',
		));
		register_sidebar(array(
			'name'=>'Sidebar Seven',
			'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
			'after_widget' => '</section>',
			'before_title' => '<div class="widget-heading clearfix"><h3>',
			'after_title' => '</h3></div>',
		));
		register_sidebar(array(
			'name'=>'Sidebar Eight',
			'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
			'after_widget' => '</section>',
			'before_title' => '<div class="widget-heading clearfix"><h3>',
			'after_title' => '</h3></div>',
		));
	    register_sidebar(array(
	        'name'=>'Footer Column 1',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h4>',
	        'after_title' => '</h4></div>',
	    ));
	    register_sidebar(array(
	        'name'=>'Footer Column 2',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h4>',
	        'after_title' => '</h4></div>',
	    ));
	    register_sidebar(array(
	        'name'=>'Footer Column 3',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h4>',
	        'after_title' => '</h4></div>',
	    ));
	    if ($footer_config == "footer-1") {
	    register_sidebar(array(
	        'name'=>'Footer Column 4',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h4>',
	        'after_title' => '</h4></div>',
	    ));
	    }
	    register_sidebar(array(
	        'name'=>'WooCommerce Sidebar',
	        'before_widget' => '<section id="%1$s" class="widget %2$s clearfix">',
	        'after_widget' => '</section>',
	        'before_title' => '<div class="widget-heading clearfix"><h3>',
	        'after_title' => '</h3></div>',
	    ));	    
	} 
	
	
	/* ADD SHORTCODE FUNCTIONALITY TO WIDGETS
	================================================== */
	
	add_filter('widget_text', 'do_shortcode');
	
	
	/* NAVIGATION CHECK
	================================================== */
	
	//functions tell whether there are previous or next 'pages' from the current page
	//returns 0 if no 'page' exists, returns a number > 0 if 'page' does exist
	//ob_ functions are used to suppress the previous_posts_link() and next_posts_link() from printing their output to the screen
	
	function has_previous_posts() {
		ob_start();
		previous_posts_link();
		$result = strlen(ob_get_contents());
		ob_end_clean();
		return $result;
	}
	
	function has_next_posts() {
		ob_start();
		next_posts_link();
		$result = strlen(ob_get_contents());
		ob_end_clean();
		return $result;
	}
	
	
	/* REMOVE CERTAIN HEAD TAGS
	================================================== */
	
	add_action('init', 'remheadlink');
	function remheadlink() {
		remove_action('wp_head', 'index_rel_link');
		remove_action('wp_head', 'rsd_link');
		remove_action('wp_head', 'wlwmanifest_link');
	}
	
	
	/* CUSTOM LOGIN LOGO
	================================================== */
	
	function sf_custom_login_logo() {
		$options = get_option('sf_pinpoint_options');
		$custom_logo = $options['custom_admin_login_logo'];
		if ($custom_logo) {		
		echo '<style type="text/css">
		    .login h1 a { background-image:url('. $custom_logo .') !important; height: 95px!important; background-size: auto; }
		</style>';
		} else {
		echo '<style type="text/css">
		    .login h1 a { background-image:url('. get_template_directory_uri() .'/images/custom-login-logo.png) !important; height: 95px!important; background-size: auto; }
		</style>';
		}
	}
	
	add_action('login_head', 'sf_custom_login_logo');
	
	
	/* COMMENTS
	================================================== */
	
	// Custom callback to list comments in the your-theme style
	function custom_comments($comment, $args, $depth) {
	  $GLOBALS['comment'] = $comment;
	    $GLOBALS['comment_depth'] = $depth;
	  ?>
	    <li id="comment-<?php comment_ID() ?>" <?php comment_class('clearfix') ?>>
	        <div class="comment-wrap clearfix">
	            <div class="comment-avatar control-item">
	            	<?php if(function_exists('get_avatar')) { echo get_avatar($comment, '50'); } ?>
	            	<?php if ($comment->comment_author_email == get_the_author_meta('email')) { ?>
	            	<span class="tooltip"><?php _e("Author", "swiftframework"); ?><span class="arrow"></span></span>
	            	<?php } ?>
	            </div>
	    		<div class="comment-content">
	            	<div class="comment-meta">
	            			<?php
	            				printf('<span class="comment-author">%1$s</span> <span class="comment-date">%2$s</span>',
	            					get_comment_author_link(),
	            					get_comment_date()
	            				);
	                        	edit_comment_link(__('Edit', 'swiftframework'), '<span class="edit-link">', '</span><span class="meta-sep"> |</span>');
	                        ?>
	                        <?php if($args['type'] == 'all' || get_comment_type() == 'comment') :
	                        	comment_reply_link(array_merge($args, array(
	                            	'reply_text' => __('Reply','swiftframework'),
	                            	'login_text' => __('Log in to reply.','swiftframework'),
	                            	'depth' => $depth,
	                            	'before' => '<span class="comment-reply">',
	                            	'after' => '</span>'
	                        	)));
	                        endif; ?>
	    			</div>
	      			<?php if ($comment->comment_approved == '0') _e("\t\t\t\t\t<span class='unapproved'>Your comment is awaiting moderation.</span>\n", 'swiftframework') ?>
	            	<div class="comment-body">
	                	<?php comment_text() ?>
	            	</div>
	    		</div>
	        </div>
	<?php } // end custom_comments
	
	// Custom callback to list pings
	function custom_pings($comment, $args, $depth) {
	       $GLOBALS['comment'] = $comment;
	        ?>
	            <li id="comment-<?php comment_ID() ?>" <?php comment_class() ?>>
	                <div class="comment-author"><?php printf(__('By %1$s on %2$s at %3$s', 'swiftframework'),
	                        get_comment_author_link(),
	                        get_comment_date(),
	                        get_comment_time() );
	                        edit_comment_link(__('Edit', 'swiftframework'), ' <span class="meta-sep">|</span> <span class="edit-link">', '</span>'); ?></div>
	    <?php if ($comment->comment_approved == '0') _e('\t\t\t\t\t<span class="unapproved">Your trackback is awaiting moderation.</span>\n', 'swiftframework') ?>
	            <div class="comment-content">
	                <?php comment_text() ?>
	            </div>
	<?php } // end custom_pings
	
	
	
	/* PAGINATION
	================================================== */
	
	 
	/* Function that Rounds To The Nearest Value.
	   Needed for the pagenavi() function */
	function round_num($num, $to_nearest) {
	   /*Round fractions down (http://php.net/manual/en/function.floor.php)*/
	   return floor($num/$to_nearest)*$to_nearest;
	}
	 
	/* Function that performs a Boxed Style Numbered Pagination (also called Page Navigation).
	   Function is largely based on Version 2.4 of the WP-PageNavi plugin */
	function pagenavi($query, $before = '', $after = '') {
	    global $wpdb;
	    $pagenavi_options = array();
	    //$pagenavi_options['pages_text'] = ('Page %CURRENT_PAGE% of %TOTAL_PAGES%:');
	    $pagenavi_options['pages_text'] = ('');
	    $pagenavi_options['current_text'] = '%PAGE_NUMBER%';
	    $pagenavi_options['page_text'] = '%PAGE_NUMBER%';
	    $pagenavi_options['first_text'] = ('First Page');
	    $pagenavi_options['last_text'] = ('Last Page');
	    $pagenavi_options['next_text'] = __("Next", "swiftframework");
	    $pagenavi_options['prev_text'] = __("Previous", "swiftframework");
	    $pagenavi_options['dotright_text'] = '...';
	    $pagenavi_options['dotleft_text'] = '...';
	    $pagenavi_options['num_pages'] = 5; //continuous block of page numbers
	    $pagenavi_options['always_show'] = 0;
	    $pagenavi_options['num_larger_page_numbers'] = 0;
	    $pagenavi_options['larger_page_numbers_multiple'] = 5;
	 
	 	$output = "";
	 	
	    //If NOT a single Post is being displayed
	    /*http://codex.wordpress.org/Function_Reference/is_single)*/
	    if (!is_single()) {
	        $request = $query->request;
	        //intval — Get the integer value of a variable
	        /*http://php.net/manual/en/function.intval.php*/
	        $posts_per_page = intval(get_query_var('posts_per_page'));
	        //Retrieve variable in the WP_Query class.
	        /*http://codex.wordpress.org/Function_Reference/get_query_var*/
	        $paged = intval(get_query_var('paged'));
	        $numposts = $query->found_posts;
	        $max_page = $query->max_num_pages;
	 
	        //empty — Determine whether a variable is empty
	        /*http://php.net/manual/en/function.empty.php*/
	        if(empty($paged) || $paged == 0) {
	            $paged = 1;
	        }
	 
	        $pages_to_show = intval($pagenavi_options['num_pages']);
	        $larger_page_to_show = intval($pagenavi_options['num_larger_page_numbers']);
	        $larger_page_multiple = intval($pagenavi_options['larger_page_numbers_multiple']);
	        $pages_to_show_minus_1 = $pages_to_show - 1;
	        $half_page_start = floor($pages_to_show_minus_1/2);
	        //ceil — Round fractions up (http://us2.php.net/manual/en/function.ceil.php)
	        $half_page_end = ceil($pages_to_show_minus_1/2);
	        $start_page = $paged - $half_page_start;
	 
	        if($start_page <= 0) {
	            $start_page = 1;
	        }
	 
	        $end_page = $paged + $half_page_end;
	        if(($end_page - $start_page) != $pages_to_show_minus_1) {
	            $end_page = $start_page + $pages_to_show_minus_1;
	        }
	        if($end_page > $max_page) {
	            $start_page = $max_page - $pages_to_show_minus_1;
	            $end_page = $max_page;
	        }
	        if($start_page <= 0) {
	            $start_page = 1;
	        }
	 
	        $larger_per_page = $larger_page_to_show*$larger_page_multiple;
	        //round_num() custom function - Rounds To The Nearest Value.
	        $larger_start_page_start = (round_num($start_page, 10) + $larger_page_multiple) - $larger_per_page;
	        $larger_start_page_end = round_num($start_page, 10) + $larger_page_multiple;
	        $larger_end_page_start = round_num($end_page, 10) + $larger_page_multiple;
	        $larger_end_page_end = round_num($end_page, 10) + ($larger_per_page);
	 
	        if($larger_start_page_end - $larger_page_multiple == $start_page) {
	            $larger_start_page_start = $larger_start_page_start - $larger_page_multiple;
	            $larger_start_page_end = $larger_start_page_end - $larger_page_multiple;
	        }
	        if($larger_start_page_start <= 0) {
	            $larger_start_page_start = $larger_page_multiple;
	        }
	        if($larger_start_page_end > $max_page) {
	            $larger_start_page_end = $max_page;
	        }
	        if($larger_end_page_end > $max_page) {
	            $larger_end_page_end = $max_page;
	        }
	        if($max_page > 1 || intval($pagenavi_options['always_show']) == 1) {
	            /*http://php.net/manual/en/function.str-replace.php */
	            /*number_format_i18n(): Converts integer number to format based on locale (wp-includes/functions.php*/
	            $pages_text = str_replace("%CURRENT_PAGE%", number_format_i18n($paged), $pagenavi_options['pages_text']);
	            $pages_text = str_replace("%TOTAL_PAGES%", number_format_i18n($max_page), $pages_text);
	            $output .= $before.'<ul class="pagenavi">'."\n";
	 
	            if(!empty($pages_text)) {
	                $output .= '<li><span class="pages">'.$pages_text.'</span></li>';
	            }
	            //Displays a link to the previous post which exists in chronological order from the current post.
	            /*http://codex.wordpress.org/Function_Reference/previous_post_link*/
	            if ($paged > 1) {
	            $output .= '<li>' . get_previous_posts_link($pagenavi_options['prev_text']) . '</li>';
	 			}
	 			
	            if ($start_page >= 2 && $pages_to_show < $max_page) {
	                $first_page_text = str_replace("%TOTAL_PAGES%", number_format_i18n($max_page), $pagenavi_options['first_text']);
	                //esc_url(): Encodes < > & " ' (less than, greater than, ampersand, double quote, single quote).
	                /*http://codex.wordpress.org/Data_Validation*/
	                //get_pagenum_link():(wp-includes/link-template.php)-Retrieve get links for page numbers.
	                $output .= '<li><a href="'.esc_url(get_pagenum_link()).'" class="first" title="'.$first_page_text.'">1</a></li>';
	                if(!empty($pagenavi_options['dotleft_text'])) {
	                    $output .= '<li><span class="expand">'.$pagenavi_options['dotleft_text'].'</span></li>';
	                }
	            }
	 
	            if($larger_page_to_show > 0 && $larger_start_page_start > 0 && $larger_start_page_end <= $max_page) {
	                for($i = $larger_start_page_start; $i < $larger_start_page_end; $i+=$larger_page_multiple) {
	                    $page_text = str_replace("%PAGE_NUMBER%", number_format_i18n($i), $pagenavi_options['page_text']);
	                    $output .= '<li><a href="'.esc_url(get_pagenum_link($i)).'" class="single_page" title="'.$page_text.'">'.$page_text.'</a></li>';
	                }
	            }
	 
	            for($i = $start_page; $i  <= $end_page; $i++) {
	                if($i == $paged) {
	                    $current_page_text = str_replace("%PAGE_NUMBER%", number_format_i18n($i), $pagenavi_options['current_text']);
	                    $output .= '<li><span class="current">'.$current_page_text.'</span></li>';
	                } else {
	                    $page_text = str_replace("%PAGE_NUMBER%", number_format_i18n($i), $pagenavi_options['page_text']);
	                    $output .= '<li><a href="'.esc_url(get_pagenum_link($i)).'" class="single_page" title="'.$page_text.'">'.$page_text.'</a></li>';
	                }
	            }
	 
	            if ($end_page < $max_page) {
	                if(!empty($pagenavi_options['dotright_text'])) {
	                    $output .= '<li><span class="expand">'.$pagenavi_options['dotright_text'].'</span></li>';
	                }
	                $last_page_text = str_replace("%TOTAL_PAGES%", number_format_i18n($max_page), $pagenavi_options['last_text']);
	                $output .= '<li><a href="'.esc_url(get_pagenum_link($max_page)).'" class="last" title="'.$last_page_text.'">'.$max_page.'</a></li>';
	            }
	            $output .= '<li>' . get_next_posts_link($pagenavi_options['next_text'], $max_page) . '</li>';
	 
	            if($larger_page_to_show > 0 && $larger_end_page_start < $max_page) {
	                for($i = $larger_end_page_start; $i <= $larger_end_page_end; $i+=$larger_page_multiple) {
	                    $page_text = str_replace("%PAGE_NUMBER%", number_format_i18n($i), $pagenavi_options['page_text']);
	                    $output .= '<li><a href="'.esc_url(get_pagenum_link($i)).'" class="single_page" title="'.$page_text.'">'.$page_text.'</a></li>';
	                }
	            }
	            $output .= '</ul>'.$after."\n";
	        }
	    }
	    
	    return $output;
	}	
	
?>