<?php
	// Template Name: Blog
?>
<?php get_header(); ?>
<?php 
	global $more;
	$more = 0; 
?>
	<div class="container">
    	<div class="span-24 notopmargin">
        	
			<div class="span-16 notopmargin">
            <?php if ( !is_archive() ) { ?>
				<?php $paged = (get_query_var('paged')) ? get_query_var('paged') : 1; query_posts('paged='.$paged.'&cat='.$cat); ?>		
            <?php } ?> 
            <?php if (!(have_posts())) { ?><div class="span-24"><h2 class="colored uppercase">There is no posts</h2></div><?php }  ?>   
            <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); 
            ?>	
            	<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <div class="span-16 notopmargin blog">
                    <div class="span-16 blog-title">
                        <div class="date">
                            <h3 class="colored"><?php the_time('d') ?> <?php the_time('M') ?><br/><span><?php the_time('Y') ?></span></h3>
                        </div>
                        <div class="post-title">
                            <h3><a href="<?php echo the_permalink(); ?>"><?php the_title(); ?></a></h3>
                            <div class="meta author">Author: <?php the_author_meta('nickname'); ?></div>
                            <div class="meta comments"> Comments: <a class="link" href="<?php the_permalink() ?>#comments"><?php comments_number('0','1','%')?></a></div>
                            <div class="meta tags" style="padding-left:20px;">Tags: 
							<?php $tag = get_the_tags();
							if (! $tag) { ?> There is no tags							
							<?php } else { ?>
								<?php the_tags(''); ?>
							<?php } ?>
							</div>
                        </div>
                    </div>
                    <?php if (get_post_meta($post->ID, 'video', true));{ ?>
                    	<div class="view view-first">
						<?php echo get_post_meta($post->ID, 'video', true); ?>
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
                    <div class="span-16 post-short">
                        <?php the_content('<a class="button_readmore" href="'. get_permalink($post->ID) . '"> Read more</a>'); ?>
                    </div>
                </div>
                </div>
                <?php endwhile;  ?> 
				<?php endif; ?>
                <?php if (function_exists('wp_corenavi')) ?><div class="span-16 separator"></div> <?php wp_corenavi(); ?>
            </div>
            <div class="span-8 skills last">
            	<?php get_sidebar(); ?>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<?php get_footer(); ?>