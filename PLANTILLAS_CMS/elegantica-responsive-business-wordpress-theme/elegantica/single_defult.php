<div class = "outerpagewrap">
	<div class="pagewrap">
		<div class="pagecontent">
			<div class="pagecontentContent">
				<h1><?php the_title();?></h1>
				<p><?php the_breadcrumb(); ?></p>
			</div>
			<div class="homeIcon"><a href="<?php echo home_url(); ?>"></a></div>
		</div>

	</div>
</div>

<div id="mainwrap">
	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	<div id="main" class="clearfix">
	<div class="pad"></div>
	<div class="content singledefult">
		<div class="postcontent singledefult" id="post-<?php the_ID(); ?>" <?php post_class(); ?>>		
			<div class="blogpost">		
				<div class="posttext">
				<?php if( !get_post_format()){?> 
				<div class="posted-date"><a href="<?php echo home_url() ?>/<?php the_time('Y') ?>/<?php the_time('m') ?>/<?php the_time('j') ?>"><?php the_time('F j, Y') ?></a></div>
				<?php } ?>
					<?php if ( !has_post_format( 'gallery' , $post->ID)) { ?>
						<div class="blogsingleimage">			
							<?php	
							if ( !get_post_format() ) {
								if ( has_post_thumbnail() ){
									$image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
									$image = $image[0];
									}
								else
									$image = get_template_directory_uri() . '/images/placeholder-580.png';
								
							?>
							<a href="<?php echo $image ?>" rel="lightbox[single-gallery]" title="<?php the_title(); ?>">
								<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=280&amp;w=600" >
							</a>
							<?php } 
							if ( has_post_format( 'video' , $post->ID)) { ?>
								<?php
								add_filter( 'the_content', 'filter_content_video' ); ?>
								<div><?php the_content(stripText($data['translation_morelink']).' '.get_the_title($post->ID)); ?></div>
								<?php remove_filter( 'the_content', 'filter_content_video' );
								?> 							
							<?php } ?>
						</div>						
					<?php } else {?>
						<?php
						$args = array(
							'post_type' => 'attachment',
							'numberposts' => -1,
							'post_status' => null,
							'post_parent' => $post->ID
						);
						$attachments = get_posts($args);
						if ($attachments) {?>
						<div class="gallery-single">
						<?php
							foreach ($attachments as $attachment) {
								$title = '';
								//echo apply_filters('the_title', $attachment->post_title);
								$image =  wp_get_attachment_image_src( $attachment->ID, 'full' ); 	
								$alt = get_post_meta( $attachment->ID ,'_wp_attachment_image_alt', true);
								if(count($alt)) $title =  $alt; ?>
									<div class="image-gallery">
										<a href="<?php echo $image[0] ?>" rel="lightbox[single-gallery]" title="<?php echo $attachment->post_title ?>"><div class = "over"></div>
											<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image[0] ?>&amp;h=95&amp;w=95"" />					
										</a>	
									</div>			
									<?php } ?>
						</div>
						<?php } ?>
					<?php }  ?>
					<div class="sentry">
						<?php if ( has_post_format( 'video' , $post->ID)) { 
							add_filter( 'the_content', 'filter_content' ); ?>
							<div><?php the_content(stripText($data['translation_morelink']).' '.get_the_title($post->ID)); ?></div>
							<?php remove_filter( 'the_content', 'filter_content' );
						}
						if(has_post_format( 'gallery' , $post->ID)){?>
							<div class="gallery-content"><?php the_content(stripText($data['translation_morelink']).' '.get_the_title($post->ID)); 	?></div>
						<?php } 
						if( !get_post_format()){?> 
						    <?php add_filter('the_content', 'addlightboxrel_replace'); ?>
							<div><?php the_content(stripText($data['translation_morelink']).' '.get_the_title($post->ID)); ?></div>		
						<?php } ?>
					</div>
				</div>
				<?php if(has_tag()) { ?>
					<div class="tags"><?php the_tags('',' ',''); ?></div>	
				<?php } ?>
				<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false)?></div>	

				
			</div>						
			
		</div>		
		<?php
		$posttags = wp_get_post_tags($post->ID, array( 'fields' => 'ids' ));
		$query = new WP_Query(
			array( "tag__in" => $posttags,
				   "orderby" => 'rand',
				   "showposts" => 4,
				   "post__not_in" => array($post->ID)
			) );
		if ($query->have_posts()) : ?>
			<div class="related">	
			<div class="relatedtitle">
				<div class="titleborder relatedb"></div>
				<h3><?php echo $data['translation_relatedpost'] ?></h3>
			</div>
			<?php
			$count = 0;
			while ($query->have_posts()) : $query->the_post(); 
				if ( has_post_thumbnail() ){
					$image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
					$image = $image[0];
					}
				else
					$image =  get_template_directory_uri() .'/images/placeholder-580.png';
					
				if($count != 3){ ?>
					<div class="one_fourth">
				<?php } else { ?>
					<div class="one_fourth last">
				<?php } ?>
						<div class="image"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=82&amp;w=126"></a></div>
						<h4><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h4>			
					</div>
						
				<?php 
				$count++;
			endwhile; ?>
			</div>
		<?php endif;
		wp_reset_query();?>	
	
	
	<?php comments_template(); ?>
					
	<?php endwhile; else: ?>
					
		<?php include_once(TEMPLATEPATH."/404.php"); ?>
					
	<?php endif; ?>
	</div>


<?php get_sidebar(); ?>
</div>
