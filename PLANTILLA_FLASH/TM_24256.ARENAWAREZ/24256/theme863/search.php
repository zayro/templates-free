<?php get_header(); ?>

<div class="column-center">
    <div class="indent-center">
	<div class="box2">
	<div class="corner-bottom-left">
    
		<img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/banner.jpg" /><br />
        
                                        

    <h2 class="pagetitle">Search Results</h2>

	<?php if (have_posts()) : ?>

		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
		</div>

        
		<?php while (have_posts()) : the_post(); ?>
        
			<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
                <div class="title">
					<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
					<div class="container">
						<div class="date">
							 <?php the_time('L, F j, Y') ?>
						</div>
						<div class="author">
							Posted by <a href="#"><?php the_author_link() ?></a>
						</div>
					</div>
				</div>
                <p class="postmetadata"><?php the_tags('Tags: ', ', ', '<br />'); ?></p>
                
            </div>

		<?php endwhile; ?>

            
		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
		</div>

	<?php else : ?>
		<div class="indent-search">
        	
            <h2 class="pagetitle">No posts found. Try a different search?</h2>
            <div class="search">
                <?php include (TEMPLATEPATH . "/searchform.php"); ?>
            </div><strong></strong>
            
        </div>

	<?php endif; ?>
    
    

    </div>
    </div>
    </div>
</div>
<?php get_sidebar(1); ?>
<?php get_footer(); ?>