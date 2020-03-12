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
	<!-- Conditional Statements for .page-heading -->
	<?php $post = $posts[0]; ?>
	<?php /* If this is a tag archive */ if( is_tag() ) { ?>
		<h1><?php _e("Posts tagged with", "swiftframework"); ?> &#8216;<?php single_tag_title(); ?>&#8217;</h1>
	<?php /* If this is a daily archive */ } elseif (is_day()) { ?>
		<h1><?php _e("Archive for", "swiftframework"); ?> <?php the_time('F jS, Y'); ?></h1>
	<?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
		<h1><?php _e("Archive for", "swiftframework"); ?> <?php the_time('F, Y'); ?></h1>
	<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
		<h1><?php _e("Archive for", "swiftframework"); ?> <?php the_time('Y'); ?></h1>
	<?php /* If this is an author archive */ } elseif (is_author()) { ?>
		<?php $author = get_userdata( get_query_var('author') );?>
			<h1><?php _e("Author archive for", "swiftframework"); ?> <?php echo $author->display_name;?></h1>
	<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
		<h1><?php _e("Blog Archives", "swiftframework"); ?></h1>
	<?php } else { ?>
		<h1><?php wp_title(''); ?></h1>
	<?php } ?>
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