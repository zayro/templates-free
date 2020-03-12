<?php
global $blogConf;
get_template_part('page', 'defaults');

if (is_day ()) :
    $blogConf['title'] = __('Daily Archives', 'themeton') . ' : ' . get_the_date();
elseif (is_month ()) :
    $blogConf['title'] = __('Monthly Archives', 'themeton') . ' : ' . get_the_date('F Y');
elseif (is_year ()) :
    $blogConf['title'] = __('Yearly Archives', 'themeton') . ' : ' . get_the_date('Y');
else : 
    $blogConf['title'] = __('Blog Archives', 'themeton');
endif;

get_header(); ?>
<!-- Start Page -->
<section id="page" class="clearfix">
    <div class="content">
        <div class="header-page">
            <h2 class="item-title">
                <?php echo $blogConf['title'];?>
            </h2>
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
    </div>
</section>
<!-- End Page -->
<?php get_footer(); ?>