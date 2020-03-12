<?php


add_action('init', 'js_inc_function');
add_theme_support( 'post-formats', array( 'link', 'gallery', 'video' ) );


/*-----------------------------------------------------------------------------------*/
// Options Framework
/*-----------------------------------------------------------------------------------*/

if ( get_magic_quotes_gpc() ) {
    $_POST      = array_map( 'stripslashes_deep', $_POST );
    $_GET       = array_map( 'stripslashes_deep', $_GET );
    $_COOKIE    = array_map( 'stripslashes_deep', $_COOKIE );
    $_REQUEST   = array_map( 'stripslashes_deep', $_REQUEST );
}

// Paths to admin functions
define('ADMIN_PATH', STYLESHEETPATH . '/admin/');
define('ADMIN_DIR', get_template_directory_uri() . '/admin/');
define('LAYOUT_PATH', ADMIN_PATH . '/layouts/');

// You can mess with these 2 if you wish.
$themedata = get_theme_data(STYLESHEETPATH . '/style.css');
define('THEMENAME', $themedata['Name']);
define('OPTIONS', 'of_options'); // Name of the database row where your options are stored

// Build Options
require_once (ADMIN_PATH . 'admin-interface.php');		// Admin Interfaces 
require_once (ADMIN_PATH . 'theme-options.php'); 		// Options panel settings and custom settings
require_once (ADMIN_PATH . 'admin-functions.php'); 	// Theme actions based on options settings
require_once (ADMIN_PATH . 'medialibrary-uploader.php'); // Media Library Uploader

$includes = TEMPLATEPATH . '/includes/';
$widget_includes = TEMPLATEPATH . '/includes/widgets/';

require_once ($includes  . 'scripts.php'); // Load JS 

// Other theme options
require_once ($includes . 'menu.php'); 		   // Menus
require_once ($includes . 'formatting.php');
require_once ($includes . 'sidebars.php');
require_once ($includes . 'shortcodes.php');
	
require_once ($widget_includes . 'pop_widget.php'); 
require_once ($widget_includes . 'racent_widget.php'); 
require_once ($widget_includes . 'contact_widget.php'); 

// Load external file to add support for MultiPostThumbnails. Allows you to set more than one "feature image" per post.
require_once('includes/multi-post-thumbnails.php');

if (class_exists('MultiPostThumbnails')) {
    new MultiPostThumbnails(array(
        'label' => '2nd Feature Image',
        'id' => 'feature-image-2',
        'post_type' => 'portfolioentry'
        )
    );    
 
}

/*vartiables*/






function fl_shortcode_button() {
	if ( ! current_user_can('edit_posts') && ! current_user_can('edit_pages') )
		return;

	// Add only in Rich Editor mode
	if ( get_user_option('rich_editing') == 'true') {
		add_filter("mce_external_plugins", "fl_add_shortcode_tinymce_plugin");
		add_filter('mce_buttons', 'fl_register_shortcode_button');
	}
}

 
 if ( ! isset( $content_width ) ) $content_width = 960;
/**
 * Register the TinyMCE Shortcode Button
 */
function fl_register_shortcode_button($buttons) {
	array_push($buttons, "|", "flshortcodes");
	return $buttons;
}

/**
 * Load the TinyMCE plugin: shortcode_plugin.js
 */
function fl_add_shortcode_tinymce_plugin($plugin_array) {
   $plugin_array['flshortcodes'] = get_template_directory_uri() . '/js/shortcode_plugin.js';
   return $plugin_array;
}
 
 function radial_formatter($content) {
    $new_content = '';
    $pattern_full = '{(\[raw\].*?\[/raw\])}is';
    $pattern_contents = '{\[raw\](.*?)\[/raw\]}is';
    $pieces = preg_split($pattern_full, $content, -1, PREG_SPLIT_DELIM_CAPTURE);
 
    foreach ($pieces as $piece) {
        if (preg_match($pattern_contents, $piece, $matches)) {
            $new_content .= $matches[1];
        } else {
            $new_content .= wptexturize(wpautop($piece));
        }
    }
 
    return $new_content;
}
 
remove_filter('the_content', 'wpautop');
remove_filter('the_content', 'wptexturize');
 
add_filter('the_content', 'radial_formatter', 99);

function shortcontent($start, $end, $new, $source, $lenght){
$text = strip_tags(preg_replace('/<h(.*)>(.*)<\/h(.*)>.*/iU', '', $source), '<b><strong>');
$text = preg_replace('#\[video\](.*)\[\/video\]#si', '', $text);
$text = preg_replace('#\[pmc_link\](.*)\[\/pmc_link\]#si', '', $text);
$text = preg_replace('/\[[^\]]*\]/', $new, $text); 
return substr(preg_replace('/\s[\s]+/','',$text),0,$lenght);

}

function fl_refresh_mce($ver) {
  $ver += 3;
  return $ver;
}

function the_breadcrumb() {
	if (!is_home()) {
		echo '<a href="';
		echo home_url();
		echo '">';
		bloginfo('name');
		echo "</a> » ";
		if (is_single()) {
			if (is_single()) {
				the_title();
			}
		} elseif (is_page()) {
			echo the_title();
		}
		elseif(get_query_var('portfoliocategory')){
			$cat = get_query_var('portfoliocategory');
			$cat = str_replace('-',' ',$cat);
			echo $cat;
		}	
		else if(get_query_var('tag')){
			$tag = get_query_var('tag');
			$tag = str_replace('-',' ',$tag);
			echo $tag;
		}
		else if(get_query_var('s')){
			$search = get_query_var('s');
			echo $search;				
		} else {
			$cat = get_query_var('cat');
			$cat = get_category($cat);
			echo $cat->name;
		}
	}
}

function social($url) {
	$social = '';
	global $data; 
	$social .= '<div id="social">';
	if($data['facebook_show'] == 1)
	$social .= '<div class="fb-like" data-href="'.$url.'" data-send="false" data-width="80" data-layout="button_count" data-show-faces="false"></div>';            
	if($data['twitter_show'] == 1)
	$social .= '<div id="twitter"><a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="'.$name.'">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></div>';
	if($data['google_show'] == 1) 
	$social .= '<div class="g-plusone" data-size="medium"></div>';
	$social .=	'</div>';
	
	echo $social;
}




function footer(){
	function pmc_recent_footer_excerpt_length( $length ) {
		return 40;
	}
	
	function pmc_recent_footer_title($title) { return  substr($title, 0, 40). '';}
		
	add_filter( 'excerpt_length', 'pmc_recent_footer_excerpt_length', 999 );
	add_filter('the_title', 'pmc_recent_footer_title') ;
}

function shortTitle($lenght)
{
	$title = the_title('','',FALSE); 
	echo substr($title, 0, $lenght);
}
function custom_excerpt_length( $length ) {
	return 30;
}
add_filter( 'excerpt_length', 'custom_excerpt_length', 999 );
function new_excerpt_more($more) {
	return '';
}
add_filter('excerpt_more', 'new_excerpt_more');
function socialLink() {
	$social = '';
	global $data; 
	if($data['facebook_show'] == 1)
	$social .= '<a target="_blank" class="facebooklink" href="'.$data['facebook'].'" title="'.$data['translation_facebook'].'"></a>';            
	if($data['twitter_show'] == 1)
	$social .= '<a target="_blank" class="twitterlink" href="'.$data['twitter'].'" title="'.$data['translation_twitter'].'"></a>';  
	if($data['digg_show'] == 1) 
	$social .= '<a target="_blank" class="vimeo" href="'.$data['digg'].'" title="'.$data['translation_digg'].'"></a>';  
	if($data['youtube_show'] == 1)
	$social .= '<a target="_blank" class="dribble" href="'.$data['youtube'].'" title="'.$data['translation_youtube'].'"></a>';  
	if($data['email_show'] == 1) 
	$social .= '<a target="_blank" class="emaillink" href="mailto:'.$data['email'].'" title="'.$data['translation_email'].'"></a>';  	
	echo $social;
}

function socialLinkTeam($facebook,$twitter,$vimeo,$dribble,$email) {
	$social = '';
	global $data; 
	if($facebook != '')
	$social .= '<a target="_blank" class="facebooklink" href="'.$facebook.'" title="'.$data['translation_facebook'].'"></a>';            
	if($twitter != '')
	$social .= '<a target="_blank" class="twitterlink" href="'.$twitter.'" title="'.$data['translation_twitter'].'"></a>';  
	if($vimeo != '') 
	$social .= '<a target="_blank" class="vimeo" href="'.$vimeo.'" title="'.$data['translation_digg'].'"></a>';  
	if($dribble != '')
	$social .= '<a target="_blank" class="dribble" href="'.$dribble.'" title="'.$data['translation_youtube'].'"></a>';  
	if($email != '') 
	$social .= '<a target="_blank" class="emaillink" href="mailto:'.$email.'" title="'.$data['translation_email'].'"></a>';  	
	echo $social;
}


function socialLinkCat($link,$title,$email) {
	$social = '';
	$social .='<div class="addthis_toolbox"><div class="custom_images">';
	global $data; 
	if($data['facebook_show'] == 1)
	$social .= '<a class="addthis_button_facebook" addthis:url="'.$link.'" addthis:title="'.$title.'"  title="'.$data['translation_facebook'].'"><img src="'. get_template_directory_uri() .'/images/facebookIcon.png" width="64" height="64" border="0" alt="'.$data['translation_facebook'].'" /></a>';            
	if($data['twitter_show'] == 1)
	$social .= '<a class="addthis_button_twitter" addthis:url="'.$link.'" addthis:title="A'.$title.'"  title="'.$data['translation_twitter'].'"><img src="'. get_template_directory_uri() .'/images/twitterIcon.png" width="64" height="64" border="0" alt="'.$data['translation_twitter'].'" /></a>';  
	if($data['digg_show'] == 1) 
	$social .= '<a class="addthis_button_digg" addthis:url="'.$link.'" addthis:title="'.$title.'" title="'.$data['translation_digg'].'"><img src="'. get_template_directory_uri() .'/images/diggIcon.png" width="64" height="64" border="0" alt="'.$data['translation_digg'].'" /></a>';  
	if($data['stumble_show'] == 1)
	$social .= '<a class="addthis_button_stumble" addthis:url="'.$link.'" addthis:title="'.$title.'" title="'.$data['translation_stumble'].'"><img src="'. get_template_directory_uri() .'/images/stumbleUponIcon.png" width="64" height="64" border="0" alt="Share to Stumble Upon" /></a>';  
 	
	$social .='<a class="addthis_button" addthis:url="'.$link.'" addthis:title="'.$title.'" ><img src="'. get_template_directory_uri() .'/images/socialIconShareMore.png" width="64" height="64" border="0" alt="More..." /></a></div><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f3049381724ac5b"></script>';	
	if($data['email_show'] == 1 && $email) 
	$social .= '<a class="emaillink" href="mailto:'.$data['email'].'" title="'.$data['translation_email'].'"></a></div>'; 
	$social .= '</div>'; 
	echo $social;
}

function socialLinkSingle() {
	$social = '';
	$social ='<div class="addthis_toolbox"><div class="custom_images">';
	global $data; 
	if($data['facebook_show'] == 1)
	$social .= '<a class="addthis_button_facebook" title="'.$data['translation_facebook'].'"><img src="'. get_template_directory_uri() .'/images/facebookIcon.png" width="64" height="64" border="0" alt="'.$data['translation_facebook'].'" /></a>';            
	if($data['twitter_show'] == 1)
	$social .= '<a class="addthis_button_twitter" title="'.$data['translation_twitter'].'"><img src="'. get_template_directory_uri() .'/images/twitterIcon.png" width="64" height="64" border="0" alt="'.$data['translation_twitter'].'" /></a>';  
	//if($data['digg_show'] == 1) 
	//$social .= '<a class="addthis_button_digg" title="'.$data['translation_digg'].'"><img src="'. get_template_directory_uri() .'/images/diggIcon.png" width="64" height="64" border="0" alt="'.$data['translation_digg'].'" /></a>';  
	//if($data['youtube_show'] == 1)
	//$social .= '<div><a class="addthis_button_youtube"><img src="'. get_template_directory_uri() .'/images/diggIcon.png" width="64" height="64" border="0" alt="Share to Twitter" /></div></a></div>';  
	$social .='<a class="addthis_button_more"><img src="'. get_template_directory_uri() .'/images/socialIconShareMore.png" width="64" height="64" border="0" alt="More..." /></a></div><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f3049381724ac5b"></script>';	
	if($data['email_show'] == 1) 
	$social .= '<a class="emaillink" href="mailto:'.$data['email'].'" title="'.$data['translation_email'].'"></a></div>'; 
	echo $social;
}

function get_category_id($cat_name){
	$term = get_term_by('name', $cat_name, 'category');
	return $term->term_id;
}
/**
 * Init process for button control
 */
add_filter( 'tiny_mce_version', 'fl_refresh_mce');
add_action( 'init', 'fl_shortcode_button' );
add_action('init', 'create_portfolio');

function create_portfolio() {
	$portfolio_args = array(
		'label' => 'Portfolio',
		'singular_label' => 'Portfolio',
		'public' => true,
		'show_ui' => true,
		'capability_type' => 'post',
		'hierarchical' => false,
		'rewrite' => true,
		'supports' => array('title', 'editor', 'thumbnail', 'author', 'comments', 'excerpt')
	);
	register_post_type('portfolioentry',$portfolio_args);
}
add_action("admin_init", "add_portfolio");
add_action('save_post', 'update_portfolio_data');

function add_portfolio(){
	add_meta_box("portfolio_details", "Portfolio Entry Options", "portfolio_options", "portfolioentry", "normal", "high");
}

function update_portfolio_data(){
	global $post;
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return $post_id;
    }
	if($post){
		if( isset($_POST["author"]) ) {
			update_post_meta($post->ID, "author", $_POST["author"]);
		}
		if( isset($_POST["date"]) ) {
			update_post_meta($post->ID, "date", $_POST["date"]);
		}
		if( isset($_POST["detail_active"]) ) {
			update_post_meta($post->ID, "detail_active", $_POST["detail_active"]);
		}else{
			update_post_meta($post->ID, "detail_active", 0);
		}
		if( isset($_POST["website_url"]) ) {
			update_post_meta($post->ID, "website_url", $_POST["website_url"]);
		}
		if( isset($_POST["status"]) ) {
			update_post_meta($post->ID, "status", $_POST["status"]);
		}		
		if( isset($_POST["customer"]) ) {
			update_post_meta($post->ID, "customer", $_POST["customer"]);
		}			

	}
}

function portfolio_options(){
	global $post;
	$data = get_post_custom($post->ID);
	if (isset($data["author"][0])){
		$author = $data["author"][0];
	}else{
		$author = "";
	}
	if (isset($data["date"][0])){
		$date = $data["date"][0];
	}else{
		$date = "";
	}
	if (isset($data["status"][0])){
		$status = $data["status"][0];
	}else{
		$status = "";
	}	
	if (isset($data["detail_active"][0])){
		$detail_active = $data["detail_active"][0];
	}else{
		$detail_active = 0;
		$data["detail_active"][0] = 0;
	}
	if (isset($data["website_url"][0])){
		$website_url = $data["website_url"][0];
	}else{
		$website_url = "";
	}
	
	if (isset($data["customer"][0])){
		$customer = $data["customer"][0];
	}else{
		$customer = "";
	}	 ?>
    <div id="portfolio-options">
        <table cellpadding="15" cellspacing="15">
        	<tr>
                <td colspan="2"><strong>Portfolio Overview Options:</strong></td>
            </tr>
            <tr>
                <td><label>Link to Detail Page: <i style="color: #999999;">(Do you want a project detail page?)</i></label></td><td><input type="checkbox" name="detail_active" value="1" <?php if( isset($detail_active)){ checked( '1', $data["detail_active"][0] ); } ?> /></td>	
            </tr>
            <tr>
            	<td><label>Project Link: <i style="color: #999999;">(The URL of your project)</i></label></td><td><input name="website_url" style="width:500px" value="<?php echo $website_url; ?>" /></td>
            </tr>
            <tr>
            	<td><label>Project Author: <i style="color: #999999;">(The URL of your project)</i></label></td><td><input name="author" style="width:500px" value="<?php echo $author; ?>" /></td>
            </tr>
            <tr>
            	<td><label>Project date: <i style="color: #999999;">(Date of project)</i></label></td><td><input name="date" style="width:500px" value="<?php echo $date; ?>" /></td>
            </tr>	
            <tr>
            	<td><label>Customer: <i style="color: #999999;">(Customer of project)</i></label></td><td><input name="customer" style="width:500px" value="<?php echo $customer; ?>" /></td>
            </tr>				
            <tr>
            	<td><label>Project status: <i style="color: #999999;">(Status of project)</i></label></td><td><input name="status" style="width:500px" value="<?php echo $status; ?>" /></td>
            </tr>				
        </table>
    </div>
      
<?php
}	
	
function add_portfolio_category(){
	add_meta_box("portfolio_categories", "Portfolio categories(only for portfolio templates)", "portfolio_category_options", "page", "normal", "high");
}	

add_action('save_post', 'update_portfolio_category_data');
add_action("admin_init", "add_portfolio_category");

function portfolio_category_options(){
	global $post;
	$data = get_post_custom($post->ID);
	if (isset($data["port_category"][0])){
		$port_category = $data["port_category"][0];
	}else{
		$port_category = "";
	}

?>
    <div id="portfolio-category-options">
        <table cellpadding="15" cellspacing="15">
        	<tr>
                <td colspan="2"><strong>Portfolio category(only for portfolio templates):</strong></td>
            </tr>
            <tr>
            	<td><label>Category: <i style="color: #999999;">(select category)</i></label></td><td>
				<?php wp_dropdown_categories('show_option_all=Show all&hierarchical=2&name=port_category&taxonomy=portfoliocategory&selected='.$port_category.''); ?>
				</td>
            </tr>
			
        </table>
    </div>
      
<?php
}
function update_portfolio_category_data(){
	global $post;
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return $post_id;
    }
	if($post){
		if( isset($_POST["port_category"]) ) {
			update_post_meta($post->ID, "port_category", $_POST["port_category"]);
		}			

	}
}


register_taxonomy("portfoliocategory", array("portfolioentry"), array("hierarchical" => true, "label" => "Portfolio Categories", "singular_label" => "Portfolio Category", "rewrite" => true));

add_filter('the_content', 'addlightboxrel_replace');

function addlightboxrel_replace ($content)
{	global $post;
	$pattern = "/<a(.*?)href=('|\")(.*?).(bmp|gif|jpeg|jpg|png)('|\")(.*?)>/i";
  	$replacement = '<a$1href=$2$3.$4$5 rel="lightbox[%LIGHTID%]"$6>';
    $content = preg_replace($pattern, $replacement, $content);
	$content = str_replace("%LIGHTID%", $post->ID, $content);
    return $content;
}


function filter_content_video( $content ){
	$content = explode('[video]', $content );
	$content = explode('[/video]',$content[1] );					
	$content = $content[0];
	return $content;
}

function filter_content( $content ){
	$content = explode('[video]', $content );
	$contentpost = $content[0] . '';
	$content = explode('[/video]',$content[1] );	
	$contentpost .= $content[1]; 
	return $contentpost;
}

function filter_link( $content ){
	$content = explode('[pmc_link]', $content );
	$content = explode('[/pmc_link]',$content[1] );	
	$content = $content[0];
	return $content;
}

function filter_content_link( $content ){
	$content = explode('[pmc_link]', $content );
	$contentcat = $content[0];
	$content = explode('[/pmc_link]',$content[1] );	
	$contentcat .= $content[1];	
	return $contentcat;
}

function filter_content_gallery( $content ){
	$content = explode('[gallery]', $content );	
	$contentgal = $content[0];	
	return $contentgal;
}


// Adds <span></span> around the first word of Widget titles
function arixWP_widget_title($title) {
$title = preg_replace('/(^[A-z0-9_]+)\s/i', '<span>$1</span> ', $title);
return $title;
}
add_filter('widget_title', 'arixWP_widget_title');

/**
 * Add "first" and "last" CSS classes to dynamic sidebar widgets. Also adds numeric index class for each widget (widget-1, widget-2, etc.)
 */
function widget_first_last_classes($params) {

	global $my_widget_num; // Global a counter array
	$this_id = $params[0]['id']; // Get the id for the current sidebar we're processing
	$arr_registered_widgets = wp_get_sidebars_widgets(); // Get an array of ALL registered widgets	

	if(!$my_widget_num) {// If the counter array doesn't exist, create it
		$my_widget_num = array();
	}

	if(!isset($arr_registered_widgets[$this_id]) || !is_array($arr_registered_widgets[$this_id])) { // Check if the current sidebar has no widgets
		return $params; // No widgets in this sidebar... bail early.
	}

	if(isset($my_widget_num[$this_id])) { // See if the counter array has an entry for this sidebar
		$my_widget_num[$this_id] ++;
	} else { // If not, create it starting with 1
		$my_widget_num[$this_id] = 1;
	}

	$class = 'class="widget-' . $my_widget_num[$this_id] . ' '; // Add a widget number class for additional styling options

	if($my_widget_num[$this_id] == 1) { // If this is the first widget
		$class .= 'widget-first ';
	} elseif($my_widget_num[$this_id] == count($arr_registered_widgets[$this_id])) { // If this is the last widget
		$class .= 'widget-last ';
	}

	$params[0]['before_widget'] = str_replace('class="', $class, $params[0]['before_widget']); // Insert our new classes into "before widget"

	return $params;

}
add_filter('dynamic_sidebar_params','widget_first_last_classes');

function stripText($string) 
{ 
    return str_replace("\\",'',$string);
} 

/*portfolio loop*/

function portfolio($height, $width, $item, $post = 'port' ,$number = 0,$cat = ''){
	global $data; 
	$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
	$categport = '';

	if($post == 'post'){
		$postT = 'post';
		$showposts = $data['sortingpost_number'];
		$postC = 'category';	
		$categport="";		
		}
	else{
		$postT = 'portfolioentry';
		$postC = 'portfoliocategory';
		$showposts = $data['port_number'];
		if($cat != '')
			$categport='&portfoliocategory='.$cat;
		}
		
	if($number != 0)
		$showposts = $number;
		
		
		
	if($item == 3){
		$titleChar = 999;
	}
	else if($item == 2){
		$titleChar = 18;
	}	
	else {
		$titleChar = 22;
	}


	if($categport != "")
		query_posts("showposts=".$showposts."&post_type=".$postT."&paged=".$paged.$categport);
	else
		query_posts("showposts=".$showposts."&post_type=".$postT."&paged=".$paged);

	$limit_text = 100;
	$currentindex = '';
	$counter = 0;
	$portfolio = '';
	$count = 0;
	while ( have_posts() ) : the_post();
		$do_not_duplicate = $post['ID']; 
		$full_image = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full', false);
		$entrycategory = get_the_term_list( $post['ID'], $postC, '', '_', '' );
		$catstring = $entrycategory;
		$catstring = strip_tags($catstring);
		$catstring = str_replace('_', ', ', $catstring);
		$categoryname = $catstring;							
		$entrycategory = strip_tags($entrycategory);
		$entrycategory = str_replace(' ', '-', $entrycategory);
		$entrycategory = str_replace('_', ' ', $entrycategory);
		
		$catidlist = explode(" ", $entrycategory);
		for($i = 0; $i < sizeof($catidlist); ++$i){
			$catidlist[$i].=$currentindex;
		}
		$catlist = implode(" ", $catidlist);

		$counter++;
		$category = get_the_term_list( $post['ID'], $postC, '', ', ', '' );	
		if ( has_post_format( 'link' , $post['ID'])) 
			$linkPost = filter_link(get_the_content());
		else
			$linkPost = get_permalink();
				
		
		if($item != 2){

		$portfolio .= '<div class="item'.$item.' '.$catlist .'" data-category="'. $catlist.'">
			
			
			<a href="'. $linkPost .'">	
				<div class="overdefult">
					<div class = "overLowerDefaultBorder"></div><div class="overLowerDefault"></div>
					<div class="overLowerDefault"></div>
				</div>
			</a>
			
			<div class="image">
				<div class="loading"></div>
				<img src="'. get_template_directory_uri() .'/js/timthumb.php?src='. $full_image[0] .'&amp;h='.$height.'&amp;w='.$width.'" alt="'. the_title('','',FALSE) .'">
			</div>';
			if($item != 3) 
				$portfolio .= '<h4><a href="'. $linkPost .'">'. substr(the_title('','',FALSE),0,$titleChar)  .'</a></h4>';
			if($item == 3) {
				$portfolio .= '<h3><a href="'. $linkPost .'">'. substr(the_title('','',FALSE),0,$titleChar)  .'</a></h3>';
				$portfolio .= '<h4>'. $category  .'</h4>	';
			}
			

		$portfolio .= '</div>';
		
		} else {
		$category = get_the_term_list( $post['ID'], $postC, '', '', '' );	
		if($count != 2){
			$portfolio .= '<div class="one_half item2 '.$catlist .'" data-category="'. $catlist.'" >';
		}
		else{
			$portfolio .= '<div class="one_half last item2 '.$catlist .'" data-category="'. $catlist.'" >';
			$count = 0;
		}

			$portfolio .= '	<div class="recentimage">
					<a href="'. $linkPost .'">
					<div class="overdefult">
						<div class = "overLowerDefaultBorder"></div><div class="overLowerDefault"></div>
					</div>
					</a>
				
					<div class="image">
						<div class="loading"></div>
						<img src="'. get_template_directory_uri() .'/js/timthumb.php?src='. $full_image[0] .'&amp;h=150&amp;w=230" alt="'. the_title('','',FALSE) .'">
					</div>
				</div>
				<div class="recentdescription">
					<h3><a class="overdefultlink" href="'.$linkPost.'">'. substr(the_title('','',FALSE),0,$titleChar) .'</a>...</h3>
					<h3 class="category">'. $category .'</h3>	
					<div class="description">'. shortcontent("[", "]", "", get_the_content() ,140) .'...</strong></div>
				</div>
			</div>';

		$count++;
		
		}

		

	endwhile; 	

	echo $portfolio;
}

function getcatslug($catID){
		$cat_obj = get_term($catID, 'portfoliocategory');
		$cat_slug = $cat_obj->slug;
		return $cat_slug;
	}



?>