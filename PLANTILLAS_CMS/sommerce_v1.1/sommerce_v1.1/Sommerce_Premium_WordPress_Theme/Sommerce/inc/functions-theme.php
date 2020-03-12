<?php
/**
 * The functions of theme 
 * 
 * @package WordPress
 * @subpackage YIW Themes
 * @since 1.0 
 */      
 
// default theme setup
function yiw_theme_setup() {

	// This theme styles the visual editor with editor-style.css to match the theme style.
	add_editor_style( 'css/editor-style.css' );

	// This theme uses post thumbnails
	add_theme_support( 'post-thumbnails' );  

	// This theme uses the menues
	add_theme_support( 'menus' );          

	// Add default posts and comments RSS feed links to head
	add_theme_support( 'automatic-feed-links' );
	
	// Post Format support.                      
	//add_theme_support( 'post-formats', array( 'aside', 'gallery' ) ); // Your changeable header business starts here
	if ( ! defined( 'HEADER_TEXTCOLOR' ) )
		define( 'HEADER_TEXTCOLOR', '' );

	// No CSS, just IMG call. The %s is a placeholder for the theme template directory URI.
	if ( ! defined( 'HEADER_IMAGE' ) )
		define( 'HEADER_IMAGE', '%s/images/slider/001.jpg' );

	// The height and width of your custom header. You can hook into the theme's own filters to change these values.
	// Add a filter to twentyten_header_image_width and twentyten_header_image_height to change these values.
	define( 'HEADER_IMAGE_WIDTH', apply_filters( 'yiw_header_image_width', 960 ) );
	define( 'HEADER_IMAGE_HEIGHT', apply_filters( 'yiw_header_image_height', 338 ) );

	// We'll be using post thumbnails for custom header images on posts and pages.
	// We want them to be 940 pixels wide by 198 pixels tall.
	// Larger images will be auto-cropped to fit, smaller ones will be ignored. See header.php.
	//set_post_thumbnail_size( HEADER_IMAGE_WIDTH, HEADER_IMAGE_HEIGHT, true );

	// Don't support text inside the header image.
	if ( ! defined( 'NO_HEADER_TEXT' ) )
		define( 'NO_HEADER_TEXT', true );

	// Add a way for the custom header to be styled in the admin panel that controls
	// custom headers. See twentyten_admin_header_style(), below.
	add_custom_image_header( '', 'yiw_admin_header_style' );

	// ... and thus ends the changeable header business.

	// Default custom headers packaged with the theme. %s is a placeholder for the theme template directory URI.
	register_default_headers( array(
		'design1' => array(
			'url' => '%s/images/slider/001.jpg',
			'thumbnail_url' => '%s/images/slider/thumb/001.jpg',
			/* translators: header image description */
			'description' => __( 'Design', 'yiw' ) . ' 1'
		),
		'design2' => array(
			'url' => '%s/images/slider/002.jpg',
			'thumbnail_url' => '%s/images/slider/thumb/002.jpg',
			/* translators: header image description */
			'description' => __( 'Design', 'yiw' ) . ' 2'
		),
		'design3' => array(
			'url' => '%s/images/slider/003.jpg',
			'thumbnail_url' => '%s/images/slider/thumb/003.jpg',
			/* translators: header image description */
			'description' => __( 'Design', 'yiw' ) . ' 3'
		),
		'design4' => array(
			'url' => '%s/images/slider/004.jpg',
			'thumbnail_url' => '%s/images/slider/thumb/004.jpg',
			/* translators: header image description */
			'description' => __( 'Design', 'yiw' ) . ' 4'
		),
		'design5' => array(
			'url' => '%s/images/slider/005.jpg',
			'thumbnail_url' => '%s/images/slider/thumb/005.jpg',
			/* translators: header image description */
			'description' => __( 'Design', 'yiw' ) . ' 5'
		),
	) );

	$locale = get_locale();      
	$locale_file = TEMPLATEPATH . "/languages/$locale.php";
	if ( is_readable( $locale_file ) )
		require_once( $locale_file ); 
    
	// This theme uses wp_nav_menu() in more locations.
	register_nav_menus(
        array(
            'nav'           => __( 'Navigation' ),
            'linksbar'      => __( 'Links Bar' )
        )
    );
    
    // images size
    add_image_size( 'shop_large_image', yiw_shop_large_w(), yiw_shop_large_h(), 'true' );  
    add_image_size( 'blog_big'      , 640, 295, true );
    add_image_size( 'blog_small'    , 295, 295, true );
    add_image_size( 'thumb_recentposts'     , 55, 55, true );
    add_image_size( 'thumb_testimonial'     , 78, 78, true );      
    add_image_size( 'thumb_testimonial'     , 147, 147, true ); 
    
    // sidebars registers                                                                                  
	register_sidebar( yiw_sidebar_args( 'Blog Sidebar', __( 'The sidebar shown on page with Blog template or on Home Page set with posts', 'yiw' ) ) ); 
	register_sidebar( yiw_sidebar_args( 'Shop Sidebar', __( 'The sidebar for all shop pages', 'yiw' ) ) );  
	register_sidebar( yiw_sidebar_args( 'Footer Main', __( 'The footer main section.', 'yiw' ), 'widget', 'h3' ) );   
	if ( yiw_get_option( 'footer_layout' ) != 'no-sidebar' )	
		register_sidebar( yiw_sidebar_args( 'Footer Sidebar', __( 'The footer main section.', 'yiw' ), 'widget', 'h3' ) );            
	
	// add sidebar created from plugin
	if( yiw_get_option( 'sidebars' ) )
	{
		$sidebars = unserialize( yiw_get_option( 'sidebars' ) );
		foreach( $sidebars AS $sidebar )
		{
			register_sidebar( yiw_sidebar_args( $sidebar, '', 'widget', 'h3' ) );
		}
	}                                             
}

// decide the layout of the theme, changing the class of body
function yiw_theme_layout_body_class( $classes ) {
	$classes[] = yiw_get_option( 'theme_layout' ) . '-layout';
	return $classes;		
}
add_filter( 'body_class', 'yiw_theme_layout_body_class' );

// decide the layout of the theme, changing the class of body
function yiw_actual_font_body_class( $classes ) {
	$classes[] = yiw_get_option( 'font' ) . '-font';
	return $classes;		
}
add_filter( 'body_class', 'yiw_actual_font_body_class' );

// add the font for the logo
function yiw_logo_font() {
	
	if ( is_admin() )
		return;
	
	$_logo_image = yiw_get_option( 'show_image_logo' );
	
	$logo_text = wptexturize( get_bloginfo( 'name' ) );
	
	if ( ! $_logo_image ) {
		wp_enqueue_style( 'Lobster-google-font', 'http://fonts.googleapis.com/css?family=Lobster&text=' . $logo_text );
	}
}
//add_action( 'wp_print_styles', 'yiw_logo_font' );     

function yiw_logo_cufon() {
	?>
	<script type="text/javascript">
		Cufon.replace( '#logo .logo-title', { fontFamily: 'Lobster', textShadow: '3px 3px 10px rgba(0,0,0,0.75)' } );
	</script>
	<?php
}      

                           

if ( ! function_exists( 'yiw_admin_header_style' ) ) :
/**
 * Styles the header image displayed on the Appearance > Header admin panel.
 *
 * Referenced via add_custom_image_header() in twentyten_setup().
 *
 * @since Twenty Ten 1.0
 */
function yiw_admin_header_style() {
?>
<style type="text/css">
/* Shows the same border as on front end */
#headimg {
	border-bottom: 1px solid #000;
	border-top: 4px solid #000;
}
/* If NO_HEADER_TEXT is false, you would style the text with these selectors:
	#headimg #name { }
	#headimg #desc { }
*/
</style>
<?php
}
endif;       


/**
 * Add style of body
 *
 * @since 1.0
 */
function yiw_body_style() {
	
// 	if ( yiw_get_option( 'theme_layout' ) != 'boxed' )
// 		return;
	
	$role = '';
	
	$bg_type = yiw_get_option( 'body_bg_type' );
	$color_bg = yiw_get_option( 'body_bg_color' );
	
	switch ( $bg_type ) {
	
		case 'color-unit' :
			$role = 'background:' . $color_bg . ';';
			break;
	
		case 'bg-image' :
			$image = yiw_get_option( 'body_bg_image', 'custom' );
            
            if ( yiw_get_option( 'theme_layout' ) == 'stretched' )
                $image = 'custom';         
			
			// image
			if ( $image != 'custom' ) {
				$url_image = get_template_directory_uri() . '/' . $image;   
				$position = 'top left'; 
				$repeat = 'repeat';
				$attachment = 'fixed';
			} else {
				$url_image = yiw_get_option( 'body_bg_image_custom', '' ); 
				$position = yiw_get_option( 'body_bg_image_custom_position' ); 
				$repeat = yiw_get_option( 'body_bg_image_custom_repeat' );
				$attachment = yiw_get_option( 'body_bg_image_custom_attachment' );
			}                      
				
			if ( $url_image != '' )
			    $url_image = " url('$url_image')";
			
			$attrs = array(
                "background-color: $color_bg",
                "background-image: $url_image",
                "background-position: $position",
                "background-repeat: $repeat",
                "background-attachment: $attachment"
            );
			
			$role = implode( ";\n", $attrs );
			break;
	
	}
?>
body, .stretched-layout .bgWrapper {
	<?php echo $role ?>
}
<?php
}   
add_action( 'yiw_custom_styles', 'yiw_body_style' );    


/**
 * Add style of header
 *
 * @since 1.0
 */
function yiw_header_style() {
	$role = '';
	
	$bg_type = yiw_get_option( 'header_bg_type' );
	$color_bg = yiw_get_option( 'header_bg_color' );
	
	switch ( $bg_type ) {
	
		case 'color-unit' :
			$role = 'background:' . $color_bg . ';';
			break;
	
		case 'bg-image' :
			$image = yiw_get_option( 'header_bg_image' );
			
			// image
			if ( $image != 'custom' ) {
				$url_image = get_template_directory_uri() . '/' . $image;   
				$position = 'top center'; 
				$repeat = 'no-repeat';
			} else {
				$url_image = yiw_get_option( 'header_bg_image_custom' ); 
				$position = yiw_get_option( 'header_bg_image_custom_position' ); 
				$repeat = yiw_get_option( 'header_bg_image_custom_repeat' );
			}
			
			
			$role = 'background:' . $color_bg . ' url(\'' . $url_image . '\') ' . $repeat . ' ' . $position . ';';
			break;
	
	}
?>
#header {
	<?php echo $role ?>
}
<?php
}   
add_action( 'yiw_custom_styles', 'yiw_header_style' );


/** SLIDERS
-------------------------------------------------------------------- */

/**
 * vars for elegant slider
 */
function yiw_slider_elegant_scripts() {
	if ( ! yiw_can_show_slider() || yiw_slider_type() != 'elegant' )
		return;
	
	$easing = ( $eas = yiw_slide_get('easing') ) ? "'$eas'" : 'null';
	?>
	<script type="text/javascript">      
		var 	yiw_slider_type = 'elegant',
                yiw_slider_elegant_easing = <?php echo $easing ?>,
				yiw_slider_elegant_fx = '<?php yiw_slide_the('effect') ?>',
				yiw_slider_elegant_speed = <?php echo yiw_slide_get('speed') * 1000 ?>,
				yiw_slider_elegant_timeout = <?php echo yiw_slide_get('timeout') * 1000 ?>,
				yiw_slider_elegant_caption_speed = <?php echo yiw_slide_get('caption_speed') * 1000 ?>;  
    </script>
	<?php
} 

/**
 * vars for thumbnails slider
 */
function yiw_slider_thubmnails_scripts() {
	if ( ! yiw_can_show_slider() || yiw_slider_type() != 'thumbnails' )
		return;
	?>
	<script type="text/javascript">      
		var 	yiw_slider_type = 'thumbnails',
                yiw_slider_thumbnails_fx = '<?php yiw_slide_the('effect') ?>',
				yiw_slider_thumbnails_speed = <?php echo yiw_slide_get('speed') * 1000 ?>,
				yiw_slider_thumbnails_timeout = <?php echo yiw_slide_get('timeout') * 1000 ?>;
    </script>
	<?php
} 

/**
 * vars for elegant slider
 */
function yiw_slider_rotating_scripts() {
	if ( ! yiw_can_show_slider() || yiw_slider_type() != 'rotating' )
		return;
	
	$easing = ( $eas = yiw_slide_get('easing') ) ? "'$eas'" : 'null';
	?>
	<script type="text/javascript">      
		var 	yiw_slider_type = 'rotating',
                yiw_slider_rotating_npanels = <?php echo yiw_slide_get('n_panels' ) * 1000 ?>,
				yiw_slider_rotating_timeDiff = <?php echo yiw_slide_get('speed1' ) * 1000 ?>,
				yiw_slider_rotating_slideshowTime = <?php echo yiw_slide_get('speed2' ) * 1000 ?>;  
    </script>
	<?php
}   


/**
 * vars for cycle slider
 */
function yiw_slider_cycle_scripts() {
    if ( ! yiw_can_show_slider() || yiw_slider_type() != 'cycle' )
        return;
    
    $easing = ( $eas = yiw_slide_get('easing') ) ? "'$eas'" : 'null';
    ?>
    <script type="text/javascript">      
        var     yiw_slider_type = 'cycle',
                yiw_slider_cycle_easing = <?php echo $easing ?>,
                yiw_slider_cycle_fx = '<?php yiw_slide_the('effect') ?>',
                yiw_slider_cycle_speed = <?php echo yiw_slide_get('speed') * 1000 ?>,
                yiw_slider_cycle_timeout = <?php echo yiw_slide_get('timeout') * 1000 ?>;
    </script>
    <?php
} 



/**
 * vars for nivo slider
 */
function yiw_slider_nivo_scripts() {
    if ( ! yiw_can_show_slider() || yiw_slider_type() != 'nivo' )
        return;
    ?>
    <script type="text/javascript">      
        var     yiw_slider_type = 'nivo',
                yiw_slider_nivo_fx = '<?php yiw_slide_the('effect') ?>',
                yiw_slider_nivo_speed = <?php echo yiw_slide_get('speed') * 1000 ?>,
                yiw_slider_nivo_timeout = <?php echo yiw_slide_get('timeout') * 1000 ?>,
                yiw_slider_nivo_directionNav = <?php echo yiw_slide_get('directionNav') ? 'true' : 'false'; ?>,
                yiw_slider_nivo_directionNavHide = <?php echo yiw_slide_get('directionNavHide') ? 'true' : 'false'; ?>,
                yiw_slider_nivo_controlNav = <?php echo yiw_slide_get('controlNav') ? 'true' : 'false'; ?>;
    </script>
    <?php
} 


add_action( 'wp_print_scripts', 'yiw_slider_cycle_scripts' );
add_action( 'wp_print_scripts', 'yiw_slider_nivo_scripts' );  
add_action( 'wp_print_scripts', 'yiw_slider_rotating_scripts' );   
add_action( 'wp_print_scripts', 'yiw_slider_elegant_scripts' );   
add_action( 'wp_print_scripts', 'yiw_slider_thubmnails_scripts' );


/** NAV MENU
-------------------------------------------------------------------- */

add_action('admin_init', array('yiwProductsPricesFilter', 'admin_init'));

class yiwProductsPricesFilter {
	// We cannot call #add_meta_box yet as it has not been defined,
    // therefore we will call it in the admin_init hook
	function admin_init() {
		if ( ! is_plugin_active( 'jigoshop/jigoshop.php' ) || basename($_SERVER['PHP_SELF']) != 'nav-menus.php' ) 
			return;
			                                                    
		wp_enqueue_script('nav-menu-query', get_template_directory_uri() . '/inc/admin_scripts/metabox_nav_menu.js', 'nav-menu', false, true);
		add_meta_box('products-by-prices', 'Prices Filter', array(__CLASS__, 'nav_menu_meta_box'), 'nav-menus', 'side', 'low');
	}

	function nav_menu_meta_box() { ?>
	<div class="prices">        
		<input type="hidden" name="jigoshop_currency" id="jigoshop_currency" value="<?php echo get_jigoshop_currency_symbol( get_option('jigoshop_currency') ) ?>" />
		<input type="hidden" name="jigoshop_shop_url" id="jigoshop_shop_url" value="<?php echo get_permalink( get_option('jigoshop_shop_page_id') ) ?>" />
		<input type="hidden" name="menu-item[-1][menu-item-url]" value="" />
		<input type="hidden" name="menu-item[-1][menu-item-title]" value="" />
		<input type="hidden" name="menu-item[-1][menu-item-type]" value="custom" />
		
		<p>
		    <?php _e( sprintf( 'The values are already expressed in %s', get_jigoshop_currency_symbol( get_option('jigoshop_currency') ) ), 'yiw' ) ?>
		</p>
		
		<p>
			<label class="howto" for="prices_filter_from">
				<span><?php _e('From'); ?></span>
				<input id="prices_filter_from" name="prices_filter_from" type="text" class="regular-text menu-item-textbox input-with-default-title" title="<?php esc_attr_e('From'); ?>" />
			</label>
		</p>

		<p style="display: block; margin: 1em 0; clear: both;">
			<label class="howto" for="prices_filter_to">
				<span><?php _e('To'); ?></span>
				<input id="prices_filter_to" name="prices_filter_to" type="text" class="regular-text menu-item-textbox input-with-default-title" title="<?php esc_attr_e('To'); ?>" />
			</label>
		</p>

		<p class="button-controls">
			<span class="add-to-menu">
				<img class="waiting" src="<?php echo esc_url( admin_url( 'images/wpspin_light.gif' ) ); ?>" alt="" />
				<input type="submit" class="button-secondary submit-add-to-menu" value="<?php esc_attr_e('Add to Menu'); ?>" name="add-custom-menu-item" />
			</span>
		</p>

	</div>
<?php
	}
}        

// add the google analytics code
function yiw_ga_code() {
    echo stripslashes( yiw_get_option( 'ga_code' ) );
}    
add_action( 'wp_footer', 'yiw_ga_code', 99 );


/** ADMIN
-------------------------------------------------------------------- */

// add new type to theme options
function yiw_select_with_header_preview( $value ) {
	
	if ( isset( $value['id'] ) )
		$id_container = 'id="' . $value['id'] . '-option" ';       
		
	// deps                   
    if ( isset( $value['deps'] ) ) {
    	$value['deps']['id_input'] = yiw_option_id( $value['deps']['id'], false );
    	$deps[ $value['id'] ] = $value['deps'];
    	$class_dep = ' yiw-deps';
    	$fade_color_dep = '<div class="fade_color"></div>';
    }
    ?>
    
        <div <?php echo $id_container ?>class="rm_option rm_input rm_select<?php echo $class_dep ?> rm_with_preview">
            <label for="<?php yiw_option_id( $value['id'] ); ?>"><?php echo $value['name']; ?></label>
            
            <select name="<?php yiw_option_name( $value['id'] ); ?>" id="<?php yiw_option_id( $value['id'] ); ?>" <?php if( isset( $value['button'] ) ) : ?>style="width:240px;" <?php endif ?>>
                <?php foreach ($value['options'] as $val => $option) { ?>
                    <option value="<?php echo $val ?>" <?php selected( yiw_get_option( $value['id'], $value['std'] ), $val ) ?>><?php echo $option; ?></option>
                <?php } ?>
            </select>                          
            
			<?php if( isset( $value['button'] ) ) : ?>
			<input type="submit" value="<?php echo $value['button']; ?>" class="button" name="<?php yiw_option_id( $value['id'] ); ?>_save" id="<?php yiw_option_id( $value['id'] ); ?>_save">
			<?php endif ?>
            
            <small><?php echo $value['desc']; ?></small>
            <div class="clearfix"></div>
            <?php $style = ( $value['std'] == 'custom' ) ? ' style="display:none;"' : ''; ?>
            <div class="preview"<?php echo $style ?>><img class="min" src="<?php echo get_template_directory_uri() . '/' . yiw_get_option( $value['id'], $value['std'] ) ?>" title="<?php _e( 'Click to expand the image to the natural size', 'yiw' ) ?>" /></div>
            <script type="text/javascript">
            	jQuery(document).ready(function($){
					var select = $('#<?php yiw_option_id( $value['id'] ); ?>');
					var preview = $('#<?php echo $value['id'] ?>-option .preview');
					
					var change_preview = function(){
						var value = select.val();
						if ( value != 'custom' ) {
							preview.find('img').attr('src', '<?php echo get_template_directory_uri() . '/'; ?>'+value);
						    preview.show();
						} else {
							preview.hide();	
						}
					};
					
					select.change(change_preview).keypress(change_preview);
					
					preview.find('img').click(function(){
						$(this).toggleClass('min');
						if ( $(this).hasClass('min') )
							$(this).attr('title', '<?php _e( 'Click to expand the image to the natural size', 'yiw' ) ?>');
						else
							$(this).attr('title', '<?php _e( 'Click to minimize the image', 'yiw' ) ?>');
					});
				});
            </script>
        </div>  
         
    <?php		
}
add_action( 'yiw_panel_type_header_preview', 'yiw_select_with_header_preview' );

// add new type to theme options
function yiw_select_with_bg_preview( $value ) {
	
	if ( isset( $value['id'] ) )
		$id_container = 'id="' . $value['id'] . '-option" ';            
		
	// deps                   
    if ( isset( $value['deps'] ) ) {
    	$value['deps']['id_input'] = yiw_option_id( $value['deps']['id'], false );
    	$deps[ $value['id'] ] = $value['deps'];
    	$class_dep = ' yiw-deps';
    	$fade_color_dep = '<div class="fade_color"></div>';
    }
    ?>
    
        <div <?php echo $id_container ?>class="rm_option rm_input rm_select<?php echo $class_dep ?> rm_with_preview rm_with_bg_preview">
            <label for="<?php yiw_option_id( $value['id'] ); ?>"><?php echo $value['name']; ?></label>
            
            <select name="<?php yiw_option_name( $value['id'] ); ?>" id="<?php yiw_option_id( $value['id'] ); ?>" <?php if( isset( $value['button'] ) ) : ?>style="width:240px;" <?php endif ?>>
                <?php foreach ($value['options'] as $val => $option) { ?>
                    <option value="<?php echo $val ?>" <?php selected( yiw_get_option( $value['id'], $value['std'] ), $val ) ?>><?php echo $option; ?></option>
                <?php } ?>
            </select>                          
            
			<?php if( isset( $value['button'] ) ) : ?>
			<input type="submit" value="<?php echo $value['button']; ?>" class="button" name="<?php yiw_option_id( $value['id'] ); ?>_save" id="<?php yiw_option_id( $value['id'] ); ?>_save">
			<?php endif ?>
            
            <small><?php echo $value['desc']; ?></small>
            <div class="clearfix"></div>
            
            <?php 
				$url = get_template_directory_uri().'/'.yiw_get_option( $value['id'], $value['std'] );
				$color = yiw_get_option( $value['id_colors'] );
				
				$style = array(
					"background-color:$color;",
					"background-image:url('$url');",
					"background-position:top center;"
				);
				$style = implode( '', $style );
				
				$style_preview = ( yiw_get_option( $value['id'], $value['std'] ) == 'custom' ) ? ' style="display:none"' : '';
			?>
            
            <div class="preview"<?php echo $style_preview ?>><div class="img" style="<?php echo $style ?>"></div></div>
            <script type="text/javascript">
            	jQuery(document).ready(function($){
					var select = $('#<?php yiw_option_id( $value['id'] ); ?>');
					var text_color = $('#<?php yiw_option_id( $value['id_colors'] ); ?>');
					var preview = $('#<?php echo $value['id'] ?>-option .preview');
					
					preview.css('cursor', 'pointer').attr('title', '<?php _e( 'Click here to update the color selected above', 'yiw' ) ?>');
					
					select.change(function(){
						var value = $(this).val();
						if ( value != 'custom' ) {
							$('.img', preview).css({'background-image':'url(<?php echo get_template_directory_uri() . '/'; ?>'+value+')'});
						    preview.show();
						} else {
							preview.hide();	
						}
					});
					
					preview.click(function(){ 
						var value = text_color.val();
						$('.img', preview).css({'background-color':value});
					});
				});
            </script>
        </div>  
         
    <?php		
}
add_action( 'yiw_panel_type_bg_preview', 'yiw_select_with_bg_preview' );

// add new type to theme options
function yiw_size_inputs( $value ) {
	
	if ( isset( $value['id'] ) )
		$id_container = 'id="' . $value['id'] . '-option" ';     
		
	// deps                   
    if ( isset( $value['deps'] ) ) {
    	$value['deps']['id_input'] = yiw_option_id( $value['deps']['id'], false );
    	$deps[ $value['id'] ] = $value['deps'];
    	$class_dep = ' yiw-deps';
    	$fade_color_dep = '<div class="fade_color"></div>';
    }
    
    $s = maybe_unserialize( yiw_get_option( $value['id'], serialize( $value['std'] ) ) );
    ?>
    
        <div <?php echo $id_container ?>class="rm_option rm_input rm_text<?php echo $class_dep ?>">
            <label for="<?php yiw_option_id( $value['id'] ); ?>_w"><?php echo $value['name']; ?></label>
            <input name="<?php yiw_option_name( $value['id'] ); ?>[w]" 
				   id="<?php yiw_option_id( $value['id'] . '_w' ); ?>" 
				   type="text" 
				   value="<?php echo $s['w']; ?>"
				   style="width:40px;" /> x
            <input name="<?php yiw_option_name( $value['id'] ); ?>[h]" 
				   id="<?php yiw_option_id( $value['id'] . '_h' ); ?>" 
				   type="text" 
				   value="<?php echo $s['h']; ?>"
				   style="width:40px;" /> px
			
			<small><?php echo $value['desc']; ?></small><div class="clearfix"></div>
        </div>
         
    <?php		
}
add_action( 'yiw_panel_type_size_inputs', 'yiw_size_inputs' );   

function yiw_select_skin_option_type( $value ) {
    if ( isset( $value['id'] ) )
    		$id_container = 'id="' . $value['id'] . '-option" ';
    ?>
    
        <div <?php echo $id_container ?>class="rm_option rm_input rm_select">
            <label for="<?php yiw_option_id( $value['id'] ); ?>"><?php echo $value['name']; ?></label>
            
            <select name="<?php yiw_option_name( $value['id'] ); ?>" id="<?php yiw_option_id( $value['id'] ); ?>" <?php if( isset( $value['button'] ) ) : ?>style="width:240px;" <?php endif ?>>
                <?php foreach ($value['options'] as $val => $option) { ?>
                    <option value="<?php echo $val ?>" <?php selected( yiw_get_option( $value['id'], $value['std'] ), $val ) ?>><?php echo $option; ?></option>
                <?php } ?>
            </select>                          
            
			<?php if( isset( $value['button'] ) ) : ?>
			<input type="submit" value="<?php echo $value['button']; ?>" class="button" name="<?php yiw_option_id( $value['id'] ); ?>_save" id="<?php yiw_option_id( $value['id'] ); ?>_save">
			<?php endif ?>  
			
			<input type="hidden" name="yiw-callback-save" value="yiw_select_skins_option" />
            
            <small><?php echo $value['desc']; ?></small>
            <div class="clearfix"></div>
        </div>  
         
    <?php
}          
add_action( 'yiw_panel_type_select_skin', 'yiw_select_skin_option_type' );   

function yiw_select_skins_option() {   
    global $yiw_theme_options, $yiw_colors;  
    
    $selected_skin = yiw_post_option( 'select_skin' );
    if( $selected_skin == '' || $selected_skin == yiw_get_option( 'select_skin' ) )
	   return;
		
	$tab = yiw_get_current_tab();
	
	$skin = array(
        'elegant' => array( 
            'theme_layout' => 'stretched',  
            'nav_type' => 'elegant',
            'slider_type' => 'elegant',      
            'slider_choosen' => 'elegant',
            'slider_elegant_slides' => serialize( array(
                    array(
                            'order' => 0,
                            'slide_title' => 'interior design',
                            'tooltip_content' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar turpis velit. Morbi rutrum, neque non pulvinar faucibus, ligula eros viverra ligula, et aliquam libero neque ac nisl. 
                    
[special_font size="24"]prices from [size px="42"]$45[/size][/special_font]',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider/001.jpg',
                            'link_type' => 'none'
                        ),
                        array(          
                            'order' => 1,
                            'slide_title' => 'Luxury gold',
                            'tooltip_content' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar turpis velit. Morbi rutrum, neque non pulvinar faucibus, ligula eros viverra ligula, et aliquam libero neque ac nisl. ',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider/002.jpg',
                            'link_type' => 'none'
                        ),
                        array(         
                            'order' => 2,
                            'slide_title' => 'Gold Parquet',
                            'tooltip_content' => 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum
                    
[special_font size="24"]prices from [size px="42"]$37[/size][/special_font]',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider/003.jpg',
                            'link_type' => 'none'
                        ),
            ) ), 
            'slider_elegant_effect' => 'fade',
            'slider_elegant_speed' => 0.5,
            'slider_elegant_timeout' => 5,
            'slider_elegant_caption_position' => 'right',
            'slider_elegant_caption_speed' => 0.5,     
            'body_bg_color' => '#ffffff',
            'shop_title_position' => 'inside-thumb',
            'shop_border_thumbnail' => 1,
            'shop_shadow_thumbnail' => 1,
            'shop_show_price' => 0,
            'shop_show_button_details' => 0,
            'shop_show_button_add_to_cart' => 0,
            'colors_footer-color-links-hover' => '#1b1b1b',
            'colors_footer-color-menues-links-hover' => '#4d4d4d',
            'colors_store-products-offer-bg' => '#616263',
            'colors_store-products-offer-text' => '#fff',
            'header_bg_image' => 'images/headers/002.jpg',
            'header_bg_type' => 'bg-image',
            'font_logo' => array( 'type' => 'google-font', 'google-font' => 'Lobster' ),
            'font_title' => array( 'type' => 'google-font', 'google-font' => 'Yanone Kaffeesatz:400' ),
            'font_slogan' => array( 'type' => 'google-font', 'google-font' => 'Yanone Kaffeesatz:400' ),
            'font_paragraph' => array( 'type' => 'web-fonts', 'web-fonts' => "'Trebuchet MS', Helvetica, sans-serif" )
        ),
        'creative' => array(    
            'theme_layout' => 'boxed',  
            'nav_type' => 'creative',
            'slider_type' => 'thumbnails',
            'slider_choosen' => 'thumbnails',
            'slider_thumbnails_slides' => serialize( array(
                    array(
                            'order' => 0,
                            'slide_title' => 'interior design',
                            'tooltip_content' => 'Lorem ipsum dolor sit amet',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider-thumbnails/001.jpg',
                            'link_type' => 'none'
                        ),
                        array(          
                            'order' => 1,
                            'slide_title' => 'Luxury gold',
                            'tooltip_content' => '',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider-thumbnails/002.jpg',
                            'link_type' => 'none'
                        ),
                        array(         
                            'order' => 2,
                            'slide_title' => 'Gold Parquet',
                            'tooltip_content' => '',
                            'content_type' => 'image',
                            'image_url' => get_template_directory_uri() . '/images/slider-thumbnails/003.jpg',
                            'link_type' => 'none'
                        ),
            ) ),                     
            'slider_thumbnails_effect' => 'fade',
            'slider_thumbnails_speed' => 0.5,
            'slider_thumbnails_timeout' => 5,
            'header_bg_type' => 'bg-image',
            'header_bg_color' => '#0A1622',
            'header_bg_image' => 'images/headers/001.jpg',
            'colors_copyright-links-color' => '#335e86',
            'colors_general-color-links' => '#335e86',
            'colors_general-color-links-hover', '#3374b3',
            'shop_title_position' => 'below-thumb',
            'shop_border_thumbnail' => 1,
            'shop_shadow_thumbnail' => 0,
            'shop_show_price' => 1,
            'shop_show_button_details' => 1,
            'shop_show_button_add_to_cart' => 1,
            'colors_store-products-offer-bg' => '#B9B701',
            'colors_store-products-offer-text' => '#fff',
            'body_bg_type' => 'bg-image',
            'body_bg_image' => 'images/backgrounds/backgrounds/002.jpg',
            'font_logo' => array( 'type' => 'google-font', 'google-font' => 'Lobster' ),
            'font_title' => array( 'type' => 'google-font', 'google-font' => 'Yanone Kaffeesatz:400' ),
            'font_slogan' => array( 'type' => 'google-font', 'google-font' => 'Yanone Kaffeesatz:400' ),
            'font_paragraph' => array( 'type' => 'web-fonts', 'web-fonts' => "'Trebuchet MS', Helvetica, sans-serif" )
        ),
    );
    
    // the slides already existing
    $slides = maybe_unserialize( yiw_get_option( 'slider_'.$skin[$selected_skin]['slider_type'].'_slides' ) );
    
    // if there are already some images into the slider, doesn't add the default images
    if ( ! empty( $slides ) )
        unset( $skin[$selected_skin]['slider_'.$skin[$selected_skin]['slider_type'].'_slides'] );
    
    // retrieve the default color for the navigation
    foreach ( $yiw_colors[$skin[$selected_skin]['nav_type'].'-navigation']['options'] as $color_id => $value )
        $skin[$selected_skin]['colors_'.$color_id] = $value['default'];
    
    $yiw_theme_options = wp_parse_args( $skin[ $selected_skin ], $yiw_theme_options );
    
    // save the skin selected
    $yiw_theme_options['select_skin'] = $selected_skin;
    
    //yiw_debug( $yiw_theme_options );
	
	yiw_update_theme_options();
                                                
	$url = admin_url( 'themes.php' ) . "?page=$_GET[page]&tab=$tab&message=saved"; 
    yiw_end_process( $url ); 
    die;
}      


/**
 * Return the page breadcrumbs
 * 
 */
function yiw_breadcrumb() {
    //if ( is_page_with_breadcrumb() ) :
    
        $delimiter = ' &rsaquo; ';
        $home = 'Home Page'; // text for the 'Home' link
        $before = '<a class="no-link current" href="#">'; // tag before the current crumb
        $after = '</a>'; // tag after the current crumb
     
        if ( !is_home() && !is_front_page() || is_paged() ) {
     
            echo '<div id="crumbs" class="theme_breadcumb">';
         
            global $post;
            $homeLink = site_url();
            echo '<a class="home" href="' . $homeLink . '">' . $home . '</a> ' . $delimiter . ' ';
         
            if ( is_category() ) {
                global $wp_query;
                $cat_obj = $wp_query->get_queried_object();
                $thisCat = $cat_obj->term_id;
                $thisCat = get_category($thisCat);
                $parentCat = get_category($thisCat->parent);
                if ( $thisCat->parent != 0 ) 
    echo get_category_parents( $parentCat, TRUE, ' ' . $delimiter . ' ' );
                echo $before . 'Archive by category "' . single_cat_title('', false) . '"' . $after;
         
            } elseif ( is_day() ) {
                echo '<a class="no-link" href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
                echo '<a class="no-link" href="' . get_month_link(get_the_time('Y'),get_the_time('m')) . '">' . get_the_time('F') . '</a> ' . $delimiter . ' ';
                echo $before . get_the_time('d') . $after;
         
            } elseif ( is_month() ) {
                echo '<a class="no-link" href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> ' . $delimiter . ' ';
                echo $before . get_the_time('F') . $after;
         
            } elseif ( is_year() ) {
                echo $before . get_the_time('Y') . $after;
         
            } elseif ( is_single() && !is_attachment() ) {
                if ( get_post_type() != 'post' ) {
    $post_type = get_post_type_object(get_post_type());
    $slug = $post_type->rewrite;
    echo '<a class="no-link" href="' . $homeLink . '/' . $slug['slug'] . '/">' . $post_type->labels->singular_name . '</a> ' . $delimiter . ' ';
    echo $before . get_the_title() . $after;
                } else {
    $cat = get_the_category(); $cat = $cat[0];
    echo get_category_parents($cat, TRUE, ' ' . $delimiter . ' ');
    echo $before . get_the_title() . $after;
                }
    
            } elseif ( !is_single() && !is_page() && get_post_type() != 'post' && !is_404() ) {
                $post_type = get_post_type_object(get_post_type());
                echo $before . $post_type->labels->singular_name . $after;
         
            } elseif ( is_attachment() ) {
                $parent = get_post($post->post_parent);
                $cat = get_the_category($parent->ID); $cat = $cat[0];
                echo get_category_parents($cat, TRUE, ' ' . $delimiter . ' ');
                echo '<a class="no-link" href="' . get_permalink($parent) . '">' . $parent->post_title . '</a> ' . $delimiter . ' ';
                echo $before . get_the_title() . $after;
         
            } elseif ( is_page() && !$post->post_parent ) {
                echo $before . get_the_title() . $after;
         
            } elseif ( is_page() && $post->post_parent ) {
                $parent_id  = $post->post_parent;
                $breadcrumbs = array();
                while ( $parent_id ) {
    $page = get_page($parent_id);
    $breadcrumbs[] = '<a class="no-link" href="' . get_permalink($page->ID) . '">' . get_the_title($page->ID) . '</a>';
    $parent_id  = $page->post_parent;
                }
                $breadcrumbs = array_reverse($breadcrumbs);
                foreach ( $breadcrumbs as $crumb ) 
    echo $crumb . ' ' . $delimiter . ' ';
                echo $before . get_the_title() . $after;
         
            } elseif ( is_search() ) {
                echo $before . 'Search results for "' . get_search_query() . '"' . $after;
         
            } elseif ( is_tag() ) {
                echo $before . 'Posts tagged "' . single_tag_title('', false) . '"' . $after;
         
            } elseif ( is_author() ) {
                global $author;
                $userdata = get_userdata($author);
                echo $before . 'Articles posted by ' . $userdata->display_name . $after;
         
            } elseif ( is_404() ) {
                echo $before . 'Error 404' . $after;
            }
         
            if ( get_query_var('paged') ) {
                if ( is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() ) 
    echo ' (';
                echo $before . __('Page', 'yiw') . ' ' . get_query_var('paged') . $after;
                if ( is_category() || is_day() || is_month() || is_year() || is_search() || is_tag() || is_author() ) 
    echo ')';
            }
         
            echo '<div class="breadcrumb-end"></div>';
            echo '</div>';
         
        }
        
    //endif;
}


/** SHOP
-------------------------------------------------------------------- */

// generate the main width for content and sidebar
function yiw_layout_widths() {
    global $content_width;
    
    $sidebar = YIW_SIDEBAR_WIDTH;
    
    if ( get_post_type() == 'product' || get_post_meta( get_the_ID(), '_sidebar_choose_page', true ) == 'Shop Sidebar' )
        $sidebar = YIW_SIDEBAR_SHOP_WIDTH;
    
    $content_width = YIW_MAIN_WIDTH - ( $sidebar + 40 );
    
    ?>
        #content { width:<?php echo $content_width ?>px; }
        #sidebar { width:<?php echo $sidebar ?>px; }        
        #sidebar.shop { width:<?php echo YIW_SIDEBAR_SHOP_WIDTH ?>px; }
    <?php
}
add_action( 'yiw_custom_styles', 'yiw_layout_widths' );

function yiw_minicart() {
    if ( ! class_exists( 'Jigoshop_Widget_Cart' ) )
        return; 
        
	$cart = new Jigoshop_Widget_Cart();
	
	$args = array(
		'before_title' => '<h3>',
		'after_title' => '</h3>',
		'before_widget' => '<div class="basketpopup">',
		'after_widget' => '</div>'
	);
	
	$instance = array(
		'title' => __( 'My Cart', 'yiw' )
	);
	
	// quantity
	$qty = 0;
	if (sizeof(jigoshop_cart::$cart_contents)>0) : foreach (jigoshop_cart::$cart_contents as $item_id => $values) :
	
		$qty += $values['quantity'];
	
	endforeach; endif;
	
	echo '<a class="trigger" href="' . jigoshop_cart::get_cart_url() . '">
			<span> ' . $qty . ' item &ndash; ' . jigoshop_cart::get_cart_total() . ' </span>
		</a> | ';
	
	$cart->widget( $args, $instance );
}     

// Decide if show the price and/or the button add to cart, on the product detail page
function yiw_remove_ecommerce() {
    if ( ! yiw_get_option( 'shop_show_button_add_to_cart_single_page', 1 ) ) {
        remove_action( 'jigoshop_template_single_summary', 'jigoshop_template_single_price', 10, 2);
        remove_action( 'jigoshop_template_single_summary', 'jigoshop_template_single_add_to_cart', 30, 2 );
    }       
}
add_action( 'wp_head', 'yiw_remove_ecommerce', 1 );

function jigoshop_template_loop_add_to_cart( $post, $_product ) {
    ?><div class="buttons">
        <a href="<?php the_permalink(); ?>" class="details"><?php echo yiw_get_option( 'shop_button_details_label' ) ?></a>
	    <a href="<?php echo $_product->add_to_cart_url(); ?>" class="add-to-cart"><?php echo yiw_get_option( 'shop_button_addtocart_label' ) ?></a><?php
	?></div><?php
}

/**
 * LAYOUT
 */
function yiw_shop_layout_pages_before() {
    $layout = yiw_layout_page();
    if ( get_post_type() == 'product' && is_single() )
        $layout = 'sidebar-no';
    ?><div class="layout-<?php echo $layout ?> group"><?php    
} 

function yiw_shop_layout_pages_after() {
    ?></div><?php    
}                                                                   
  
add_action( 'jigoshop_before_main_content', 'yiw_shop_layout_pages_before', 1 );
add_action( 'jigoshop_sidebar', 'yiw_shop_layout_pages_after', 99 );
                    
/**
 * SIZES
 */ 

// shop small
function yiw_shop_small_w() { return get_option('jigoshop_shop_small_w'); }	
function yiw_shop_small_h() { return get_option('jigoshop_shop_small_h'); }   
// shop tiny
function yiw_shop_tiny_w() { return get_option('jigoshop_shop_tiny_w'); }	
function yiw_shop_tiny_h() { return get_option('jigoshop_shop_tiny_h'); }   
// shop thumbnail
function yiw_shop_thumbnail_w() { return get_option('jigoshop_shop_thumbnail_w'); }	
function yiw_shop_thumbnail_h() { return get_option('jigoshop_shop_thumbnail_h'); } 
// shop large
function yiw_shop_large_w() { return get_option('jigoshop_shop_large_w'); }	
function yiw_shop_large_h() { return get_option('jigoshop_shop_large_h'); }   
      
function yiw_change_shop_sizes() {
    // shop small                          
    add_filter( 'jigoshop_get_var_shop_small_w', 'yiw_shop_small_w' );
    add_filter( 'jigoshop_get_var_shop_small_h', 'yiw_shop_small_h' );
    // shop tiny                          
    add_filter( 'jigoshop_get_var_shop_tiny_w', 'yiw_shop_tiny_w' );
    add_filter( 'jigoshop_get_var_shop_tiny_h', 'yiw_shop_tiny_h' );
    // shop thumbnail                          
    add_filter( 'jigoshop_get_var_shop_thumbnail_w', 'yiw_shop_thumbnail_w' );
    add_filter( 'jigoshop_get_var_shop_thumbnail_h', 'yiw_shop_thumbnail_h' );
    // shop large                          
    add_filter( 'jigoshop_get_var_shop_large_w', 'yiw_shop_large_w' );
    add_filter( 'jigoshop_get_var_shop_large_h', 'yiw_shop_large_h' );
}
//add_action( 'init', 'yiw_change_shop_sizes' ); 

// change size for large image on product page
function yiw_change_large_size() {
    return 'shop_large_image';
}
//add_filter( 'single_product_large_thumbnail_size', 'yiw_change_large_size' );

// print style for small thumb size
function yiw_size_images_style() {
	?>
	.products li { width:<?php echo yiw_shop_small_w() + ( yiw_get_option( 'shop_border_thumbnail' ) ? 14 : 0 ) ?>px !important; }
	.products li a strong { width:<?php echo yiw_shop_small_w() - 30 ?>px !important; }
	.products li a strong.inside-thumb { top:<?php echo yiw_shop_small_h() - 41 ?>px !important; }
	.products li.border a strong.inside-thumb { top:<?php echo yiw_shop_small_h() + 7 - 41 ?>px !important; }
	.products li a img { width:<?php echo yiw_shop_small_w() ?>px !important;height:<?php echo yiw_shop_small_h() ?>px !important; }
	div.product div.images { width:<?php echo yiw_shop_large_w() + 14 ?>px; }
	div.product div.summary { width:<?php echo 960 - ( yiw_shop_large_w() + 14 ) - 20 ?>px; }
	.product.hentry > span.onsale { left:<?php echo yiw_shop_large_w() - 20 ?>px; right:auto; }
	<?php
}
add_action( 'yiw_custom_styles', 'yiw_size_images_style' );

/**
 * PRODUCT PAGE
 */                       

/**
 * After Single Products Summary Div
 **/
function jigoshop_output_product_data_tabs() {       
		
	global $_product;
	
	if ( get_the_content() == '' && ! yiw_if_related() && ! $_product->has_attributes() && ! comments_open() )
	   return;
	
	if ( yiw_if_related() )
	   $current_tab = '#related-products';
	elseif ( get_the_content() != '' )     
	   $current_tab = '#tab-description';
	elseif ( comments_open() )     
	   $current_tab = '#tab-reviews';
	elseif ( $_product->has_attributes() )     
	   $current_tab = '#tab-attributes';
	
	?>
	<div id="product-tabs">
		<ul class="tabs">
		
			<?php do_action('jigoshop_product_tabs', $current_tab); ?>
			
		</ul>			
		
		<div class="containers">
		  <?php do_action('jigoshop_product_tab_panels'); ?>
		</div>
		
	</div>
	<?php
	
}

function jigoshop_product_description_tab( $current_tab ) {
    if ( get_the_content() == '' )
        return;
	?>
	<li <?php if ($current_tab=='#tab-description') echo 'class="active"'; ?>><a href="#tab-description"><?php _e('Description', 'jigoshop'); ?></a></li>
	<?php
}                    
function jigoshop_product_description_panel() {  
    if ( get_the_content() == '' )
        return;
	echo '<div class="panel" id="tab-description">';
	the_content();
	echo '</div>';
}
function yiw_related_products_tab( $current_tab ) {  
    if ( ! yiw_if_related() )
        return;
	?>
 	<li <?php if ($current_tab=='#related-products') echo 'class="active"'; ?>><a href="#related-products"><?php _e('Related Products', 'yiw'); ?></a></li>
 	<?php
}                

function yiw_if_related() {
    ob_start();
    jigoshop_related_products();
    if ( ob_get_clean() == '' )
        return false;
    else
        return true;
}     

function jigoshop_related_products_panel() {  
    if ( ! yiw_if_related() )
        return;    
	echo '<div class="panel" id="related-products">';
	jigoshop_related_products( 5, 5 );
	echo '</div>';
}         

function jigoshop_related_products( $posts_per_page = 4, $post_columns = 4, $orderby = 'rand' ) {
	
	global $_product, $columns, $per_page;
	
	// Pass vars to loop
	$per_page = $posts_per_page;
	$columns = $post_columns;
	
	$related = $_product->get_related();
	if (sizeof($related)>0) :
		$args = array(
			'post_type'	=> 'product',
			'ignore_sticky_posts'	=> 1,
			'posts_per_page' => $per_page,
			'orderby' => $orderby,
			'post__in' => $related
		);
		$args = apply_filters('jigoshop_related_products_args', $args);
		query_posts($args);            
        
        if ( ! have_posts() )
            return '';
          
		echo '<div class="related products">';
		jigoshop_get_template_part( 'loop', 'shop' ); 
		echo '</div>';
	endif;
	wp_reset_query();
	
}                                                          
add_action( 'jigoshop_product_tab_panels', 'jigoshop_related_products_panel', 1 );
add_action( 'jigoshop_product_tabs', 'yiw_related_products_tab', 1 ); 
remove_action( 'jigoshop_after_single_product_summary', 'jigoshop_output_related_products', 20);

if ( ! isset( $_COOKIE["current_tab"] ) ) {
    setcookie( 'current_tab', '#related-products' );
    $_COOKIE["current_tab"] = '#related-products';
}

// pagination
function jigoshop_pagination() {
    get_template_part('pagination');
}

// product thumbnail
function jigoshop_get_product_thumbnail( $size = 'shop_small', $placeholder_width = 0, $placeholder_height = 0 ) {
	
	global $post;
	
	if (!$placeholder_width) $placeholder_width = jigoshop::get_var('shop_small_w');
	if (!$placeholder_height) $placeholder_height = jigoshop::get_var('shop_small_h');
	
	if ( has_post_thumbnail() ) 
	   $thumb = get_the_post_thumbnail($post->ID, $size);
	else
	   $thumb = '';
	
	if ( empty( $thumb ) )
        $thumb = '<img src="'.jigoshop::plugin_url(). '/assets/images/placeholder.png" alt="Placeholder" width="'.$placeholder_width.'" height="'.$placeholder_height.'" />';
	
    return $thumb;
}

// number of products
function yiw_items_list_pruducts() {
    return 8;
}
//add_filter( 'loop_shop_per_page', 'yiw_items_list_pruducts' );

?>