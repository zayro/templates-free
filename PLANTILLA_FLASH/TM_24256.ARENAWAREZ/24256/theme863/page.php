<?php get_header(); ?>

<div class="column-center">
    <div class="indent-center">
	<div class="box2">
	<div class="corner-bottom-left">
    
		<img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/banner.jpg" /><br />
    
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
        
		<div class="post" id="post-<?php the_ID(); ?>">
            <div class="title">
                <h2 class="pages"><?php the_title(); ?></h2>
            </div>
			<div class="text-box">
            	<div class="ind">
                	
                    <?php the_content('<p class="serif">Read the rest of this page &raquo;</p>'); ?>

					<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
                    
        		</div>
			</div>
		</div>
        
		<?php endwhile; endif; ?>
		<?php edit_post_link('Edit this entry.', '<p class="link-edit">', '</p>'); ?>
    
    </div>
    </div>
    </div>
</div>
<?php get_sidebar(1); ?>
<?php get_footer(); ?>