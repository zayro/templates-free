<?php

if ( function_exists('register_sidebar') )
    register_sidebar(array(
		'name' => __('Left Sidebar', 'theme863'),
        'before_widget' => '<div id="%1$s" class="widget %2$s"><div class="widget-bg">',
        'after_widget' => '</div></div></div>',
        'before_title' => '<h2><span>',
        'after_title' => '</span></h2><div class="inside-widget">',
    ));

// Search 	
	function widget_theme863_search() {
?>

<div class="widget" id="search">
	<h2><?php _e('Search','theme863'); ?></h2>
	<div class="inside-widget">
		<?php// include (TEMPLATEPATH . "/searchform.php"); ?>
		<form method="get" id="searchform" action="<?php bloginfo('home'); ?>" style="margin:0;">
	
		<input type="text" class="searching" value="<?php the_search_query(); ?>" name="s" id="s" /><input class="submit" type="image" src="<?php bloginfo('stylesheet_directory'); ?>/images/search.gif" value="submit" />
	
		</form>
	</div>
</div>
<?php
}
if ( function_exists('register_sidebar_widget') )
    register_sidebar_widget(__('Search'), 'widget_theme863_search');


	function widget_theme863_recent_posts() {
?>
				<?php
					$r = new WP_Query(array('showposts' => 5, 'what_to_show' => 'posts', 'nopaging' => 0, 'post_status' => 'publish', 'caller_get_posts' => 1));
					if ($r->have_posts()) :
				?>
				<div class="widget" id="recentposts">
					<div class="widget-bg">
						<h2><?php _e('Recent posts','theme863'); ?></h2>
						<div class="inside-widget">
							<ul>
								<?php  while ($r->have_posts()) : $r->the_post(); ?>
									<li><a href="<?php the_permalink() ?>"><?php if ( get_the_title() ) the_title(); else the_ID(); ?> </a> <?php the_author_link() ?></li>
								<?php endwhile; ?>
							</ul>
						</div>
					</div>
				</div>
				<?php endif; ?>
<?php
}
if ( function_exists('register_sidebar_widget') )
	register_sidebar_widget(__('Recent Posts'), 'widget_theme863_recent_posts');
