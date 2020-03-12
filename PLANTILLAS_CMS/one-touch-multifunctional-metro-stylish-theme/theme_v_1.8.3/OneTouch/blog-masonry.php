<?php
/*
Template Name: Blog with Masonry Blocks
*/
?>

<?php global $NHP_Options; ?>
<?php get_template_part('templates/page', 'header'); ?>

<div class="row">
  <div class="fifteen columns">
    <?php

      if ( is_front_page() ) {
          $paged = (get_query_var('page')) ? get_query_var('page') : 1;
      } else {
          $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
      }
    query_posts('post_type=post&posts_per_page='.$NHP_Options->get('masonry_posts_per_page').'&paged=' . $paged);

    get_template_part('templates/content', 'grid');
   ?>

  </div>
</div>

<?php
wp_enqueue_script('masonry');
wp_enqueue_script('easing');

wp_enqueue_style('grid', get_template_directory_uri() . '/assets/css/grid.css', false, null);
?>

<script type="text/javascript">
  jQuery(document).ready(function(){


    var $container = jQuery('#grid-posts');

    $container.imagesLoaded( function(){
      $container.masonry({
        itemSelector : 'article.mini'
      });
    });


  });
</script>