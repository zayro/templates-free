<?php

add_action('init', 'of_options');

if (!function_exists('of_options')) {

    function of_options() {

//Access the WordPress Categories via an Array
        $of_categories = array();
        $of_categories_obj = get_categories('hide_empty=0');
        foreach ($of_categories_obj as $of_cat) {
            $of_categories[$of_cat->cat_ID] = $of_cat->cat_name;
        }
        $categories_tmp = array_unshift($of_categories, "Select a category:");

//Access the WordPress Pages via an Array
        $of_pages = array();
        $of_pages_obj = get_pages('sort_column=post_parent,menu_order');
        foreach ($of_pages_obj as $of_page) {
            $of_pages[$of_page->ID] = $of_page->post_name;
        }
        $of_pages_tmp = array_unshift($of_pages, "Select a page:");

//Testing 
        $of_options_select = array("one", "two", "three", "four", "five");
        $of_options_radio = array("light" => "Light", "dark" => "Dark");
        $of_options_homepage_blocks = array(
            "disabled" => array(
                "placebo" => "placebo", //REQUIRED!
                "block_one" => "Block One",
                "block_two" => "Block Two",
                "block_three" => "Block Three",
            ),
            "enabled" => array(
                "placebo" => "placebo", //REQUIRED!
                "block_four" => "Block Four",
            ),
        );


//Stylesheets Reader
        $alt_stylesheet_path = LAYOUT_PATH;
        $alt_stylesheets = array();

        if (is_dir($alt_stylesheet_path)) {
            if ($alt_stylesheet_dir = opendir($alt_stylesheet_path)) {
                while (($alt_stylesheet_file = readdir($alt_stylesheet_dir)) !== false) {
                    if (stristr($alt_stylesheet_file, ".css") !== false) {
                        $alt_stylesheets[] = $alt_stylesheet_file;
                    }
                }
            }
        }
        
//Background Pattern Reader
        global $pattern_images;
        $pattern_images_path = get_template_directory() . '/images/bg/'; // change this to where you store your bg images
        $pattern_images_url = get_template_directory_uri() . '/images/bg/'; // change this to where you store your bg images
        $pattern_images = array();
        if (is_dir($pattern_images_path)) {
            if ($pattern_images_dir = opendir($pattern_images_path)) {
                $i = 0;
                while (($pattern_images_file = readdir($pattern_images_dir)) !== false) {
                    if (stristr($pattern_images_file, ".png") !== false || stristr($pattern_images_file, ".jpg") !== false) {
                        $i++;
                        $pattern_images[$pattern_images_file] = $pattern_images_url . $pattern_images_file;
                    }
                }
            }
        }

//Social Position Images Reader
        $social_images_path = get_template_directory() . '/framework/images/social-option/'; // change this to where you store your bg images
        $social_images_url = get_template_directory_uri() . '/framework/images/social-option/'; // change this to where you store your bg images
        $social_images = array();
        if (is_dir($social_images_path)) {
            if ($social_images_dir = opendir($social_images_path)) {
                while (($social_images_file = readdir($social_images_dir)) !== false) {
                    if (stristr($social_images_file, ".png") !== false || stristr($social_images_file, ".jpg") !== false) {
                        $social_images[] = $social_images_url . $social_images_file;
                    }
                }
            }
        }
        

        
//Post Size Images Reader
        $postsize_images_path = get_template_directory() . '/framework/images/post-size/'; // change this to where you store your bg images
        $postsize_images_url = get_template_directory_uri() . '/framework/images/post-size/'; // change this to where you store your bg images
        $postsize_images = array();
        if (is_dir($postsize_images_path)) {
            if ($postsize_images_dir = opendir($postsize_images_path)) {
                $i = 0;
                while (($postsize_images_file = readdir($postsize_images_dir)) !== false) {
                    if (stristr($postsize_images_file, ".png") !== false || stristr($postsize_images_file, ".jpg") !== false) {
                        $i++;
                        $postsize_images[$postsize_images_file] = $postsize_images_url . $postsize_images_file;
                    }
                }
            }
        }

        /* ----------------------------------------------------------------------------------- */
        /* TO DO: Add options/functions that use these */
        /* ----------------------------------------------------------------------------------- */

//More Options
        $uploads_arr = wp_upload_dir();
        $all_uploads_path = $uploads_arr['path'];
        $all_uploads = get_option('of_uploads');
        $other_entries = array("Select a number:", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19");
        $body_repeat = array("no-repeat", "repeat-x", "repeat-y", "repeat");
        $body_pos = array("top left", "top center", "top right", "center left", "center center", "center right", "bottom left", "bottom center", "bottom right");

// Image Alignment radio box
        $of_options_thumb_align = array("alignleft" => "Left", "alignright" => "Right", "aligncenter" => "Center");

// Image Links to Options
        $of_options_image_link_to = array("image" => "The Image", "post" => "The Post");


        /* ----------------------------------------------------------------------------------- */
        /* The Options Array */
        /* ----------------------------------------------------------------------------------- */

// Set the Options Array
        global $of_options;
        $of_options = array();

        /* ----------------------------- GENERAL SETTINGS ----------------------------------- */

        $of_options[] = array("name" => "General Settings",
            "type" => "heading");

        $url = ADMIN_DIR . '../framework/images/layouts/';

        $of_options[] = array("name" => "Logo image",
            "desc" => "Upload your logo image here. If you didn't add image, your logo comes from <tt>Site title</tt> text",
            "id" => "logo_image",
            "std" => "",
            "type" => "upload");
        
        $of_options[] = array("name" => "Favicon image",
            "desc" => "Upload a 16px x 16px image that will represent your website's favicon. To ensure cross-browser compatibility, we recommend converting the favicon into .ico format before uploading. (<a href='http://www.favicon.cc' target='_blank'>www.favicon.cc</a>)",
            "id" => "favicon",
            "std" => "",
            "type" => "upload");
        
        $of_options[] = array("name" => "Modal mode",
            "desc" => "If turn it OFF, it goes to single page when you click on the posts from blog/category.",
            "id" => "modal_mode",
            "std" => 1,
            "type" => "checkbox");
        
        $of_options[] = array("name" => "Auto Infinite Scroll",
            "desc" => "If you turn this option ON, your blog will auto scroll to next page when you go to bottom of your site.",
            "id" => "auto_infinite_scroll",
            "std" => 1,
            "type" => "checkbox");

        $of_options[] = array("name" => "Post size",
            "desc" => "Please select default post size of your site.",
            "id" => "item_size",
            "std" => $postsize_images_url . "01.png",
            "type" => "tiles",
            "options" => $postsize_images);
  
        $of_options[] = array("name" => "Tracking code",
            "desc" => "Please include your Google analytics or other tracking code here. It is official site of the Google <a href='http://www.google.com/analytics/' target='_blank'>analytics</a>.",
            "id" => "google_analytics",
            "std" => "",
            "type" => "textarea");
		
		$of_options[] = array("name" => "Custom CSS",
            "desc" => "If you have advanced style changes, you can include here your custom CSS. Your included style will always priviliged than standard style.",
            "id" => "custom_css",
            "std" => "",
            "type" => "textarea");
        
        /* ----------------------------- ADDITIONAL OPTIONS ----------------------------------- */

        $of_options[] = array("name" => "Additional Options",
            "type" => "heading");
        
        $of_options[] = array("name" => "Post order type",
            "desc" => "Control post order on category, archive, search result pages (default pages). Note: Blog page has individual option in their page options section.",
            "id" => "order_type",
            "std" => "Date",
            "options" => Array('Date', 'Date ASC', 'Title', 'Title ASC', 'Random'),
            "type" => "select");
        
        $of_options[] = array("name" => "Allow post comment",
            "desc" => "If turn it OFF, it will be close comment function from all the posts.",
            "id" => "post_comment",
            "std" => 1,
            "type" => "checkbox");
                
        $of_options[] = array("name" => "Allow page comment",
            "desc" => "If turn it OFF, it will be close comment function from all the pages.",
            "id" => "page_comment",
            "std" => 1,
            "type" => "checkbox");
			
		$of_options[] = array("name" => "Allow author on post",
            "desc" => "If turn it ON, it will be show about author from all the posts.",
            "id" => "post_author",
            "std" => 1,
            "type" => "checkbox");
                
        $of_options[] = array("name" => "Allow author on page",
            "desc" => "If turn it ON, it will be show about author from all the pages.",
            "id" => "page_author",
            "std" => 1,
            "type" => "checkbox");
        
        $of_options[] = array("name" => "Use facebook comment?",
            "desc" => "If turn it ON, site comment will show by facebook comments.",
            "id" => "facebook_comment",
            "std" => 0,
			"folds" => 1,
            "show" => "facebook_app_id,comment_perpage",
            "type" => "checkbox");

        $of_options[] = array("name" => "Facebook App ID",
            "desc" => "Please include your facebook App ID. You can get your appid from <a href='http://developers.facebook.com/docs/' target='_blank'>here</a>.",
            "id" => "facebook_app_id",
            "std" => "",
			"fold" => "facebook_comment",
            "type" => "text");

        $of_options[] = array("name" => "Comments per page",
            "desc" => "Please select comment count pagination of facebook comments.",
            "id" => "comment_perpage",
            "std" => "10",
			"fold" => "facebook_comment",
            "type" => "text");
        

        /* ----------------------------- FONT OPTIONS ----------------------------------- */

        $of_options[] = array("name" => "Font Options",
            "type" => "heading");

        $of_options[] = array("name" => "General font",
            "id" => "general_font",
            "std" => array('size' => '12px', 'height' => '18px', 'face' => 'Helvetica Neue, Helvetica, Arial, sans-serif', 'style' => 'normal', 'color' => '#707070'),
            "type" => "typography");

        $of_options[] = array("name" => "Link decoration",
            "id" => "link_decoration",
            "std" => 'none',
            "type" => "select",
            "options" => array('blink', 'inherit', 'line-through', 'none', 'overline', 'underline'));

        $of_options[] = array("name" => "Post title in Blog",
            "id" => "blog_title",
            "std" => array('size' => '14px', 'height' => '20px', 'style' => 'bold'),
            "type" => "typography");

        $of_options[] = array("name" => "Single post title",
            "id" => "single_title",
            "std" => array('size' => '24px', 'height' => '30px', 'style' => 'bold'),
            "type" => "typography");

        $of_options[] = array("name" => "Sidebar title",
            "id" => "sidebar_title",
            "std" => array('size' => '9px', 'height' => '9px', 'style' => 'bold'),
            "type" => "typography");

        $of_options[] = array("name" => "Footer text",
            "id" => "footer_text",
            "std" => array('size' => '9px', 'height' => '15px', 'style' => 'normal'),
            "type" => "typography");
        
        /* ----------------------------- SKIN OPTIONS ----------------------------------- */

        $of_options[] = array("name" => "Skin Options",
            "type" => "heading");
        
        $of_options[] = array("name" => "Background pattern",
            "desc" => "Select pattern.",
            "id" => "bg_pattern",
            "std" => $pattern_images_url . "bg10.png",
            "type" => "tiles",            
            "options" => $pattern_images,
        );
		
        $of_options[] = array("name" => "Background color",
            "desc" => "Choose color.",
            "id" => "bg_color",
            "std" => "#C0C0C0",
            "type" => "color");
 
        $of_options[] = array("name" => "Active custom background image",
            "desc" => "If turn it ON, show your image for background. This option works overwrite previous pattern and bg color option.",
            "id" => "custom_bg_enable",
            "std" => 0,
			"folds" => 1,
            "show" => "custom_bg,bg_options",
            "hide" => "bg_pattern,bg_color",
            "type" => "checkbox");
        
        $of_options[] = array("name" => "Custom background image",
            "desc" => "Upload a background image for body section of the site. You can get amazing background patterns from <a href='http://subtlepatterns.com' target='_blank'>SubtlePatterns.com</a>. Have a nice customizing =)",
            "id" => "custom_bg",
            "std" => "",
			"fold" => "custom_bg_enable",
            "type" => "media",
        );

        $of_options[] = array("name" => "Properties",
            "desc" => "Properties of custom background image.",
            "id" => "bg_options",
            "std" => array('color' => '#F4F4F4', 'repeat' => 'repeat', 'position' => 'left top', 'attachment' => 'scroll'),
			"fold" => "custom_bg_enable",
            "type" => "background",
        );
        
        /* ----------------------------- CUSTOM SIDEBAR ----------------------------------- */

        $of_options[] = array("name" => "Custom sidebar",
            "type" => "heading");
		global $data;
		$default = isset($data["custom_sidebar"]) ? $data["custom_sidebar"] : "";
        $of_options[] = array("name" => "Custom sidebar",
            "desc" => "You can create unlimited siderbars on your site. You should add some widgets <strong>Appearance=><a href='widgets.php'>Widgets</a></strong> after you have add new sidebar here.",
            "id" => "custom_sidebar",
            "std" => $default,
            "type" => "sidebar");
        
        /* ----------------------------- FOOTER OPTIONS ----------------------------------- */
        
        $of_options[] = array("name" => "Footer Options",
            "type" => "heading");

        $of_options[] = array("name" => "Footer Text",
            "desc" => "Please insert your copyright text or footer element here. Also you can add here simple html tags too.",
            "id" => "copyrighttext",
            "std" => 'Copyright 2012. Powered by <a href="http://www.wordpress.org">WordPress</a><br> <span><a href="#"><strong>'.THEMENAME.'</strong> theme</a> by <a href="http://www.themeton.com"><strong>ThemeTon</strong></a></span>',
            "type" => "textarea"
            );
        
         /* ----------------------------- SOCIAL LINKS ----------------------------------- */
        $of_options[] = array("name" => "Social options",
            "type" => "heading");

        $of_options[] = array("name" => "Social shares",
            "desc" => "Activation of Social shares.",
            "id" => "social_media",
            "std" => "",
			"folds" => 1,
            "show" => "sharethis_key,social_position,social_facebook,social_twitter,social_googlePlus,social_linkedin,social_pinterest,social_email",
            "type" => "checkbox");
		
		$of_options[] = array("name" => "Sharethis Key",
			"desc" => "You can get your publisher key <a href='http://sharethis.com/' target='_blank'>here</a>. If you need more information please<a href='http://www.vodeblog.com/2010/09/how-to-get-your-sharethis-publisher-key-in-wordpress/' target='_blank'> read it</a>.",
            "id" => "sharethis_key",
            "std" => '',
			"fold" => "social_media",
            "type" => "text");

        $of_options[] = array("name" => "Position Options",
            "desc" => "All those selections works on Modal mode. If you go to directly in single page, sharing section shows just after or before content.",
            "id" => "social_position",
            "std" => $social_images_url . "01.png",
            "type" => "tiles",
			"fold" => "social_media",
            "options" => $social_images);

        $of_options[] = array("name" => "Facebook share",
            "id" => "social_facebook",
            "std" => 1,
			"fold" => "social_media",
            "type" => "checkbox");			
		$of_options[] = array("name" => "Twitter share",
            "id" => "social_twitter",
            "std" => 1,
			"fold" => "social_media",
            "type" => "checkbox");
        $of_options[] = array("name" => "GooglePlus share",
            "id" => "social_googlePlus",
            "std" => 0,
			"fold" => "social_media",
            "type" => "checkbox");
		$of_options[] = array("name" => "Linkedin share",
            "id" => "social_linkedin",
            "std" => 0,
			"fold" => "social_media",
            "type" => "checkbox");
        $of_options[] = array("name" => "Pinterest share",
            "id" => "social_pinterest",
            "std" => 1,
			"fold" => "social_media",
            "type" => "checkbox");
        $of_options[] = array("name" => "Email this button",
            "id" => "social_email",
            "std" => 0,
			"fold" => "social_media",
            "type" => "checkbox");
			
			
		// Backup Options
		$of_options[] = array( "name" => "Backup Options",
							"type" => "heading");
							
		$of_options[] = array( "name" => "Backup and Restore Options",
							"id" => "of_backup",
							"std" => "",
							"type" => "backup",
							"desc" => 'You can use the two buttons below to backup your current options, and then restore it back at a later time. This is useful if you want to experiment on the options but would like to keep the old settings in case you need it back.',
							);
							
		$of_options[] = array( "name" => "Transfer Theme Options Data",
							"id" => "of_transfer",
							"std" => "",
							"type" => "transfer",
							"desc" => 'You can tranfer the saved options data between different installs by copying the text inside the text box. To import data from another install, replace the data in the text box with the one from another install and click "Import Options".',
							);
    }   
}
?>
