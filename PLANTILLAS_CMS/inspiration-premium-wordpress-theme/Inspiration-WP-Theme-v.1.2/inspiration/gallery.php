<?php
	get_header();
	if ( have_posts() ): the_post();
?>
	<!-- Start Content Wrapper -->
	<div class="content_wrapper">
		<?php //get_template_part('part', 'title'); ?>
		<div id="content">
<?php
	$terms = array();
	$terms[0] = get_term_by( 'slug', get_query_var( 'term' ), get_query_var( 'taxonomy' ) );
	$childrens = get_term_children( $terms[0]->term_id, 'gallery' );
	foreach ($childrens as $children) {
		$terms[] = get_term($children, 'gallery');
	}
?>
			<!-- View By Box -->
			<div class="splitter_wrap">
				<strong><?php _e('Sort by:', TEMPLATENAME); ?></strong>
				<ul id="filter" class="splitter">
					<?php foreach($terms as $key => $term): ?>
					<li><a href="#top" rel="<?php echo $term->slug; ?>" title="<?php echo $term->name; ?>"><?php echo $term->name; ?></a></li>
					<?php endforeach; ?>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="gallery">
			<!-- Portfolio Full Box -->
			<ul id="portfolio">
<?php
	do {
		$_readmore_text = get_option('blog_more_text');
		$gallery_categories = get_the_terms($post->ID, 'gallery');
		$term_classes = array();
		foreach($gallery_categories as $cat) {
			$term_classes[] = $cat->slug;
		}
		$term_classes = implode(' ', $term_classes);

		//$video_link = get_post_meta(get_the_ID(), 'video_link', true);
		$portfolio_type = get_post_meta(get_the_ID(), 'switch', true);
		$image_id = get_post_thumbnail_id();
		$full_thumbnail = wp_get_attachment_image_src($image_id, 'full');
?>
				<li id="id<?php echo the_ID(); ?>" class="<?php echo $term_classes; ?>">
					<div class="gallery_item">
					<?php if (has_post_thumbnail()): ?>
						<?php the_post_thumbnail('gallery_thumb', array('title' => false, 'class' => 'cover')); ?>
						<h4><?php the_title(); ?></h4>
						<?php the_excerpt(); ?>
					<?php if (!empty($_readmore_text)): ?>
						<a href="<?php the_permalink(); ?>" class="btn alignleft" title="<?php echo $_readmore_text; ?>"><?php echo $_readmore_text; ?></a>
					<?php endif; ?>
					<?php if ($portfolio_type == 'image rotator' || $portfolio_type == ''): ?>
						<a href="<?php echo $full_thumbnail[0]; ?>" class="zoom" data-rel="prettyPhoto[gallery]" title="<?php _e('Enlarge', TEMPLATENAME); ?>"><?php _e('Enlarge', TEMPLATENAME); ?></a>
					<?php endif; ?>
					<?php else: ?>
						<img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo get_bloginfo('template_url').'/images/no_image.gif&w=214&h=194'; ?>" class="cover" alt="" />
					</div>
					<?php endif; ?>
				</li>
<?php
		if (!have_posts())
			break;
		the_post();
	} while (1);
?>
			</ul>
			</div>
			<?php /* Display navigation to next/previous pages when applicable */
			if ($wp_query->max_num_pages > 1): ?>
			<!-- Start Paging -->
				<?php	if (function_exists('wp_pagenavi')):
						echo wp_pagenavi();
				else: ?>
			<div class="navigation" id="nav-below">
				<div class="nav-previous"><?php next_posts_link(__('<span class="meta-nav">&larr;</span> Older posts', TEMPLATENAME)); ?></div>
				<div class="nav-next"><?php previous_posts_link(__('Newer posts <span class="meta-nav">&rarr;</span>', TEMPLATENAME)); ?></div>
			</div><!-- #nav-below -->
				<?php endif; ?>
			<!-- End Paging -->
			<?php endif; ?>
			<div class="clear"></div>
		</div>
	</div>
	<!-- End Content Wrapper -->
<?php
	endif;
	get_footer();
 ?>