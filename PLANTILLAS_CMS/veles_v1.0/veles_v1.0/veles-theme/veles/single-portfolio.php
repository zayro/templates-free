
<?php get_header(); ?>
		<div class="container">
        <div class="span-24 notopmargin">
		<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
			 		
		<div class="span-16">
        	
            <div id="article" <?php if (!((get_post_meta($post->ID, image, true)) || (get_post_meta($post->ID, image2, true)) || (get_post_meta($post->ID, image3, true)))) { ?>class="slider_area"<?php } ?>>
            	<?php if ((get_post_meta($post->ID, image, true)) || (get_post_meta($post->ID, image2, true)) || (get_post_meta($post->ID, image3, true))) { ?>
                    <?php if (get_post_meta($post->ID, image, true)) { ?>
                    <blockquote>
                    	<img class="slider_area" src="<?php echo get_post_meta($post->ID, image, true); ?>" width="600px" height="auto" alt="" title="" />
					</blockquote>       
                    <?php } ?>
                    <?php if (get_post_meta($post->ID, image2, true)) { ?>
                    <blockquote>
                    	<img class="slider_area" src="<?php echo get_post_meta($post->ID, image2, true); ?>" width="600px"  height="auto" alt="" title="" />
					</blockquote>        
                    <?php } ?>
                    <?php if (get_post_meta($post->ID, image3, true)) { ?>
                    <blockquote>
                    	<img class="slider_area" src="<?php echo get_post_meta($post->ID, image3, true); ?>" width="600px" height="auto" alt="" title="" />
					</blockquote>        
                    <?php } ?>
                    <div class="clear"></div>
            	<?php }  ?>
                <?php if (get_post_meta($post->ID, video, true));{ ?>
                	<?php echo get_post_meta($post->ID, video, true); ?>
                <?php }?>
                
                <?php if ( get_post_meta($post->ID, image_single, true)) { ?>
                    <div class="view view-first">
                    	<?php $large_image_url = wp_get_attachment_image_src( get_post_meta($post->ID, image_single, true)); ?>
                         <?php  
								$pretty_attr = array(
											'class'	=> "bordered_img last center",
							); ?>
                        <div class=""><a><img src="<?php echo get_post_meta($post->ID, image_single, true); ?>" width="600px" alt="" title="" /></a></div>
                        <div class="mask">
                            <a href="<?php echo get_post_meta($post->ID, image_single, true); ?>" rel="prettyPhoto" class="info">Zoom image</a>
                        </div>
                    </div>
                    <div class="clear"></div>
				<?php } ?>
                
                <?php if ((!(get_post_meta($post->ID, image, true))) & (!(get_post_meta($post->ID, image2, true))) & (!(get_post_meta($post->ID, image3, true))) & (!(get_post_meta($post->ID, image_single, true))) & (!(get_post_meta($post->ID, video, true)))) { ?>
                <h4 class="uppercase center" style="color:#fff; margin-bottom:0px;">Please upload images or past code for video</h4>
            	<?php } ?>
            </div>
            <div class="clear"></div>
            	</div>
            <div class="span-8 skills last">
                <div class="sidebar">
                	<h5><?php the_title(); ?></h5>
                    <?php if (get_post_meta($post->ID, image_logo, true)) { ?>
                    <div class="logo" style=" text-align:center;">
                        <img src="<?php echo get_post_meta($post->ID, image_logo, true); ?>" alt="Logo-<?php the_title(); ?>" />
                    </div>
                    <div class="clear"></div>
                    <?php } ?>
                    <p><?php the_content(''); ?></p>
                    <?php if (get_post_meta($post->ID, custom_description, true)) { ?>
                    <h6><?php echo stripslashes(get_post_meta($post->ID, custom_title, true)); ?></h6>
                    <p><?php echo stripslashes(get_post_meta($post->ID, custom_description, true)); ?></p>
                    <div class="clear"></div>
                    <div class="big-separator"></div>
					<?php } ?>
                    <?php if (get_post_meta($post->ID, custom_description2, true)) { ?>
                    <h6><?php echo stripslashes(get_post_meta($post->ID, custom_title2, true)); ?></h6>
                    <p><?php echo stripslashes(get_post_meta($post->ID, custom_description2, true)); ?></p>
                    <div class="clear"></div>
                    <?php if (get_post_meta($post->ID, custom_description3, true)) { ?>
                    <div class="big-separator"></div>
					<?php } ?>
					<?php } ?>
                    <?php if (get_post_meta($post->ID, custom_description3, true)) { ?>
                    <h6><?php echo stripslashes(get_post_meta($post->ID, custom_title3, true)); ?></h6>
                    <p><?php echo stripslashes(get_post_meta($post->ID, custom_description3, true)); ?></p>
                    <div class="clear"></div>
					<?php } ?>
                </div>
            </div>
		<?php endwhile;  ?>
	 <?php endif; ?>
     	
     </div>	
  <!--- END SIDEBAR -->
<div class="clear"></div>
</div>
<?php get_footer(); ?>