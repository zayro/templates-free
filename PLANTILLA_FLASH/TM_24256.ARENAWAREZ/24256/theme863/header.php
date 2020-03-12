<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="alternate" type="application/atom+xml" title="<?php bloginfo('name'); ?> Atom Feed" href="<?php bloginfo('atom_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />


<?php if ( is_singular() ) wp_enqueue_script( 'comment-reply' ); ?>

<?php //comments_popup_script(600, 600); ?>

<?php wp_head(); ?>

<!--[if IE]>
	<script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/ie_png.js"></script>
	<script type="text/javascript">
		ie_png.fix('.png');
	</script>
<![endif]-->

</head>

<body>
    <div class="main-bg">
    	<div class="main">
            <!--header-->
            <div id="header">
				<div class="search">
					<?php get_search_form(); ?>
				</div>
            	<div class="logo">
                    <h1 onclick="location.href='<?php echo get_option('home'); ?>/'"><?php bloginfo('name'); ?></h1>
                </div>
				<div class="description"><?php bloginfo('description'); ?></div>
                
            	<?php 
					wp_page_menu('show_home=0&sort_column=menu_order, post_title&link_before=<span><span>&link_after=</span></span>');
				?>
				
            </div>
            <!--header end-->
            <!--content -->
            <div class="content">
				<div class="box png">
					<div class="bottom-bg png">
					<div class="box-bg png">
						<div class="indent">
							<div class="container">