<?php get_header(); ?>

<?php
	$options = get_option('sf_pinpoint_options');
	$page_layout = $options['page_layout'];
?>

<div class="page-heading full-width clearfix">
	<?php if ($page_layout == "fullwidth") { ?>
	<div class="container">
	<div class="sixteen columns">
	<?php } ?>
	<h1><?php single_cat_title(); ?></h1>
	<?php if ($page_layout == "fullwidth") { ?>
	</div>
	</div>
	<?php } ?>
</div>

<?php if ($page_layout == "fullwidth") { ?>
<div class="container">
<div class="sixteen columns">
<?php } ?>
<div class="inner-page-wrap has-right-sidebar has-one-sidebar clearfix">
	
	<div class="blog-listings eleven columns alpha">
	
	<?php if(have_posts()) : ?>
		
		<!-- OPEN .blog-items -->
		<ul class="blog-items">

		<?php while (have_posts()) : the_post(); ?>

			<li class="blog-item">
			<?php // The following determines what the post format is and shows the correct file accordingly
				$format = get_post_format();
				if($format == 'quote') {
				get_template_part( 'includes/post-formats/quote' );
				} else {
				get_template_part( 'includes/post-formats/standard' );
				}
			?>
			</li>

		<?php endwhile; ?>
				
		<!-- CLOSE .blog-items -->
		</ul>
		
	<?php endif; ?>
		
	<?php if ( has_previous_posts() || has_next_posts() ) { ?>

		<!-- OPEN .pagination-wrap .blog-pagination .full-width .clearfix -->
		<div class="pagination-wrap blog-pagination full-width clearfix">
		
			<div class="nav-previous"><?php next_posts_link(__('<i class="icon-chevron-left"></i> <span class="nav-text">Older Entries</span>', "swiftframework")); ?></div>
			<?php wp_link_pages(); ?>
			<div class="nav-next"><?php previous_posts_link(__('<span class="nav-text">Newer Entries</span><i class="icon-chevron-right"></i>', "swiftframework")); ?></div>		
			
		<!-- CLOSE .pagination-wrap .blog-pagination .full-width .clearfix -->
		</div>

	<?php } ?>
	
	</div>
	
	<aside class="sidebar right-sidebar five columns omega">
		<?php dynamic_sidebar(); ?>
	</aside>
	
</div>

<?php if ($page_layout == "fullwidth") { ?>
</div>
</div>
<?php } ?>

<!-- WordPress Hook -->
<?php get_footer(); ?>