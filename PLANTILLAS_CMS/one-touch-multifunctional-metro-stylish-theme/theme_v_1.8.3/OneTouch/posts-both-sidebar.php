<?php
/*
Template Name: Posts with both sidebars
*/
?>


<?php  get_template_part('templates/page', 'header'); ?>

  <div class="row">

      <?php

$data['archive_layout'] = "3c-fixed";

if (($data['archive_layout'] == "2c-l-fixed") || ($data['archive_layout'] == "3c-fixed")) {
    get_template_part('templates/sidebar', 'left');
}
if (($data['archive_layout'] == "2c-l-fixed") || ($data['archive_layout'] == "2c-r-fixed")) {
    echo '<div id="content" class="eleven columns">';
} elseif (($data['archive_layout'] == "1col-fixed")) {
    echo '<div id="content" class="fifteen columns">';
} else {
    echo '<div id="content" class="seven columns">';
}
    if ( is_front_page() ) {
        $paged = (get_query_var('page')) ? get_query_var('page') : 1;
    } else {
        $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
    }

    query_posts('post_type=post&posts_per_page='.$NHP_Options->get('posts_per_page').'&paged=' . $paged);

    get_template_part('templates/content', '');

echo '</div>';
if ($data['archive_layout'] == "3c-r-fixed") {
    get_template_part('templates/sidebar', 'left');
}

if (($data['archive_layout'] == "2c-r-fixed") || ($data['archive_layout'] == "3c-fixed") || ($data['archive_layout'] == "3c-r-fixed")) {
    get_template_part('templates/sidebar', 'right');
} ?>

</div>