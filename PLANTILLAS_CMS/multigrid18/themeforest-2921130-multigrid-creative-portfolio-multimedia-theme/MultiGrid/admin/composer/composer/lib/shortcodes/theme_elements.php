<?php
/**
 * An example of how to write WPBakery Visual Composer custom shortcode
 *
 * To create shortcodes for visual composer you need to complete 2 steps.
 *
 * 1. Create new class which extends WPBakeryShortCode.
 * If you are not familiar with OOP in php, don't worry follow this instruction and we will guide you how to
 * create valid shortcode for visual composer without learning OOP.
 *
 * 2. Need to create configurations by using wpb_map function.
 *
 * Shortcode class.
 * Shortcode class extends WPBakeryShortCode abstract class.
 * Correct name for shortcode class should look like WPBakeryShortCode_YOUR_SHORTCODE_HERE.
 * YOUR_SHORTCODE_HERE must contain only latin letters, numbers and symbol "_".
*/

/**
 * Shortcode class example "Hello World"
 *
 * Lets pretend that we want to create shortcode with this structure: [my_hello_world foo="bar"]Shortcode content here[/my_hello_world]
 */

/* This shortcode is used for tables
---------------------------------------------------------- */
class WPBakeryShortCode_tt_table extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';
        extract(shortcode_atts(array(
            'table_name' => 'default table',
            'table_content' => '<table><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Username</th></tr></thead><tbody><tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td></tr><tr><td>2</td><td>Jacob</td><td>Thornton</td><td>@fat</td></tr><tr><td>3</td><td>Larry</td><td>the Bird</td><td>@twitter</td></tr></tbody></table>',
            'width' => '1/1',
            'el_class' => '',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;
        $el_class="";
        switch($table_name){
            case'striped_table':   $el_class="table-striped";                               break;
            case'bordered_table':  $el_class="table-bordered";                              break;
            case'condensed_table': $el_class="table-condensed";                             break;
            case'combine_them_all':$el_class="table-striped table-bordered table-condensed";break;
        }
        // START - temp bug repair
        $table_content=substr($table_content, strpos($table_content, '<table'));
        // END   - temp bug repair
        $output = str_ireplace('<table>', '<table class="table '.$el_class.'">', $table_content);
        $output = '<div class="'.$width.' '.$extra_class.'">' . $output . '</div>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
        $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolder($width);
        //  START - Customize
        $tt_el_class="";
        switch($table_name){
            case'striped_table':   $tt_el_class="table-striped";                               break;
            case'bordered_table':  $tt_el_class="table-bordered";                              break;
            case'condensed_table': $tt_el_class="table-condensed";                             break;
            case'combine_them_all':$tt_el_class="table-striped table-bordered table-condensed";break;
        }
        //  END - Customize

        // START - temp bug repair
        $table_content=substr($table_content, strpos($table_content, '<table'));
        // END   - temp bug repair
        
        //START - table HTML
        $tmp  = str_ireplace('<table>', '<table class="table '.$tt_el_class.'">', $table_content);
        $iner = '<div class="'.$width.'">' . $tmp . '</div>';
        //END   - table HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for progress bars
---------------------------------------------------------- */
class WPBakeryShortCode_tt_progress extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';

        extract(shortcode_atts(array(
            'progress_name' => 'basic',
            'progress_size' => '50',
            'width' => '1/1',
            'el_class' => '',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);

        $extra_class=$el_class;
        $el_class="";
        switch($progress_name){
            case'basic':   $el_class=" progress";                        break;
            case'striped': $el_class=" progress progress-striped";       break;
            case'animated':$el_class=" progress progress-striped active";break;
        }

        $output .= '<div class=" '.$width.$el_class.' '.$extra_class.'" style="min-height: 18px;">
                        <div class="bar" style="width: '.$progress_size.'%;"></div>
                    </div>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
         $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolder($width);
        //  START - Customize
        $tt_el_class="progress";
        switch($progress_name){
            case'striped': $tt_el_class=" progress progress-striped";       break;
            case'animated':$tt_el_class=" progress progress-striped active";break;
        }      
        //  END - Customize

        //START - progress HTML
        $iner .= '<div class=" '.$tt_el_class.'">
                        <div class="bar" style="width: '.$progress_size.'%;"></div>
                    </div>';
        //END   - progress HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for Hero unit
---------------------------------------------------------- */
class WPBakeryShortCode_tt_hero_unit extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';
        extract(shortcode_atts(array(
            'hero_unit_title' => 'Hello, world!',
            'hero_unit_tagline' => 'This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.',
            'hero_unit_button_text' => 'Learn more',
            'hero_unit_button_url' => '#',
            'width' => '1/1',
            'el_class' =>'',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;
        $el_class='hero-unit';
        $output .= '<div class="'.$width.' '.$el_class.'  '.$extra_class.'">
                        <h1>'.$hero_unit_title.'</h1>
                        <p>'.$hero_unit_tagline.'</p>
                        <p>
                            <a href="'.$hero_unit_button_url.'" class="btn btn-primary btn-large">'.$hero_unit_button_text.'</a>
                        </p>
                    </div>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
        $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolder($width);
        $tt_el_class='hero-unit';
        //START - hero unit HTML
        $iner = '<div class="'.$width.' '.$tt_el_class.'">
                        <h1 class="tt_title">'.$hero_unit_title.'</h1>
                        <p class="tt_tagline">'.$hero_unit_tagline.'</p>
                        <p class="tt_btn">
                            <a href="'.$hero_unit_button_url.'" class="btn btn-primary btn-large">'.$hero_unit_button_text.'</a>
                        </p>
                    </div>';
        //END   - hero unit HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for popovers
---------------------------------------------------------- */
class WPBakeryShortCode_tt_popover extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';
        extract(shortcode_atts(array(
            'popover_title' => 'Popover title',
            'popover_content' => 'And here\'s some amazing content. It\'s very engaging. right?',
            'popover_text' => 'hover for popover',
            'width' => '1/1',
            'el_class' =>'',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;
        $el_class='well';
        $output .= '<div class="'.$width.' '.$extra_class.'">
                        <a href="#" class="'.$el_class.' btn btn-danger" rel="popover" data-content="'.$popover_content.'" data-original-title="'.$popover_title.'">'.$popover_text.'</a>
                    </div><p style="display:none;"><script>jQuery(".'.$el_class.'").popover();</script></p>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
        $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolderNoElClass($width);
       
        //START - popover HTML
        $tt_el_class='well';
        $iner = '<div class="'.$width.'">
                        <a href="#" class="'.$tt_el_class.' btn btn-danger" rel="popover" data-content="'.$popover_content.'" data-original-title="'.$popover_title.'">'.$popover_text.'</a>
                    </div><script>jQuery(".'.$tt_el_class.'").popover();</script>';
        //END   - popover HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for Tooltips
---------------------------------------------------------- */
class WPBakeryShortCode_tt_tooltip extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';
        extract(shortcode_atts(array(
            'tooltip_text' => 'Hover here',
            'tooltip_content' => 'Tooltip content',
            'width' => '1/1',
            'el_class' =>'',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;
        $el_class='target_tooltip';
        $output .= '<div class="'.$width.' '.$extra_class.'">
                        <a href="#"  class="'.$el_class.'" rel="tooltip" data-original-title="'.$tooltip_content.'">'.$tooltip_text.'</a>
                    </div><p style="display:none;"><script>jQuery(".'.$el_class.'").tooltip();</script></p>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
         $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolderNoElClass($width);
        
        //START - tooltip HTML
        $tt_el_class='target_tooltip';
        $iner = '<div class="'.$width.'">
                        <a href="#"  class="'.$tt_el_class.'" rel="tooltip" data-original-title="'.$tooltip_content.'">'.$tooltip_text.'</a>
                    </div><script>jQuery(".'.$tt_el_class.'").tooltip();</script>';
        //END   - tooltip HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for Spaces
---------------------------------------------------------- */
class WPBakeryShortCode_tt_space extends WPBakeryShortCode {
    protected function content( $atts, $content = null ) {
        $output = '';
        extract(shortcode_atts(array(
            'height' => '15px',
            'width' => '1/1',
            'el_class' =>'',
            'el_position' =>''
        ), $atts));
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;
        $el_class='tt_space';
        $output .= '<div class="'.$extra_class.'"><div style="margin-top:'.$height.';"></div></div>';
        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }

    public function contentAdmin( $atts, $content ) {
         $output = $custom_markup = $width = '';
        if ( $content != NULL ) { $content = wpautop(stripslashes($content)); }

        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //var_dump($param['value']);
                if ( isset($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = is_string($param['value']) ? __($param['value'], "js_composer") : $param['value'];
                } else {
                    $shortcode_attributes[$param['param_name']] = '';
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));		


        $output = $this->getElementHolderNoElClass($width);
        
        //START - tooltip HTML
        $tt_el_class='tt_space';
        $iner = '<div class="'.$width.'">
                    <div class="'.$tt_el_class.'" style="margin-top:'.$height.';"></div>
                </div>';
        //END   - tooltip HTML
        foreach ($this->settings['params'] as $param) {
            $param_value = $$param['param_name'];
            //var_dump($param_value);
            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        
        $output = str_ireplace('%wpb_element_content%', $iner, $output);
        return $output;
    }
}



/* This shortcode is used for Testimonials
---------------------------------------------------------- */
class WPBakeryShortCode_tt_testimonial extends WPBakeryShortCode {
    public function content( $atts, $content = null ) {
        $title = '';
        extract(shortcode_atts(array(
            'title' => __("Testimonials", "js_composer")
        ), $atts));
        
        $output = '<div class="testimonials-item">'.wpb_js_remove_wpautop($content).'<div class="testimonials-name">'.$title.'</div></div>';
        return $output;
    }

    public function contentAdmin($atts, $content) {
        $title = '';
        $defaults = array( 'title' => __('Testimonial', 'js_composer') );
        extract( shortcode_atts( $defaults, $atts ) );

        return '<div id="tab-'. sanitize_title( $title ) .'" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">'. do_shortcode($content) . WPBakeryVisualComposer::getInstance()->getLayout()->getContainerHelper() . '</div>';
    }
}

class WPBakeryShortCode_tt_testimonials extends WPBakeryShortCode {

    public function __construct($settings) {
        parent::__construct($settings);
        WPBakeryVisualComposer::getInstance()->addShortCode( array( 'base' => 'tt_testimonial' ) );
    }

    public function contentAdmin($atts, $content = null) {
        $width = $custom_markup = '';
        $shortcode_attributes = array('width' => '1/1');
        foreach ( $this->settings['params'] as $param ) {
            if ( $param['param_name'] != 'content' ) {
                //$shortcode_attributes[$param['param_name']] = $param['value'];
                if ( is_string($param['value']) ) {
                    $shortcode_attributes[$param['param_name']] = __($param['value'], "js_composer");
                } else {
                    $shortcode_attributes[$param['param_name']] = $param['value'];
                }
            } else if ( $param['param_name'] == 'content' && $content == NULL ) {
                //$content = $param['value'];
                $content = __($param['value'], "js_composer");
            }
        }
        extract(shortcode_atts(
            $shortcode_attributes
            , $atts));

        // Extract tab titles
        preg_match_all( '/tt_testimonials title="([^\"]+)"/i', $content, $matches, PREG_OFFSET_CAPTURE );
        $tab_titles = array();
        if ( isset($matches[1]) ) { $tab_titles = $matches[1]; }

        $output = '';

        $tmp = '';
        if ( count($tab_titles) ) {
            $tmp .= '<ul class="clearfix">';
            foreach ( $tab_titles as $tab ) {
                $tmp .= '<li><a href="#tab-'. sanitize_title( $tab[0] ) .'">' . $tab[0] . '</a></li>';
            }
            $tmp .= '</ul>';
        } else {
            $output .= do_shortcode( $content );
        }
        $elem = $this->getElementHolder($width);

        $iner = '';
        foreach ($this->settings['params'] as $param) {
            $param_value = $custom_markup = '';
            eval("\$param_value = \$".$param['param_name'].";");

            if ( is_array($param_value)) {
                // Get first element from the array
                reset($param_value);
                $first_key = key($param_value);
                $param_value = $param_value[$first_key];
            }
            $iner .= $this->singleParamHtmlHolder($param, $param_value);
        }
        //$elem = str_ireplace('%wpb_element_content%', $iner, $elem);

        if ( isset($this->settings["custom_markup"]) &&$this->settings["custom_markup"] != '' ) {
            if ( $content != '' ) {
                $custom_markup = str_ireplace("%content%", $tmp.$content, $this->settings["custom_markup"]);
            } else if ( $content == '' && isset($this->settings["default_content"]) && $this->settings["default_content"] != '' ) {
                $custom_markup = str_ireplace("%content%",$this->settings["default_content"],$this->settings["custom_markup"]);
            }
            //$output .= do_shortcode($this->settings["custom_markup"]);
            $iner .= do_shortcode($custom_markup);
        }
        $elem = str_ireplace('%wpb_element_content%', $iner, $elem);
        $output = $elem;

        return $output;
    }

    public function content($atts, $content =null)
    {
        extract(shortcode_atts(array(
            'title' => '',
            'interval' => 0,
            'width' => '1/1',
            'el_position' => '',
            'el_class' => ''
        ), $atts));
        $tt_double_border = $tt_border_class = $output = '';

        if(is_page_template('page-home.php')){
            $tt_border_class = ' border';
            $tt_double_border = '<div class="double-bg"><div class="left-sdw"></div><div class="right-sdw"></div><div class="repeat-sdw"></div></div>';
        }
            
        $el_class = $this->getExtraClass($el_class);
        $width = wpb_translateColumnWidthToSpan($width);
        $extra_class=$el_class;       
        
        $output .= '<div class="content-testimonials '.$width.' '.$extra_class.'">
                        <div class="'.$tt_border_class.'">
                            <div class="testimonials" style="height: auto !important;">
                                '.wpb_js_remove_wpautop($content).'
                            </div>
                        </div>'.$tt_double_border.'
                    </div>';
                $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;        
    }
}



/////////////////////////////////////////////////////
//////////////////////// MAP ////////////////////////
/////////////////////////////////////////////////////
/* Table
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Table", "js_composer"),
    "base"		=> "tt_table",
    "wrapper_class"     => "table-wrapper",
    "icon"              => "icon-tt-table",
    "params"            => array(
        array(
            "type" => "dropdown",
            "heading" => __("Select table style", "js_composer"),
            "param_name" => "table_name",
            "value" => array('Default table', 'Striped table', 'Bordered table', 'Condensed table', 'Combine them all'),
            "description" => __('
                <p><b>Default table: </b>No styles, just columns and rows</p>
                <p><b>Striped table: </b>Only horizontal lines between rows</p>
                <p><b>Bordered table: </b>Rounds corners and adds outer border</p>
                <p><b>Condensed table: </b>Adds light gray background color to odd rows (1, 3, 5, etc)</p>
                <p><b>Combine them all!: </b>Cuts vertical padding in half, from 8px to 4px, within all td and th elements</p>
            ', "js_composer")
        ),
        array(
            "type" => "exploded_textarea",
//            "type" => "textarea_html",
            "heading" => __("Table content", "js_composer"),
            "param_name" => "table_content",
            "value" => "<table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                </tbody>
                </table>",
            "description" => __("Table content.", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
));
/* Progress bars
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Progress bars", "js_composer"),
    "base"		=> "tt_progress",
    "class"		=> "progress",
    "icon"              => "icon-tt-progress",
    "wrapper_class"     => "progress-wrapper",
    "params"            => array(
        array(
            "type" => "dropdown",
            "heading" => __("Select progress style", "js_composer"),
            "param_name" => "progress_name",
            "value" => array('Basic', 'Striped', 'Animated'),
            "description" => __('
                <p><b>Basic: </b>Default progress bar with a vertical gradient.</p>
                <p><b>Striped: </b>Uses a gradient to create a striped effect (no IE).</p>
                <p><b>Animated: </b>Takes the striped example and animates it (no IE).</p>
            ', "js_composer")
        ), 
        array(
            "type" => "textfield",
            "heading" => __("Progress size", "js_composer"),
            "param_name" => "progress_size",
            "value" => "100",
            "description" => __("Enter progress size. Example: 0-100", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "js_callback" => array("init" => "ttProgressInitCallBack")
));
/* Hero unit
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Hero unit", "js_composer"),
    "base"		=> "tt_hero_unit",
    "class"		=> "hero-unit",
    "icon"              => "icon-tt-hero-unit",
    "wrapper_class"     => "hero-unit-wrapper",
    "params"            => array(
        array(
            "type" => "textfield",
            "heading" => __("Title", "js_composer"),
            "param_name" => "hero_unit_title",
            "value" => "Hello, world!",
            "description" => __("Hero unit title", "js_composer")
        ),
        array(
            "type" => "exploded_textarea",
            "heading" => __("Tagline", "js_composer"),
            "param_name" => "hero_unit_tagline",
            "value" => "This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.",
            "description" => __("Tagline", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Button text", "js_composer"),
            "param_name" => "hero_unit_button_text",
            "value" => "Learn more",
            "description" => __("Button text", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Button URL", "js_composer"),
            "param_name" => "hero_unit_button_url",
            "value" => "#",
            "description" => __("Button URL", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
));
/* Popovers
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Popover", "js_composer"),
    "base"		=> "tt_popover",
    "class"		=> "popover",
    "icon"              => "icon-tt-popover",
    "wrapper_class"     => "popover-wrapper",
    "params"            => array(
        array(
            "type" => "textfield",
            "heading" => __("Title", "js_composer"),
            "param_name" => "popover_title",
            "value" => "A Title",
            "description" => __("Popover title", "js_composer")
        ),
        array(
            "type" => "exploded_textarea",
            "heading" => __("Content", "js_composer"),
            "param_name" => "popover_content",
            "value" => "And here's some amazing content. It's very engaging. right?",
            "description" => __("Popover content", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Popover text", "js_composer"),
            "param_name" => "popover_text",
            "value" => "hover for popover",
            "description" => __("Popover text", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
));
/* Tooltips
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Tooltip", "js_composer"),
    "base"		=> "tt_tooltip",
    "class"		=> "tooltip",
    "icon"              => "icon-tt-tooltip",
    "wrapper_class"     => "tooltip-wrapper",
    "params"            => array(
        array(
            "type" => "textfield",
            "heading" => __("Text", "js_composer"),
            "param_name" => "tooltip_text",
            "value" => "Hover here",
            "description" => __("Tooltip title", "js_composer")
        ),
        array(
            "type" => "exploded_textarea",
            "heading" => __("Content", "js_composer"),
            "param_name" => "tooltip_content",
            "value" => "Tooltip content",
            "description" => __("Tooltip content", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
));
/* Space
---------------------------------------------------------- */
wpb_map( array(
    "name"		=> __("Space", "js_composer"),
    "base"		=> "tt_space",
    "class"		=> "space",
    "icon"              => "icon-tt-space",
    "wrapper_class"     => "space-wrapper",
    "params"            => array(
        array(
            "type" => "textfield",
            "heading" => __("Space heigh", "js_composer"),
            "param_name" => "height",
            "value" => "15px",
            "description" => __("Enter space height", "js_composer")
        ),
        array(
                "type" => "textfield",
                "heading" => __("Extra class name", "js_composer"),
                "param_name" => "el_class",
                "value" => "",
                "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
)); 
/* Tabs
---------------------------------------------------------- */
WPBMap::map( 'tt_testimonials', array(
    "name"		=> __("Testimonials", "js_composer"),
    "base"		=> "tt_testimonials",
    "controls"	=> "full",
    "class"		=> "wpb_tabs not_dropable_in_third_level not-column-inherit",
	"icon"		=> "icon-tt-testimonials",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Auto rotate slides", "js_composer"),
            "param_name" => "interval",
            "value" => array(0, 3, 5, 10, 15),
            "description" => __("Auto rotate slides each X seconds. Select 0 to disable.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "custom_markup" => '
	<div class="tab_controls">
		<button class="add_tab">'.__("Add testimonial", "js_composer").'</button>
		<button class="edit_tab">'.__("Edit current testimonial title", "js_composer").'</button>
		<button class="delete_tab">'.__("Delete current testimonial", "js_composer").'</button>
	</div>

	<div class="wpb_tabs_holder">
		%content%
	</div>',
    'default_content' => '
	<ul>
		<li><a href="#tab-1"><span>'.__('Testimonial 1', 'js_composer').'</span></a></li>
		<li><a href="#tab-2"><span>'.__('Testimonial 2', 'js_composer').'</span></a></li>
	</ul>

	<div id="tab-1" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>

	<div id="tab-2" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>',
    "js_callback" => array("init" => "wpbTestimonialsInitCallBack", "shortcode" => "wpbTestimonialsGenerateShortcodeCallBack")
    //"js_callback" => array("init" => "wpbTabsInitCallBack", "edit" => "wpbTabsEditCallBack", "save" => "wpbTabsSaveCallBack", "shortcode" => "wpbTabsGenerateShortcodeCallBack")
) );
?>