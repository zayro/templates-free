<?php       
/**
 * @package WordPress
 * @since 1.0
 */
 
/*
Template Name: Blog
*/

get_header() ?>                        
        
		<div class="layout-<?php echo yiw_layout_page() ?> group">
        
            <?php query_posts('cat=' . yiw_get_exclude_categories() . '&posts_per_page=' . get_option('posts_per_page') . '&paged=' . $paged) ?>
            
            <!-- START CONTENT -->
            <div id="content" class="group">
                <?php get_template_part('loop', 'index') ?>
            </div>                       
            <!-- END CONTENT -->
            
            <!-- START SIDEBAR -->
            <?php get_sidebar('blog') ?>
            <!-- END SIDEBAR -->    
        
        </div>   
                              
        <!-- START EXTRA CONTENT -->
		<?php get_template_part( 'extra-content' ) ?>      
        <!-- END EXTRA CONTENT -->    
        
<?php get_footer() ?>