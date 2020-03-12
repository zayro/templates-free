<?php
	get_header();
	if ( have_posts() ): the_post();
?>
	<!-- Start Content Wrapper -->
	<div class="content_wrapper">
		<?php get_template_part('part', 'title'); ?>
		<div id="content">
<?php
	do {
//		$target_link = get_post_meta(get_the_ID(), 'target_link', true);
		$video_link = get_post_meta(get_the_ID(), 'video_link', true);
		$image_id = get_post_thumbnail_id();
		$full_thumbnail = wp_get_attachment_image_src($image_id, 'full');
		
		// Secondary images
		$image1 = get_post_meta(get_the_ID(), 'portfolio_image1', true); 
		$image2 = get_post_meta(get_the_ID(), 'portfolio_image2', true); 
		$image3 = get_post_meta(get_the_ID(), 'portfolio_image3', true); 
		$image4 = get_post_meta(get_the_ID(), 'portfolio_image4', true); 
		$image5 = get_post_meta(get_the_ID(), 'portfolio_image5', true);
		$image6 = get_post_meta(get_the_ID(), 'portfolio_image6', true);
		$image7 = get_post_meta(get_the_ID(), 'portfolio_image7', true);
		$image8 = get_post_meta(get_the_ID(), 'portfolio_image8', true);
		$image9 = get_post_meta(get_the_ID(), 'portfolio_image9', true);
		
		$audio1 = get_post_meta(get_the_ID(), 'audio_mp3', true);
		$audio2 = get_post_meta(get_the_ID(), 'audio_ogg', true);
		
		$embed = get_post_meta(get_the_ID(), 'portfolio_embed_code', true);
		$switch = get_post_meta(get_the_ID(), 'switch', true);
?>
			<div class="portfolio_detailed" id="post-<?php the_ID(); ?>">
				<?php if($switch == 'audio') : ?>
				<div class="portfolio_audio_vid">
			        <?php audio(get_the_ID()); ?>
			    
			        <div id="jquery_jplayer_<?php the_ID(); ?>" class="jp-jplayer"></div>
			
			        <div class="jp-audio-container">
			            <div class="jp-audio">
			                <div class="jp-type-single">
			                    <div id="jp_interface_<?php the_ID(); ?>" class="jp-interface">
			                        <ul class="jp-controls">
			                            <li><div class="seperator-first"></div></li>
			                            <li><div class="seperator-second"></div></li>
			                            <li><a href="#" class="jp-play" tabindex="1">play</a></li>
			                            <li><a href="#" class="jp-pause" tabindex="1">pause</a></li>
			                            <li><a href="#" class="jp-mute" tabindex="1">mute</a></li>
			                            <li><a href="#" class="jp-unmute" tabindex="1">unmute</a></li>
			                        </ul>
			                        <div class="jp-progress-container">
			                            <div class="jp-progress">
			                                <div class="jp-seek-bar">
			                                    <div class="jp-play-bar"></div>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="jp-volume-bar-container">
			                            <div class="jp-volume-bar">
			                                <div class="jp-volume-bar-value"></div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
				</div>
				<?php endif; ?>
				<?php if($switch == 'image rotator' || $switch == '') : ?>
				<div class="portfolio_rotator">
					<ul>
						<li>
							<?php if (has_post_thumbnail()): ?>
								<?php the_post_thumbnail('portfolio_single', array('title' => false)); ?>
							<?php else: ?>
								<img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo get_bloginfo('template_url')."/images/no_image.gif&w=532&h=274"; ?>" alt="" />
							<?php endif; ?>
						</li>
						<?php $image_count = 0; ?>
						<?php if($image1 != '') : ?>
				        <li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image1; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
		                <?php $image_count++; endif; ?>

						<?php if($image2 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image2; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image3 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image3; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image4 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image4; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image5 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image5; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image6 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image6; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image7 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image7; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image8 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image8; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>

						<?php if($image9 != '') : ?>
						<li><img src="<?php echo get_bloginfo('template_url'); ?>/timthumb.php?src=<?php echo $image9; ?>&amp;w=532&amp;h=274" alt="<?php the_title(); ?>" /></li>
						<?php $image_count++; endif; ?>
					</ul>
				</div>
				<?php endif; ?>
				<?php if($switch == 'video') : ?>
				<div class="portfolio_audio_vid">
					<?php if($embed == '') : ?>
						
					<?php video(get_the_ID()); ?>
					
					<style type="text/css">
						.jp-video-play,
						div.jp-jplayer.jp-jplayer-video {
							height: 300px;
						}
					</style>
					
					<div id="jquery_jplayer_<?php the_ID(); ?>" class="jp-jplayer jp-jplayer-video"></div>
					
					<div class="jp-video-container">
						<div class="jp-video">
							<div class="jp-type-single">
								<div id="jp_interface_<?php the_ID(); ?>" class="jp-interface">
									<ul class="jp-controls">
										<li><div class="seperator-first"></div></li>
										<li><div class="seperator-second"></div></li>
										<li><a href="#" class="jp-play" tabindex="1">play</a></li>
										<li><a href="#" class="jp-pause" tabindex="1">pause</a></li>
										<li><a href="#" class="jp-mute" tabindex="1">mute</a></li>
										<li><a href="#" class="jp-unmute" tabindex="1">unmute</a></li>
									</ul>
									<div class="jp-progress-container">
										<div class="jp-progress">
											<div class="jp-seek-bar">
												<div class="jp-play-bar"></div>
											</div>
										</div>
									</div>
									<div class="jp-volume-bar-container">
										<div class="jp-volume-bar">
											<div class="jp-volume-bar-value"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					<?php else: ?>
					
						<?php //echo $embed; ?>
						<?php echo stripslashes(htmlspecialchars_decode($embed)); ?>
					
					<?php endif; ?>
		        </div>
		    	<?php endif; ?>
				<div class="portfolio_description">
					<?php if (get_option('portfolio_show_date')): ?>
					<div class="rel_date"><?php echo get_the_date('m/d/Y'); ?></div>
					<?php endif; ?>
					<?php if (get_option('portfolio_show_clients')): ?>
					<div class="divisions"><?php echo get_the_term_list( $post->ID, 'clients', ' ', ', ', '' ); ?></div>
					<?php endif; ?>
					<?php if (get_option('portfolio_show_division')): ?>
					<div class="tags"><?php echo get_the_term_list( $post->ID, 'divisions', ' ', ', ', '' ); ?></div>
					<?php endif; ?>
					<h3><?php _e('Project Description:', TEMPLATENAME); ?></h3>
					<?php the_content(); ?>
					<div class="buttons">
						<a href="<?php print $_SERVER['HTTP_REFERER'];?>" class="btn alignleft back" title="<?php _e('back to portfolio', TEMPLATENAME); ?>"><?php _e('back to portfolio', TEMPLATENAME); ?></a>
						<?php
							$target_link = metaboxesGenerator::the_superlink('target_link');
							$taget_text = get_option('portfolio_target_text');
							if (!empty($target_link)):
						?>
						<a href="<?php echo $target_link; ?>" title="<?php echo $taget_text; ?>" class="btn alignleft" target="_blank"><?php echo $taget_text; ?></a>
						<?php endif; ?>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<!-- Start Commentlist -->
			<?php if (get_option('portfolio_show_comments')) comments_template(); ?>
			<div class="clear"></div>
<?php
		if (!have_posts())
			break;
		the_post();
	} while (1);
?>
			<div class="clear"></div>
		</div><!-- End Content -->
	</div>
	<!-- End Content Wrapper -->
<?php
	endif;
	get_footer();
 ?>