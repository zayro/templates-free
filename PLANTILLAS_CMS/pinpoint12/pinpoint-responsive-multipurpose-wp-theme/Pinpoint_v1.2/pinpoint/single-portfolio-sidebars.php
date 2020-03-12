<?php get_header(); ?>
	
<?php
	$options = get_option('sf_pinpoint_options');
	$page_layout = $options['page_layout'];	
	$portfolio_data = get_post_meta( $post->ID, 'portfolio', true );
	$current_item_id = $post->ID;
	$sidebar_config = get_post_meta($post->ID, 'sf_sidebar_config', true);
	$left_sidebar = get_post_meta($post->ID, 'sf_left_sidebar', true);
	$right_sidebar = get_post_meta($post->ID, 'sf_right_sidebar', true);
	$page_wrap_class = '';
	if ($sidebar_config == "left-sidebar") {
	$page_wrap_class = 'has-left-sidebar';
	} elseif ($sidebar_config == "right-sidebar") {
	$page_wrap_class = 'has-right-sidebar';
	} elseif ($sidebar_config == "both-sidebars") {
	$page_wrap_class = 'has-both-sidebars';
	} else {
	$page_wrap_class = 'has-no-sidebar';
	}
	$twitter_share = $options['twitter_share_username'];
?>

<div class="page-heading full-width clearfix">
	<?php if ($page_layout == "fullwidth") { ?>
	<div class="container">
	<div class="sixteen columns">
	<?php } ?>
	<h1><?php the_title(); ?></h1>
	<?php if ($page_layout == "fullwidth") { ?>
	</div>
	</div>
	<?php } ?>
</div>

<?php if ($page_layout == "fullwidth") { ?>
<div class="container">
<div class="sixteen columns">
<?php } ?>

<div class="inner-page-wrap <?php echo $page_wrap_class; ?> clearfix">
	
	<?php if ($sidebar_config == "left-sidebar") { ?>
		
		<aside class="sidebar left-sidebar five columns alpha">
			<?php dynamic_sidebar($left_sidebar); ?>
		</aside>
		
	<?php } else if ($sidebar_config == "both-sidebars") { ?>
	
		<aside class="sidebar left-sidebar four columns alpha">
			<?php dynamic_sidebar($left_sidebar); ?>
		</aside>
	
	<?php } ?>
	
	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

	<!-- OPEN article -->
	<?php if ($sidebar_config == "left-sidebar") { ?>
	<article <?php post_class('portfolio-article clearfix eleven columns omega'); ?> id="<?php the_ID(); ?>">
	<?php } elseif ($sidebar_config == "right-sidebar") { ?>
	<article <?php post_class('portfolio-article clearfix eleven columns alpha'); ?> id="<?php the_ID(); ?>">
	<?php } elseif ($sidebar_config == "both-sidebars") { ?>
	<article <?php post_class('portfolio-article clearfix eight columns'); ?> id="<?php the_ID(); ?>">
	<?php } else { ?>
	<article <?php post_class('portfolio-article clearfix'); ?> id="<?php the_ID(); ?>">
	<?php } ?>
	
		<?php
			
			$media_type = $media_image = $media_video = $media_gallery = '';
			 
			$use_thumb_content = get_post_meta($post->ID, 'sf_thumbnail_content_main_detail', true);
			
			if ($use_thumb_content) {
			$media_type = get_post_meta($post->ID, 'sf_thumbnail_type', true);
			$media_image = get_post_meta($post->ID, 'sf_thumbnail_image', true);
			$media_video = get_post_meta($post->ID, 'sf_thumbnail_video_url', true);
			$media_gallery = rwmb_meta( 'sf_thumbnail_gallery', 'type=image&size=full-width-image' );
			} else {
			$media_type = get_post_meta($post->ID, 'sf_detail_type', true);
			$media_image = get_post_meta($post->ID, 'sf_detail_image', true);
			$media_video = get_post_meta($post->ID, 'sf_detail_video_url', true);
			$media_gallery = rwmb_meta( 'sf_detail_gallery', 'type=image&size=full-width-image' );
			$media_slider = get_post_meta($post->ID, 'sf_detail_rev_slider_alias', true);
			}
			
			if (!$media_image) {
				$media_image = get_post_thumbnail_id();
			}
			
			$media_image_url = wp_get_attachment_url( $media_image, 'full' );
			
			// META VARIABLES
			$media_width = 940;
			$media_height = NULL;
			$video_height = 530;
		?>
		
		<figure class="media-wrap">
				
		<?php if ($media_type == "video") { ?>
			
			<?php echo video_embed($media_video, $media_width, $video_height); ?>
			
		<?php } else if ($media_type == "slider") { ?>
			
			<div class="flexslider portfolio-slider">
				
				<ul class="slides">
						
				<?php foreach ( $media_gallery as $image ) {
			    	echo "<li><img src='{$image['url']}' width='{$image['width']}' height='{$image['height']}' alt='{$image['alt']}' /></li>";
				} ?>
															
				</ul>
			
			</div>
			
		<?php } else if ($media_type == "layer-slider") { ?>
			
			<div class="layerslider portfolio-slider">
				
				<?php echo do_shortcode('[rev_slider '.$media_slider.']'); ?>
			
			</div>
				
		<?php } else { ?>
				
			<?php $detail_image = aq_resize( $media_image_url, $media_width, $media_height, true, false); ?>
			
			<?php if ($detail_image) { ?>
				
				<a href="#">
					<img src="<?php echo $detail_image[0]; ?>" width="<?php echo $detail_image[1]; ?>'" height="<?php echo $detail_image[2]; ?>'" />
				</a>
				
			<?php } ?>
			
		<?php } ?>
		
		</figure>
			
		<section class="article-body-wrap">
			
			<?php 
				$item_client = get_post_meta($post->ID, 'sf_portfolio_client', true);
				$item_date = get_the_date();
				$item_link = get_post_meta($post->ID, 'sf_portfolio_external_link', true);
				$show_social = get_post_meta($post->ID, 'sf_social_sharing', true);
			?>
			
			<div class="portfolio-details-wrap">
				<?php if ($item_client) { ?>
				<span class="client"><?php _e("Client: ", "swiftframework"); ?><span><?php echo $item_client; ?></span></span>
				<?php } ?>
				<span class="date"><?php _e("Date: ", "swiftframework"); ?><span><?php echo $item_date; ?></span></span>
				<?php if (has_tag()) { ?>
				<span class="tags"><?php _e("Tags: ", "swiftframework"); ?><span class="tagcloud"><?php the_tags('', '', ''); ?></span></span>
				<?php } ?>
				<?php if ($item_link) { ?>
				<a class="item-link" href="<?php echo $item_link; ?>" target="_blank"><i class="icon-link"></i><?php echo $item_link; ?></a>
				<?php } ?>
			</div>
			<section class="portfolio-detail-description">
				<div class="body-text">
					<?php the_content(); ?>
				</div>
			</section>
			
			<?php if ($show_social) { ?>
			
			<div class="share-links">
				<?php if (function_exists( 'lip_love_it_link' )) { ?>
				<div class="item-loves">
					<?php echo lip_love_it_link(get_the_ID(), '<i class="icon-heart"></i>', '<i class="icon-heart"></i>'); ?>
				</div>
				<?php } ?>
				<div id="like-button" class="fb-this">
					<div class="fb-like" data-href="<?php the_permalink(); ?>" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div>
				</div>
				<div class="tweet-this">
					<a href="https://twitter.com/share" class="twitter-share-button" data-url="<?php the_permalink(); ?>" data-via="<?php echo $twitter_share; ?>" data-lang="en">Tweet</a>
				</div>
			</div>
			
			<?php } ?>
			
		</section>
		
		
		<div class="pagination-wrap full-width clearfix">
					
			<div class="nav-previous"><?php next_post_link_plus( array('end_post' => false) );?></div>
			<div class="nav-next"><?php previous_post_link_plus( array('end_post' => false) );?></div> 

		</div>		
			
	<!-- CLOSE article -->
	</article>

	<?php endwhile; endif; ?>

	<?php if ($sidebar_config == "right-sidebar") { ?>
		
		<aside class="sidebar right-sidebar five columns omega">
			<?php dynamic_sidebar($right_sidebar); ?>
		</aside>
		
	<?php } else if ($sidebar_config == "both-sidebars") { ?>
	
		<aside class="sidebar right-sidebar four columns omega">
			<?php dynamic_sidebar($right_sidebar); ?>
		</aside>
	
	<?php } ?>

</div>

<?php if ($page_layout == "fullwidth") { ?>
</div>
</div>
<?php } ?>

<!-- WordPress Hook -->
<?php get_footer(); ?>