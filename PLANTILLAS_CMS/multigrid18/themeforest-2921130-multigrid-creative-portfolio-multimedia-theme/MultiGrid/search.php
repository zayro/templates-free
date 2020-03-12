<?php
/*
 * @package themeton
 */
get_template_part('page', 'defaults');
$blogConf['sidebar_position']=' right';
get_header();
global $blogConf; ?>
<section id="page" class="clearfix">
    <!-- Start Page --><?php
    if (have_posts ()) { ?>
            <div class="content">
                <div class="header-page">
                    <h2 class="item-title">
                        <?php _e('Search result', 'themeton');?>
                    </h2>
                    <div class="page-teaser">
                        <div class="widget_search"><?php get_search_form(); ?></div>
                    </div>
                </div>
                <div id="masonry" class="clearfix">
                    <div class="mansonry-container">
                        <!-- Start Featured Article --><?php
                        if (have_posts ()) the_post();

                        rewind_posts();
                        get_template_part('loop'); ?>
                        <!-- End Featured Article -->
                    </div>
                    <?php infiniteScroll(); ?>
                </div>
            </div><?php
    } else { ?>
        <!-- Start Page -->
            <div class="single-no-ajax">
                <div class="single-container clearfix">
                    <div class="item-single">
                        <article class="not-found border">
                            <div class="not-found-message">
                                <p><?php _e('Sorry, but nothing matched your search criteria. Please try again with some different keywords.', 'themeton'); ?></p>
                            </div>
                            <div class="widget_search"><?php get_search_form(); ?></div>
                        </article>
                    </div><?php
                    $blogConf['sidebar_position'] = "right";
                    get_sidebar(); ?>
                </div>
            </div>
        <!-- End Page --><?php
    } ?>
    <!-- End Page -->
</section><?php
get_footer(); ?>