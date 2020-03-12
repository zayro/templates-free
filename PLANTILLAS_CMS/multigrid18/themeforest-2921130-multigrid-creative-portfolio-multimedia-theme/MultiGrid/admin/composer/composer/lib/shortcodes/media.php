<?php
/**
 */

class WPBakeryShortCode_VC_Video extends WPBakeryShortCode {

    protected function content( $atts, $content = null ) {
        $title = $link = $size = $el_position = $width = $el_class = '';
        extract(shortcode_atts(array(
            'title' => '',
            'link' => '',
            'size' => ( isset($content_width) ) ? $content_width : 500,
            'el_position' => '',
            'width' => '1/1',
            'el_class' => ''
        ), $atts));
        $output = '';

        if ( $link == '' ) { return null; }
        $video_h = '';
        $el_class = $this->getExtraClass($el_class);
        $width = wpb_translateColumnWidthToSpan($width);
        $size = str_replace(array( 'px', ' ' ), array( '', '' ), $size);
        $size = explode("x", $size);
        $video_w = $size[0];
        if ( count($size) > 1 ) {
            $video_h = ' height="'.$size[1].'"';
        }

        global $wp_embed;
        $embed = $wp_embed->run_shortcode('[embed width="'.$video_w.'"'.$video_h.']'.$link.'[/embed]');

        $output .= '<div class="wpb_video_widget wpb_content_element '.$width.$el_class.'">';
        $output .= '<div class="wpb_wrapper">';
        $output .= ($title != '' ) ? '<h2 class="wpb_heading wpb_video_heading">'.$title.'</h2>' : '';
        $output .= $embed;
        $output .= '</div>'.$this->endBlockComment('.wpb_wrapper');
        $output .= '</div>'.$this->endBlockComment($width);

        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }
}
class WPBakeryShortCode_VC_Gmaps extends WPBakeryShortCode {

    protected function content( $atts, $content = null ) {

        $title = $link = $size = $zoom = $type = $el_position = $width = $el_class = '';
        extract(shortcode_atts(array(
            'title' => '',
            'link' => '',
            'size' => 200,
            'zoom' => 14,
            'type' => 'm',
            'el_position' => '',
            'width' => '1/1',
            'el_class' => ''
        ), $atts));
        $output = '';

        if ( $link == '' ) { return null; }

        $el_class = $this->getExtraClass($el_class);
        $width = wpb_translateColumnWidthToSpan($width);

        $size = str_replace(array( 'px', ' ' ), array( '', '' ), $size);

        $output .= '<div class="wpb_gmaps_widget wpb_content_element '.$width.$el_class.'">';
        $output .= '<div class="wpb_wrapper">';
        $output .= ($title != '' ) ? '<h2 class="wpb_heading wpb_video_heading">'.$title.'</h2>' : '';
        $output .= '<div class="wpb_map_wraper"><iframe width="100%" height="'.$size.'" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="'.$link.'&amp;t='.$type.'&amp;z='.$zoom.'&amp;output=embed"></iframe></div>';
        $output .= '</div>'.$this->endBlockComment('.wpb_wrapper');
        $output .= '</div>'.$this->endBlockComment($width);

        $output = $this->startRow($el_position) . $output . $this->endRow($el_position);
        return $output;
    }
}