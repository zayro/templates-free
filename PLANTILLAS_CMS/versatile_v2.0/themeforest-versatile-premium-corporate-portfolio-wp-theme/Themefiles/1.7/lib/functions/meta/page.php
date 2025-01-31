<?php
//************************************* MetaBoxes

	$page_meta_boxes =

	array(	
      
	"sidebars" => array(
		"name" => "sidebar",  
		"title" => "Choose Sidebar Position", 
		"meta_name" => "options", 
		"description" => "Select the options below for displaying the sidebar right aligned or left aligned",
		"type" => "radio",
		"class" => "radio",
		"std" => "",
		"options" => array("leftsidebar" => "Left Sidebar",
						"rightsidebar" => "Right Sidebar"
					)
		), 
	
"Breadcrumb" => array(
			"name" => "breadcrumbs",
			"type" => "checkbox",
			"meta_name" => "display",
			"std" => "",
			"title" => "breadcrumbs",
			"description" => "Check this if you want to disable the breadcrumb for this page"),

"Subheaderbg" => array(
			"name" => "subheaderbg",
			"type" => "color",
			"meta_name" => "display",
			"std" => "",
			"title" => "Subheader Background",
			"description" => "Choose the color for subheader background."),

"imageupload" => array(
			"name" => "subheaderbg",
			"type" => "upload",
			"meta_name" => "image",
			"std" => "",
			"title" => "Subheader Background Image",
			"description" => "Choose the color for subheader background Image."),

		

		"radio" => array(
		"name" => "radio",  
		"title" => "Custom Subheader Teaser Options", 
		"meta_name" => "options", 
		"description" => "Select the options below for displaying the subheader teaser",
		"type" => "radio",
		"class" => "radio",
		"std" =>"default",
		"options" => array("twitter" => "Twitter",
							"custom" => "Custom", 
							"disable" => "Disable",
							"default" => "Default",
							"customhtml" => "Custom HTML")
			),

		"desc" => array(
		"name" => "page",
		"type" => "textarea",
		"meta_name" => "desc",
		"std" => "",
		"title" => "Custom Subheader Teaser Text/HTML",
		"description" => "Enter the text which will appear in the subheader of this page. If you want to use bold text use html strong element example &lt;strong&gt;bold text &lt;/strong&gt;"),
	);
//************************************* META BOXES FOR PAGES
function custom_page_meta_boxes() {
	global $post, $page_meta_boxes;
	
	echo'<div class="postoptions">';
		foreach($page_meta_boxes as $meta_box) {
			$meta_box_value = get_post_meta($post->ID,$meta_box['name'].'_'.$meta_box['meta_name'], true);
				if($meta_box_value == "")
					$meta_box_value = $meta_box['std'];
				echo'<input type="hidden" name="'.$meta_box['name'].'_noncename" id="'.$meta_box['name'].'_noncename" value="'.wp_create_nonce( plugin_basename(__FILE__) ).'" />';
				
				if( $meta_box['type'] == "text" )
				{
				echo'<div class="metabox">';
				echo'<h3>'.$meta_box['title'].'</h3><div class="metainner">';
				echo'<div class="box-info"><label for="'.$meta_box['name'].'_'.$meta_box['meta_name'].'">'.$meta_box['description'].'.</label></div>';				
				echo'<div class="box-option">';		
				echo'<input type="text" name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" value="'.stripslashes(get_post_meta($post->ID, $meta_box['name'].'_'.$meta_box['meta_name'], true)).'" size="50%" />';
				echo'</div></div></div>';
				}
	if( $meta_box['type'] == "upload" )
				{
?>
<script>
jQuery(document).ready(function() {
jQuery('.upload_image_button').click(function() {
var clickedID = jQuery(this).attr('id');	

 formfield = jQuery('#'+clickedID).attr('name');
 tb_show('', 'media-upload.php?type=image&amp;tab=library&amp;TB_iframe=true');
 //tb_show('', 'media-upload.php?type=image&amp;TB_iframe=true');
 return false;
});
jQuery('.upload_image_button').click(function() {
var clickedID = jQuery(this).attr('id');	
window.send_to_editor = function(html) {
 imgurl = jQuery('img',html).attr('src');
 jQuery('#'+clickedID).val(imgurl);
 tb_remove();
}
});
});
</script>
<?php
				echo'<div class="metabox"><h3>'.$meta_box['title'].'</h3><div class="metainner">';
				echo'<div class="box-info"><label for="'.$meta_box['name'].'_'.$meta_box['meta_name'].'">'.$meta_box['description'].'.</label></div>';				
				echo'<div class="box-option">';
				echo "<table>";
echo "<tr valign='top'>";
echo "<th scope='row'>Upload Image</th>";
echo "<td><label for='upload_image'>";
echo'<input value="'.stripslashes(get_post_meta($post->ID, $meta_box['name'].'_'.$meta_box['meta_name'], true)).'" type="text" name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'"  id="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" size="50%" />';
echo '<input class="upload_image_button"  id="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" type="button" value="Upload Image" />';
echo '</label></td><td id="id="'.$meta_box['name'].'_'.$meta_box['meta_name'].'"></td>';
echo "</tr></table>";
				echo'</div></div></div>';
				}
				if( $meta_box['type'] == "color" )
				{
				echo'<div class="metabox">';
				echo'<h3>'.$meta_box['title'].'</h3><div class="metainner colorbox">';
				echo'<div class="simple-option" id="colorPicker">';		
				echo'<input type="color" size="8" id="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" value="'.stripslashes(get_post_meta($post->ID, $meta_box['name'].'_'.$meta_box['meta_name'], true)).'" data-hex="true" class="color" /></div>';
				echo'<div class="simple-info"><label for="'.$meta_box['name'].'_'.$meta_box['meta_name'].'">'.$meta_box['description'].'.</label></div>';				
				echo'</div></div>';
				}
				if( $meta_box['type'] == "textarea" )
				{
				echo'<div class="metabox">';
				echo'<h3>'.$meta_box['title'].'</h3><div class="metainner">';
				echo'<div class="box-info"><label for="'.$meta_box['name'].'_'.$meta_box['meta_name'].'">'.$meta_box['description'].'.</label></div>';				
				echo'<div class="box-option">';		
				echo'<textarea name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" rows="" cols=""  />' .get_post_meta($post->ID, $meta_box['name'].'_'.$meta_box['meta_name'], true). '</textarea>';
				echo'</div></div></div>';
				}

				if(($meta_box['type'] == 'radio') && (!empty($meta_box['options']))) { // radio buttons
					echo'<div class="metabox"><h3>'.$meta_box['title'].'</h3><div class="metainner">';
				echo'<div class="box-info"><label for="'.$meta_box['name'].'_'.$meta_box['meta_name'].'">'.$meta_box['description'].'.</label></div>';				
				echo'<div class="box-option">';
				foreach($meta_box['options'] as $key => $value) {
				echo '<input type="radio" name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'"  value="' . $key . '" ' . (isset($meta_box_value) && ($meta_box_value == $key) ? ' checked="checked"' : '') . '/> ' . $value . ' &nbsp; ' . "\n";
				}
				echo'</div></div></div>';
				}

				if( $meta_box['type'] == "checkbox" )
				{
				$layout=get_post_meta($post->ID, $meta_box['name'].'_'.$meta_box['meta_name'], true);
				if( $layout == $meta_box['name'].'_'.$meta_box['meta_name'] ) { $checked = "checked=\"checked\""; }else{ $checked = ""; } 
				echo'<div class="metabox">';
				echo'<h3>'.$meta_box['title'].'</h3><div class="metainner">';
				echo'<div class="box-option">';		
				echo'<label><input type="checkbox" name="'.$meta_box['name'].'_'.$meta_box['meta_name'].'" value="'.$meta_box['name'].'_'.$meta_box['meta_name'].'"  '.$checked.' /> '.$meta_box['description'].'.</label></div>';
				echo'</div></div>';
				}
			}
				
		echo'</div>';
		}
		function page_save_postdata( $post_id ) {
	global $post,$page_meta_boxes;
	foreach($page_meta_boxes as $meta_box) {
		// Verify
		if ( !wp_verify_nonce( $_POST[$meta_box['name'].'_noncename'], plugin_basename(__FILE__) )) {
			return $post_id;
		}
		if ( 'page' == $_POST['post_type'] ) {
			if ( !current_user_can( 'edit_page', $post_id ))
				return $post_id;
		} else {
			if ( !current_user_can( 'edit_post', $post_id ))
				return $post_id;
		}

		$data = $_POST[$meta_box['name'].'_'.$meta_box['meta_name']];
		if(get_post_meta($post_id, $meta_box['name'].'_'.$meta_box['meta_name']) == "")
			add_post_meta($post_id, $meta_box['name'].'_'.$meta_box['meta_name'], $data, true);
		elseif($data != get_post_meta($post_id, $pre.'_'.$meta_box['meta_name'], true))
			update_post_meta($post_id, $meta_box['name'].'_'.$meta_box['meta_name'], $data);
		elseif($data == "")
			delete_post_meta($post_id, $meta_box['name'].'_'.$meta_box['meta_name'], get_post_meta($post_id, $meta_box['name'].'_'.$meta_box['meta_name'], true));
	}
}


function page_meta_box() {
	global $themename;
	if ( function_exists('add_meta_box') ) {

	add_meta_box( 'new-meta-boxes', $themename.' Page Options', 'custom_page_meta_boxes', 'page', 'normal', 'high' );


	}
}
add_action('admin_menu', 'page_meta_box');
add_action('save_post', 'page_save_postdata');
?>
