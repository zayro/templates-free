<?php
/*
 * template name: Blog
 */
global $isBlog;
$isBlog = true;
get_template_part('page', 'config');
get_header(); ?>
<!-- Start Page -->
<section id="page" class="clearfix loading">
    <div class="content">
        <?php if($blogConf['hide_pagetitle'] || $blogConf['teaser_text']!="") { ?>
            <div class="header-page">
                <?php if($blogConf['hide_pagetitle']) { ?>
                    <h2 class="item-title">
                        <?php echo $blogConf['title'];?>
                    </h2>
                <?php }
                    if($blogConf['teaser_text']!="") { ?>
                    <div class="page-teaser">
                        <p><?php echo $blogConf['teaser_text'];?></p>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
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
<?php
get_footer();
?>