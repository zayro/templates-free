<?php
get_template_part('single', 'config');
get_header();
global $blogConf, $show, $single_content_type;
if (have_posts ()) { the_post();
    $single_content_type=array('item','teaser');
    if($blogConf['layout'] == '0-1-1')
        unset($blogConf['sidebar_position']);
    get_template_part('content', 'single');
}
get_footer(); ?>