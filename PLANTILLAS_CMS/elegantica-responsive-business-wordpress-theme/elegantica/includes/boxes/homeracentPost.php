<?php

	$pc = new WP_Query(array('orderby=date', 'showposts' =>  $data['home_recent_number_post'], 'nopaging' => 0, 'post_status' => 'publish', 'ignore_sticky_posts' => 1, 'post_type' => array( 'post'))); 
?>

	<script type="text/javascript">
	  jQuery(document).ready(function(){
		jQuery('.sliderAdvertisePost').bxSlider({
			controls: true,
			displaySlideQty: 1,
			default: 1000,
			easing : 'easeInOutQuint',
			prevText : '',
			nextText : ''
			
		});
	  });
	</script>

<div class="homeRacent post">
	<div class="titleborder"></div>
	<h2><?php echo stripText($data['translation_post']) ?></h2>
	<div id="homeRecent">
	<ul class="sliderAdvertisePost">
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
		$category = get_the_term_list( $post->ID, $catType, '', ' ', '' );		
		//end category			
		if ( has_post_thumbnail() ){
			$image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
			$image = $image[0];}
		else
			$image = get_template_directory_uri() .'/images/placeholder-580.png'; 
			if( has_post_format( 'link' , $post->ID))
			add_filter( 'the_excerpt', 'filter_content_link' );
		if($count != 2){
			echo '<div class="one_half" >';
		}
		else{
			echo '<div class="one_half last" >';
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
						<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=80&amp;w=130" alt="<?php the_title(); ?>">
					</div>
				</div>
				<div class="recentdescription">
					<h3><a class="overdefultlink" href="<?php the_permalink() ?>"><?php $title = the_title('','',FALSE); echo substr($title, 0, 40);  ?></a></h3>
					<p><?php echo strip_tags(substr(filter_content_gallery(filter_content_link(filter_content($post->post_content))) ,0,108),'<strong>');?> ...</strong></p>
					<a class="recentmore" href="<?php the_permalink() ?>"><?php echo $data['translation_read_more'] ?> &rarr;</a>
				</div>
			</div>
		<?php 
		$count++;
		
		 if($countitem == 2){ 
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

