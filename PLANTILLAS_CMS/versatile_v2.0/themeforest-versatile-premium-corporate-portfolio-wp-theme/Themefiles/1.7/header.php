<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<title><?php if (is_front_page() ) {
    bloginfo('name');
	} elseif ( is_category() ) {
		single_cat_title(); echo ' - ' ; bloginfo('name');
	} elseif (is_single() ) {
		single_post_title();
	} elseif (is_page() ) {
		single_post_title(); echo ' - '; bloginfo('name');
	} else {
		wp_title('',true);
	} ?>
</title>
<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" />
<meta name="description" content="<?php bloginfo('description'); ?>" />
<?php require_once(sys_includes."/var.php"); ?>

<?php if(is_front_page()) { ?>
	<meta name="slider_url" content="<?php bloginfo('template_directory'); ?>">
	<meta name="slider_type" content="<?php echo get_option("sys_choose_slider"); ?>">
	<meta name="nivo_slider_effect" content="<?php echo get_option('nivoslidereffect'); ?>">
<?php  } ?>
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
<?php if($favicon) { ?>
<link rel="shortcut icon" href="<?php echo $favicon; ?>" type="image/x-icon" /> 
<?php } ?>

<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('template_url'); ?>/css/ie.css" />
<![endif]-->
	
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!--[if IE 6]>
<script src="<?php bloginfo('template_url'); ?>/DD_belatedPNG.js" type="text/javascript"></script>
<script>
  /* EXAMPLE */
  DD_belatedPNG.fix('*');
  /* string argument can be any CSS selector */
  /* .png_bg example is unnecessary */
  /* change it to what suits you! */
</script>
<![endif]--> 
<?php if ( is_singular() ) wp_enqueue_script( 'comment-reply' ); ?>
<?php wp_head(); ?>
<?php $colorlayoutoptions = $_GET['colorlayout']; 
if($colorlayoutoptions) {
?>

<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('template_directory'); ?>/css/<?php echo $colorlayoutoptions;?>.css" />
<?php } ?>
</head>
<?php $layoutoptions = $_GET['layout']; ?>
<body id="<?php if ($layoutoptions){ echo $layoutoptions;} else { echo get_option('layoutoption'); }?>">
<!-- #wrap-all -->
<div id="wrap-all">
	<header id="header">
		<div id="topbar">
			<div class="inner">
	
			<!-- logo -->
			<div class="logo">
			<?php if($s_logo){ ?>
			<a href="<?php echo get_option('home'); ?>" title="<?php bloginfo('name'); ?>">
			<img src="<?php echo $s_logo; ?>" alt="<?php bloginfo('name'); ?>" />
			</a>
			<?php } else { ?>
			<a href="<?php echo get_option('home'); ?>" title="<?php bloginfo('name'); ?>">
			<?php bloginfo('name'); ?>
			<span class="blogdesc"><?php bloginfo('description'); ?></span>	
			</a>
			<?php } ?>
			</div>
			<!-- logo -->

            <div class="topmenu">
        	<?php if (has_nav_menu( 'top-menu' ) ) { wp_menu_functon(); }
			else{?>
			<ul class="nav">
                <li><a href="<?php echo get_option('home'); ?>" title="<?php
bloginfo('name'); ?>">Home<span>Frontpage</span></a></li>
                <?php
wp_list_pages('title_li=');
echo "</ul>";
}        
?>
            </div>
            <!-- topmenu -->
	
			</div><!-- inner -->
	</div><!-- topbar -->
	<div class="clear"></div>
