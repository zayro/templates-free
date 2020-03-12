<?php        
/**
 * @package WordPress
 * @subpackage YIW Themes
 * @since 1.0
 */                        

get_header() ?>                        
        
		<div class="layout-<?php echo yiw_layout_page() ?> group">
        
            <!-- START CONTENT -->
            <div id="content" role="main" class="group">
                <?php get_template_part( 'loop', 'page' ) ?> 
                
                <?php comments_template() ?>
            </div>
            <!-- END CONTENT -->
            
            <!-- START SIDEBAR -->
            <?php get_sidebar() ?>
            <!-- END SIDEBAR -->    
        
        </div>   
                              
        <!-- START EXTRA CONTENT -->
		<?php get_template_part( 'extra-content' ) ?>      
        <!-- END EXTRA CONTENT -->    
        
<?php get_footer() ?>
