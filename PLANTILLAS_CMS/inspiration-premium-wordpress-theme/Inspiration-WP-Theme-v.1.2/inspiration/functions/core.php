<?php
if (!defined('TEMPLATENAME')) {
	define('TEMPLATENAME', get_option('template'));
}

 /** Tell WordPress to run theme_custom_setup() when the 'after_setup_theme' hook is run. */
add_action('after_setup_theme', 'theme_custom_setup');

if (!function_exists('theme_custom_setup')) {
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 *
 * @uses add_theme_support() To add support for post thumbnails and automatic feed links.
 * @uses register_nav_menus() To add support for navigation menus.
 * @uses add_custom_background() To add support for a custom background.
 * @uses add_editor_style() To style the visual editor.
 * @uses load_theme_textdomain() For translation/localization support.
 * @uses add_custom_image_header() To add support for a custom header.
 * @uses register_default_headers() To register the default custom header images provided with the theme.
 * @uses set_post_thumbnail_size() To set a custom post thumbnail size.
 *
 */
	function theme_custom_setup() {

		// This theme styles the visual editor with editor-style.css to match the theme style.
//		add_editor_style();

		// This theme uses post thumbnails
		add_theme_support('post-thumbnails');

		// Add default posts and comments RSS feed links to head
		add_theme_support( 'automatic-feed-links' );

		// This theme allows users to set a custom background
		add_custom_background();

		// Make theme available for translation
		// Translations can be filed in the /languages/ directory
		load_theme_textdomain(TEMPLATENAME, TEMPLATEPATH . '/languages');

		// This theme uses wp_nav_menu() in one location.
		register_nav_menus(
			array(
				'primary' => __('Primary Navigation', TEMPLATENAME),
			)
		);

	}
}

// styles & scripts
if ( !is_admin() ) {
	function init_styles_and_scripts() {
		wp_register_style('css_main_dark', get_bloginfo('template_directory') . '/stylesheets/dark/styles.css');
		wp_register_style('css_main_light', get_bloginfo('template_directory') . '/stylesheets/light/styles.css');
		wp_register_style('css_custom', get_bloginfo('template_directory') . '/stylesheets/custom.php');
		wp_register_style('css_ddsmoothmenu', get_bloginfo('template_directory') . '/stylesheets/ddsmoothmenu.css');
		wp_register_style('css_tipsy', get_bloginfo('template_directory') . '/stylesheets/tipsy.css');
		wp_register_style('css_pretty', get_bloginfo('template_directory') . '/stylesheets/prettyPhoto.css');

		wp_register_script('js_tweet', get_bloginfo('template_directory') . '/js/jquery.tweet.js', array('jquery'));
		wp_register_script('js_watermarkinput', get_bloginfo('template_directory') . '/js/jquery.watermarkinput.js', array('jquery'));
		wp_register_script('js_ddsmoothmenu', get_bloginfo('template_directory') . '/js/ddsmoothmenu.js', array('jquery'));
		wp_register_script('js_tipsy', get_bloginfo('template_directory') . '/js/jquery.tipsy.js', array('jquery'));
		wp_register_script('js_pretty', get_bloginfo('template_directory') . '/js/jquery.prettyPhoto.js', array('jquery'));
		wp_register_script('js_autoAlign', get_bloginfo('template_directory') . '/js/jquery.flexibleColumns.min.js', array('jquery'));
		wp_register_script('js_quicksand', get_bloginfo('template_directory') . '/js/jquery.quicksand.js', array('jquery'));
		wp_register_script('js_easing', get_bloginfo('template_directory') . '/js/jquery.easing.1.3.js', array('jquery'));
		wp_register_script('js_scrolTo', get_bloginfo('template_directory') . '/js/jquery.scrollTo-min.js', array('jquery'));
		wp_register_script('js_localscrol', get_bloginfo('template_directory') . '/js/jquery.localscroll-min.js', array('js_scrolTo'));
		wp_register_script('js_flashobject', get_bloginfo('template_directory') . '/js/flashobject.js', array('jquery'));
		wp_register_script('js_roundabout', get_bloginfo('template_directory') . '/js/jquery.roundabout.js', array('jquery'));
		wp_register_script('js_round_shapes', get_bloginfo('template_directory') . '/js/jquery.roundabout-shapes.min.js', array('jquery'));
		wp_register_script('js_jplayer', get_bloginfo('template_directory') . '/js/jquery.jplayer.min.js', array('jquery'));
		wp_register_script('js_uniform', get_bloginfo('template_directory') . '/js/jquery.uniform.min.js', array('jquery'));
		wp_register_script('js_common', get_bloginfo('template_directory') . '/js/common.js', array('jquery'), '1.0.0');
	}
	add_action('init', 'init_styles_and_scripts');
} else {
	function init_admin_styles_and_scripts() {
		wp_register_style( 'css_admin_options', get_bloginfo('template_directory') . '/functions/admin_options/stylesheets/admin_options.css');
		wp_register_script( 'jquery-cooke', get_bloginfo('template_directory') . '/functions/admin_options/js/jquery.cookie.js');
		wp_register_script( 'admin_common', get_bloginfo('template_directory') . '/functions/admin_options/js/common.js');
		wp_enqueue_style('css_admin_options');
		wp_enqueue_script('jquery-cooke');
		wp_enqueue_script('jquery-ui-tabs');
		add_thickbox();
		wp_enqueue_script('admin_common');
//		remove_meta_box('postcustom', 'post', 'normal');
//		remove_meta_box('postcustom', 'page', 'normal');
	}
	add_action('admin_init', 'init_admin_styles_and_scripts');
}

/**
 * add a default-gravatar to options
 */
function theme_addgravatar( $avatar_defaults ) {
	$myavatar = get_bloginfo('template_directory') . '/images/avatar.gif';
	$avatar_defaults[$myavatar] = 'people';
	return $avatar_defaults;
}
add_filter( 'avatar_defaults', 'theme_addgravatar' );

function theme_post_limit($limit) {
		if ( is_admin() ) return $limit;
		$old_limit = $limit;
		if ( is_home() ) {
			$limit = get_option('front_page_limit');
		} elseif ( is_search() ) {
			$limit = get_option('searches_limit');
		} elseif ( is_category() ) {
			$limit = get_option('categories_limit');
		} elseif ( is_tag() ) {
			$limit = get_option('tags_limit');
		} elseif ( is_author() ) {
			$limit = get_option('authors_limit');
		} elseif ( is_year() ) {
			$limit = get_option('year_archives_limit') ? get_option('year_archives_limit') : get_option('archives_limit');
		} elseif ( is_month() ) {
			$limit = get_option('month_archives_limit') ? get_option('month_archives_limit') : get_option('archives_limit');
		} elseif ( is_day() ) {
			$limit = get_option('day_archives_limit') ? get_option('day_archives_limit') : get_option('archives_limit');
		} elseif ( is_archive() ) {
			$limit = get_option('archives_limit');
		}

		if ( !$limit )
			$limit = $old_limit;
		elseif ( $limit == '-1' )
			$limit = '18446744073709551615';
		return $limit;
}
add_action('option_posts_per_page', 'theme_post_limit');

/**
 * Replaces "[...]" (appended to automatically generated excerpts) with an ellipsis and twentyten_continue_reading_link().
 *
 * To override this in a child theme, remove the filter and add your own
 * function tied to the excerpt_more filter hook.
 *
 * @return string An ellipsis
 */
function theme_auto_excerpt_more( $more ) {
		  return ' &hellip;';
}
add_filter( 'excerpt_more', 'theme_auto_excerpt_more' );

require_once (TEMPLATEPATH . '/functions/metaboxes/metaboxes_generator.php');

function theme_favico() {
	$ico = get_option('favicon');
	if (empty($ico))
		$ico = get_bloginfo('template_url').'/images/favicon.ico';
	echo $ico;
}

function theme_logo() {
	$logo = get_option('logo');
	if (empty($logo))
		$logo = get_bloginfo('template_url').'/images/logo.png';
	echo $logo;
}

function theme_check_custom_background() {
	$background = get_background_image();
	$color = get_background_color();
   return (!$background && !$color) ? true : false;
}

/**
 * Create HTML list of nav menu items.
 * Replacement for the native Walker, using the description.
 *
 * @see    http://wordpress.stackexchange.com/q/14037/
 * @author toscho, http://toscho.de
 */
class Description_Walker extends Walker_Nav_Menu
{
    /**
     * Start the element output.
     *
     * @param  string $output Passed by reference. Used to append additional content.
     * @param  object $item   Menu item data object.
     * @param  int $depth     Depth of menu item. May be used for padding.
     * @param  array $args    Additional strings.
     * @return void
     */
    function start_el(&$output, $item, $depth, $args)
    {
        $classes     = empty ( $item->classes ) ? array () : (array) $item->classes;

        $class_names = join(
            ' '
        ,   apply_filters(
                'nav_menu_css_class'
            ,   array_filter( $classes ), $item
            )
        );

        ! empty ( $class_names )
            and $class_names = ' class="'. esc_attr( $class_names ) . '"';

        $output .= "<li id='menu-item-$item->ID' $class_names>";

        $attributes  = '';

        ! empty( $item->attr_title )
            and $attributes .= ' title="'  . esc_attr( $item->attr_title ) .'"';
        ! empty( $item->target )
            and $attributes .= ' target="' . esc_attr( $item->target     ) .'"';
        ! empty( $item->xfn )
            and $attributes .= ' rel="'    . esc_attr( $item->xfn        ) .'"';
        ! empty( $item->url )
            and $attributes .= ' href="'   . esc_attr( $item->url        ) .'"';

        // insert description for top level elements only
        // you may change this
        $description = ( ! empty ( $item->description ) and 0 == $depth )
            ? '<span class="menu_description">' . esc_attr( $item->description ) . '</span>' : '';

        $title = apply_filters( 'the_title', $item->title, $item->ID );

        $item_output = $args->before
            . "<a $attributes>"
            . $args->link_before
            . $title
            . $description
            . '</a> '
            . $args->link_after
            . $args->after;

        // Since $output is called by reference we don't need to return anything.
        $output .= apply_filters(
            'walker_nav_menu_start_el'
        ,   $item_output
        ,   $item
        ,   $depth
        ,   $args
        );
    }
}

//	IE browser detection
function ae_detect_ie()
{
    if (isset($_SERVER['HTTP_USER_AGENT']) && 
    (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false))
        return true;
    else
        return false;
}

//	Audio JS

function audio($postid) {
	
	$mp3 = get_post_meta($postid, 'audio_mp3', TRUE);
	$ogg = get_post_meta($postid, 'audio_ogg', TRUE);
	
	 ?>
		<script type="text/javascript">
		
			jQuery(document).ready(function(){
	
				if(jQuery().jPlayer) {
					jQuery("#jquery_jplayer_<?php echo $postid; ?>").jPlayer({
						ready: function () {
							jQuery(this).jPlayer("setMedia", {
								<?php if($mp3 != '') : ?>
								mp3: "<?php echo $mp3; ?>",
								<?php endif; ?>
								<?php if($ogg != '') : ?>
								oga: "<?php echo $ogg; ?>",
								<?php endif; ?>
								end: ""
							});
						},
						swfPath: "<?php echo get_template_directory_uri(); ?>/js",
						cssSelectorAncestor: "#jp_interface_<?php echo $postid; ?>",
						supplied: "<?php if($ogg != '') : ?>oga,<?php endif; ?><?php if($mp3 != '') : ?>mp3, <?php endif; ?> all"
					});
					
				}
			});
		</script>
	<?php 
}


//	Video JS

function video($postid) {
	
	$m4v = get_post_meta($postid, 'video_m4v', TRUE);
	$ogv = get_post_meta($postid, 'video_ogv', TRUE);
	$poster = wp_get_attachment_image_src( get_post_thumbnail_id($post->ID), 'portfolio_poster', false, '' );
	
	 ?>
		<script type="text/javascript">
			jQuery(document).ready(function(){
				
				if(jQuery().jPlayer) {
					jQuery("#jquery_jplayer_<?php echo $postid; ?>").jPlayer({
						ready: function () {
							jQuery(this).jPlayer("setMedia", {
								<?php if($m4v != '') : ?>
								m4v: "<?php echo $m4v; ?>",
								<?php endif; ?>
								<?php if($ogv != '') : ?>
								ogv: "<?php echo $ogv; ?>",
								<?php endif; ?>
								<?php if ($poster != '') : ?>
								poster: "<?php echo $poster[0]; ?>"
								<?php endif; ?>
							});
						},
						swfPath: "<?php echo get_template_directory_uri(); ?>/js",
						cssSelectorAncestor: "#jp_interface_<?php echo $postid; ?>",
						supplied: "<?php if($m4v != '') : ?>m4v, <?php endif; ?><?php if($ogv != '') : ?>ogv, <?php endif; ?> all"
					});
					
				}
			});
		</script>
	<?php 
}


?>