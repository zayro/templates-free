<?php

global $featured_image_printed, $blogConf;
$format = get_post_format();
if (false === $format || $format == 'image' || (!is_single()&&$format == 'video')) {
    $permalink = is_single() ? true : false;
    $featured_image_printed = post_image_show_auto_size($permalink);
}else{
    echo '<div class="item-media">';
    get_template_part('format', $format);
    echo '</div>';
} ?>