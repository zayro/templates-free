<div class="side-bar-right">
	<div class="corner-bottom-right">
	<div class="corner-bottom-left">
	<div class="corner-top-right">
	<div class="corner-top-left">
    
    	<?php 	/* Widgetized sidebar, if you have the plugin installed. */
				
		 ?>
			<!-- Author information is disabled per default. Uncomment and fill in your details if you want to use it.
			<li><h2>Author</h2>
			<p>A little something about you, the author. Nothing lengthy, just an overview.</p>
			</li>
			-->

			<?php if ( is_404() || is_category() || is_day() || is_month() ||
						is_year() || is_search() || is_paged() ) {
			?>

			<?php /* If this is a 404 page */ if (is_404()) { ?>
			<?php /* If this is a category archive */ } elseif (is_category()) { ?>
			<p class="info-sidebar">You are currently browsing the archives for the <?php single_cat_title(''); ?> category.</p>

			<?php /* If this is a yearly archive */ } elseif (is_day()) { ?>
			<p class="info-sidebar">You are currently browsing the <a href="<?php bloginfo('url'); ?>/"><?php echo bloginfo('name'); ?></a> blog archives
			for the day <?php the_time('l, F jS, Y'); ?>.</p>

			<?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
			<p class="info-sidebar">You are currently browsing the <a href="<?php bloginfo('url'); ?>/"><?php echo bloginfo('name'); ?></a> blog archives
			for <?php the_time('F, Y'); ?>.</p>

			<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
			<p class="info-sidebar">You are currently browsing the <a href="<?php bloginfo('url'); ?>/"><?php echo bloginfo('name'); ?></a> blog archives
			for the year <?php the_time('Y'); ?>.</p>

			<?php /* If this is a monthly archive */ } elseif (is_search()) { ?>
			<p class="info-sidebar">You have searched the <a href="<?php echo bloginfo('url'); ?>/"><?php echo bloginfo('name'); ?></a> blog archives
			for <strong>'<?php the_search_query(); ?>'</strong>. If you are unable to find anything in these search results, you can try one of these links.</p>

			<?php /* If this is a monthly archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
			<p class="info-sidebar">You are currently browsing the <a href="<?php echo bloginfo('url'); ?>/"><?php echo bloginfo('name'); ?></a> blog archives.</p>

			<?php } ?>

			<?php }?>
            
            <?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar(__('Left Sidebar','theme863')) ) : else :?>
            
            	<div class="widget" id="categories">
					<h2><?php _e('Categories','theme863'); ?></h2>
					<div class="inside-widget">
						<ul>
							<?php wp_list_categories('show_count=0&title_li='); ?>
						</ul>
					</div>
                </div>
                
				
				<div class="widget" id="latestworks">
					<h2><?php _e('Latest works','theme863'); ?></h2>
					<div class="inside-widget">
						<a href="#"><img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/work-img1.jpg" /></a><a href="#"><img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/work-img2.jpg" /></a>
						<a href="#"><img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/work-img3.jpg" /></a><a href="#"><img alt="" src="<?php bloginfo('stylesheet_directory'); ?>/images/work-img4.jpg" /></a>
					</div>
				</div>
			
                <div class="widget" id="archives">
					<h2><?php _e('Archives','theme863'); ?></h2>
					<div class="inside-widget">
						<ul>
							<?php wp_get_archives('type=monthly'); ?>
						</ul>
					</div>
                </div>
				
				<div class="widget" id="tag_cloud">
					<h2><?php _e('Tags','theme863'); ?></h2>
					<div class="inside-widget">
						<?php wp_tag_cloud(); ?>
					</div>
				</div>
				      
				<div class="widget" id="meta">
					<h2><?php _e('Meta','theme863'); ?></h2>
					<div class="inside-widget">
						<ul>
							<?php wp_register(); ?>
							<li><?php wp_loginout(); ?></li>
							<li><a href="http://www.w3.org/" title="This page The World Wide Web Consortium (W3C)"><abbr title="World Wide Web Consortium">W3C</abbr> Page</a></li>
							<li><a href="http://gmpg.org/xfn/"><abbr title="XHTML Friends Network">XFN</abbr></a></li>
							<li><a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform.">WordPress</a></li>
							<?php wp_meta(); ?>
						</ul>
					</div>
				</div>
			          
			<?php endif; ?>  
            
    </div>
    </div>
    </div>
    </div>
</div>