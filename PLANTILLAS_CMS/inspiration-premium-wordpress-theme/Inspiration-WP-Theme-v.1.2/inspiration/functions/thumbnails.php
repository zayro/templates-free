<?php

if (function_exists('add_image_size')) {
	add_image_size('small_thumb', 60, 60, true);
	add_image_size('gallery_thumb', 214, 194, true);
	add_image_size('gallery', 140, 140, true);
	add_image_size('featured', 200, 140, true);
	// Blog Thumbnails
	add_image_size('blog', 600, 220, true);
	add_image_size('blog_alternate', 192, 224, true);
	
	// Portfolio Thumbnails
	add_image_size('one', 582, 274, true);
	add_image_size('two', 441, 224, true);
	add_image_size('three', 277, 154, true);
	add_image_size('four', 197, 154, true);
	
	// Portfolio single page Thumbnails
	add_image_size('portfolio_single', 532, 274, true);
	add_image_size('portfolio_poster', 545, 310, true);
}

?>