<?php 
/*
Template Name: Portfolio Page
*/
?>
<?php 
$et_ptemplate_settings = array();
$et_ptemplate_settings = maybe_unserialize( get_post_meta($post->ID,'et_ptemplate_settings',true) );

$fullwidth = isset( $et_ptemplate_settings['et_fullwidthpage'] ) ? (bool) $et_ptemplate_settings['et_fullwidthpage'] : false;
$et_ptemplate_showtitle = isset( $et_ptemplate_settings['et_ptemplate_showtitle'] ) ? (bool) $et_ptemplate_settings['et_ptemplate_showtitle'] : false;
$et_ptemplate_showdesc = isset( $et_ptemplate_settings['et_ptemplate_showdesc'] ) ? (bool) $et_ptemplate_settings['et_ptemplate_showdesc'] : false;
$et_ptemplate_detect_portrait = isset( $et_ptemplate_settings['et_ptemplate_detect_portrait'] ) ? (bool) $et_ptemplate_settings['et_ptemplate_detect_portrait'] : false;

$gallery_cats = isset( $et_ptemplate_settings['et_ptemplate_gallerycats'] ) ? (array) $et_ptemplate_settings['et_ptemplate_gallerycats'] : array();
$et_ptemplate_gallery_perpage = isset( $et_ptemplate_settings['et_ptemplate_gallery_perpage'] ) ? (int) $et_ptemplate_settings['et_ptemplate_gallery_perpage'] : 12;

$et_ptemplate_portfolio_size = isset( $et_ptemplate_settings['et_ptemplate_imagesize'] ) ? (int) $et_ptemplate_settings['et_ptemplate_imagesize'] : 2;

$et_ptemplate_portfolio_class = '';
if ( $et_ptemplate_portfolio_size == 1 ) $et_ptemplate_portfolio_class = ' et_portfolio_small';
if ( $et_ptemplate_portfolio_size == 3 ) $et_ptemplate_portfolio_class = ' et_portfolio_large';
?>
	
	<?php get_header(); ?>
	<div id="content-top"></div>
		
		<div id="contentwrap">
			<div id="content" class="clearfix">
			
				<div id="content-area"<?php if ($fullwidth) echo ' class="pagefull_width"'; ?>>
				<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
					<div class="entry post clearfix">
						
						<h1 class="title"><?php the_title(); ?></h1>
						<?php $width = 136;
							  $height = 136;
							  $classtext = 'thumbnail alignleft';
							  $titletext = get_the_title();
						
							  $thumbnail = get_thumbnail($width,$height,$classtext,$titletext,$titletext);
							  $thumb = $thumbnail["thumb"]; ?>
										
						<?php if($thumb <> '' && get_option('13floor_page_thumbnails') == 'on') { ?>
							<?php print_thumbnail($thumb, $thumbnail["use_timthumb"], $titletext , $width, $height, $classtext); ?>
						<?php }; ?>
						<?php the_content(); ?>
						<?php wp_link_pages(array('before' => '<p><strong>'.esc_html__('Pages','13floor').':</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
						
						<div id="et_pt_portfolio_gallery" class="clearfix<?php echo $et_ptemplate_portfolio_class; ?>">
							<?php $gallery_query = '';
							$portfolio_count = 1;
							$et_open_row = false;
							if ( !empty($gallery_cats) ) $gallery_query = '&cat=' . implode(",", $gallery_cats);
							else echo '<!-- gallery category is not selected -->'; ?>
							<?php 
								global $wp_embed;
								$et_videos_output = '';
								$et_paged = is_front_page() ? get_query_var( 'page' ) : get_query_var( 'paged' );
							?>
							<?php query_posts("showposts=$et_ptemplate_gallery_perpage&paged=" . $et_paged . $gallery_query); ?>
							<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
								
								<?php $width = 260;
								$height = 170;
								
								if ( $et_ptemplate_portfolio_size == 1 ) {
									$width = 140;
									$height = 94;
									$et_portrait_height = 170;
								}
								if ( $et_ptemplate_portfolio_size == 2 ) $et_portrait_height = 315;
								if ( $et_ptemplate_portfolio_size == 3 ) {
									$width = 400;
									$height = 263;
									$et_portrait_height = 800;
								}						
								
								$et_auto_image_detection = false;
								if ( has_post_thumbnail( $post->ID ) && $et_ptemplate_detect_portrait ) {
									$wordpress_thumbnail = get_post( get_post_thumbnail_id($post->ID) );
									$wordpress_thumbnail_url = $wordpress_thumbnail->guid;
									
									if ( et_is_portrait($wordpress_thumbnail_url) )	$height = $et_portrait_height;
								}
														
								$titletext = get_the_title();
								$et_portfolio_title = get_post_meta($post->ID,'et_portfolio_title',true) ? get_post_meta($post->ID,'et_portfolio_title',true) : get_the_title();
								$et_videolink = get_post_meta($post->ID,'et_videolink',true) ? get_post_meta($post->ID,'et_videolink',true) : '';
								
								if ( '' != $et_videolink ){
									$et_video_id = 'et_video_post_' . $post->ID;
									$et_videos_output .= '<div id="'. esc_attr( $et_video_id ) .'">' . $wp_embed->shortcode( '', $et_videolink ) . '</div>';
								}

								$thumbnail = get_thumbnail($width,$height,'',$titletext,$titletext,true,'et_portfolio');
								$thumb = $thumbnail["thumb"];
								
								if ( $et_ptemplate_detect_portrait && $thumbnail["use_timthumb"] && et_is_portrait($thumb) ) {
									$height = $et_portrait_height;
								} ?>
							
								<?php if ( $portfolio_count == 1 || ( $et_ptemplate_portfolio_size == 2 && (!$fullwidth && ($portfolio_count+1) % 2 == 0) ) || ( $et_ptemplate_portfolio_size == 3 && (($portfolio_count+1) % 2 == 0) ) ) {
									$et_open_row = true; ?>
									<div class="et_pt_portfolio_row clearfix">
								<?php } ?>
								
										<div class="et_pt_portfolio_item">
											<?php if ($et_ptemplate_showtitle) { ?>
												<h2 class="et_pt_portfolio_title"><?php echo $et_portfolio_title; ?></h2>
											<?php } ?>
											<div class="et_pt_portfolio_entry<?php if ( $height == $et_portrait_height ) echo ' et_portrait_layout'; ?>">
												<div class="et_pt_portfolio_image<?php if ($et_videolink <> '') echo ' et_video'; ?>">
													<?php print_thumbnail($thumb, $thumbnail["use_timthumb"], $titletext, $width, $height, ''); ?>
													<span class="et_pt_portfolio_overlay"></span>
													
													<a class="et_portfolio_zoom_icon fancybox" title="<?php the_title(); ?>"<?php if ($et_videolink == '') echo ' rel="portfolio"'; ?> href="<?php if ($et_videolink <> '') echo esc_url( '#' . $et_video_id ); else echo($thumbnail['fullpath']); ?>"><?php esc_html_e('Zoom in','13floor'); ?></a>
													<a class="et_portfolio_more_icon" href="<?php the_permalink(); ?>"><?php esc_html_e('Read more','13floor'); ?></a>
												</div> <!-- end .et_pt_portfolio_image -->
											</div> <!-- end .et_pt_portfolio_entry -->
											<?php if ($et_ptemplate_showdesc) { ?>
												<p><?php truncate_post(90); ?></p>
											<?php } ?>
										</div> <!-- end .et_pt_portfolio_item -->
								
								<?php if ( ($et_ptemplate_portfolio_size == 2 && !$fullwidth && $portfolio_count % 2 == 0) || ( $et_ptemplate_portfolio_size == 3 && ($portfolio_count % 2 == 0) ) ) {
									$et_open_row = false; ?>
									</div> <!-- end .et_pt_portfolio_row -->
								<?php } ?>
								
								<?php if ( ($et_ptemplate_portfolio_size == 2 && $fullwidth && $portfolio_count % 3 == 0) || ($et_ptemplate_portfolio_size == 1 && !$fullwidth && $portfolio_count % 3 == 0) || ($et_ptemplate_portfolio_size == 1 && $fullwidth && $portfolio_count % 5 == 0) ) { ?>
									</div> <!-- end .et_pt_portfolio_row -->
									<div class="et_pt_portfolio_row clearfix">
									<?php $et_open_row = true; ?>
								<?php } ?>
								
							<?php $portfolio_count++; 
							endwhile; ?>
								<?php if ( $et_open_row ) { 
									$et_open_row = false; ?>
									</div> <!-- end .et_pt_portfolio_row -->
								<?php } ?>
								<div class="page-nav clearfix">
									<?php if (function_exists('wp_pagenavi')) { wp_pagenavi(); }
									else { ?>
										 <?php get_template_part('includes/navigation'); ?>
									<?php } ?>
								</div> <!-- end .entry -->
							<?php else : ?>
								<?php if ( $et_open_row ) { 
									$et_open_row = false; ?>
									</div> <!-- end .et_pt_portfolio_row -->
								<?php } ?>
								<?php get_template_part('includes/no-results'); ?>
							<?php endif; wp_reset_query(); ?>
							
							<?php if ( $et_open_row ) { 
								$et_open_row = false; ?>
								</div> <!-- end .et_pt_portfolio_row -->
							<?php } ?>
							
							<?php if ( '' != $et_videos_output ) echo '<div class="et_embedded_videos">' . $et_videos_output . '</div>'; ?>
						</div> <!-- end #et_pt_portfolio_gallery -->
						
						<?php edit_post_link(esc_html__('Edit this page','13floor')); ?>
					
					</div> <!-- end .post -->
				<?php endwhile; endif; ?>
				</div> <!-- end #content-area -->
	
	<?php if (!$fullwidth) get_sidebar(); ?>
	<?php get_footer(); ?>