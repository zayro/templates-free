<?php

/*--------------------------------------------------------------------------------------------------

	File: zn-init.php

	Description: This file contains information about the theme.
	Plesae be carefull when editing this file

--------------------------------------------------------------------------------------------------*/

if( ! defined('ADMIN_PATH' ) ) 	 { 	define( 'ADMIN_PATH', get_stylesheet_directory().'/admin/' ); }
if( ! defined('ADMIN_DIR' ) ) 	 { 	define( 'ADMIN_DIR', get_stylesheet_directory_uri() . '/admin/'); }
if( ! defined('THEME_DIR' ) ) 	 { 	define( 'THEME_DIR', get_stylesheet_directory_uri() ); }
if( ! defined('MASTER_THEME_DIR' ) ) 	 { 	define( 'MASTER_THEME_DIR', get_template_directory_uri() ); }
if( ! defined('IMAGES_URL' ) ) 	 { 	define( 'IMAGES_URL', get_template_directory_uri() .'/images' ); }
if( ! defined('ADMIN_IMAGES_DIR' ) ) 	 { 	define( 'ADMIN_IMAGES_DIR', get_template_directory_uri() . '/admin/images'); }
if( ! defined('ADMIN_MASTER_ADMIN_DIR' ) ) 	 { 	define( 'ADMIN_MASTER_ADMIN_DIR', get_template_directory_uri() . '/admin/'); }

if( ! defined('THEMENAME' ) ) 	 { 	define( 'THEMENAME', 'Kallyas' ); }
if( ! defined('OPTIONS' ) ) 	 { 	define( 'OPTIONS', 'zn_kallyas_options' ); }

$my_theme = wp_get_theme();
if ( is_child_theme() ) {
	$parent_name = $my_theme->Template;
	$master_theme = wp_get_theme($parent_name);
	$version = $master_theme->Version;
}
elseif ( $my_theme->exists() ) {
		$version = $my_theme->Version;
}

if( ! defined('THEME_VERSION' ) ) 	 { 	define( 'THEME_VERSION', $version ); }



// Load the interface
if (is_admin()){
	
	$all_icon_sets = array();
	$bootstrap_icons = array();
	
	locate_template(array('admin/framework/class-zn-html.php'), true, true);
	locate_template(array('admin/framework/functions-zn-theme-functions.php'), true, true);
	locate_template(array('admin/framework/functions-zn-admin.php'), true, true);
	locate_template(array('admin/framework/function-zn-metabox.php'), true, true);
	locate_template(array('admin/framework/helper-icons.php'), true, true);
	locate_template(array('admin/options/theme-options.php'), true, true);
	locate_template(array('admin/options/zn-meta-boxes.php'), true, true);
	locate_template(array('admin/framework/functions-zn-ajax-callback.php'), true, true);

}

require_once dirname( __FILE__ ) . '/framework/class-tgm-plugin-activation.php';
add_action( 'tgmpa_register', 'kallyas_register_required_plugins' );

function kallyas_register_required_plugins() {

	/**
	 * Array of plugin arrays. Required keys are name and slug.
	 * If the source is NOT from the .org repo, then source is also required.
	 */
	$plugins = array(
		array(
			'name'     				=> 'Revolution Slider', // The plugin name
			'slug'     				=> 'revslider', // The plugin slug (typically the folder name)
			'source'   				=> get_stylesheet_directory() . '/admin/plugins/revslider.zip', // The plugin source
			'required' 				=> false, // If false, the plugin is only 'recommended' instead of required
			'version' 				=> '2.3.3', // E.g. 1.0.0. If set, the active plugin must be this version or higher, otherwise a notice is presented
			'force_activation' 		=> false, // If true, plugin is activated upon theme activation and cannot be deactivated until theme switch
			'force_deactivation' 	=> false, // If true, plugin is deactivated upon theme switch, useful for theme-specific plugins
			'external_url' 			=> '', // If set, overrides default API URL and points to an external URL
		),
		array(
			'name'     				=> 'Cute Slider', // The plugin name
			'slug'     				=> 'CuteSlider', // The plugin slug (typically the folder name)
			'source'   				=> get_stylesheet_directory() . '/admin/plugins/cutesliderwp.zip', // The plugin source
			'required' 				=> false, // If false, the plugin is only 'recommended' instead of required
			'version' 				=> '1.1.1', // E.g. 1.0.0. If set, the active plugin must be this version or higher, otherwise a notice is presented
			'force_activation' 		=> false, // If true, plugin is activated upon theme activation and cannot be deactivated until theme switch
			'force_deactivation' 	=> false, // If true, plugin is deactivated upon theme switch, useful for theme-specific plugins
			'external_url' 			=> '', // If set, overrides default API URL and points to an external URL
		),
	);

	// Change this to your theme text domain, used for internationalising strings
	$theme_text_domain = THEMENAME;

	$config = array(
		'domain'       		=> THEMENAME,         	// Text domain - likely want to be the same as your theme.
		'default_path' 		=> '',                         	// Default absolute path to pre-packaged plugins
		'parent_menu_slug' 	=> 'themes.php', 				// Default parent menu slug
		'parent_url_slug' 	=> 'themes.php', 				// Default parent URL slug
		'menu'         		=> 'install-required-plugins', 	// Menu slug
		'has_notices'      	=> true,                       	// Show admin notices or not
		'is_automatic'    	=> false,					   	// Automatically activate plugins after installation or not
		'message' 			=> '',							// Message to output right before the plugins table
		'strings'      		=> array(
			'page_title'                       			=> __( 'Install Required Plugins', THEMENAME ),
			'menu_title'                       			=> __( 'Install Plugins', THEMENAME ),
			'installing'                       			=> __( 'Installing Plugin: %s', THEMENAME ), // %1$s = plugin name
			'oops'                             			=> __( 'Something went wrong with the plugin API.', THEMENAME ),
			'notice_can_install_required'     			=> _n_noop( 'This theme requires the following plugin: %1$s.', 'This theme requires the following plugins: %1$s.' ), // %1$s = plugin name(s)
			'notice_can_install_recommended'			=> _n_noop( 'This theme recommends the following plugin: %1$s.', 'This theme recommends the following plugins: %1$s.' ), // %1$s = plugin name(s)
			'notice_cannot_install'  					=> _n_noop( 'Sorry, but you do not have the correct permissions to install the %s plugin. Contact the administrator of this site for help on getting the plugin installed.', 'Sorry, but you do not have the correct permissions to install the %s plugins. Contact the administrator of this site for help on getting the plugins installed.' ), // %1$s = plugin name(s)
			'notice_can_activate_required'    			=> _n_noop( 'The following required plugin is currently inactive: %1$s.', 'The following required plugins are currently inactive: %1$s.' ), // %1$s = plugin name(s)
			'notice_can_activate_recommended'			=> _n_noop( 'The following recommended plugin is currently inactive: %1$s.', 'The following recommended plugins are currently inactive: %1$s.' ), // %1$s = plugin name(s)
			'notice_cannot_activate' 					=> _n_noop( 'Sorry, but you do not have the correct permissions to activate the %s plugin. Contact the administrator of this site for help on getting the plugin activated.', 'Sorry, but you do not have the correct permissions to activate the %s plugins. Contact the administrator of this site for help on getting the plugins activated.' ), // %1$s = plugin name(s)
			'notice_ask_to_update' 						=> _n_noop( 'The following plugin needs to be updated to its latest version to ensure maximum compatibility with this theme: %1$s.', 'The following plugins need to be updated to their latest version to ensure maximum compatibility with this theme: %1$s.' ), // %1$s = plugin name(s)
			'notice_cannot_update' 						=> _n_noop( 'Sorry, but you do not have the correct permissions to update the %s plugin. Contact the administrator of this site for help on getting the plugin updated.', 'Sorry, but you do not have the correct permissions to update the %s plugins. Contact the administrator of this site for help on getting the plugins updated.' ), // %1$s = plugin name(s)
			'install_link' 					  			=> _n_noop( 'Begin installing plugin', 'Begin installing plugins' ),
			'activate_link' 				  			=> _n_noop( 'Activate installed plugin', 'Activate installed plugins' ),
			'return'                           			=> __( 'Return to Required Plugins Installer', THEMENAME ),
			'plugin_activated'                 			=> __( 'Plugin activated successfully.', THEMENAME ),
			'complete' 									=> __( 'All plugins installed and activated successfully. %s', THEMENAME ), // %1$s = dashboard link
			'nag_type'									=> 'updated' // Determines admin notice type - can only be 'updated' or 'error'
		)
	);

	tgmpa( $plugins, $config );

}

?>