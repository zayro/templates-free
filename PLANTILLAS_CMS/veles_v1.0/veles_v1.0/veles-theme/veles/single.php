<?php get_header(); ?>
	<div class="container">
    	<div class="span-24 notopmargin">
			<div class="span-16 notopmargin">
                <div class="span-16 notopmargin blog">
                	<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>	
                    <div class="span-16 blog-title">
                        <div class="date">
                            <h3 class="colored"><?php the_time('d') ?> <?php the_time('M') ?><br/><span><?php the_time('Y') ?></span></h3>
                        </div>
                        <div class="post-title">
                            <h3><?php the_title(); ?></h3>
                            <div class="meta author">Author: <?php the_author(); ?></div>
                            <div class="meta comments"> Comments: <a class="link" href="<?php the_permalink() ?>#comments"><?php comments_number('0','1','%')?></a></div>
                            <div class="meta tags" style="padding-left:20px;">
							<?php $tag = get_the_tags();
							if (! $tag) { ?> No tags here							
							<?php } else { ?>
								<?php the_tags('Tags:'); ?>
							<?php } ?>
							</div>
                        </div>
                    </div>
                    <?php if (get_post_meta($post->ID, video, true));{ ?>
                    	<div class="view view-first">
						<?php echo get_post_meta($post->ID, video, true); ?>
                        </div>
                    <?php } ?>
                    <?php if ( has_post_thumbnail()) { ?>
                    <div class="view view-first">
                    	<?php $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); ?>
                         <?php  
								$pretty_attr = array(
											'class'	=> "bordered_img last center",
							); ?>
                        <div class="blog_wide"><a><?php if ( has_post_thumbnail()) { the_post_thumbnail('blog3',$pretty_attr);	} ?></a></div>
                        <div class="mask">
                            <a href="<?php echo $large_image_url[0]; ?>" rel="prettyPhoto" class="info">Zoom image</a>
                        </div>
                    </div>
                    <?php } ?>
					<div class=" span-16 post-short">
                    	<?php the_content(' '); ?>
                        <div class="big-separator"></div>
                        <?php endwhile;  ?>      
	 					<?php endif; ?>
                    <?php comments_template(); ?> 	   
                    </div>
                 </div>
            </div>
            <div class="span-8 skills last">
				<?php get_sidebar(); ?>
            </div>
        </div>
    </div>
    <div class="clear"></div>
<?php get_footer(); ?>