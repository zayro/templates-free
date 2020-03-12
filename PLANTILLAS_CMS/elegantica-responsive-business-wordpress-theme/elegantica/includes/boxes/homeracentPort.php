<?php

	$pc = new WP_Query(array('orderby=date', 'showposts' =>  $data['home_recent_number'], 'nopaging' => 0, 'post_status' => 'publish', 'ignore_sticky_posts' => 1, 'post_type' => array( 'portfolioentry'))); 
?>

	<script type="text/javascript">
	  jQuery(document).ready(function(){
		jQuery('.sliderAdvertisePort').bxSlider({
			controls: true,
			displaySlideQty: 1,
			default: 1000,
			easing : 'easeInOutQuint',
			prevText : '',
			nextText : ''
			
		});
	  });
	</script>

<div class="homeRacent">
	<div class="titleborder"></div>
	<h2><?php echo stripText($data['translation_port']) ?></h2>
	<div id="homeRecent">
	<ul class="sliderAdvertisePort">
		<?php
		$currentindex = '';
		if ($pc->have_posts()) :
		$count = 1;
		$countitem = 1;
		?>
		<?php  while ($pc->have_posts()) : $pc->the_post();
		if($countitem == 1){
			echo '<li>';}			
		$do_not_duplicate = $post->ID; 
		$full_image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
		$entrycategory = get_the_term_list( $post->ID, 'portfoliocategory', '', '_', '' );
		$catstring = $entrycategory;
		$catstring = strip_tags($catstring);
		$catstring = str_replace('_', ', ', $catstring);
		$categoryname = $catstring;							
		$entrycategory = strip_tags($entrycategory);
		$entrycategory = str_replace(' ', '-', $entrycategory);
		$entrycategory = str_replace('_', ' ', $entrycategory);
		
		$catidlist = explode(" ", $entrycategory);
		for($i = 0; $i < sizeof($catidlist); ++$i){
			$catidlist[$i].=$currentindex;
		}
		$catlist = implode(" ", $catidlist);		
		if(get_post_type( $post->ID ) == 'post'){
			$type = 'post';
			$catType= 'category';
		}else{
			$type = 'port';
			$catType= 'portfoliocategory';
		}
		//category
		$category = get_the_term_list( $post->ID, $catType, '', ',', '' );	
		$category = explode(',',$category);	
		//end category			
		if ( has_post_thumbnail() ){
			$image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
			$image = $image[0];}
		else
			$image = get_template_directory_uri() .'/images/placeholder-580.png'; 
			if( has_post_format( 'link' , $post->ID))
			add_filter( 'the_excerpt', 'filter_content_link' );		
		if($count != 3){
			echo '<div class="one_third" >';
		}
		else{
			echo '<div class="one_third last" >';
			$count = 0;
		}?>
				<div class="recentimage">
					<a class="overdefultlink" href="<?php the_permalink() ?>">
					<div class="overdefult">
						<div class = "overLowerDefaultBorder"></div><div class="overLowerDefault"></div>
					</div>
					</a>
					<div class="image">
						<div class="loading"></div>
						<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=150&amp;w=282" alt="<?php the_title(); ?>">
					</div>
				</div>
				<div class="recentdescription">
					<h3><a class="overdefultlink" href="<?php the_permalink() ?>"><?php $title = the_title('','',FALSE);  echo substr($title, 0, 24);  ?></a>...</h3>
					<h3 class="category"><?php echo $category[0] ?></h3>	
				</div>
			
			</div>
		<?php 
		$count++;
		
		 if($countitem == 6){ 
			$countitem = 0; ?>
			</li>
		<?php } 
		$countitem++;
		endwhile; endif;
		wp_reset_query(); ?>
		</ul>
	</div>
</div>

<div class="clear"></div>

