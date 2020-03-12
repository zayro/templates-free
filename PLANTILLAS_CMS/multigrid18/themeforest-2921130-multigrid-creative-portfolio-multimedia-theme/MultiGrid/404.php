<?php
/*
 * @package themeton
 */
get_template_part('page', 'defaults');
    $blogConf['title'] = __('This is somewhat embarrassing, isn&rsquo;t it?', 'themeton');
get_header(); 
global $blogConf; ?>
<!-- Start Page -->
<section id="page" class="clearfix">
    <div class="single-no-ajax">
        <div class="single-container clearfix">
            <div class="item-single">
                <article class="not-found border">
                    <h1><?php _e( 'Not Found', 'themeton' ); ?></h1>
                    <p><?php _e('It seems we can&rsquo;t find what you&rsquo;re looking for. Perhaps searching, or one of the links below, can help.', 'themeton'); ?></p>
                    <?php get_search_form(); ?>
                </article>
            </div><?php
            $blogConf['sidebar_position'] = "right";
            get_sidebar(); ?>
        </div>
    </div>
</section>
<!-- End Page --><?php
get_footer(); ?>