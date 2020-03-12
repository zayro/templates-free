<?php
global $blogConf;
get_template_part('page', 'defaults');
get_header();
the_post(); ?>
<!-- Start Page -->
<section id="page" class="clearfix">
    <div class="content">
        <div class="header-page"><?php get_template_part('post', 'author'); ?></div>
        <div id="masonry" class="clearfix">
            <div class="mansonry-container">
                <!-- Start Featured Article -->
                    <?php get_template_part('loop');?>
                <!-- End Featured Article -->
            </div>
        </div>
    </div>
</section>
<!-- End Page -->
<?php get_footer(); ?>