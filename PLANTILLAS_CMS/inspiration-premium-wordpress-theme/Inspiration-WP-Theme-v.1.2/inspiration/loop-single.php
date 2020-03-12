				<!-- Start Post -->
				<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
					<!-- Start Post Title -->
					<div class="posted">
						<span class="date"><?php echo get_the_date('M d, Y'); ?></span>
						<span class="author"><?php printf('<a href="%1$s" title="%2$s">%3$s</a>', get_author_posts_url(get_the_author_meta('ID')), sprintf(esc_attr__('View all posts by %s', TEMPLATENAME), get_the_author()), get_the_author()); ?></span>
						<span class="category"><?php if (count(get_the_category())): ?><?php echo get_the_category_list(', '); ?><?php endif; ?></span>
						<span class="comments"><a href="<?php echo get_comments_link(); ?>" title="<?php comments_number(); ?>"><?php comments_number(); ?></a></span>
						<div class="clear"></div>
					</div>
					<!-- End Post Title -->
					<?php if(has_post_thumbnail()): ?>
					<!-- Post Thumbnail -->
					<div class="post_thumb"><?php the_post_thumbnail('blog', array('title' => false, 'class' => 'pic')); ?></div>
					<!-- End Post Thumbnail -->
					<?php endif; ?>
					<!-- Post Content -->
					<div class="excerpt">
						<?php the_content(); ?>
					</div>
					<!-- End Post Content -->
					<div class="clear"></div>
				</div>
				<!-- End Post -->
				<?php if (get_option('show_about_autor', true)): ?>
				<!-- Start Author Box -->
				<!-- Post bio -->
				<div id="bio">
					<div class="bio">
						<div class="vcard">
							<?php echo get_avatar(get_the_author_meta('ID'), 80) ?>
						</div>
						<div class="author_content">
							<h3><a href="<?php the_author_url(); ?> "><?php the_author(); ?></a></h3>
							<?php the_author_meta('description'); ?>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!-- // Post bio -->
				<div class="hr bottom"></div>
				<!-- End Author Box -->
				<?php endif; ?>
				<?php if (get_option('show_popular_related', true)): ?>
				<!-- Popular & Related Block -->
				<div class="popular_related">
					<div class="popular">
						<h3><?php _e('Popular Posts', TEMPLATENAME); ?></h3>
						<?php query_posts(array('orderby' => 'comment_count', 'showposts' =>3 )); ?>
						<ul>
						<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
							<li>
								<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('small_thumb', array('class' => 'pic alignleft', 'title' => false)); ?></a>
								<b><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></b>
								<span class="date"><?php echo get_the_date('M d, Y'); ?></span>
								<div class="clear"></div>
							</li>
						<?php endwhile; endif; ?>
						</ul>
						<?php wp_reset_query(); ?>
					</div>
					<div class="related">
						<h3><?php _e('Related Posts', TEMPLATENAME); ?></h3>
						<?php
						$_id = get_the_ID();
						$tags = wp_get_post_tags($_id, array('fields' => 'ids'));
						if ($tags):
						$args=array(
							'tag__and' => $tags,
							'post__not_in' => array($_id),
							'posts_per_page' => 3,
							'ignore_sticky_posts' => 1,
						);
						$loop = new WP_Query($args);
						if ($loop->have_posts()):
							if ($loop->have_posts()): ?>
						<ul>
							<?php while ($loop->have_posts()) : $loop->the_post(); ?>
							<li>
								<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('small_thumb', array('class' => 'pic alignleft', 'title' => false)); ?></a>
								<b><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></b>
								<span class="date"><?php echo get_the_date('M d, Y'); ?></span>
								<div class="clear"></div>
							</li>
							<?php endwhile; ?>
							<?php wp_reset_query(); ?>
						</ul>
						<?php endif;
						endif;
						endif;
						?>
					</div>
					<div class="clear"></div>
				</div>
				<!-- // Popular & Related Block -->
				<?php endif; ?>
				<?php comments_template(); ?>