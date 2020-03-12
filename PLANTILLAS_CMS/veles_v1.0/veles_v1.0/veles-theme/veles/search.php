<?php get_header(); ?>

        <!-- MAIN CONTENT -->
		<div class="container">
			<div class="span-16">
            <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
                <div class="blockquote4" style="border-top:none!important;"><a href="<?php the_permalink(); ?>"><h6 class="colored"><?php the_title(); ?></h6></a><?php the_time('l, F j, Y'); ?></div>
              <?php endwhile; else: ?>
                <div class="span-16">
                <h3 class="colored">There is no results</h3>
			</div>

          <?php endif; ?> 
			</div> 
            <div class="span-8 skills last">
            	<?php get_sidebar(); ?>
            </div>            	
		</div>
<div class="clear"></div> 

<?php get_footer(); ?>