<?php
global $featured_image_printed, $blogConf;
$featured_image_printed = true;

echo '<div class="entry-video clearfix">';
echo get_post_meta($post->ID, 'tt-video-embed', true);
echo '</div>';
?>
