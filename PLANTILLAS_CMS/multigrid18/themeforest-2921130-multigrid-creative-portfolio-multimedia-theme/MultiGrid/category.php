<?php
global $blogConf;
get_template_part('page', 'defaults');

$blogConf['title'] = __("Category", "themeton") . " : " . single_cat_title("", false);
get_header(); ?>
<!-- Start Page -->
<section id="page" class="clearfix">
    <div class="content">
        <div class="header-page">
            <h2 class="item-title">
                <?php echo $blogConf['title'];?>
            </h2>
            <div class="page-teaser">
                <?php echo category_description();?>
            </div>
        </div>
        <div id="masonry" class="clearfix">
            <div class="mansonry-container">
                <!-- Start Featured Article -->
                <?php get_template_part('loop');?>
                <!-- End Featured Article -->
            </div>
            <?php infiniteScroll(); ?>
        </div>
    </div>
</section>
<!-- End Page -->
<?php get_footer(); ?>