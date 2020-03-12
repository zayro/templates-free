<?php get_header(); ?>

<div class="column-center">
	<div class="indent-center">
	<div class="box2">
	<div class="corner-bottom-left">
    
		<img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/banner.jpg" /><br />
		
		<p class="extra">Recent posts</p>
		
	<?php if (have_posts()) : ?>
    
		<?php while (have_posts()) : the_post(); ?>
            
			<div class="post">
				<div class="title">
					<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
					<div class="container">
						<div class="date">
							 <?php the_time('l, F j, Y') ?>
						</div>
						<div class="author">
							Posted by <a href="#"><?php the_author_link() ?></a>
						</div>
					</div>
				</div>
				<div class="text-box">
					<div class="ind">
						<?php the_content(''); ?>
					</div>
				</div>
				<div class="container">
					<div class="comments">
						<?php comments_popup_link('<span><span>0 Comments</span></span>', '<span><span>0 Comment</span></span>', '<span><span>% Comments</span></span>'); ?><?php edit_post_link('<span><span>Edit</span></span>', '', ''); ?>
					</div>
					<div class="link">
						<a href="<?php the_permalink() ?>#more-<?php the_id() ?>" class="button"><span><span>Read more</span></span></a>
					</div>
				</div>
			</div>
			
		<?php endwhile; ?>
            
            <div class="navigation">
                <div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
                <div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
            </div>

	<?php else : ?>

		<h2 class="pagetitle">No posts found. Try a different search?</h2>
        <div class="search">
        	<?php include (TEMPLATEPATH . "/searchform.php"); ?>
        </div>

	<?php endif; ?>

	</div>
	</div>
    </div>
</div>
<?php get_sidebar(1); ?>
<?php get_footer(); ?>
