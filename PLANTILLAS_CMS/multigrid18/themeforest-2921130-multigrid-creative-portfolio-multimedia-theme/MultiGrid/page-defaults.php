<?php
global $post, $blogConf;
$blogConf['layout'] = '2-1-1';
$layout_options = split("-", $blogConf['layout']);
$blogConf['image_width'] = 580;
$blogConf['content_position'] = "";
$blogConf['content_span'] = "span12";
if($layout_options[0] != '0') {
    $blogConf['sidebar_position'] = $layout_options[0]=='2' ? "right" : "left";
    $blogConf['content_position'] = $layout_options[0]=='2' ? "left" : "right";
    $blogConf['content_position'] .= " with-sidebar";
    $blogConf['content_span'] = "span8";
    if (isset($optionss['custom_sidebar'])) {
        $blogConf['sidebar'] = $optionss['custom_sidebar'];
    }
}
$blogConf['hide_pagetitle'] = isset($optionss['hide_pagetitle']) ? true : false;
$blogConf['post_contshow'] = isset($optionss['post_contshow']) ? $optionss['post_contshow'] : 'Full';
$blogConf['post_titleshow'] = isset($optionss['post_titleshow']) ? false : true;
$blogConf['teaser_text'] = '';