<!DOCTYPE html>

<html <?php language_attributes(); ?> class="no-js">

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta charset="<?php bloginfo( 'charset' ); ?>" />



	<?php 
		global $data; 
		$favicon = ''; $favicon = $data['favicon'];
		if (empty($favicon)) { $favicon = get_template_directory_uri() .'/images/favicon.ico'; }	
	?>

	<title>
	<?php

		global $page, $paged;

		wp_title( '|', true, 'right' );

		bloginfo( 'name' );

		$site_description = get_bloginfo( 'description', 'display' );
		if ( $site_description && ( is_home() || is_front_page() ) )
			echo " | $site_description";

		if ( $paged >= 2 || $page >= 2 )
			echo ' | ' . sprintf( 'Page %s' , max( $paged, $page ) );

	?>
	</title>
		
		<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

		<link rel="icon" type="image/png" href="<?php echo $data['favicon'] ?>">


		<link rel="alternate" type="application/atom+xml" title="<?php bloginfo('name'); ?> Atom Feed" href="<?php bloginfo('atom_url'); ?>" />

		
	<?php if ( is_singular() && get_option( 'thread_comments' ) ) wp_enqueue_script( 'comment-reply' ); ?>

	<?php wp_head(); ?>


	<?php echo  stripText($data['google_analytics']); ?>




	<link rel="root" id="root" type="text/css" href="<?php echo get_template_directory_uri() ?>" >
	<link rel='stylesheet' id="stylesheet" type="text/css" href="" rel="stylesheet" /> 

</head>		
<body <?php body_class(); ?>>


	<header>
		<div id="headerwrap" >

			<div id="header">	
			<div class="notification">
				<div class="notificationwrap">
					<div class = "menuSearchField">
						<form method="get" id="searchform" action="<?php home_url();?>/">
							<div><input type="text" size="18" value="<?php echo $data['translation_header_search']?>" onFocus="this.value=''" onblur="this.value='<?php echo $data['translation_header_search']?>'" name="s" id="s" />
								<input type="submit" id="searchsubmit" value="Search" class="btn" />
							</div>
						</form>
					</div>
					<div class="socialcategory"><?php socialLink() ?></div>
				</div>
			</div>
			
				<div class="closewrap">
					<div id="close" class="open"></div>
				</div>				
						<div id="logo">
						
						<?php $logo = $data['logo']; ?>
						
							<a href="<?php echo home_url(); ?>"><img src="<?php if ($logo != '') {?><?php echo $logo; ?><?php } else {?><?php get_template_directory_uri(); ?>/images/logo.png<?php }?>" alt="<?php bloginfo('name'); ?> - <?php bloginfo('description') ?>" /></a>
							<?php if($data['showtagline']){ ?><div class="logotag"><?php echo get_bloginfo ( 'description' ); ?></div><?php } ?>
						</div>
						
			
				<div class="pagenav">
				
						<?php wp_nav_menu( array( 'container_class' => 'menu-header', 'theme_location' => 'main-menu', 'walker' => new description_walker() ) ); ?>

				</div>	

			</div>
		</div>
					
	</header>			
		

