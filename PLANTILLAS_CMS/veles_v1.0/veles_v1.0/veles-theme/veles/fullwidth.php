<?php
	// Template Name: Fullwidth
?>
<?php get_header(); ?>
	<div class="container">
    <div class="span-24">
		<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>	
        <?php the_content(); ?>    
        <?php endwhile;  ?> 
        <?php endif; ?>
    </div>
    <div class="clear"></div>
	</div>
    <div class="clear"></div>
<?php get_footer(); ?>