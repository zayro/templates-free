<?php
	get_header();
	if ( have_posts() ): the_post();
?>
	<!-- Start Content Wrapper -->
	<div class="content_wrapper">
		<?php get_template_part('part', 'title'); ?>
		<div id="content">
			<div class="partners">
				<ul>
<?php
	do {
		$partner_link = get_post_meta(get_the_ID(), 'partner_link', true);
?>
					<li id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
						<div class="partner_item">
						<?php if (has_post_thumbnail()): ?>
							<?php the_post_thumbnail('gallery_thumb', array('title' => false, 'class' => false)); ?>
							<div class="caption">
								<h4><?php the_title(); ?></h4>
								<?php the_excerpt(); ?>
								<?php if (!empty($partner_link)): ?>
								<a href="<?php echo $partner_link; ?>" class="partner_link" title="<?php the_title(); ?>" target="_blank"><?php echo $partner_link; ?></a>
								<?php endif; ?>
							</div>
						<?php else: ?>
							<img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo get_bloginfo('template_url').'/images/no_image.gif&w=214&h=194'; ?>" alt="" />
						<?php endif; ?>
						</div>
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