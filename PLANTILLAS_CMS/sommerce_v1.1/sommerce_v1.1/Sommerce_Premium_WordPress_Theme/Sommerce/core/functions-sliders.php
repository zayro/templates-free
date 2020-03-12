<?php
/**
 * The functions for the sliders management.
 * 
 * @package WordPress
 * @subpackage YI Framework
 */                     
    
/** 
 * Decide if you can show the slider          
 *  
 * @return string
 * 
 * @since 1.0  
 */  
function yiw_can_show_slider() {
    $can = (bool) ( is_home() || is_front_page() || is_page_template('home.php') );
    if ( apply_filters( 'yiw_when_show_the_slider', $can ) )
        return true;
    else
        return false;
}   
    
/** 
 * Get the type of the slider set in the db.          
 *  
 * @return string
 * 
 * @since 1.0  
 */  
function yiw_slider_type() {
    global $yiw_slider;
    return $yiw_slider->slider_type;
}   
    
/** 
 * Check if the slider if empty, that haven't any element inside.          
 *  
 * @return bool true = the slider is empty, false = the slider have elements
 * 
 * @since 1.0  
 */  
function yiw_is_empty() {
    global $yiw_slider;
    return $yiw_slider->is_empty();
}    

/** 
 * Check if there is slides yet and increment the index and update the $current_slide 
 * attribute, with current slide arguments.
 * 
 * This function is used in the loop, to generate the markup of slider, on the main code.         
 * 
 * @since 1.0  
 */   
function yiw_have_slide() {
    global $yiw_slider;
    return $yiw_slider->have_slide();
}   

/** 
 * Echo the parameter of the current slide
 * 
 * @param string $var The parameter.        
 * 
 * @since 1.0  
 */   
function yiw_slide_the( $var, $args = array() ) {
    global $yiw_slider;     
    $yiw_slider->the( $var, $args );
}

/** 
 * Get the parameter of the current slide
 * 
 * @param string $var The parameter.        
 * 
 * @since 1.0  
 */   
function yiw_slide_get( $var, $args = array() ) {
    global $yiw_slider;
    return $yiw_slider->get( $var, $args );
}

/** 
 * Echo the classes of the current slide.  
 * 
 * @param string $class Extra class.        
 * 
 * @since 1.0  
 */   
function yiw_slide_class( $class = '', $echo = true ) {
    global $yiw_slider;
    return $yiw_slider->slide_class( $class, $echo );
}

 /**
 * The class for the slider management
 *
 * This class include inside all the method for an easy management of the sliders.
 *
 * @package YI Framework
 * @subpackage YIW_Slider
 * @since 1.0
 */
class YIW_Slider {
    
    /**
	 * Public var for the index of the loop of slides
	 *
	 * @since 1.0.0
	 * @access public
	 * @var integer
	 */   
    var $index = 0;
    
    /**
	 * Array with all slides of the slider
	 *
	 * @since 1.0.0
	 * @access public
	 * @var array
	 */   
    var $slides = array();
    
    /**
	 * Var with the tipe of slider to show
	 *
	 * @since 1.0.0
	 * @access public
	 * @var array
	 */   
    var $slider_type = '';     
    
    /**
	 * THe lenght of the slider
	 *
	 * @since 1.0.0
	 * @access public
	 * @var integer
	 */   
    var $length = 0;         
    
    /**
	 * Array with the current slide
	 *
	 * @since 1.0.0
	 * @access public
	 * @var array
	 */   
    var $current_slide = array();
    
    /**
	 * If there is link in the current slider
	 *
	 * @since 1.0.0
	 * @access public
	 * @var bool
	 */   
    var $there_is_link = false;
    
    /**
	 * The url of the link, set in the slide
	 *
	 * @since 1.0.0
	 * @access public
	 * @var string
	 */   
    var $url_slide = '';
    
    /**
	 * The html, before the text, for the links
	 *
	 * @since 1.0.0
	 * @access public
	 * @var string
	 */   
    var $a_before;
    
    /**
	 * The html, after the text, for the links
	 *
	 * @since 1.0.0
	 * @access public
	 * @var string
	 */   
    var $a_after;
    
    /**
	 * The ID option of the type slider, where get the type of slider to load.
	 *
	 * @since 1.0.0
	 * @access public
	 * @const string
	 */   
    const SLIDER_TYPE_ID = 'slider_type';
    
    /**
	 * The ID option of slides, where get all slides of the slider.
	 *
	 * @since 1.0.0
	 * @access public
	 * @const string
	 */   
    const SLIDES_ID = 'slider_%s_slides';
    
    /**
	 * Inizialize the slider.
	 *
	 * @since 1.0.0
	 */
    function init() {
        // Retrieve the slider type
        $this->slider_type = yiw_get_option( self::SLIDER_TYPE_ID ); 
            
        // Retrieve all slides of the slider
        $this->slides = $this->get_slides(); 
            
        // Retrieve number of elements of the slider
        $this->length = count( $this->slides );    
    }
    
    /** 
     * Get the slides from an option of Theme Options
     *  
     * @return array The array with all slides, sorted by key 'order'
     * 
     * @since 1.0  
     */ 
    function get_slides()
    {
        $option = sprintf( self::SLIDES_ID, $this->slider_type );
        return yiw_subval_sort( unserialize( yiw_get_option( $option ) ), 'order' );
    } 
    
    /** 
     * Check if the slider if empty, that haven't any element inside.          
     *  
     * @return bool true = the slider is empty, false = the slider have elements
     * 
     * @since 1.0  
     */   
    function is_empty() {
        if ( ! $this->length )
            return true;
        else
            return false;
    }
    
    /** 
     * Check if there is slides yet and increment the index and update the $current_slide 
     * attribute, with current slide arguments.
     * 
     * This function is used in the loop, to generate the markup of slider, on the main code.          
     *  
     * @return mixed The array with all slides, sorted by key 'order' (it can return FALSE, if is empty or if the slider is in the end)
     * 
     * @since 1.0  
     */   
    function have_slide() {
        // if the slider is empty, return false
        if ( $this->is_empty() )
            return false;
        
        // if the current index is major of the number of elements of the slider, return false to stop the loop
        if ( $this->index > $this->length-1 )
            return false;
        
        $this->current_slide = $this->slides[ $this->index ];
        ++$this->index;    
        
        // retrieve the links of the slide, if there are.
        $this->links_slider();
        
        // continue the element showing
        return true;
    }
    
    /**
	 * Retrieve the parameter of the current slide.
	 *
	 * @since 1.0.0
	 *
	 * @param string $var Parameter name.
	 */
    function the( $var, $args = array() ) {
        $args['echo'] = true;
        echo $this->get( $var, $args );    
    }   
    
    /**
	 * Retrieve the parameter of the current slide.
	 *
	 * @since 1.0.0
	 *
	 * @param string $var Parameter name.
	 */
    function get( $var, $args = array() ) {
        $default = array(
            'before' => '',
            'after' => '',
            'container' => true,
            'video_width' => 425,
            'video_height' => 356
        );       
        $args = wp_parse_args( $args, $default );
        
        $output = '';
        $slide = $this->current_slide;
        
        switch ( $var ) {
        
            case 'title' :
                $the_ = yiw_split_title( $slide['slide_title'] );
                $output = $this->a_before . $the_['title'] . $this->a_after;
                break;
        
            case 'subtitle' :
                $the_ = yiw_split_title( $slide['slide_title'] );
                $output = $the_['subtitle'];
                break;
        
            case 'content' :
                $content_slide = stripslashes( $slide['tooltip_content'] );
                $content_slide = do_shortcode( $content_slide );
                $content_slide = wpautop( $content_slide );
                $output = $content_slide . $this->get_more_text();
                break;  
        
            case 'clean-content' :
                $output = stripslashes( $slide['tooltip_content'] );
                break;         
        
            case 'image-url' :        
                $output = $slide['image_url'];
                break;    
        
            case 'featured-content' :
                $featured_args = $args;
                $featured_args['echo'] = false;
                $output = $this->featured_content( $featured_args );
                break;        
            
            default :
                if ( isset( $slide[$var] ) )
                    $output = $slide[$var];
                else
                    $output = yiw_get_option( 'slider_' . $this->slider_type . '_' . $var, '' );
                break;  
        
        }
        
        return $output;
    }         

    /** 
     * Retrieve the links of the slide, set from Theme Options, for the sliders
     * 
     * @since 1.0  
     */ 
    function links_slider()
    {
        $slide = $this->current_slide;
        
        if ( ! isset( $slide['link_type'] ) )
            return;
        
        switch( $slide['link_type'] )
        {
            case 'page':
                $this->there_is_link = TRUE;
                $this->url_slide = get_permalink( $slide['link_page'] );
            break;
            
            case 'category': 
                $this->there_is_link = TRUE;
                $theCatId = get_category_by_slug( $slide['link_category'] );                              
                $this->url_slide = get_category_link( $theCatId->term_id );
            break;
            
            case 'url':      
                $this->there_is_link = TRUE;                          
                $this->url_slide = esc_url( $slide['link_url'] );
            break;
            
            case 'none':     
                $this->there_is_link = FALSE;
                $this->url_slide = '';
            break;
        }  
        
        if ( $this->there_is_link ) {
            $this->a_before = '<a href="' . $this->url_slide . '">';
            $this->a_after = '</a>';
        } else {
            $this->a_before = '';
            $this->a_after = '';
        }
    }           

    /** 
     * Get the more text link.
     *      
     * @return null
     * 
     * @since 1.0  
     */ 
    function get_more_text() {
        $more_text = yiw_get_option( 'slider_' . $this->slider_type . '_show_more_text' );    
        if( ! empty( $more_text ) AND $this->there_is_link )
            $more_text = " <a href=\"$this->url_slide\" class='read-more'>" . yiw_get_option( 'slider_' . $this->slider_type . '_more_text' ) . "</a>";
        else
            $more_text = '';
           
        return $more_text;   
    } 

    /** 
     * Retrieve and print the type and content of the slide
     *      
     * @return null
     * 
     * @since 1.0  
     */ 
    function featured_content( $args = array() )
    {
        $default = array(
            'container' => true,
            'video_width' => 425,
            'video_height' => 356,
            'echo' => true
        );       
        $args = wp_parse_args( $args, $default );
                
        extract($args, EXTR_SKIP);
        
        $slide = $this->current_slide;
        $link = $this->there_is_link;
        $link_url = $this->url_slide;
        
        $output = '';
            
        switch( $slide['content_type'] ) { 
                    
            case 'image' :
                if( $container )
                    $output .= '<div class="featured-image">'; 
                    
                if ( isset( $slide['slide_title'] ) )
                    $alt = $slide['slide_title'];
                else
                    $alt = '';
                
                $output .= $this->a_before . '<img src="' . $slide['image_url'] . '" alt="' . $alt . '" />' . $this->a_after;
                
                if( $container )
                        $output .= '</div>';  
                break;
            
            case 'video' : 
                list( $type, $id ) = explode( ':', yiw_video_type_by_url( $slide['url_video'] ) );
                
                switch ( $type ) :
                
                    case 'youtube' :
                        $output .= '
                        <div class="video-container">
                            <div id="video-youtube-' . $id . '"></div>
                        </div>
                        <script type="text/javascript">            
                            
                            swfobject.embedSWF("http://www.youtube.com/e/' . $id . '",
                                               "video-youtube-' . $id . '", "' . $video_width . '", "' . $video_height . '", "8", null, null, { allowScriptAccess: "always", wmode: "transparent" }, { id: "video-youtube-' . $id . '-player" } );
                                
                        </script>';
                        
                        break;
                
                    case 'vimeo' :
//                         $output .= '
//                         <div class="video-container">
//                             <div id="video-vimeo-' . $id . '">
//                                 <object width="' . $video_width . '" height="' . $video_height . '">
//                                     <param name="allowfullscreen" value="true" />
//                                     <param name="allowscriptaccess" value="always" />  
//                                     <param name="wmode" value="transparent" />
//                                     <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=' . $id . '&amp;server=vimeo.com&amp;color=00adef&amp;fullscreen=1" />
//                                     <embed src="http://vimeo.com/moogaloop.swf?clip_id=' . $id . '&amp;server=vimeo.com&amp;color=00adef&amp;fullscreen=1"
//                                         type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="' . $video_width . '" height="' . $video_height . '"></embed>
//                                 </object>
//                             </div>
//                         </div>';   
                        $output .= '
                        <div class="video-container">
                            <div id="video-vimeo-' . $id . '"></div>
                        </div>
                        <script type="text/javascript">            
                            
                            swfobject.embedSWF("http://vimeo.com/moogaloop.swf?clip_id=' . $id . '&amp;server=vimeo.com&amp;color=00adef&amp;fullscreen=1",
                                               "video-vimeo-' . $id . '", "' . $video_width . '", "' . $video_height . '", "8", null, null, { allowScriptAccess: "always", wmode: "transparent" }, { id: "video-youtube-' . $id . '-player" } );
                                
                        </script>';
                        
                        break;
                
                endswitch;
                
                break;               
            
        }
        
        if ( $echo )
            echo $output;
        else
            return $output;
    }                  

    /** 
     * Get the classes of the slide element
     *      
     * @return string
     * 
     * @since 1.0  
     */ 
    function slide_class( $class = '', $echo = true ) {
        $classes = array();
        
        if ( $this->index == 1 )
            $classes[] = 'first';
        
        if ( $this->index == $this->length )
            $classes[] = 'last';
        
        $classes[] = 'slide-' . $this->index;
        
        if ( ! empty( $class ) )
            $classes[] = $class;
        
        $output = ' class="' . implode( ' ', $classes ) . '"';
        if ( $echo )        
            echo $output;
        else
            return $output;
    }
    
}
?>