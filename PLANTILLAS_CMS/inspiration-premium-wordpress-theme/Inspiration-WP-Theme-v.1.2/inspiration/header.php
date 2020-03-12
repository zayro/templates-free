<?php
/**
 * The Header for our theme.
 *
 * @package WordPress
 * @subpackage Inspiration
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta http-equiv="content-type" content="text/html;charset=<?php bloginfo( 'charset' ); ?>" />
<link rel="shortcut icon" href="<?php theme_favico(); ?>" />
<title><?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 */
	global $page, $paged;

	wp_title( '|', true, 'right' );

	// Add the blog name.
	bloginfo( 'name' );

	// Add the blog description for the home/front page.
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		echo " | $site_description";

	// Add a page number if necessary:
	if ( $paged >= 2 || $page >= 2 )
		echo ' | ' . sprintf( __( 'Page %s', TEMPLATENAME ), max( $paged, $page ) );

	?></title>
	
	<?php  if (ae_detect_ie()) {  ?>
	<style type="text/css">
		.succsess_box, .warning_box, .error_box, .info_box, .bigrounded, .btn, .button, .big.btn, .navigation a, .wp-pagenavi a, .wp-pagenavi span, .comments-navigation a, img.pic, img.avatar, p.dropcap-type3:first-letter, p.dropcap-type2:first-letter, .posted_content, .comment-reply-link, #bio, .partners li, .gallery li, .splitter li a, input[type=text], textarea, #searchform div, .tab-items, .tab-items li a:active, .tab-items li a:focus, .tab-items li.ui-tabs-selected a, .tab-items li.ui-tabs-selected a:hover, .tab-items li.ui-state-active a, .tab-items li.ui-state-active a:hover, .widget_flickr .flickr img, .twitter_box, .trigger, .acc_trigger, .acc_container
			{behavior: url(<?php echo get_bloginfo('template_url'); ?>/js/PIE.php);}
	</style>
	<?php }  ?>
	
	<?php
	if ((get_option('default_theme_color')) == 'dark'):
		wp_enqueue_style('css_main_dark');
	else:
		wp_enqueue_style('css_main_light');
	endif;
	?>
	<?php wp_enqueue_style('css_custom'); ?>

	<?php slider_enqueue(); ?>
	
	<?php //wp_enqueue_script('jquery'); ?>
	<?php wp_enqueue_script('js_watermarkinput'); ?>
	<?php wp_enqueue_script('js_ddsmoothmenu'); ?>
	<?php wp_enqueue_script('jquery-color'); ?>
	<?php wp_enqueue_script('jquery-ui-tabs'); ?>
	<?php wp_enqueue_script('js_tipsy'); ?>
	<?php wp_enqueue_script('js_localscrol'); ?>
	<?php wp_enqueue_script('js_autoAlign'); ?>
	<?php wp_enqueue_script('js_preloader'); ?>
	<?php wp_enqueue_script('js_uniform'); ?>
	<?php wp_enqueue_script('js_common'); ?>
<?php
	if (is_portfolio() || is_tax('gallery')) {
		wp_enqueue_style('css_pretty');
		//wp_enqueue_script('js_pretty');
		wp_enqueue_script('js_roundabout');
		wp_enqueue_script('js_round_shapes');
		wp_enqueue_script('js_easing');
		wp_enqueue_script('js_jplayer');
	}
 ?>
<?php
	if (is_tax('gallery')) {
		wp_enqueue_script('js_quicksand');
		wp_enqueue_script('js_easing');
	}
 ?>

<?php
	/* We add some JavaScript to pages with the comment form
	 * to support sites with threaded comments (when in use).
	 */
	if ( is_singular() && get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );

	/* Always have wp_head() just before the closing </head>
	 * tag of your theme, or you will break many plugins, which
	 * generally use this hook to add elements to <head> such
	 * as styles, scripts, and meta tags.
	 */
	wp_head();
?>

 <script type="text/javascript">
 	if (jQuery('a[rel^="prettyPhoto"]')) {
		<?php wp_enqueue_script('js_pretty'); ?>
	}
 </script>

	<?php slider_init(); ?>

	<?php if (get_option('ga_use')) echo get_option('ga_code'); ?>
</head>
<body <?php body_class(); ?> <?php if (!is_front_page() || (is_front_page() && get_option('slider_type') == 'disable')): ?> id="sp"<?php else: ?> id="main"<?php endif; ?> >
<!-- Start Main Nav -->
<div class="mainnav_full">
	<div id="MainNav">
		<a href="<?php echo home_url('/'); ?>" class="logo"><img src="<?php theme_logo(); ?>" alt="<?php bloginfo( 'name' ); ?>" /></a>
		<div id="menu">
			<?php if ( has_nav_menu( 'primary' ) ) { ?>
				<script type="text/javascript">
					ddsmoothmenu.init({
						mainmenuid: 'menu', //menu DIV id
						orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
						classname: 'ddsmoothmenu', //class added to menu's outer DIV
						//customtheme: ["#1c5a80", "#18374a"],
						contentsource: 'markup' //"markup" or ["container_id", "path_to_menu_file"]
					})
				</script>
				<?php wp_nav_menu(
					array(
						'container'		=> false,
						'menu_class'	=> 'ddsmoothmenu',
						'theme_location'=> 'primary',
						'items_wrap'	=> '<ul class="ddsmoothmenu">%3$s</ul>',
						'before'		=> '<span class="menuslide"></span>',
						'walker'		=> new Description_Walker
					)
				); ?>
			<?php } else { ?>
				<script type="text/javascript">
					ddsmoothmenu.init()
				</script>
				<?php wp_page_menu(
					array(
						'sort_column' => 'menu_order',
						'menu_class'  => 'ddsmoothmenu',
						'menu_id'     => 'menu',
						'include'     => '',
						'exclude'     => '',
						'echo'        => true,
						'show_home'   => 'Blog',
						'link_before' => '',
						'link_after'  => ''
					)
				); 
			} ?>
		</div>
		<div class="clear"></div>
	</div>
</div>
<!-- End Main Nav -->

<!-- Begin Header -->
<div class="header_full <?php if (get_option('default_header_pattern') != '0'): echo get_option('default_header_pattern'); else: echo ''; endif; ?>">
	<div class="head_top_shadow"></div>
	<div class="head_bot_shadow"></div>
	<div id="header">
	<?php if (!is_front_page() || (is_front_page() && get_option('slider_type') == 'disable')): ?>
	
	<?php else: ?>
	<?php theme_slider_render(); ?>
	<?php endif; ?>
	</div>
</div>	
<!-- End Header -->
<?php if (!is_front_page() || (is_front_page() && get_option('slider_type') == 'disable')): ?>

	<?php else: ?>

		<?php if (get_option('use_feature_home_box')): ?>
		<!-- Start Featured Top Line -->
		<div id="featured_top_line">
			<?php if (get_option('use_feature_home_box')) echo do_shortcode(get_option('feature_home_box')); ?>
			<div class="clear"></div>
		</div>
		<!-- End Featured Top Line -->
		<?php endif; ?>

<?php endif; ?>