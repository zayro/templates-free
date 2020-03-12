<?php
/**
 * @package WordPress
 * @subpackage Kassyopea
 */      

/**
 * Order the array by a key
 * 
 * @param array $a The array to sort
 * @param string $subkey The key used for the sorting
 * @return array Array sorted
 * 
 * @since 1.0                
 */   
function yiw_subval_sort( $a, $subkey ) {
	if( is_array( $a ) AND ! empty( $a ) ) {
		foreach( $a as $k => $v ) {
			$b[$k] = strtolower( $v[$subkey] );
		}
		
		asort( $b );
		
		foreach( $b as $key => $val ) {
			$c[] = $a[$key];
		}
		
		return $c;
	}
	
	return $a;
}   

/**
 * Retrieve the current pagename
 * 
 * @return string Current pagename
 * 
 * @since 1.0                
 */   
function yiw_get_current_pagename()
{
	global $post;
	
	if ( isset( $post->post_name ) )
		return $post->post_name;
	else
		return '';
}        

/**
 * Retrieve the escluded categories, set on Theme Options
 * 
 * @return string String with all id categories excluded, separeted by a comma
 * 
 * @since 1.0                
 */  
function yiw_get_exclude_categories()
{
    $cats = yiw_get_option('blog_cats_exclude_1');
    
    $cats = str_replace(" ", "", $cats);   // tolgo gli spazi che l'utente inserisce
    $cats = explode(",", $cats);           // divido le categorie tramite le virgole inserite
    
    $temp = array();
    foreach($cats as $cat)
    {
        $temp[] = $cat;              // metto tutte le categorie in un array temporaneo
    }
    
    // genero una nuova stringa con l'esclusione delle categorie passate in parametro, aggiugendo un meno davanti ad ogni numero (-1,-4,-7,ecc...)
    $i = 0; $query = '';
    foreach($temp as $c)
    {                                                                                                      
        if($i != 0) $query .= ',';    // aggiunge la virgola, soltanto se non è il primo elemento processato
        $query .= "-$c";
        
        $i++;
    }
    
    return $query;
}   

/**
 * Check if the email passed is valid
 * 
 * @return bool TRUE = valid; FALSE = no valid.
 * 
 * @since 1.0                
 */  
function yiw_check_email( $m ) {
	$r = "([A-z0-9]+[\._\-]?){1,3}([A-z0-9])*";
  	$r = "/(?i)^{$r}\@{$r}\.[A-z]{2,6}$/";
  	return preg_match( $r, $m );
}       

/**
 * Convert the words within the brackets, with <span> tags, to apply different style
 * 
 * E.g.
 * FROM: My [sentence]
 * TO:   My <span>sentence</span>    
 * 
 * @param string $str The string to convert
 * @param string $class (optional) A class to add into <span> tags
 * @param string $after (optional) An optional string, to add after the string converted   
 * @return string The string converted
 * 
 * @since 1.0                
 */  
function yiw_get_convertTags($str, $class = '', $after = '') 
{
    global $yiw_tags_allowed;
    
	if( $class != '' )
		$class = ' class="' . $class . '"';
		
    $str = str_replace('[', '<span' . $class . '>', $str);
    $str = str_replace(']', '</span>', $str);
    
    foreach( $yiw_tags_allowed as $tag => $value )
        $str = str_replace( "%$tag%", $value, $str );
    
    return $str . $after;
}                      

/**
 * The same above, but this print the string and not return.
 * 
 * @since 1.0                
 */  
function yiw_convertTags($str, $class = '', $after = '') 
{
    echo yiw_get_convertTags($str, $class, $after);
}                                 
add_filter( 'bloginfo', 'yiw_get_convertTags' );                

/**
 * Remove the brackets by string passed
 * 
 * @param string $str The string to convert
 * @param string $after (optional) An optional string, to add after the string converted
 * @return string The string converted   
 * 
 * @since 1.0                
 */  
function yiw_get_removeTags($str, $after = '') 
{
    $str = str_replace('[', '', $str);
    $str = str_replace(']', '', $str);
    
    return $str . $after;
}     

/**
 * Retrieve the current complete url
 * 
 * @since 1.0                
 */  
function yiw_curPageURL() {
	$pageURL = 'http';
	if ( isset( $_SERVER["HTTPS"] ) AND $_SERVER["HTTPS"] == "on" ) 
		$pageURL .= "s";
	
	$pageURL .= "://";
	
	if ( isset( $_SERVER["SERVER_PORT"] ) AND $_SERVER["SERVER_PORT"] != "80" ) 
		$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
	else
		$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	
	return $pageURL;
}           

/** 
 * Convert a string of categories into excluded categories
 * 
 * @param string $cats The string with all positive ids of categories
 * @return string A string of all ids negative of categories to exclude 
 * 
 * @since 1.0  
 */ 
function yiw_exclude_categories($cats)
{
    $excluded_cats = '-9999';
    $cats = explode(",", $cats);
    
    foreach ($cats as $cat) 
    {
    	$excluded_cats .= ',-' . $cat;
    }
    
    return $excluded_cats;
}         

/** 
 * Simple echo a string, with a before and after string, only if the main string is not empty.
 *  
 * @param string $before What there is before the main string  
 * @param string $string The main string. If it is empty or null, the functions return null.
 * @param string $after What there is after the main string
 * @param bool $echo If echo or only return it
 * @return string The complete string, if the main string is not empty or null
 * 
 * @since 1.0  
 */ 
function yiw_string_( $before = '', $string = '', $after = '', $echo = true )
{
    $html = '';
    
	if( $string != '' AND !is_null( $string ) )
		$html = $before . $string . $after;
	
	if( $echo )
		echo $html;
	
	return $html;
}      

/** 
 * Echo a list of option for a select html
 * 
 * @param array $option The array with all option to transform  
 * @param string $value_select The value to select  
 * @param bool $echo if true, print the html output
 * @return string The html output with all options   
 * 
 * @since 1.0  
 */ 
function yiw_list_option( $option = array(), $value_select = '', $echo = true )
{
	if( empty( $option ) )
		return;
	
	foreach( $option as $key => $value )
	{
		$selected = selected( $key, $value_select, false );
			
		$html .= "<option value=\"$key\"$selected>$value</option>\n";
	}
	
	if( $echo )
		echo $html;
		
	return $html;
}           


/**
 * Retrive a list of files, contained into a folder.   
 * 
 * @since 1.0  
 * 
 * @param string $folder The absolute pathname of folder
 * @return array An array of all files
 */     
function yiw_list_files_into( $folder )
{
	$files = array();
	
    if ( file_exists($folder) && $handle = opendir($folder) ) {                                
       while ( false !== ($file = readdir($handle ) ) ) { 
	        if ( $file == ".." || $file == "." || $file[0] == '.' ) {
	            continue;
	        }

           $files[] = $file;
       }
    
       closedir($handle); 
    } 
    
    return $files;
}      


/**
 * Search the shortcode into a post content   
 * 
 * @since 1.0  
 * 
 * @param string $id_post The id of current post
 * @param string $shortcode The shortcode to search
 * @return bool
 */    
function yiw_search_shortcode_into_post( $id_post = false, $shortcode = '' ){
	global $wpdb, $post;            
	
	if ( ! $id_post && isset( $post->ID ) )
		$id_post = $post->ID;        
	
	if ( ! $id_post && ! isset( $post->ID ) )
		return;
	
	$sql = "SELECT `ID` FROM `{$wpdb->posts}` WHERE `ID` = $id_post AND `post_content` LIKE '%$shortcode%' LIMIT 1";
	
	if ( $wpdb->get_var($sql) )
		return true;
	else
		return false;
}    


/**
 * Private function to print the content of an array.   
 * 
 * @since 1.0  
 */     
function yiw_debug( $a, $die = true ) {
	echo '<pre>';
	print_r($a);
	echo '</pre>';
	if ( $die )
		die;
}
?>