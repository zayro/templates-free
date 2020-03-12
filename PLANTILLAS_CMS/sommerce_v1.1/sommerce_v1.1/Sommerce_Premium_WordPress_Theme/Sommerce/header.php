<?php
/**
 * The Header for our theme.
 *
 * @package WordPress
 * @subpackage YIW Themes
 * @since 1.0
 */
?><!DOCTYPE html>
<!--[if IE 6]>
<html id="ie6" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 7]>
<html id="ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html id="ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 9]>
<html id="ie9" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 6) | !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<meta name="viewport" content="width=device-width" />
<title><?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 */
	global $page, $paged;

	wp_title( '|', true, 'right' );

	// Add the blog name.
	bloginfo( 'name' );
	
	// Add description, if is home
	if ( is_home() || is_front_page() )
		echo ' | ' . get_bloginfo( 'description' );

	// Add a page number if necessary:
	if ( $paged >= 2 || $page >= 2 )
		echo ' | ' . sprintf( __( 'Page %s', 'yiw' ), max( $paged, $page ) );

	?></title>
	
	<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
    
    <?php
		// styles
        wp_enqueue_style( 'prettyPhoto' );  
		wp_enqueue_style( 'Droid-google-font',  'http://fonts.googleapis.com/css?family=Droid+Sans' );      
        wp_enqueue_style( 'jquery-tipsy' );  
                                             
		// scripts    
        wp_enqueue_script( 'jquery-prettyPhoto' );
        wp_enqueue_script( 'jquery-tipsy' );  
        wp_enqueue_script( 'jquery-tweetable' );           
    	wp_enqueue_script( 'jquery-nivo' );       
	    wp_enqueue_script( 'jquery-cycle' ); 
        
        // slider libraries
		if ( is_home() || is_front_page() || is_page_template('home.php') ) :
		
            $slider_type = yiw_get_option( 'slider_type' );
            
		    wp_enqueue_style( 'slider-' . $slider_type,        get_template_directory_uri()."/css/slider-". $slider_type .".css" );
			
			// elegant
			if ( $slider_type == 'elegant' ) :      
	    		wp_enqueue_script( 'jquery-cycle' ); 
        		wp_enqueue_script( 'jquery-easing' );  
	    
		    // flash
		    elseif ( $slider_type == 'flash' ) :
		        wp_enqueue_script( 'swfobject' );
	    
		    // thumbnails
		    elseif ( $slider_type == 'thumbnails' ) :
		        wp_enqueue_script( 'jquery-aw-showcases', get_template_directory_uri()."/js/jquery.aw-showcase.js" );
	    
		    // cycle
		    elseif ( $slider_type == 'cycle' ) :
		        wp_enqueue_script( 'jquery-cycle' );   
		        wp_enqueue_script( 'swfobject' );
	    
		    // nivo
		    elseif ( $slider_type == 'nivo' ) :
		        wp_enqueue_script( 'jquery-nivo' );
	    
		    // rotating
		    elseif ( $slider_type == 'rotating' ) :                                                                                
        		wp_enqueue_style( 'jquery-rotating',   	get_template_directory_uri()."/css/jquery-rotating.css" );  
		        wp_enqueue_script( 'jquery-rotating',	get_template_directory_uri()."/js/jquery.RotateImageMenu.js", array('jquery'), '1.0', true );
		        //wp_enqueue_script( 'jquery-transform',	get_template_directory_uri()."/js/jquery.transform-0.9.3.min.js", array('jquery') ); 
		    endif;
		
		endif;
		 
        // custom
        wp_enqueue_script( 'jquery-custom',      get_template_directory_uri()."/js/jquery.custom.js", array('jquery'), '1.0', true); 
		                   
		/* We add some JavaScript to pages with the comment form
		 * to support sites with threaded comments (when in use).
		 */
		if ( is_singular() && get_option( 'thread_comments' ) )
			wp_enqueue_script( 'comment-reply' );                                                        
    ?>         

    <!-- [favicon] begin -->
    <link rel="shortcut icon" type="image/x-icon" href="<?php yiw_favicon(); ?>" />
    <link rel="icon" type="image/x-icon" href="<?php yiw_favicon(); ?>" />
    <!-- [favicon] end -->  
    
    <?php wp_head() ?>
</head>

<body <?php body_class( "no_js" ) ?>>   
                             
	<!-- START LIGHT WRAPPER -->
	<div class="bgLight group"> 
                             
		<!-- START WRAPPER -->
		<div class="wrapper group">    
	                             
			<!-- START BG WRAPPER -->
			<div class="bgWrapper group">          
		    
			    <!-- START HEADER -->
			    <div id="header" class="group">  
				
					<!-- .inner -->
					<div class="inner group">          
			        
				        <!-- START LOGO -->
				        <div id="logo" class="group">
				            
				            <a href="<?php echo home_url() ?>" title="<?php bloginfo('name') ?>"> 
				                <?php if ( yiw_get_option( 'show_image_logo' ) ) : ?>
				                <img src="<?php yiw_logo() ?>" alt="Logo <?php bloginfo('name') ?>" /> 
				                <?php else : ?>
				                <span class="logo-title"><?php bloginfo( 'name' ) ?></span>
				                <?php endif; ?>
				            </a>         
							
							<?php if ( yiw_get_option( 'show_description_logo' ) ) : ?>
							<p class="logo-description"><?php bloginfo( 'description' ) ?></p>
                            <?php endif; ?>     
				        
				        </div>
				        <!-- END LOGO -->        
			        
				        <!-- START LINKSBAR -->
				        <?php get_template_part( 'linksbar' ); ?>
				        <!-- END LINKSBAR -->  
				        
				        <div class="clear"></div>
				    
				        <!-- START NAV -->
				        <div id="nav" class="group <?php echo yiw_get_option( 'nav_type' ) ?>"<?php if( yiw_get_option( 'show_searchform' ) ) : ?> style="width:720px;"<?php endif; ?>>
				            <?php  
								$nav_args = array(       
				                    'theme_location' => 'nav',
				                    'container' => 'none',
				                    'menu_class' => 'level-1',
				                    'depth' => 3,   
				                    //'fallback_fb' => false,
				                    //'walker' => new description_walker()
				                );
				                
				                wp_nav_menu( $nav_args ); 
				            ?>    
				        </div>
				        <!-- END NAV -->
						
						<?php if( yiw_get_option( 'show_searchform' ) ) : ?>
						<!-- START SEARCH FORM -->  
						<?php 
							$submit_label = create_function( '', 'return "&gt;";' );
							$label = create_function( '', 'return "' . __( 'search on the shop', 'yiw' ) . '";' );
							add_filter( 'yiw_searchform_submitlabel', $submit_label );
							add_filter( 'yiw_searchform_label', $label );
							get_template_part( 'searchform' );             
							remove_filter( 'yiw_searchform_submitlabel', $submit_label );
							remove_filter( 'yiw_searchform_label', $label );
						?>
						<!-- END SEARCH FORM -->
						<?php endif; ?>
					
					</div>
					<!-- end .inner -->   
			    
			    </div>   
			    <!-- END HEADER -->    
		        
				<?php get_template_part( 'slider' ); ?> 
			    
			    <!-- START PRIMARY SECTION -->
			    <div id="primary" class="inner group">    
		        
				    <?php get_template_part( 'slogan' ); ?> 