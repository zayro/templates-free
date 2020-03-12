<?php get_template_part('templates/page', 'header'); ?>

<div id="content" class="row">

    <div class="fifteen columns">


        <a href="<?php echo wp_get_attachment_url($post->ID); ?>"><?php echo wp_get_attachment_image($post->ID, 'large'); ?></a>


    </div>
</div>