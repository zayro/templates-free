<?php
	$post_format = get_post_format();
	$post_title = get_the_title();
	$post_author = get_the_author_link();
	$post_date = get_the_date();
	$post_categories = get_the_category_list(', ');
	$post_comments = get_comments_number();
	$post_permalink = get_permalink();
	$custom_excerpt = get_post_meta($post->ID, 'sf_custom_excerpt', true);
	$post_excerpt = '';
	if ($custom_excerpt != '') {
	$post_excerpt = $custom_excerpt;
	} else {
	$post_excerpt = get_the_excerpt();
	}
	$post_content = get_the_content();
		
	$thumb_width = 940;
	$thumb_height = NULL;
	$video_height = 530;
	
	$thumb_type = get_post_meta($post->ID, 'sf_thumbnail_type', true);
	$thumb_image = get_post_meta($post->ID, 'sf_thumbnail_image', true);
	$thumb_video = get_post_meta($post->ID, 'sf_thumbnail_video_url', true);
	$thumb_gallery = rwmb_meta( 'sf_thumbnail_gallery', 'type=image&size=blog-image' );
	$thumb_link_type = get_post_meta($post->ID, 'sf_thumbnail_link_type', true);
	$thumb_link_url = get_post_meta($post->ID, 'sf_thumbnail_link_url', true);
	$thumb_lightbox_thumb = rwmb_meta( 'sf_thumbnail_image', 'type=image&size=large' );
	$thumb_lightbox_image = rwmb_meta( 'sf_thumbnail_link_image', 'type=image&size=large' );
	$thumb_lightbox_video_url = get_post_meta($post->ID, 'sf_thumbnail_link_video_url', true);
	
	if (!$thumb_image) {
		$thumb_image = get_post_thumbnail_id();
	}
	
	$thumb_img_url = wp_get_attachment_url( $thumb_image, 'full' );
	$thumb_lightbox_img_url = wp_get_attachment_url( $thumb_lightbox_image, 'full' );
	
	$item_figure = $link_config = "";
	
	// LINK TYPE VARIABLES			
	if ($thumb_link_type == "link_to_url") {
		$link_config = 'href="'.$thumb_link_url.'" class="link-to-url"';
	} else if ($thumb_link_type == "lightbox_thumb") {
		$link_config = 'href="'.$thumb_img_url.'" class="view"';
	} else if ($thumb_link_type == "lightbox_image") {
		$lightbox_image_url = '';
		foreach ($thumb_lightbox_image as $image) {
			$lightbox_image_url = $image['full_url'];
		}
		$link_config = 'href="'.$lightbox_image_url.'" class="view"';	
	} else {
		$link_config = 'href="'.$post_permalink.'" class="link-to-post"';
	}
	
	// THUMBNAIL MEDIA TYPE SETUP
	
	if ($thumb_type == "none") {
	
	$item_figure .= '<div class="spacer"></div>';
	
	} else {
	
	$item_figure .= '<figure class="media-wrap">';
					
	if ($thumb_type == "video") {
		
		$video = video_embed($thumb_video, $thumb_width, $video_height);
		
		$item_figure .= $video;
		
	} else if ($thumb_type == "slider") {
		
		$item_figure .= '<div class="flexslider thumb-slider"><ul class="slides">';
					
		foreach ( $thumb_gallery as $image )
		{
		    $item_figure .= "<li><img src='{$image['url']}' width='{$image['width']}' height='{$image['height']}' alt='{$image['alt']}' /></li>";
		}
														
		$item_figure .= '</ul><div class="open-item"><a '.$link_config.'></a></div></div>';
		
	} else if ($thumb_type == "image") {
	
		$image = aq_resize( $thumb_img_url, $thumb_width, $thumb_height, true, false);
		
		if ($image) {
			
			$item_figure .= '<a '.$link_config.'>';
			
			$item_figure .= '<img src="'.$image[0].'" width="'.$image[1].'" height="'.$image[2].'" />';
						
			$item_figure .= '</a>';
		}
	}
	
	$item_figure .= '</figure>';
	
	}
	
?>

<div class="blog-details-wrap">
	<h2><a href="<?php echo $post_permalink; ?>"><?php echo $post_title; ?></a></h2>
	<div class="blog-item-details">
		<?php printf(__('By %1$s on %2$s In %3$s', 'swiftframework'), $post_author, $post_date, $post_categories); ?>
		<div class="comments-likes">
			<?php if ( comments_open() ) { ?>
			<i class="icon-comments"></i><?php echo $post_comments; ?>
			<?php } ?>
			<?php if (function_exists( 'lip_love_it_link' )) {
				echo lip_love_it_link(get_the_ID(), '<i class="icon-heart"></i>', '<i class="icon-heart"></i>');
			} ?>
		</div>
	</div>
	<?php echo $item_figure; ?>
	<div class="excerpt"><?php echo $post_excerpt; ?></div>
	<a class="read-more" href="<?php echo $post_permalink; ?>"><?php _e("Keep Reading", "swiftframework"); ?><i class="icon-chevron-right"></i></a>
</div>