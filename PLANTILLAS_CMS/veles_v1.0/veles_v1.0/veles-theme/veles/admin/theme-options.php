<?php
global $data;
add_action('init','of_options');

if (!function_exists('of_options')) {
function of_options(){
	
//Access the WordPress Categories via an Array
$of_categories = array();  
$of_categories_obj = get_categories('hide_empty=0');
foreach ($of_categories_obj as $of_cat) {
    $of_categories[$of_cat->cat_ID] = $of_cat->cat_name;}
$categories_tmp = array_unshift($of_categories, "Select a category:");    
       
//Access the WordPress Pages via an Array
$of_pages = array();
$of_pages_obj = get_pages('sort_column=post_parent,menu_order');    
foreach ($of_pages_obj as $of_page) {
    $of_pages[$of_page->ID] = $of_page->post_name; }
$of_pages_tmp = array_unshift($of_pages, "Select a page:");       

$of_logo_select = array("1" => "Image", "2" => "Text");
$of_slider_select = array("1" => "AsyncSlider", "2" => "Nivo Slider", "3" => "Vertical Accordion Slider","4" => "Accordion Slider", "5" => "Static Homepage", "6" => "Video Block");
$of_slider_select_2 = array("1" => "AsyncSlider", "2" => "Nivo Slider", "3" => "Vertical Accordion Slider","4" => "Accordion Slider", "5" => "Static Homepage", "6" => "Video Block");

$of_index_block_select = array("1" => "Two Blocks", "2" => "Four Blocks");
$of_index_block3_select = array("1" => "Just Header and Text", "2" => "One Skill", "3" => "Two Skills", "4" => "Three Skills", "5" => "Four Skills", "6" => "Five Skills", "7" => "Six Skills", "8" => "Seven Skills",);
$of_about_block_select = array("1" => "One Block", "2" => "Two Blocks", "3" => "Three Blocks", "4" => "Four Blocks", "5" => "Six Blocks");
$of_services_block_select = array("1" => "One Block", "2" => "Two Blocks", "3" => "Three Blocks", "4" => "Four Blocks", "5" => "Six Blocks");
$of_index2_block_select = array("1" => "One Block", "2" => "Two Blocks", "3" => "Three Blocks", "4" => "Four Blocks", "5" => "Six Blocks");
$of_index3_block_select = array("1" => "One Block", "2" => "Two Blocks", "3" => "Three Blocks", "4" => "Four Blocks", "5" => "Six Blocks");

// Portfolio Style 
$of_portfolio_style = array("1" => "Portfolio and Right Sidebar","2" => "Portfolio and Left Sidebar","3" => "3 Columns Portfolio","4" => "4 Columns Portfolio"); 
$of_top_line_style = array("1" => "Line Without Content","2" => "Line With Content"); 
$default_image_slider_async['url'] = get_template_directory_uri().'/images/slide-1.png';
$default_image_slider_nivo['url']= get_template_directory_uri().'/images/nivo_slide-1.jpg';
//Testing 
$of_options_select = array("one","two","three","four","five"); 
$of_options_radio = array("one" => "One","two" => "Two","three" => "Three","four" => "Four","five" => "Five");
$of_options_contact = array("top_text" => "Top text","phone" => "Phone","fax" => "Fax","website" => "WebSite","email" => "E-mail","bottom_text" => "Bottom text");

$of_options_social = array("Twitter" => "Twitter","Facebook" => "Facebook","Google+" => "Google+","Vimeo" => "Vimeo","Dribbble" => "Dribbble");


$of_options_homepage_blocks = array( 
	"disabled" => array (
		"placebo" 		=> "placebo", //REQUIRED!
		"block_one"		=> "Block One",
		"block_two"		=> "Block Two",
		"block_three"	=> "Block Three",
	), 
	"enabled" => array (
		"placebo" => "placebo", //REQUIRED!
		"block_four"	=> "Block Four",
	),
);


//Stylesheets Reader
$alt_stylesheet_path = LAYOUT_PATH;
$alt_stylesheets = array();

if ( is_dir($alt_stylesheet_path) ) {
    if ($alt_stylesheet_dir = opendir($alt_stylesheet_path) ) { 
        while ( ($alt_stylesheet_file = readdir($alt_stylesheet_dir)) !== false ) {
            if(stristr($alt_stylesheet_file, ".css") !== false) {
                $alt_stylesheets[] = $alt_stylesheet_file;
            }
        }    
    }
}

//Background Images Reader
$bg_images_path = STYLESHEETPATH. '/images/bg/'; // change this to where you store your bg images
$bg_images_url = get_bloginfo('template_url').'/images/bg/'; // change this to where you store your bg images
$bg_images = array();

if ( is_dir($bg_images_path) ) {
    if ($bg_images_dir = opendir($bg_images_path) ) { 
        while ( ($bg_images_file = readdir($bg_images_dir)) !== false ) {
            if(stristr($bg_images_file, ".png") !== false || stristr($bg_images_file, ".jpg") !== false) {
                $bg_images[] = $bg_images_url . $bg_images_file;
            }
        }    
    }
}

/*-----------------------------------------------------------------------------------*/
/* TO DO: Add options/functions that use these */
/*-----------------------------------------------------------------------------------*/

//More Options
$uploads_arr = wp_upload_dir();
$all_uploads_path = $uploads_arr['path'];
$all_uploads = get_option('of_uploads');
$other_entries = array("Select a number:","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19");
$body_repeat = array("no-repeat","repeat-x","repeat-y","repeat");
$body_pos = array("top left","top center","top right","center left","center center","center right","bottom left","bottom center","bottom right");

// Image Alignment radio box
$of_options_thumb_align = array("alignleft" => "Left","alignright" => "Right","aligncenter" => "Center"); 

// Image Links to Options
$of_options_image_link_to = array("image" => "The Image","post" => "The Post"); 


/*-----------------------------------------------------------------------------------*/
/* The Options Array */
/*-----------------------------------------------------------------------------------*/

// Set the Options Array
global $of_options;
$of_options = array();

		
		
		
					
$of_options[] = array( "name" => "General Settings",
					"type" => "heading");

$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">General Settings</h3>",
					"icon" => true,
					"type" => "info");
					
$of_options[] = array("name" =>  "",
					"desc" => "Upload a 16px x 16px Png/Gif image that will represent your website's favicon.",
					"id" => "media_upload_favicon",
					"std" => "http://www.orange-idea.com/veles/fav.png",
					"type" => "upload"); 



$of_options[] = array( "name" => "Type of Top Line",
					"desc" => "",
					"id" => "top_line_style",
					"std" => "Line With Content",
					"type" => "select",
					"options" => $of_top_line_style);


$of_options[] = array( "name" =>  "",
					"desc" => "Top Line content",
					"id" => "top_line_block1",
					"std" => "",
					"type" => "text");


$of_options[] = array( "name" =>  "",
					"desc" => "Show Search Form?",
					"id" => "top_line_search",
					"std" => true,
					"type" => "checkbox"); 






$of_options[] = array( "name" => "Please select type of logo",
					"desc" => "Normal Select Box.",
					"id" => "logo_select",
					"std" => "Image",
					"type" => "select",
					"options" => $of_logo_select);

$of_options[] = array("name" =>  "",
					"desc" => "If you want use image as logo please upload it",
					"id" => "media_upload_logo",
					"std" => "http://www.orange-idea.com/veles/logo.png",
					"type" => "media");
					
$of_options[] = array("name" =>  "",
					"desc" => "If you want use text as logo please type here",
					"id" => "logo_text",
					"std" => 'VELES WP THEME',
					"type" => "text");


$of_options[] = array("name" =>  "",
					"desc" => "If you use text as logo then this is place for slogan",
					"id" => "logo_slogan",
					"std" => "Powerfull and Flexible WordPress Theme",
					"type" => "text");
					
  

$of_options[] = array( "name" =>  "Styling",
					"desc" => "Pick a background color for the theme (default: #fff).",
					"id" => "body_background",
					"std" => "",
					"type" => "color");

$of_options[] = array("name" =>  "",
					"desc" => "Select a background pattern.",
					"id" => "custom_bg",
					"std" => $bg_images_url."main_bg.jpg",
					"type" => "tiles",
					"options" => $bg_images,
					);					

$of_options[] = array("name" =>  "",
					"desc" => "Specify the h1 header font properties",
					"id" => "headers_font_one",
					"std" => array('size' => '38px', 'face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  

$of_options[] = array("name" =>  "",
					"desc" => "Specify the h2 header font properties",
					"id" => "headers_font_two",
					"std" => array('size' => '32px','face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  


$of_options[] = array("name" =>  "",
					"desc" => "Specify the h3 header font properties",
					"id" => "headers_font_three",
					"std" => array('size' => '26px','face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  

$of_options[] = array("name" =>  "",
					"desc" => "Specify the h4 header font properties",
					"id" => "headers_font_four",
					"std" => array('size' => '20px','face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  

$of_options[] = array("name" =>  "",
					"desc" => "Specify the h5 header font properties",
					"id" => "headers_font_five",
					"std" => array('size' => '16px','face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  

$of_options[] = array("name" =>  "",
					"desc" => "Specify the h6 header font properties",
					"id" => "headers_font_six",
					"std" => array('size' => '14px','face' => 'Arial','style' => 'normal','color' => '#000000'),
					"type" => "typography");  

$of_options[] = array("name" =>  "",
					"desc" => "Pick a second color",
					"id" => "colored",
					"std" => "#ff0000",
					"type" => "color");










$of_options[] = array( "name" => "Home Page Style I",
					"type" => "heading");
					
$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Home Page Style I Settings</h3>",
					"icon" => true,
					"type" => "info");

$of_options[] = array( "name" =>  "",
					"desc" => "Select type of slider",
					"id" => "slider_select",
					"std" => "AsyncSlider",
					"type" => "select",
					"options" => $of_slider_select);
					

$of_options[] = array( "name" => "Block I Settings",
					"desc" => "Show Block I ?",
					"id" => "index_block1",
					"std" => true,
					"type" => "checkbox");
					
					
$of_options[] = array("name" =>  "",
					"desc" => "Please input Block I Header",
					"id" => "index_block1_header",
					"std" => "Who are we?",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Please input Block I Content",
					"id" => "index_block1_text",
					"std" => "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo",
					"type" => "textarea");
					
$of_options[] = array("name" =>  "",
					"desc" => "Please input URL if you want show 'Read More' button",
					"id" => "index_block1_url",
					"std" => "/about_us/",
					"type" => "text");
					
$of_options[] = array( "name" => "Block II Settings",
					"desc" => "Show Block II ?",
					"id" => "index_block2",
					"std" => true,
					"type" => "checkbox");															


$of_options[] = array("name" =>  "",
					"desc" => "Block II Header",
					"id" => "index_block2_header",
					"std" => "Our Specialization",
					"type" => "text");
	
$of_options[] = array("name" =>  "",
					"desc" => "Some text after Block II Header",
					"id" => "index_block2_subheader",
					"std" => "Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi.",
					"type" => "textarea");


$of_options[] = array("name" =>  "",
					"desc" => "How many scpecialization blocks?",
					"id" => "block_select",
					"std" => "Two Blocks",
					"type" => "select",
					"options" => $of_index_block_select);					

$of_options[] = array("name" =>  "",
					"desc" => "Show Icons?",
					"id" => "index_block2_icons",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array( "name" => "Specialization 1 Settings",
					"desc" => "Icon",
					"id" => "index_block2_spec1_img",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "upload");
					
$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "index_block2_spec1_header",
					"std" => "Website Creation",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index_block2_spec1_text",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");




$of_options[] = array( "name" => "Specialization 2 Settings",
					"desc" => "Iconn",
					"id" => "index_block2_spec2_img",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "upload");
					
$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "index_block2_spec2_header",
					"std" => "Search Engine Optimization",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index_block2_spec2_text",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");



$of_options[] = array( "name" => "Specialization 3 Settings",
					"desc" => "Icon",
					"id" => "index_block2_spec3_img",
					"std" => "http://www.orange-idea.com/veles/icon_3.png",
					"mod" => "min",
					"type" => "upload");
					
$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "index_block2_spec3_header",
					"std" => "Walls painting",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index_block2_spec3_text",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");



$of_options[] = array( "name" => "Specialization 4 Settings",
					"desc" => "Icon",
					"id" => "index_block2_spec4_img",
					"std" => "http://www.orange-idea.com/veles/icon_4.png",
					"mod" => "min",
					"type" => "upload");
					
$of_options[] = array( "name" =>  "",
					"desc" => "Header",
					"id" => "index_block2_spec4_header",
					"std" => "Brending",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index_block2_spec4_text",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");


$of_options[] = array( "name" => "Blcok III Settings (Skills)",
					"desc" => "Show Block III ?",
					"id" => "index_block3",
					"std" => true,
					"type" => "checkbox");
					

$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "index_block3_header",
					"std" => "Skills of our team",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Content after Header",
					"id" => "index_block3_subheader",
					"std" => "Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel.",
					"type" => "textarea");	

$of_options[] = array("name" =>  "",
					"desc" => "How many skills?",
					"id" => "skills_select",
					"std" => "Five Skills",
					"type" => "select",
					"options" => $of_index_block3_select);					
					
				

$of_options[] = array("name" =>  "",
					"desc" => "Skill 1 Header",
					"id" => "index_block3_skill1_header",
					"std" => "Web Design",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 1 Percentage",
					"id" => "index_block3_skill1_percent",
					"std" => "90",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Skill 2 Header",
					"id" => "index_block3_skill2_header",
					"std" => "CSS3 styleing",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 2 Percentage",
					"id" => "index_block3_skill2_percent",
					"std" => "60",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Skill 3 Header",
					"id" => "index_block3_skill3_header",
					"std" => "Html5 coding",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 3 Percentage",
					"id" => "index_block3_skill3_percent",
					"std" => "70",
					"type" => "text");
					

$of_options[] = array("name" =>  "",
					"desc" => "Skill 4 Header",
					"id" => "index_block3_skill4_header",
					"std" => "PHP Programming",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 4 Percentage",
					"id" => "index_block3_skill4_percent",
					"std" => "40",
					"type" => "text");
					

$of_options[] = array("name" =>  "",
					"desc" => "A text input field.",
					"id" => "index_block3_skill5_header",
					"std" => "WordPress Development",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 5 Percentage",
					"id" => "index_block3_skill5_percent",
					"std" => "50",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Skill 6 Header",
					"id" => "index_block3_skill6_header",
					"std" => "Skill 6",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 6 Percentage",
					"id" => "index_block3_skill6_percent",
					"std" => "60",
					"type" => "text");
					

$of_options[] = array("name" =>  "",
					"desc" => "Skill 7 Header",
					"id" => "index_block3_skill7_header",
					"std" => "Skill 7",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Skill 7 Percentage",
					"id" => "index_block3_skill7_percent",
					"std" => "70",
					"type" => "text");



$of_options[] = array( "name" => "Blcok IV Settings (Portfolio)",
					"desc" => "Show Block IV ?",
					"id" => "index1_block4",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array( "name" => "",
					"desc" => "Header",
					"id" => "index1_block4_title",
					"std" => "RECENT PROJECTS",
					"type" => "text");					

$of_options[] = array("name" =>  "",
					"desc" => "Content after Header",
					"id" => "index1_block4_content",
					"std" => "Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi.",
					"type" => "textarea");



$of_options[] = array("name" =>  "",
					"desc" => "How many Portfolio Items?.",
					"id" => "index1_portfolio",
					"std" => "4",
					"type" => "text");










$of_options[] = array( "name" => "Home Page Style II",
					"type" => "heading");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Home Page Style II Settings</h3>",
					"icon" => true,
					"type" => "info");



$of_options[] = array( "name" => "Presentation Blocks Settings",
					"desc" => "How many presentation block do you want to show?",
					"id" => "index2_block_select",
					"std" => "Three Blocks",
					"type" => "select",
					"options" => $of_index2_block_select);


$of_options[] = array("name" =>  "",
					"desc" => "Do you want to show icons?",
					"id" => "index2_block1_icons",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array( "name" => "Presentation Block 1 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p1_h",
					"std" => "Easy to Customize",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p1_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p1_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 2 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p2_h",
					"std" => "Browsers Compatible",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p2_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p2_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array(  "name" => "Presentation Block 3 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p3_h",
					"std" => "Full Documentation",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p3_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p3_i",
					"std" => "http://www.orange-idea.com/veles/icon_3.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array(  "name" => "Presentation Block 4 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p4_h",
					"std" => "Block 4 Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p4_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p4_i",
					"std" => "http://www.orange-idea.com/veles/icon_4.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array(  "name" => "Presentation Block 5 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p5_h",
					"std" => "Block 5 Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p5_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p5_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array(  "name" => "Presentation Block 6 Settings",
					"desc" => "Header",
					"id" => "index2_block1_p6_h",
					"std" => "Block 6 Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index2_block1_p6_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index2_block1_p6_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array( "name" => "How many Blog Posts?",
					"desc" => "",
					"id" => "index2_blogs",
					"std" => "1",
					"type" => "text");

$of_options[] = array( "name" => "How many Portfolio Posts?",
					"desc" => "",
					"id" => "index2_portfolio",
					"std" => "2",
					"type" => "text");






$of_options[] = array( "name" => "Home Page Style III",
					"type" => "heading");
					

$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Home Page Style III Settings</h3>",
					"icon" => true,
					"type" => "info");
					
$of_options[] = array( "name" => "Block I Settings",
					"desc" => "Header",
					"id" => "index3_block1_title",
					"std" => "Curent specialization",
					"type" => "text");					

$of_options[] = array("name" =>  "",
					"desc" => "Content after Header",
					"id" => "index3_block1_content",
					"std" => "Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi.",
					"type" => "textarea");
					

$of_options[] = array( "name" =>  "",
					"desc" => "How many Presentation Block?",
					"id" => "index3_block_select",
					"std" => "Six Blocks",
					"type" => "select",
					"options" => $of_index3_block_select);


$of_options[] = array("name" =>  "",
					"desc" => "Do you want to show ICONS?",
					"id" => "index3_block1_icons",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array( "name" => "Presentation Block 1 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p1_h",
					"std" => "Website Creation",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p1_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p1_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 2 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p2_h",
					"std" => "Search Engine Optimization",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p2_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p2_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array( "name" => "Presentation Block 3 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p3_h",
					"std" => "Internet marketing",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p3_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p3_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Presentation Block 4 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p4_h",
					"std" => "Browsers Compatible",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p4_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p4_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array( "name" => "Presentation Block 5 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p5_h",
					"std" => "Brending",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p5_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p5_i",
					"std" => "http://www.orange-idea.com/veles/icon_4.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Presentation Block 6 Settings",
					"desc" => "Header",
					"id" => "index3_block1_p6_h",
					"std" => "Walls Painting",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "index3_block1_p6_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "index3_block1_p6_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");








$of_options[] = array( "name" => "Block II Settings",
					"desc" => "Header",
					"id" => "index3_block2_title",
					"std" => "RECENT PROJECTS",
					"type" => "text");					

$of_options[] = array("name" =>  "",
					"desc" => "Content after Header",
					"id" => "index3_block2_content",
					"std" => "Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi.",
					"type" => "textarea");



$of_options[] = array("name" =>  "",
					"desc" => "How many Portfolio Items?.",
					"id" => "index3_portfolio",
					"std" => "4",
					"type" => "text");







/* About Us */
$of_options[] = array( "name" => "About Us",
					"type" => "heading");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">About Us Template Settings</h3>",
					"icon" => true,
					"type" => "info");
					
$of_options[] = array( "name" => "Block 1 Settings",
					"desc" => "Do you want to show Block1 ?",
					"id" => "about_block1",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "about_block1_header",
					"std" => "SOME WORDS ABOUT <span class='colored'>VELES</span>",
					"type" => "text");					

$of_options[] = array("name" =>  "",
					"desc" => "Content after Header",
					"id" => "about_block1_description",
					"std" => "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing...",
					"type" => "textarea");

$of_options[] = array( "name" => "Presentation Blocks Settings",
					"desc" => "Do you want to show Presentation Blocks?",
					"id" => "about_block1_presentation",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "Do you want to show Icons ?",
					"id" => "about_block1_icons",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "How many Presentation Block?",
					"id" => "about_block_select",
					"std" => "Three Blocks",
					"type" => "select",
					"options" => $of_about_block_select);


$of_options[] = array( "name" => "Presentation Block 1 Settings",
					"desc" => "Header",
					"id" => "about_block1_p1_h",
					"std" => "Easy to Customize",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p1_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p1_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 2 Settings",
					"desc" => "Header",
					"id" => "about_block1_p2_h",
					"std" => "Browsers Compatible",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p2_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p2_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array( "name" => "Presentation Block 3 Settings",
					"desc" => "Header",
					"id" => "about_block1_p3_h",
					"std" => "Full Documentation",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p3_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p3_i",
					"std" => "http://www.orange-idea.com/veles/icon_3.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 4 Settings",
					"desc" => "Header",
					"id" => "about_block1_p4_h",
					"std" => "Block Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p4_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p4_i",
					"std" => "http://www.orange-idea.com/veles/icon_4.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 5 Settings",
					"desc" => "Header",
					"id" => "about_block1_p5_h",
					"std" => "Block Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p5_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p5_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 6 Settings",
					"desc" => "Header",
					"id" => "about_block1_p6_h",
					"std" => "Block Title",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block1_p6_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet vivverra, tortor libero sodales leo eget",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload image for icon",
					"id" => "about_block1_p6_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Block II Settings",
					"desc" => "Do you want to show Block2 ?",
					"id" => "about_block2",
					"std" => true,
					"type" => "checkbox");


$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "about_block2_h",
					"std" => "WHY CHOOSE US / <span class='colored'>OR</span> / WHAT THE HELL IS GOING ON HERE ?",
					"type" => "text");

$of_options[] = array( "name" => "Content",
					"desc" => "A text input field.",
					"id" => "about_block2_t",
					"std" => "Curabitur tempus arcu ac massa vulputate fermentum at non nisi. Curabitur tempus arcu ac massa vulputate fermentum at non nisi. Cras non massa ipsum, lobortis cursus purus.</br></br>Curabitur sed vestibulum diam. Praesent turpis elit, ultricies eget pellentesque quis, tempor id sapien. Morbi accumsan nulla ac urna elementum dapibus. Phasellus eu felis orci, sit amet placerat eros. Sed aliquet iaculis nisi id convallis. Suspendisse id enim et turpis faucibus consectetur.</br></br>Curabitur tempus arcu ac massa vulputate fermentum at non nisi. Cras non massa ipsum, lobortis cursus purus. Curabitur sed vestibulum diam. Praesent turpis elit, ultricies eget pellentesque quis, tempor id sapien.",
					"type" => "textarea");

$of_options[] = array("name" =>  "",
					"desc" => "Do you want to show left image ?",
					"id" => "about_block2_image",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "Upload images using the native media uploader, or define the URL directly",
					"id" => "about_block2_image_upload",
					"std" => "http://www.orange-idea.com/veles/css3.png",
					"type" => "media");	
									
$of_options[] = array( "name" =>  "",
					"desc" => "Do you want to show Special Block ?",
					"id" => "about_block2_spec",
					"std" => true,
					"type" => "checkbox");


$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "about_block2_spec_h",
					"std" => "Be smaprt... please...",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block2_spec_t",
					"std" => "Curabitur tempus arcu ac massa vulputate fermentum at non nisi. Cras non massa ipsum, lobortis cursus purus.</br></br>Curabitur sed vestibulum diam. Praesent turpis elit, ultricies eget pellentesque quis, tempor id sapien. Morbi accumsan nulla ac urna elementum dapibus. Phasellus eu felis orci, sit amet placerat eros. Sed aliquet iaculis nisi id convallis. Suspendisse id enim et turpis faucibus consectetur.",
					"type" => "textarea");



$of_options[] = array( "name" => "Block III Settings",
					"desc" => "Do you want to show Block III",
					"id" => "about_block3",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "about_block3_h",
					"std" => "<span class='colored'>THEY</span> TRUST US:",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "about_block3_t",
					"std" => "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing...",
					"type" => "textarea");


$of_options[] = array("name" =>  "",
					"desc" => "Client 1 Image Upload",
					"id" => "about_block3_image_upload_1",
					"std" => "http://www.orange-idea.com/veles/client-1.png",
					"type" => "media");

$of_options[] = array("name" =>  "",
					"desc" => "Client 2 Image Upload",
					"id" => "about_block3_image_upload_2",
					"std" => "http://www.orange-idea.com/veles/client-2.png",
					"type" => "media");

$of_options[] = array("name" =>  "",
					"desc" => "Client 3 Image Upload",
					"id" => "about_block3_image_upload_3",
					"std" => "http://www.orange-idea.com/veles/client-3.png",
					"type" => "media");

$of_options[] = array("name" =>  "",
					"desc" => "Client 4 Image Upload",
					"id" => "about_block3_image_upload_4",
					"std" => "http://www.orange-idea.com/veles/client-4.png",
					"type" => "media");












$of_options[] = array( "name" => "Services",
					"type" => "heading");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Services Template Settings</h3>",
					"icon" => true,
					"type" => "info");

$of_options[] = array(  "name" => "Block I Settings",
					"desc" => "Do you want to show Block 1?",
					"id" => "services_block1",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "services_block1_title",
					"std" => "OUR <span class='colored'>SERVICES</span>",
					"type" => "text");


$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_content",
					"std" => "<div class='span-8 notopmargin'><img class='' src='http://www.orange-idea.com/veles/imac.png' alt=''/></div>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</br></br>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</br></br>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of lette, as opposed to using 'Content here, content here', making it look like readable English ",
					"type" => "textarea");

$of_options[] = array( "name" => "Block II Settings",
					"desc" => "Header",
					"id" => "services_block_check",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "Do you want to show Icons?",
					"id" => "services_block1_icons",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array("name" =>  "",
					"desc" => "How many Presentation Block do you want to show?",
					"id" => "services_block_select",
					"std" => "Six Blocks",
					"type" => "select",
					"options" => $of_services_block_select);


$of_options[] = array( "name" => "Presentation Block 1 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p1_h",
					"std" => "Website Creation",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p1_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p1_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Presentation Block 2 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p2_h",
					"std" => "Search Engine Optimization",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p2_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p2_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");






$of_options[] = array( "name" => "Presentation Block 3 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p3_h",
					"std" => "Internet marketing",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p3_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p3_i",
					"std" => "http://www.orange-idea.com/veles/icon_1.png",
					"mod" => "min",
					"type" => "media");




$of_options[] = array( "name" => "Presentation Block 4 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p4_h",
					"std" => "Browsers Compatible",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p4_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p4_i",
					"std" => "http://www.orange-idea.com/veles/icon_4.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Presentation Block 5 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p5_h",
					"std" => "Brending",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p5_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p5_i",
					"std" => "http://www.orange-idea.com/veles/icon_3.png",
					"mod" => "min",
					"type" => "media");





$of_options[] = array( "name" => "Presentation Block 6 Setttings",
					"desc" => "Header",
					"id" => "services_block1_p6_h",
					"std" => "Walls painting",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block1_p6_t",
					"std" => "Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec.",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Upload images for icon",
					"id" => "services_block1_p6_i",
					"std" => "http://www.orange-idea.com/veles/icon_2.png",
					"mod" => "min",
					"type" => "media");



$of_options[] = array( "name" => "Block III Settings",
					"desc" => "Do you want to show Block III ?",
					"id" => "services_block3",
					"std" => true,
					"type" => "checkbox");



$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "services_block3_title",
					"std" => "PAY ATTENTION ON OUR SPECIAL OFFER",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Content",
					"id" => "services_block3_content",
					"std" => "<div><img class='' src='http://www.orange-idea.com/veles/discount.png' alt='' /><h6 class='colored'>Only in January 2012</h6><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p><p class='small-italic nobottommargin'>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.</p></div>",
					"type" => "textarea");


$of_options[] = array( "name" => "Testimonials Costumization",
					"desc" => "Do  you want to show testimonials?",
					"id" => "services_block3_testimonials",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array("name" =>  "",
					"desc" => "Block title",
					"id" => "services_block3_testimonials_title",
					"std" => "Clients <span class='colored'>Testimonials</span>",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 1 Content",
					"id" => "services_block3_testimonials_1",
					"std" => "The readable content of a page when looking at its layout.</br></br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
					"type" => "textarea");

$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 1 Author",
					"id" => "services_block3_testimonials_1_author",
					"std" => "Jhon Doe",
					"type" => "text");



$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 2 Content",
					"id" => "services_block3_testimonials_2",
					"std" => "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</br></br>It is a long established fact that a reader will be distracted by the readable content of a page..",
					"type" => "textarea");

$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 2 Author",
					"id" => "services_block3_testimonials_2_author",
					"std" => "Alex Marchel",
					"type" => "text");
					
					
					
$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 3 Content",
					"id" => "services_block3_testimonials_3",
					"std" => "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.",
					"type" => "textarea");

$of_options[] = array("name" =>  "",
					"desc" => "Testimonial 3 Author",
					"id" => "services_block3_testimonials_3_author",
					"std" => "Sam Pitterson",
					"type" => "text");					


















$of_options[] = array( "name" => "Contact Page",
					"type" => "heading");



$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Contacts Template Settings</h3>",
					"icon" => true,
					"type" => "info");

$of_options[] = array("name" =>  "",
					"desc" => "Show Google map ?",
					"id" => "checkbox_google_map",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array( "name" =>  "",
					"desc" => "Google map code",
					"id" => "veles_google_map",
					"std" => 'http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Redmond,+WA,+%D0%A1%D0%A8%D0%90&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=54.533615,114.169922&amp;ie=UTF8&amp;hq=&amp;hnear=%D0%A0%D0%B5%D0%B4%D0%BC%D0%BE%D0%BD%D0%B4,+%D0%9A%D0%B8%D0%BD%D0%B3,+%D0%92%D0%B0%D1%88%D0%B8%D0%BD%D0%B3%D1%82%D0%BE%D0%BD&amp;z=13&amp;ll=47.673988,-122.121512&amp;output=embed',
					"type" => "textarea");

$of_options[] = array( "name" => "Contact Information Settings",
					"desc" => "Show Contact form and contact info?",
					"id" => "checkbox_contact_form",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array("name" =>  "",
					"desc" => "E-mail for Contact form",
					"id" => "contact-mail",
					"std" => 'administrator@fxmail.ru',
					"type" => "text");


$of_options[] = array("name" =>  "",
					"desc" => "Header",
					"id" => "veles_contact_header",
					"std" => "<span class='colored'>Contact</span> information",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Adress",
					"id" => "veles_adress",
					"std" => "123456 Street Name, Los Angeles",
					"type" => "text"); 
					
$of_options[] = array( "name" =>  "",
					"desc" => "Phone",
					"id" => "veles_phone",
					"std" => "(1800) 765-4321",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Fax",
					"id" => "veles_fax",
					"std" => "(1800) 765-4321",
					"type" => "text");
					
$of_options[] = array("name" =>  "",
					"desc" => "Website",
					"id" => "veles_website",
					"std" => "http://yoursitename.com ",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "E-mail",
					"id" => "veles_email",
					"std" => "info@yoursitename.com",
					"type" => "text");



$of_options[] = array(  "name" => "What you want to show?",
					"desc" => "Top Text",
					"id" => "top_text",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array(  "name" => "",
					"desc" => "Phone",
					"id" => "phone",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array(  "name" => "",
					"desc" => "Fax",
					"id" => "fax",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array(  "name" => "",
					"desc" => "WebSite",
					"id" => "website",
					"std" => true,
					"type" => "checkbox");
					
$of_options[] = array(  "name" => "",
					"desc" => "E-mail",
					"id" => "email",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array(  "name" => "",
					"desc" => "Bottom Text",
					"id" => "bottom_text",
					"std" => true,
					"type" => "checkbox");


$of_options[] = array("name" =>  "",
					"desc" => "Contetn after Phone,Fax, Adress, ect...",
					"id" => "veles_contact_text",
					"std" => "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has.",
					"type" => "textarea");



/* Portfolio */

$of_options[] = array( "name" => "Portfolio",
					"type" => "heading");



$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Portfolio Settings</h3>",
					"icon" => true,
					"type" => "info");


$of_options[] = array( "name" => "Type Of Portfolio",
					"desc" => "Select the type to display",
					"id" => "sl_portfolio_style",
					"std" => "default",
					"type" => "select",
					"options" => $of_portfolio_style);  
					

$of_options[] = array("name" =>  "",
					"desc" => "Enter the number of projects to display",
					"id" => "sl_portfolio_projects",
					"std" => "10",
					"type" => "text");








/* Footer */

$of_options[] = array( "name" => "Footer",
					"type" => "heading");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "",
					"std" => "<h3 style=\"margin: 0 0 0px;\">Footer Settings</h3>",
					"icon" => true,
					"type" => "info");
					
					
$of_options[] = array( "name" => "Block I Settings",
					"desc" => "Upload logo for Block 1",
					"id" => "footer_logo",
					"std" => "http://www.orange-idea.com/veles/logo_footer.png",
					"type" => "media");
					
$of_options[] = array("name" =>  "",
					"desc" => "Header After logo",
					"id" => "feel_free",
					"std" => "Feel free to contact us",
					"type" => "text");					



$of_options[] = array(  "name" => "Social Icons Settings",
					"desc" => "Show Twitter?",
					"id" => "Twitter",
					"std" => true,
					"type" => "checkbox");

$of_options[] = array( "name" =>  "",
					"desc" => "Show Facebook?",
					"id" => "Facebook",
					"std" => true,
					"type" => "checkbox");
					 
$of_options[] = array( "name" =>  "",
					"desc" => "Show Google+?",
					"id" => "Google+",
					"std" => true,
					"type" => "checkbox"); 					 

$of_options[] = array( "name" =>  "",
					"desc" => "Show Vimeo?",
					"id" => "Vimeo",
					"std" => true,
					"type" => "checkbox"); 
					

$of_options[] = array( "name" =>  "",
					"desc" => "Show Dribbble?",
					"id" => "Dribbble",
					"std" => true,
					"type" => "checkbox"); 
$of_options[] = array("name" =>  "",
					"desc" => "Twitterl URL",
					"id" => "twitter_url",
					"std" => "http://www.twitter.com",
					"type" => "text");


$of_options[] = array("name" =>  "",
					"desc" => "Facebook URL",
					"id" => "facebook_url",
					"std" => "http://www.facebook.com",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Google+ URL",
					"id" => "google_url",
					"std" => "http://www.plus.google.com",
					"type" => "text");

$of_options[] = array( "name" =>  "",
					"desc" => "Vimeo URL",
					"id" => "vimeo_url",
					"std" => "http://www.vimeo.com",
					"type" => "text");

$of_options[] = array("name" =>  "",
					"desc" => "Dribbble URL",
					"id" => "dribbble_url",
					"std" => "http://www.dribbble.com",
					"type" => "text");


$of_options[] = array( "name" => "Blcok II Settings",
					"desc" => "Block 2 Header",
					"id" => "footer_block2_title",
					"std" => "<span class='colored'>Veles</span> Corporation",
					"type" => "text");


$of_options[] = array( "name" =>  "",
					"desc" => "Block 2 Content ",
					"id" => "footer_block2_text",
					"std" => "I am happy to announce a new HTML/CSS template. Flexible and beautiful template which could be suitable for almost all kinds of business.</br></br>It has modern and minimalist style. Powered by custom jquery scripts.",
					"type" => "textarea");


$of_options[] = array( "name" =>  "",
					"desc" => "Scpecial area ",
					"id" => "footer_block2_spec",
					"std" => "<a href='http://themeforest.net/user/OrangeIdea/follow'> Follow me</a> to be notified for updates!",
					"type" => "text");

$of_options[] = array( "name" => "Blcok 3 Settings",
					"desc" => "Block 3 Header (If empty will show 5 Recetn Posts)",
					"id" => "footer_block3_title",
					"std" => "",
					"type" => "text");



$of_options[] = array( "name" =>  "",
					"desc" => "Block 3 Content (If empty will show 5 Recetn Posts)",
					"id" => "footer_block3_text",
					"std" => "",
					"type" => "textarea");


$of_options[] = array("name" =>  "",
					"desc" => "Twitter accaunt",
					"id" => "twitter_feed",
					"std" => "Orange_idea_RU",
					"type" => "text");


$of_options[] = array( "name" => "Blcok 4 Costumization",
					"desc" => "Block 4 Header (If empty will show Twitter Feed)",
					"id" => "footer_block4_title",
					"std" => "",
					"type" => "text");



$of_options[] = array( "name" =>  "",
					"desc" => "Block 4 Content (If empty will show Twitter Feed)",
					"id" => "footer_block4_text",
					"std" => "",
					"type" => "textarea");






					
																																			
/* Nivo Slider */
$of_options[] = array( "name" => "Nivo Slider",
					"type" => "heading");

$of_options[] = array( "name" => "Add Images And Descriptions",
					"desc" => "Add items for Nivo Slider",
					"id" => "sl_nivoslider",
					"std" => array('title' => 'Some Title Goes Here','url' => $default_image_slider_nivo['url'],'link' => '#','description' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo'),					
					"type" => "slider");

/* AsyncSlider */
$of_options[] = array( "name" => "AsyncSlider",
					"type" => "heading");

$of_options[] = array( "name" => "Add Images And Descriptions",
					"desc" => "Add items for Nivo Slider",
					"id" => "sl_async",
					"std" => array('title' => "<span class='colored'>RISE THEME</span>",'url' => $default_image_slider_async['url'],'link' => '#','description' => '<h4>Premium HTML / CSS3 Template</h4><p>Powerful site template designed in a clean and minimalistic style. This template is very flexible, easy for customizing and well documented, approaches for personal and professional use.</p><h5>Features:</h5><ul><li>25 Valid Pages</li><li>Awesome Sliders to work with</li><li>20 Patterns</li><li>JQuery Dropdown menu</li></ul><ul class="last"><li>25 Valid Pages</li><li>20 Patterns</li><li>Working Google Maps</li><li>JQuery Dropdown menu</li></ul>'),					
					"type" => "slider");
					
/* Accordion Slider */
$of_options[] = array( "name" => "Accordion Slider",
					"type" => "heading");

$of_options[] = array( "name" => "Add Images And Descriptions",
					"desc" => "Add items for Accordion Slider",
					"id" => "sl_accordion",
					"std" => array('title' => 'Example Title','url' => $default_image_slider_nivo['url'],'link' => '#','description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '),	
					"type" => "slider");

/* Vido Block */
$of_options[] = array( "name" => "Video Block",
					"type" => "heading");
$of_options[] = array( "name" => "Code For Video Block ( max width: 900px )",
					"desc" => "Paste your code",
					"id" => "sl_video",
					"std" => '<iframe src="http://player.vimeo.com/video/23534361?title=0&lt;amp;byline=0&lt;amp;portrait=0" width="900" height="350"></iframe>',
					"type" => "textarea"); 
/* Static Image */
$of_options[] = array( "name" => "Static Image",
					"type" => "heading");

$of_options[] = array( "name" => "Image Upload",
					"desc" => "",
					"id" => "static_image",
					"std" => "http://www.orange-idea.com/veles/static_slide-1.jpg",
					"type" => "media");

$of_options[] = array( "name" => "Header",
					"desc" => "",
					"id" => "static_image_header",
					"std" => "",
					"type" => "text");

$of_options[] = array( "name" => "Description",
					"desc" => "",
					"id" => "static_image_text",
					"std" => "",
					"type" => "text");

/* Vertical Accordion */
$of_options[] = array( "name" => "Vertical Accordion",
					"type" => "heading");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "va-1",
					"std" => "---- Slide 1 settings ----",
					"icon" => true,
					"type" => "info");
					
$of_options[] = array( "name" => "Slide 1 Image Upload",
					"desc" => "",
					"id" => "va-slice-1",
					"std" => "http://www.orange-idea.com/veles/1.jpg",
					"type" => "media");					

$of_options[] = array( "name" => "Slide 1 Title",
					"desc" => "",
					"id" => "va-title-1",
					"std" => "Programming",
					"type" => "text");

$of_options[] = array( "name" => "Slide 1 Description",
					"desc" => "A text input field.",
					"id" => "va-content-1",
					"std" => "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</br></br>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
					"type" => "text");
					
$of_options[] = array( "name" => "Slide 1 URL",
					"desc" => "A text input field.",
					"id" => "va-url-1",
					"std" => "#",
					"type" => "text");

$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "va-1",
					"std" => "---- Slide 2 settings ----",
					"icon" => true,
					"type" => "info");

$of_options[] = array( "name" => "Slide 2 Image Upload",
					"desc" => "Upload images using the native media uploader, or define the URL directly",
					"id" => "va-slice-2",
					"std" => "http://www.orange-idea.com/veles/2.jpg",
					"type" => "media");					

$of_options[] = array( "name" => "Slide 2 Title",
					"desc" => "A text input field.",
					"id" => "va-title-2",
					"std" => "Managment",
					"type" => "text");

$of_options[] = array( "name" => "Slide 2 Description",
					"desc" => "A text input field.",
					"id" => "va-content-2",
					"std" => "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</br></br>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
					"type" => "text");
					
$of_options[] = array( "name" => "Slide 2 URL",
					"desc" => "A text input field.",
					"id" => "va-url-2",
					"std" => "#",
					"type" => "text");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "va-1",
					"std" => "---- Slide 3 settings ----",
					"icon" => true,
					"type" => "info");


$of_options[] = array( "name" => "Slide 3 Image Upload",
					"desc" => "Upload images using the native media uploader, or define the URL directly",
					"id" => "va-slice-3",
					"std" => "http://www.orange-idea.com/veles/3.jpg",
					"type" => "media");					

$of_options[] = array( "name" => "Slide 3 Title",
					"desc" => "A text input field.",
					"id" => "va-title-3",
					"std" => "Visual Design",
					"type" => "text");

$of_options[] = array( "name" => "Slide 3 Description",
					"desc" => "A text input field.",
					"id" => "va-content-3",
					"std" => "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</br></br>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
					"type" => "text");
					
$of_options[] = array( "name" => "Slide 3 URL",
					"desc" => "A text input field.",
					"id" => "va-url-3",
					"std" => "#",
					"type" => "text");


$of_options[] = array( "name" => "Hello there!",
					"desc" => "",
					"id" => "va-1",
					"std" => "---- Slide 4 settings ----",
					"icon" => true,
					"type" => "info");


$of_options[] = array( "name" => "Slide 4 Image Upload",
					"desc" => "Upload images using the native media uploader, or define the URL directly",
					"id" => "va-slice-4",
					"std" => "http://www.orange-idea.com/veles/4.jpg",
					"type" => "media");					

$of_options[] = array( "name" => "Slide 4 Title",
					"desc" => "A text input field.",
					"id" => "va-title-4",
					"std" => "Marketing",
					"type" => "text");


$of_options[] = array( "name" => "Slide 4 Description",
					"desc" => "A text input field.",
					"id" => "va-content-4",
					"std" => "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</br></br>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
					"type" => "text");
					
$of_options[] = array( "name" => "Slide 4 URL",
					"desc" => "A text input field.",
					"id" => "va-url-4",
					"std" => "#",
					"type" => "text");

 





	}
}



?>
