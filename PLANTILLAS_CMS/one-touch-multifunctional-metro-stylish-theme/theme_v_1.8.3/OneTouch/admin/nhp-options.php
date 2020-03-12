<?php

/*
 * 
 * Require the framework class before doing anything else, so we can use the defined urls and dirs
 * Also if running on windows you may have url problems, which can be fixed by defining the framework url first
 *
 */
//define('NHP_OPTIONS_URL', site_url('path the options folder'));

$theme_version = '';

if( function_exists( 'wp_get_theme' ) ) {
    if( is_child_theme() ) {
        $temp_obj = wp_get_theme();
        $theme_obj = wp_get_theme( $temp_obj->get('Template') );
    } else {
        $theme_obj = wp_get_theme();
    }

    $theme_version = $theme_obj->get('Version');
    $theme_name = $theme_obj->get('Name');
    $theme_uri = $theme_obj->get('ThemeURI');
    $author_uri = $theme_obj->get('AuthorURI');
} else {
    $theme_data = get_theme_data(get_stylesheet_directory_uri().'/style.css' );
    $theme_version = $theme_data['Version'];
    $theme_name = $theme_data['Name'];
    $theme_uri = $theme_data['ThemeURI'];
    $author_uri = $theme_data['AuthorURI'];
}

define( 'NHPOPTIONS', $theme_name.'_hhp-options' );


if(!class_exists('NHP_Options')){
    require_once( dirname( __FILE__ ) . '/options/options.php' );
    require_once( dirname( __FILE__ ) . '/function.ajax.php' );
    require_once( dirname( __FILE__ ) . '/function.get.options.php' );
}


/*
 * 
 * Custom function for filtering the sections array given by theme, good for child themes to override or add to the sections.
 * Simply include this function in the child themes functions.php file.
 *
 * NOTE: the defined constansts for urls, and dir will NOT be available at this point in a child theme, so you must use
 * get_template_directory_uri() if you want to use any of the built in icons
 *
 */
function add_another_section($sections){
	
	//$sections = array();
	$sections[] = array(
				'title' => __('A Section added by hook', 'nhp-opts'),
				'desc' => __('<p class="description">This is a section created by adding a filter to the sections array, great to allow child themes, to add/remove sections from the options.</p>', 'nhp-opts'),
				//all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
				//You dont have to though, leave it blank for default.
				'icon' => trailingslashit(get_template_directory_uri()).'options/img/glyphicons/glyphicons_062_attach.png',
				//Lets leave this as a blank section, no options just some intro text set above.
				'fields' => array()
				);
	
	return $sections;
	
}//function
//add_filter('nhp-opts-sections-twenty_eleven', 'add_another_section');


/*
 * 
 * Custom function for filtering the args array given by theme, good for child themes to override or add to the args array.
 *
 */
function change_framework_args($args){
	
	//$args['dev_mode'] = false;
	
	return $args;
	
}//function
//add_filter('nhp-opts-args-twenty_eleven', 'change_framework_args');

/*
 * This is the meat of creating the optons page
 *
 * Override some of the default values, uncomment the args and change the values
 * - no $args are required, but there there to be over ridden if needed.
 *
 *
 */

function setup_framework_options(){
$args = array();

//Set it to dev mode to view the class settings/info in the form - default is false
$args['dev_mode'] = false;

//google api key MUST BE DEFINED IF YOU WANT TO USE GOOGLE WEBFONTS
//$args['google_api_key'] = '***';

//Remove the default stylesheet? make sure you enqueue another one all the page will look whack!
//$args['stylesheet_override'] = true;

//Add HTML before the form
$args['intro_text'] = __('<p>Panel to configure theme options. If you have any questions or suggestions, please write on our forum <a href="http://sup.crumina.net"/>sup.crumina.net</a></p>', 'nhp-opts');

//Setup custom links in the footer for share icons
    $args['share_icons']['twitter'] = array(
        'link' => 'http://twitter.com/Crumina',
        'title' => 'Folow me on Twitter',
        'img' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_322_twitter.png'
    );
    $args['share_icons']['linked_in'] = array(
        'link' => 'http://sup.crumina.net/',
        'title' => 'Support forum',
        'img' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_049_star.png'
    );

//Choose to disable the import/export feature
//$args['show_import_export'] = false;

//Choose a custom option name for your theme options, the default is the theme name in lowercase with spaces replaced by underscores
$args['opt_name'] = 'one_touch';

define('NHP_OPT_NAME', $args['opt_name']);

//Custom menu icon
//$args['menu_icon'] = '';

//Custom menu title for options page - default is "Options"
$args['menu_title'] = __('Theme Options', 'nhp-opts');

//Custom Page Title for options page - default is "Options"
$args['page_title'] = __('One Touch  Theme Options', 'nhp-opts');

//Custom page slug for options page (wp-admin/themes.php?page=***) - default is "nhp_theme_options"
$args['page_slug'] = 'nhp_theme_options';

//Custom page capability - default is set to "manage_options"
//$args['page_cap'] = 'manage_options';

//page type - "menu" (adds a top menu section) or "submenu" (adds a submenu) - default is set to "menu"
//$args['page_type'] = 'submenu';

//parent menu - default is set to "themes.php" (Appearance)
//the list of available parent menus is available here: http://codex.wordpress.org/Function_Reference/add_submenu_page#Parameters
//$args['page_parent'] = 'themes.php';

//custom page location - default 100 - must be unique or will override other items
$args['page_position'] = 3;

//Custom page icon class (used to override the page icon next to heading)
//$args['page_icon'] = 'icon-themes';

//Want to disable the sections showing as a submenu in the admin? uncomment this line
//$args['allow_sub_menu'] = false;
		
//Set ANY custom page help tabs - displayed using the new help tab API, show in order of definition		
$args['help_tabs'][] = array(
							'id' => 'nhp-opts-1',
							'title' => __('Theme Information 1', 'nhp-opts'),
							'content' => __('<p>This is the tab content, HTML is allowed.</p>', 'nhp-opts')
							);
$args['help_tabs'][] = array(
							'id' => 'nhp-opts-2',
							'title' => __('Theme Information 2', 'nhp-opts'),
							'content' => __('<p>This is the tab content, HTML is allowed.</p>', 'nhp-opts')
							);

//Set the Help Sidebar for the options page - no sidebar by default										
$args['help_sidebar'] = __('<p>This is the sidebar content, HTML is allowed.</p>', 'nhp-opts');

$portfolio_taxonomies = get_terms('project_type', 'orderby=none&hide_empty');

$portfolio_cats = array();
foreach ($portfolio_taxonomies as $portfolio_taxonomy ){
    $portfolio_cats[$portfolio_taxonomy->slug] = $portfolio_taxonomy->name;
}

$sections = array();

$default_styles = "
.tiled-menu>li>.menu-item-wrap>a{
  background-color:#ffaa31;
}
.tiled-menu>.menu-portfolio>span>a {
   background-color:#FFAA31;
}
.tiled-menu>.menu-blog>span>a{
  background-color:#57BAE8;
}
.tiled-menu>.menu-shop>span>a{
   background-color:#6CBE42;
 }
.tiled-menu>.menu-shortcodes>span>a {
    background-color:#FFAA31;
}
.tiled-menu>.menu-features>span>a{
    background-color:#57BAE8;
}
.tiled-menu>.menu-contacts>span>a{
    background-color:#FFAA31;
}";

$sections[] = array(
    'title' => __('Main Options', 'nhp-opts'),
    'desc' => __('<p class="description">Main options of site</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_023_cogwheels.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
    array(
        'id' => 'custom_favicon',
        'type' => 'upload',
        'title' => __('Upload Favicon', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Upload a 16px x 16px Png/Gif image that will represent your website\'s favicon.', 'nhp-opts')
    ),
    array(
        'id' => 'custom_logo_upload',
        'type' => 'upload',
        'title' => __('Upload Custom Header Logo', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Upload a logotype image image that will represent your website.', 'nhp-opts'),
        'std'  => 'http://theme.crumina.net/onetouch/wp-content/uploads/2012/12/metro.png',
    ),
    array(
        'id' => 'custom_footer_logo_upload',
        'type' => 'upload',
        'title' => __('Upload Custom Footer Logo', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Upload a logotype image image that will represent your website.', 'nhp-opts'),
        'std'  =>'http://theme.crumina.net/onetouch/wp-content/uploads/2012/12/logo.png',
    ),

    array(
        'id' => 'type_posts_show',
        'type' => 'select',
        'title' => __('Post Excerpt', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Select post show type.', 'nhp-opts'),
        'options' => array('excert' => 'Excerpt','full_post' => 'Full Post',),//Must provide key => value pairs for select options
        'std' => 'excert'
    ),

    array(
            'id' => 'main_menu_style',
            'type' => 'select',
            'title' => __('Top menu submenu style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select style of top menu dropdown', 'nhp-opts'),
            'options' => array('horisontal' => 'Horisontal', 'vertical' => 'Vertical',), //Must provide key => value pairs for select options
            'std' => 'horisontal'
    ),

    array(
        'id' => 'google_analytics',
        'type' => 'textarea',
        'title' => __('Tracking Code', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Paste your Google Analytics (or other) tracking code here. This will be added into the footer template of your theme.', 'nhp-opts'),
        'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
        'std' => ''
    ),
    array(
        'id' => 'custom_css',
        'type' => 'textarea',
        'title' => __('Custom CSS', 'nhp-opts'),
        'sub_desc' => __('', 'nhp-opts'),
        'desc' => __('Quickly add some CSS to your theme by adding it to this block.', 'nhp-opts'),
        'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
        'std' => $default_styles
    ),

    ),
);

$sections[] = array(
    'title' => __('Inner page options', 'nhp-opts'),
    'desc' => __('<p class="description">Parameters for inner pages (social share etc)</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL . 'img/glyphicons/glyphicons_144_folder_open.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'post_share_button',
            'type' => 'button_set',
            'title' => __('Enable social share buttons on single post / page', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('0' => 'Off','1' => 'On'),
            'std' => '1'// 1 = on | 0 = off
        ),
        array(
            'id' => 'post_share_place',
            'type' => 'select',
            'title' => __('Place to show post share icons', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('bottom'=>'After post','top' => 'Before post','both' => 'Before post and after post'),
            'std' => 'bottom'
        ),
        array(
            'id' => 'custom_share_code',
            'type' => 'textarea',
            'title' => __('Custom share code', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
        ),

        array(
            'id' => 'autor_box_disp',
            'type' => 'button_set',
            'title' => __('Enable author simple info box on single post / page', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('0' => 'Off','1' => 'On'),
            'std' => '1'// 1 = on | 0 = off
        ),

        array(
            'id' => 'pagination_style',
            'type' => 'button_set', //the field type
            'title' => __('Pagination type', 'nhp-opts'),
            'sub_desc' => __('Please select your pagination type', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('1' => __('Prev/next butt.', 'nhp-opts'), '2' => __('Pages list', 'nhp-opts')),
            'std' => '1'//this should be the key as defined above
        ),

        array(
            'id' => 'masonry_posts_per_page',
            'type' => 'text',
            'title' => __('Posts per grid template page', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Number of posts, displayed on blog masonry the page', 'nhp-opts'),
            'validate' => 'numeric',
            'std' => '18'
        ),
        array(
            'id' => 'posts_per_page',
            'type' => 'text',
            'title' => __('Posts on blog template page', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Number of posts, displayed on blof page', 'nhp-opts'),
            'validate' => 'numeric',
            'std' => '5'
        ),
        array(
            'id' => 'post_thumbnails_width',
            'type' => 'text',
            'title' => __('Type width of post thumbnail (in px)', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'validate' => 'numeric',
            'std' => '1200'
        ),
        array(
            'id' => 'post_thumbnails_height',
            'type' => 'text',
            'title' => __('Type height of post  thumbnail (in px)', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'validate' => 'numeric',
            'std' => '300',
        ),
        array(
            'id' => 'boxed_portfolio',
            'type' => 'select',
            'title' => __('Select the style of tabbed portfolio', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('boxed' => 'Boxed','left-boxed' => 'Left Boxed', 'full-width'=>"Full Width"),
            'std' => 'left-boxed',
        ),
        array(
            'id' => 'portfolio_single_style',
            'type' => 'button_set', //the field type
            'title' => __('Select portfolio image format', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' =>array(
                'left'=>'2 columns',
                'full'=>'Full width',
            ),
            'std' => 'left',
        ),
        array(
            'id' => 'portfolio_single_slider',
            'type' => 'button_set', //the field type
            'title' => __('Display portfolio images', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' =>array(
                'slider'=>'Slider',
                'full'=>'Items',
            ),
            'std' => 'slider',
        ),

    ),
);


$sections[] = array(
    'title' => __('Styling Options', 'nhp-opts'),
    'desc' => __('<p class="description">Style parameters of body and footer</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_234_brush.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'main_menu_position',
            'type' => 'button_set', //the field type
            'title' => __('Select Main menu alignment', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' =>array(
                'left'=>'Left',
                'right'=>'Right',
            ),
            'std' => 'right',
        ),
        array(
            'id' => 'site_boxed',
            'type' => 'select_hide_show_opts',
            'title' => __('Body Layout', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select boxed or non-boxed layout.', 'nhp-opts'),
            'options' => array('0' => 'Non-Boxed', '1' => 'Boxed'),
            'std' => '0',// 1 = on | 0 = off,
            'options_to_show' => array(
                '0'=>"body_wrapper_bg_color,body_wrapper_bg_image,body_wrapper_custom_repeat,",
                "1"=>""
            ),
        ),
        //Body wrapper
        array(
            'id' => 'body_wrapper_bg_color',
            'type' => 'color',
            'title' => __('Content background color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select background color', 'nhp-opts'),
            'std' => '#FFFFFF'
        ),
        array(
            'id' => 'body_wrapper_bg_image',
            'type' => 'upload',
            'title' => __('Upload content background image', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Upload a background pattern or image.', 'nhp-opts')
        ),
        array(
            'id' => 'body_wrapper_custom_repeat',
            'type' => 'select',
            'title' => __('Background image repeat', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select type background image repeat', 'nhp-opts'),
            'options' => array(''=>'standart','repeat-y' => 'repeat-y','repeat-x' => 'repeat-x','no-repeat' => 'no-repeat', 'repeat' => 'repeat', ),//Must provide key => value pairs for select options
            'std' => ''
        ),


        //Body wrapper
        array(
            'id' => 'body_bg_color',
            'type' => 'color',
            'title' => __('Body background color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select background color, pattern or upload your own image', 'nhp-opts'),
            'std' => '#FFFFFF'
        ),
        array(
            'id' => 'body_bg_image',
            'type' => 'upload',
            'title' => __('Upload own background image', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Upload a background pattern or image.', 'nhp-opts')
        ),
        array(
            'id' => 'body_custom_repeat',
            'type' => 'select',
            'title' => __('Background image repeat', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select type background image repeat', 'nhp-opts'),
            'options' => array(''=>'standart','repeat-y' => 'repeat-y','repeat-x' => 'repeat-x','no-repeat' => 'no-repeat', 'repeat' => 'repeat', ),//Must provide key => value pairs for select options
            'std' => ''
        ),
        array(
            'id' => 'body_bg_fixed',
            'type' => 'button_set',
            'title' => __('Fixed body background', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('0' => 'Off','1' => 'On'),
            'std' => '0'// 1 = on | 0 = off
        ),
        array(
            'id' => 'footer_bg_color',
            'type' => 'color',
            'title' => __('Footer background color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select background color, pattern or upload your own image', 'nhp-opts'),
            'std' => ''
        ),
        array(
            'id' => 'footer_font_color',
            'type' => 'color',
            'title' => __('Footer font color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select font color.', 'nhp-opts'),
            'std' => ''
        ),
        array(
            'id' => 'footer_bg_image',
            'type' => 'upload',
            'title' => __('Or upload own footer background image', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Upload a background pattern or image.', 'nhp-opts')
        ),
        array(
            'id' => 'footer_custom_repeat',
            'type' => 'select',
            'title' => __('Footer background image repeat', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select type background image repeat', 'nhp-opts'),
            'options' => array(''=>'standart','repeat-y' => 'repeat-y','repeat-x' => 'repeat-x','no-repeat' => 'no-repeat', 'repeat' => 'repeat', ),//Must provide key => value pairs for select options
            'std' => ''
        ),
        array(
            'id' => 'main_link_color',
            'type' => 'color',
            'title' => __('Basic links color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select link color.', 'nhp-opts'),
            'std' => ''
        ),
        array(
            'id' => 'main_link_color_hover',
            'type' => 'color',
            'title' => __('Basic links color on hover', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select link color.', 'nhp-opts'),
            'std' => ''
        ),


    ),
);

    $sections[] = array(
        'title' => __('Main slider options', 'nhp-opts'),
        'desc' => __('<p class="description">Metro-style slider options</p>', 'nhp-opts'),
        //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
        //You dont have to though, leave it blank for default.
        'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_050_link.png',
        //Lets leave this as a blank section, no options just some intro text set above.
        'fields' => array(
            array(
                'id' => 'boxed_post_slider',
                'type' => 'select',
                'title' => __('Main slider style', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select metro slider show type.', 'nhp-opts'),
                'options' => array('1' => 'Boxed','2' => 'Left Boxed','3' => 'Not Boxed','4' => 'No scrolling'),//Must provide key => value pairs for select options
                'std' => '1'
            ),
            array(
                'id' => 'horizontal_slider_type',
                'type' => 'select',
                'title' => __('Horizontal Slider Items are taken from', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select post type that will be show in the horizontal slider.', 'nhp-opts'),
                'options' => array('post' => 'Posts','portfolio' => 'Portfolio',),//Must provide key => value pairs for select options
                'std' => 'post'
            ),
            array(
                'id' => 'slider_posts_number',
                'type' => 'select',
                'title' => __('Number of posts to display:', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Set number of posts to display on the main slider', 'nhp-opts'),
                'options' => array(9=>9,12=>12,15=>15,18=>18,21=>21,24=>24,27=>27,30=>30),
                'std' => 18
            ),
            array(
                'id' => 'main_slider_item_icon',
                'type' => 'upload',
                'title' => __('Upload Icon of main slider item', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('', 'nhp-opts')
            ),
            array(
                'id' => 'even_slider_elements_bgcolor',
                'type' => 'color',
                'title' => __('Even elements substrate color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
            array(
                'id' => 'odd_slider_elements_bgcolor',
                'type' => 'color',
                'title' => __('Odd elements substrate color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
            array(
                'id' => 'even_slider_elements_textcolor',
                'type' => 'color',
                'title' => __('Even elements text color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
            array(
                'id' => 'odd_slider_elements_textcolor',
                'type' => 'color',
                'title' => __('Odd elements text color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
            array(
                'id' => 'even_slider_elements_datecolor',
                'type' => 'color',
                'title' => __('Even elements date color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
            array(
                'id' => 'odd_slider_elements_datecolor',
                'type' => 'color',
                'title' => __('Odd elements date color', 'nhp-opts'),
                'sub_desc' => __('', 'nhp-opts'),
                'desc' => __('Select link color.', 'nhp-opts'),
                'std' => ''
            ),
        )
    );


$sections[] = array(
    'title' => __('Footer options', 'nhp-opts'),
    'desc' => __('<p class="description">Footer options</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_050_link.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'footer_display',
            'type' => 'select_hide_show_opts',
            'title' => __('Footer looks like:', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select the view of footer', 'nhp-opts'),
            'std' => 'blocks',
            'options_to_show'=>array(
                'blocks'=>"",
                "copyright"=>"footer_title_description_text,footer_subtitle_description_text,footer_description_text,footer_contacts_text"),
            'options'=>array(
                'blocks'=>'3 blocks',
                'copyright'=>'Copyright'
            ),
            'std' => 'blocks',
        ),



        array(
            'id' => 'footer_title_description_text',
            'type' => 'text',
            'title' => __('Title of description text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here title of the description in footer', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'About company'
        ),
        array(
            'id' => 'footer_subtitle_description_text',
            'type' => 'text',
            'title' => __('Subtitle of description text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here subtitle of the description in footer', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'IT IS REALLY INTERESTING'
        ),
        array(
            'id' => 'footer_description_text',
            'type' => 'textarea',
            'title' => __('Footer description text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here description text, that will be displayed in footer', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'I’m not sure anyone saw this coming, but now that it’s here, it makes good sense: parents have smartphones. Some of their'
        ),
        array(
            'id' => 'footer_contacts_text',
            'type' => 'textarea',
            'title' => __('Footer contacts text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here contacts text, that will be displayed in footer', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post,
            'std' => 'Address:   123456 Street Name, Los Angeles <br> Phone:   (1800) 765-4321'
        ),

        array(
            'id' => 'copyright_footer',
            'type' => 'text',
            'title' => __('Copyright text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here copyright texts', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'My copyright info 2013'
        ),

        array(
            'id' => 'menu_in_footer',
            'type' => 'button_set',
            'title' => __('Display menu in footer?', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('1' => 'On','0' => 'Off'),
            'std' => '0'
        ),

        array(
            'id' => 'footer_menu_select',
            'type' => 'menu_select',
            'title' => __('Footer Menu Select', 'nhp-opts'),
            'sub_desc' => __('Select one to display in footer', 'nhp-opts'),
            'desc' => __('This field creates a drop down menu of all the sites menus.', 'nhp-opts'),
            //'args' => array()//uses wp_get_nav_menus
        ),

        array(
            'id' => 'footer_color_style',
            'type' => 'button_set',
            'title' => __('Fixed body background', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('light' => 'White','dark' => 'Dark'),
            'std' => 'dark'
        ),

    )
);


$sections[] = array(
    'title' => __('Contact page options', 'nhp-opts'),
    'desc' => __('<p class="description">Contact page options</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_024_parents.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'map_address',
            'type' => 'text',
            'title' => __('Google Map Address', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type your address to be shown on the Google Map', 'nhp-opts'),
            'std' =>'London, Downing street, 10'
        ),
        array(
            'id' => 'faces_on_contact_menu',
            'type' => 'button_set',
            'title' => __('Show pictures on contact page menu item', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array('0' => 'Off','1' => 'On'),
            'std' => '1'// 1 = on | 0 = off
        ),
        array(
            'id' => 'antispam_way',
            'type' => 'select_hide_show_opts',
            'title' => __('Use default key', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select the way of anti spam protection', 'nhp-opts'),
            'std' => 'About company',
            'options_to_show'=>array(
                'recaptcha'=>"antispam_question,antispam_answer",
                "question"=>"public_key_recaptcha,private_key_recaptcha,default_keys_recaptcha"),
            'options'=>array(
                'recaptcha'=>'Recaptcha',
                'question'=>'Controll question'
            ),
            'std' => 'question',
        ),
        array(
            'id' => 'antispam_question',
            'type' => 'text',
            'title' => __('Type the antispam question', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Antispam question will protect you from spamers', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'How many legs does elephant have?'
        ),
        array(
            'id' => 'antispam_answer',
            'type' => 'text',
            'title' => __('Type the answer for antispam question', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Antispam question will protect you from spamers', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' =>'4'
        ),
        array(
            'id' => 'public_key_recaptcha',
            'type' => 'text',
            'title' => __('Insert your public reCaptcha key', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'validate' => 'no_html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => ''
        ),
        array(
            'id' => 'private_key_recaptcha',
            'type' => 'text',
            'title' => __('Insert your rivate reCaptcha key', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'validate' => 'no_html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => ''
        ),
        array(
            'id' => 'default_keys_recaptcha',
            'type' => 'checkbox',
            'title' => __('Use default keys', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'std' => '1'
        ),

    ),
);

$sections[] = array(
    'title' => __('Unlimited sidebars', 'nhp-opts'),
    'desc' => __('<p class="description">Add or delete your own sidebars</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_154_show_big_thumbnails.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'custom_sidebars',
            'type' => 'custom_sidebars',
            'title' => __('Custom Sidebars', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here your copyrights or other info, you wish to be displayeв in footer', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => ''
        ),
    ),
);

$sections[] = array(
    'title' => __('Social accounts', 'nhp-opts'),
    'desc' => __('<p class="description">Type links for social accounts</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_088_adress_book.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'expand_social_icons',
            'type' => 'checkbox',
            'title' => __('Expand social icons', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Check if you want to expand social icon panel, by default', 'nhp-opts'),
            'std' => 0
        ),
        array(
            'id' => 'fb_link',
            'type' => 'text',
            'title' => __('Facebook link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://facebook.com'
        ),
        array(
            'id' => 'tw_link',
            'type' => 'text',
            'title' => __('Twitter link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://twitter.com'
        ),
        array(
            'id' => 'fl_link',
            'type' => 'text',
            'title' => __('Flickr link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://flickr.com'
        ),
        array(
            'id' => 'vi_link',
            'type' => 'text',
            'title' => __('Vimeo link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://vimeo.com'
        ),
        array(
            'id' => 'lf_link',
            'type' => 'text',
            'title' => __('Last FM link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://lastfm.com'
        ),
        array(
            'id' => 'dr_link',
            'type' => 'text',
            'title' => __('Dribble link', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://dribble.com'
        ),
        array(
            'id' => 'yt_link',
            'type' => 'text',
            'title' => __('YouTube', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://youtube.com'
        ),
        array(
            'id' => 'ms_link',
            'type' => 'text',
            'title' => __('Microsoft ID', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'https://accountservices.passport.net/'
        ),
        array(
            'id' => 'li_link',
            'type' => 'text',
            'title' => __('LinkedIN', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://linkedin.com'
        ),
        array(
            'id' => 'gp_link',
            'type' => 'text',
            'title' => __('Google +', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'https://accounts.google.com/'
        ),
        array(
            'id' => 'pi_link',
            'type' => 'text',
            'title' => __('Picasa', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://picasa.com'
        ),
        array(
            'id' => 'pt_link',
            'type' => 'text',
            'title' => __('Pinterest', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://pinterest.com'
        ),
        array(
            'id' => 'wp_link',
            'type' => 'text',
            'title' => __('Wordpress', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://wordpress.com'
        ),
        array(
            'id' => 'db_link',
            'type' => 'text',
            'title' => __('Dropbox', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste link to your account', 'nhp-opts'),
            'validate' => 'url',
            'std' => 'http://dropbox.com'
        ),
        array(
            'id' => 'rss_link',
            'type' => 'text',
            'title' => __('RSS', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Paste alternative link to Rss', 'nhp-opts'),
            'std' => ''
        ),
    ),
);

$sections[] = array(
    'title' => __('Blocks Manager', 'nhp-opts'),
    'desc' => __('<p class="description">Setup and configure blocks</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_153_more_windows.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'block_manager',
            'type' => 'block_manager',
            'title' => __('Blocks Manager', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Add new and configure blocks', 'nhp-opts'),
            'std' => '{+Director page+:{+id+:+director-page+,+color+:++,+bgimage+:++,+page+:+director+,+title+:++,+subtitle+:++},+Post Slider+:{+id+:+post-slider+,+color+:++,+bgimage+:++,+page+:+post_slider+,+title+:++,+subtitle+:++},+Recent Projects+:{+id+:+recent-projects+,+color+:++,+bgimage+:++,+page+:+recent_projects+,+title+:+Recent Projects Title+,+subtitle+:+Recent Projects Subtitle+}}'
        ),
    ),
);

$sections[] = array(
    'title' => __('Home Settings', 'nhp-opts'),
    'desc' => __('<p class="description">Set blocks position, enable or disable them.</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_020_home.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'homepage_title_description_text',
            'type' => 'textarea',
            'title' => __('Homepage title of description text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here title of the description in homepage', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'About company'
        ),
        array(
            'id' => 'homepage_subtitle_description_text',
            'type' => 'textarea',
            'title' => __('Homepage subtitle of description text', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Type here subtitle of the description in homepage', 'nhp-opts'),
            'validate' => 'html', //see http://codex.wordpress.org/Function_Reference/wp_kses_post
            'std' => 'About company'
        ),
        array(
            'id' => 'homepage_blocks',
            'type' => 'sorter',
            'title' => __('Blocks Sorter', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Drag and drop your blocks', 'nhp-opts'),
            'std' => '{+enabled+:[+Post Slider+,+Director page+,+Recent Projects+],+disabled+:[+Demo block+]}'
        ),
    ),
);

$font_size_options = array(
    '.' => '',
    '9' => '9px',
    '10' => '10px',
    '11' => '11px',
    '12' => '12px',
    '13' => '13px',
    '14' => '14px',
    '16' => '16px',
    '18' => '18px',
    '20' => '20px',
    '22' => '22px',
    '24' => '24px',
    '32' => '32px',
    '40' => '40px',
);

$sections[] = array(
    'title' => __('Typography', 'nhp-opts'),
    'desc' => __('<p class="description">Typography settings</p>', 'nhp-opts'),
    //all the glyphicons are included in the options folder, so you can hook into them, or link to your own custom ones.
    //You dont have to though, leave it blank for default.
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_100_font.png',
    //Lets leave this as a blank section, no options just some intro text set above.
    'fields' => array(
        array(
            'id' => 'body_font_size',
            'type' => 'select',
            'title' => __('Body main font size', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select font size.', 'nhp-opts'),
            'std' => '#4D4D4D',
            'options' => $font_size_options,
        ),
        array(
            'id' => 'body_font_color',
            'type' => 'color',
            'title' => __('Body main font color', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('Select font color.', 'nhp-opts'),
            'std' => '#4D4D4D'
        ),
        array(
            'id' => 'h1_typo',
            'type' => 'element_font',
            'title' => __('H1 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h1_color',
            'type' => 'color',
            'title' => __('H1 elements color', 'nhp-opts'),
            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),
            'std' => '',

        ),
        array(
            'id' => 'h2_typo',
            'type' => 'element_font',
            'title' => __('H2 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),

            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h2_color',
            'type' => 'color',
            'title' => __('H2 elements color', 'nhp-opts'),
            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),

            'std' => ''
        ),
        array(
            'id' => 'h3_typo',
            'type' => 'element_font',
            'title' => __('H3 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),

            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h3_color',
            'type' => 'color',
            'title' => __('H3 elements color', 'nhp-opts'),
            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),

            'std' => ''
        ),
        array(
            'id' => 'h4_typo',
            'type' => 'element_font',
            'title' => __('H4 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),

            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h4_color',
            'type' => 'color',
            'title' => __('H4 elements color', 'nhp-opts'),
            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),

            'std' => ''
        ),
        array(
            'id' => 'h5_typo',
            'type' => 'element_font',
            'title' => __('H5 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h5_color',
            'type' => 'color',
            'title' => __('H5 elements color', 'nhp-opts'),
            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),

            'std' => ''
        ),
        array(
            'id' => 'h6_typo',
            'type' => 'element_font',
            'title' => __('H6 elements style', 'nhp-opts'),
            'sub_desc' => __('', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),

            'std' => '',
            'selector' =>'',
        ),
        array(
            'id' => 'h6_color',
            'type' => 'color',
            'title' => __('H6 elements color', 'nhp-opts'),

            'sub_desc' => __('Click on field to choose color', 'nhp-opts'),

            'std' => ''
        ),
    ),
);

$sections[] = array(
    'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_157_show_lines.png',
    'title' => __('Layouts Settings', 'nhp-opts'),
    'desc' => __('<p class="description">Configure layouts of different pages</p>', 'nhp-opts'),
    'fields' => array(
        array(
            'id' => 'pages_layout',
            'type' => 'radio_img',
            'title' => __('Created Pages Layout', 'nhp-opts'),
            'sub_desc' => __('Select one of layouts for standart pages', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array(
                '1col-fixed' => array('title' => 'No sidebars', 'img' => NHP_OPTIONS_URL.'img/1col.png'),
                '2c-l-fixed' => array('title' => 'Sidebar on left', 'img' => NHP_OPTIONS_URL.'img/2cl.png'),
                '2c-r-fixed' => array('title' => 'Sidebar on right', 'img' => NHP_OPTIONS_URL.'img/2cr.png'),
                '3c-l-fixed' => array('title' => '2 left sidebars', 'img' => NHP_OPTIONS_URL.'img/3cl.png'),
                '3c-fixed' => array('title' => '2 sidebars', 'img' => NHP_OPTIONS_URL.'img/3cc.png'),
                '3c-r-fixed' => array('title' => '2 right sidebars', 'img' => NHP_OPTIONS_URL.'img/3cr.png'),
            ),//Must provide key => value(array:title|img) pairs for radio options
            'std' => '1col-fixed'
        ),
        array(
            'id' => 'archive_layout',
            'type' => 'radio_img',
            'title' => __('Archive Pages Layout', 'nhp-opts'),
            'sub_desc' => __('Select one of layouts for archive pages', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array(
                '1col-fixed' => array('title' => 'No sidebars', 'img' => NHP_OPTIONS_URL.'img/1col.png'),
                '2c-l-fixed' => array('title' => 'Sidebar on left', 'img' => NHP_OPTIONS_URL.'img/2cl.png'),
                '2c-r-fixed' => array('title' => 'Sidebar on right', 'img' => NHP_OPTIONS_URL.'img/2cr.png'),
                '3c-l-fixed' => array('title' => '2 left sidebars', 'img' => NHP_OPTIONS_URL.'img/3cl.png'),
                '3c-fixed' => array('title' => '2 sidebars', 'img' => NHP_OPTIONS_URL.'img/3cc.png'),
                '3c-r-fixed' => array('title' => '2 right sidebars', 'img' => NHP_OPTIONS_URL.'img/3cr.png'),
            ),//Must provide key => value(array:title|img) pairs for radio options
            'std' => '2c-l-fixed'
        ),
        array(
            'id' => 'single_layout',
            'type' => 'radio_img',
            'title' => __('Single Pages Layout', 'nhp-opts'),
            'sub_desc' => __('Select one of layouts for single pages', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array(
                '1col-fixed' => array('title' => 'No sidebars', 'img' => NHP_OPTIONS_URL.'img/1col.png'),
                '2c-l-fixed' => array('title' => 'Sidebar on left', 'img' => NHP_OPTIONS_URL.'img/2cl.png'),
                '2c-r-fixed' => array('title' => 'Sidebar on right', 'img' => NHP_OPTIONS_URL.'img/2cr.png'),
                '3c-l-fixed' => array('title' => '2 left sidebars', 'img' => NHP_OPTIONS_URL.'img/3cl.png'),
                '3c-fixed' => array('title' => '2 sidebars', 'img' => NHP_OPTIONS_URL.'img/3cc.png'),
                '3c-r-fixed' => array('title' => '2 right sidebars', 'img' => NHP_OPTIONS_URL.'img/3cr.png'),
            ),//Must provide key => value(array:title|img) pairs for radio options
            'std' => '2c-l-fixed'
        ),
        array(
            'id' => 'search_layout',
            'type' => 'radio_img',
            'title' => __('Search Page Layout', 'nhp-opts'),
            'sub_desc' => __('Select one of layouts for search page', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array(
                '1col-fixed' => array('title' => 'No sidebars', 'img' => NHP_OPTIONS_URL.'img/1col.png'),
                '2c-l-fixed' => array('title' => 'Sidebar on left', 'img' => NHP_OPTIONS_URL.'img/2cl.png'),
                '2c-r-fixed' => array('title' => 'Sidebar on right', 'img' => NHP_OPTIONS_URL.'img/2cr.png'),
                '3c-l-fixed' => array('title' => '2 left sidebars', 'img' => NHP_OPTIONS_URL.'img/3cl.png'),
                '3c-fixed' => array('title' => '2 sidebars', 'img' => NHP_OPTIONS_URL.'img/3cc.png'),
                '3c-r-fixed' => array('title' => '2 right sidebars', 'img' => NHP_OPTIONS_URL.'img/3cr.png'),
            ),//Must provide key => value(array:title|img) pairs for radio options
            'std' => '2c-l-fixed'
        ),
        array(
            'id' => '404_layout',
            'type' => 'radio_img',
            'title' => __('404 Page Layout', 'nhp-opts'),
            'sub_desc' => __('Select one of layouts for 404 page', 'nhp-opts'),
            'desc' => __('', 'nhp-opts'),
            'options' => array(
                '1col-fixed' => array('title' => 'No sidebars', 'img' => NHP_OPTIONS_URL.'img/1col.png'),
                '2c-l-fixed' => array('title' => 'Sidebar on left', 'img' => NHP_OPTIONS_URL.'img/2cl.png'),
                '2c-r-fixed' => array('title' => 'Sidebar on right', 'img' => NHP_OPTIONS_URL.'img/2cr.png'),
                '3c-l-fixed' => array('title' => '2 left sidebars', 'img' => NHP_OPTIONS_URL.'img/3cl.png'),
                '3c-fixed' => array('title' => '2 sidebars', 'img' => NHP_OPTIONS_URL.'img/3cc.png'),
                '3c-r-fixed' => array('title' => '2 right sidebars', 'img' => NHP_OPTIONS_URL.'img/3cr.png'),
            ),//Must provide key => value(array:title|img) pairs for radio options
            'std' => '2c-l-fixed'
        )
    ),
);
    //var_dump(get_option($args['opt_name']));

	$tabs = array();
			
	if (function_exists('wp_get_theme')){
		$theme_data = wp_get_theme();
		$theme_uri = $theme_data->get('ThemeURI');
		$description = $theme_data->get('Description');
		$author = $theme_data->get('Author');
		$version = $theme_data->get('Version');
		$tags = $theme_data->get('Tags');
	}else{
		$theme_data = get_theme_data(trailingslashit(get_stylesheet_directory()).'style.css');
		$theme_uri = $theme_data['URI'];
		$description = $theme_data['Description'];
		$author = $theme_data['Author'];
		$version = $theme_data['Version'];
		$tags = $theme_data['Tags'];
	}	

	$theme_info = '<div class="nhp-opts-section-desc">';
	$theme_info .= '<p class="nhp-opts-theme-data description theme-uri">'.__('<strong>Theme URL:</strong> ', 'nhp-opts').'<a href="'.$theme_uri.'" target="_blank">'.$theme_uri.'</a></p>';
	$theme_info .= '<p class="nhp-opts-theme-data description theme-author">'.__('<strong>Author:</strong> ', 'nhp-opts').$author.'</p>';
	$theme_info .= '<p class="nhp-opts-theme-data description theme-version">'.__('<strong>Version:</strong> ', 'nhp-opts').$version.'</p>';
	$theme_info .= '<p class="nhp-opts-theme-data description theme-description">'.$description.'</p>';
	$theme_info .= '<p class="nhp-opts-theme-data description theme-tags">'.__('<strong>Tags:</strong> ', 'nhp-opts').implode(', ', (array)$tags).'</p>';
	$theme_info .= '</div>';



	$tabs['theme_info'] = array(
					'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_195_circle_info.png',
					'title' => __('Theme Information', 'nhp-opts'),
					'content' => $theme_info
					);
	
	if(file_exists(trailingslashit(get_stylesheet_directory()).'README.html')){
		$tabs['theme_docs'] = array(
						'icon' => NHP_OPTIONS_URL.'img/glyphicons/glyphicons_071_book.png',
						'title' => __('Documentation', 'nhp-opts'),
						'content' => nl2br(file_get_contents(trailingslashit(get_stylesheet_directory()).'README.html'))
						);
	}//if

	global $NHP_Options;
	$NHP_Options = new NHP_Options($sections, $args, $tabs);

}//function
add_action('init', 'setup_framework_options', 0);

/*
 * 
 * Custom function for the callback referenced above
 *
 */
function my_custom_field($field, $value){
	print_r($field);
	print_r($value);

}//function

/*
 * 
 * Custom function for the callback validation referenced above
 *
 */
function validate_callback_function($field, $value, $existing_value){
	
	$error = false;
	$value =  'just testing';
	/*
	do your validation
	
	if(something){
		$value = $value;
	}elseif(somthing else){
		$error = true;
		$value = $existing_value;
		$field['msg'] = 'your custom error message';
	}
	*/
	
	$return['value'] = $value;
	if($error == true){
		$return['error'] = $field;
	}
	return $return;
	
}//function
?>