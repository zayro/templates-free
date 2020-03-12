<?php
	$_readmore_text = get_option('blog_more_text');
	$columns = (isset($_GET['columns'])) ? $_GET['columns'] : '';
	if ($columns)
		update_option('blog_type', $columns);
	$blog_type = get_option('blog_type');
	do {
?>
		<?php if ($blog_type == 'default_blog'): ?>
		<!-- Start Post -->
		<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
			<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
			<div class="posted">
				<span class="date"><?php echo get_the_date('M, d, Y'); ?></span>
				<span class="author"><?php printf('<a href="%1$s" title="%2$s">%3$s</a>', get_author_posts_url(get_the_author_meta('ID')), sprintf(esc_attr__('View all posts by %s', TEMPLATENAME), get_the_author()), get_the_author()); ?></span>
				<span class="category"><?php if (count(get_the_category())): ?><?php echo get_the_category_list(', '); ?><?php endif; ?></span>
				<span class="comments"><a href="<?php echo get_comments_link(); ?>" title="<?php comments_number(); ?>"><?php comments_number('0', '1', '%'); ?></a></span>
				<div class="clear"></div>
			</div>
			<?php if(has_post_thumbnail()): ?>
			<!-- Post Thumbnail -->
			<div class="post_thumb"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('blog', array('title' => false, 'class' => 'pic')); ?></a></div>
			<!-- End Post Thumbnail -->
			<?php endif; ?>
			<div class="excerpt">
				<!-- Post Excerpt -->
				<?php the_excerpt(); ?>
			</div>
			<!-- Read More Btn -->
			<?php if (!empty($_readmore_text)): ?>
			<a href="<?php the_permalink(); ?>" class="btn alignleft" title="<?php echo $_readmore_text; ?>"><?php echo $_readmore_text; ?></a>
			<?php endif; ?>
			<div class="clear"></div>
		</div>
		<!-- End Post -->
		<?php else: ?>
		<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
			<?php if(has_post_thumbnail()): ?>
			<!-- Post Thumbnail -->
			<div class="post_thumb_alternate"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('blog_alternate', array('title' => false, 'class' => 'pic')); ?></a></div>
			<!-- End Post Thumbnail -->
			<?php endif; ?>
			<div class="post_descr_alternate">
				<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
				<div class="posted_alternate">
					<span class="date"><?php echo get_the_date('M, d, Y'); ?></span>
					<span class="author"><?php printf('<a href="%1$s" title="%2$s">%3$s</a>', get_author_posts_url(get_the_author_meta('ID')), sprintf(esc_attr__('View all posts by %s', TEMPLATENAME), get_the_author()), get_the_author()); ?></span>
					<span class="category"><?php if (count(get_the_category())): ?><?php echo get_the_category_list(', '); ?><?php endif; ?></span>
					<span class="comments"><a href="<?php echo get_comments_link(); ?>" title="<?php comments_number(); ?>"><?php comments_number('0', '1', '%'); ?></a></span>
				</div>
				<div class="excerpt">
					<?php the_excerpt(); ?>
				</div>
				<!-- Read More Btn -->
				<?php if (!empty($_readmore_text)): ?>
				<a href="<?php the_permalink(); ?>" class="btn alignleft" title="<?php echo $_readmore_text; ?>"><?php echo $_readmore_text; ?></a>
				<?php endif; ?>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<?php endif; ?>
<?php
	if (!have_posts())
		break;
	the_post();
	} while (1);
?>
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
				<div class="clear"></div>
				<!-- End Paging -->
				<?php endif; ?>
