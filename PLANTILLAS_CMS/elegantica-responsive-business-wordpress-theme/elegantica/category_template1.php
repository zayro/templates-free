<?php get_header(); ?>

<div class = "outerpagewrap">
	<div class="pagewrap">
		<div class="pagecontent">
			<div class="pagecontentContent">
				<h1>
				<?php 
				if(get_query_var('portfoliocategory')){
					$cat = get_query_var('portfoliocategory');
					$cat = str_replace('-',' ',$cat);
					echo $cat;
				}	
				else if(get_query_var('tag')){
					$tag = get_query_var('tag');
					$tag = str_replace('-',' ',$tag);
					echo $tag;				
				} 
				else if(get_query_var('s')){
					$search = get_query_var('s');
					echo 'Search: '.$search;				
				}			
				else {
					$cat = get_query_var('cat');
					$cat = get_category($cat);
					echo $cat->name;
				}
					?>
				</h1>
				<p><?php the_breadcrumb(); ?></p>
			</div>
			<div class="homeIcon"><a href="<?php echo home_url(); ?>"></a></div>	
		</div>
	</div>
</div>



<script type="text/javascript">
jQuery(document).ready(function($){
	    $('.slider').anythingSlider({
		hashTags : false,
		expand		: true,
		autoPlay	: true,
		resizeContents  : false,
		pauseOnHover    : true,
		buildArrows     : false,
		buildNavigation : false,
		delay		: 4000,
		resumeDelay	: 0,
		animationTime	: <?php echo $data['anispeed'] ?>,
		delayBeforeAnimate:0,
		easing : 'easeInOutQuint',	
	    })

	    
	    $('.slider-wrapper').hover(function() {
		$(".slideforward").stop(true, true).fadeIn();
		$(".slidebackward").stop(true, true).fadeIn();
	    }, function() {
		$(".slideforward").fadeOut();
		$(".slidebackward").fadeOut();
	    });
	    $(".pauseButton").toggle(function(){
		$(this).attr("class", "playButton");
		$('#slider').data('AnythingSlider').startStop(false); // stops the slideshow
	    },function(){
		$(this).attr("class", "pauseButton");
		$('.slider').data('AnythingSlider').startStop(true);  // start the slideshow
	    });
	    $(".slideforward").click(function(){
		$('.slider').data('AnythingSlider').goForward();
	    });
	    $(".slidebackward").click(function(){
		$('.slider').data('AnythingSlider').goBack();
	    });
	});
	
</script>	
   

	
<div id="mainwrap">

	<div id="main" class="clearfix">

		<div class="pad"></div>	
					
			<div class="content blog">
						
				<?php if (have_posts()) : ?>
				
				<?php while (have_posts()) : the_post();
				if ( has_post_format( 'gallery' , $post->ID)) { ?>
				<div class="slider-category">
				
					<div class="blogpostcategory">
					<?php
						$args = array(
							'post_type' => 'attachment',
							'numberposts' => null,
							'post_status' => null,
							'post_parent' => $post->ID,
							'orderby' => 'menu_order ID',
						);
						$attachments = get_posts($args);
						if ($attachments) {?>
						<div id="slider-category" class="slider-category">
							<ul id="slider" class="slider">
								<?php
									foreach ($attachments as $attachment) {
										//echo apply_filters('the_title', $attachment->post_title);
										$image =  wp_get_attachment_image_src( $attachment->ID, 'full' ); ?>	
											<li>
											<div class="slider-item">
												<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image[0] ?>&amp;h=280&amp;w=580" />					
													
											</div>			
											</li>
											<?php } ?>
							</ul>
							
						</div>
				  <?php } else { 
				  $image = get_template_directory_uri() .'/images/placeholder-580-gallery.png'; ?>
				  <a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=280&amp;w=580" alt="<?php the_title(); ?>"></a>
				  <?php }?>
						<div class="entry">
							
							<div class="leftholder">
									<div class = "posted-date"><div class = "date-inside"><a href="<?php 
									$arc_year = get_the_time('Y'); 
									$arc_month = get_the_time('m'); 
									$arc_day = get_the_time('d');
									echo get_day_link($arc_year, $arc_month, $arc_day); ?>"><div class="day"><?php the_time('j') ?></div><div class="month"><?php the_time('M') ?></div> </a></div></div>
								<div class="commentblog"><div class = "circleHolder"><div class = "comment-inside"><?php comments_popup_link('0', '1', '%'); ?></div></div></div>
							</div>
							<div class = "meta">
									
									<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
									<div class="authorblog"><strong><?php echo stripText($data['translation_by']) ?></strong> <?php the_author_posts_link(); ?></div>
									<div class="categoryblog"><strong><?php echo stripText($data['translation_categories']) ?></strong>							
											<?php   if(get_query_var('portfoliocategory')){ 
												echo get_the_term_list( $post->ID, 'portfoliocategory', '', ', ', '' ); 
											} else {
												the_category(', '); 
											}?></div>
									<div class="blogcontent"><?php echo shortcontent('[', ']', '', $post->post_content ,300);?> ...</div>
									<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>
									<a class="blogmore" href="<?php the_permalink() ?>"><?php echo $data['translation_read_more'] ?> &rarr;</a>

							</div>
							
						</div>	
					</div>
				</div>
				<?php } 
				if ( has_post_format( 'video' , $post->ID)) { ?>
				<div class="slider-category">
				
					<div class="blogpostcategory">
					<div class="loading"></div>
					<?php
					if(strstr($post->post_content,'[video]')){
					add_filter( 'the_content', 'filter_content_video' );
					echo the_content();
					remove_filter( 'the_content', 'filter_content_video' );
					}
					else{ 
						  $image = get_template_directory_uri() .'/images/placeholder-580-video.png'; ?>
						  <a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=280&amp;w=580" alt="<?php the_title(); ?>"></a>
						
					<?php } ?>
						<div class="entry">
							
							<div class="leftholder">
								<div class = "posted-date"><div class = "date-inside"><a href="<?php 
									$arc_year = get_the_time('Y'); 
									$arc_month = get_the_time('m'); 
									$arc_day = get_the_time('d');
									echo get_day_link($arc_year, $arc_month, $arc_day); ?>"><div class="day"><?php the_time('j') ?></div><div class="month"><?php the_time('M') ?></div> </a></div></div>
								<div class="commentblog"><div class = "circleHolder"><div class = "comment-inside"><?php comments_popup_link('0', '1', '%'); ?></div></div></div>
							</div>
							<div class = "meta">
									
									<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
										<div class="authorblog"><strong><?php echo stripText($data['translation_by']) ?></strong> <?php the_author_posts_link(); ?></div>
									<div class="categoryblog"><strong><?php echo stripText($data['translation_categories']) ?></strong>						
											<?php   if(get_query_var('portfoliocategory')){ 
												echo get_the_term_list( $post->ID, 'portfoliocategory', '', ', ', '' ); 
											} else {
												the_category(', '); 
											}?></div>
									<div class="blogcontent"><?php echo shortcontent('[', ']', '', $post->post_content ,300);?> ...</div>
									<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>
									<a class="blogmore" href="<?php the_permalink() ?>"><?php echo $data['translation_read_more'] ?> &rarr;</a>

							</div>
							
						</div>	
					</div>
				</div>
				<?php } 
				if ( has_post_format( 'link' , $post->ID)) { ?>
				<div class="link-category">
					<div class="blogpostcategory">
					<?php
					add_filter( 'the_content', 'filter_content_link' );?>
					<span><?php echo the_content(); ?> </span>


					<div class="entry">
						
						<div class="leftholder">
								<div class = "posted-date"><div class = "date-inside"><a href="<?php 
									$arc_year = get_the_time('Y'); 
									$arc_month = get_the_time('m'); 
									$arc_day = get_the_time('d');
									echo get_day_link($arc_year, $arc_month, $arc_day); ?>"><div class="day"><?php the_time('j') ?></div><div class="month"><?php the_time('M') ?></div> </a></div></div>
							<div class="commentblog"></div>
						</div>
						<div class = "meta">
								
								<h2 class="title"><a href="<?php echo filter_link($post->post_content) ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
									<div class="authorblog"><strong><?php echo stripText($data['translation_by']) ?></strong> <?php the_author_posts_link(); ?></div>
									<div class="categoryblog"><strong><?php echo stripText($data['translation_categories']) ?></strong>							
										<?php   if(get_query_var('portfoliocategory')){ 
											echo get_the_term_list( $post->ID, 'portfoliocategory', '', ', ', '' ); 
										} else {
											the_category(', '); 
										}?></div>
								<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>
								<a class="blogmore" href="<?php echo filter_link($post->post_content) ?>"><?php echo $data['translation_read_more'] ?> &rarr;</a>

						</div>
						
					</div>	
						
					</div>
				</div>
				
				<?php 
				remove_filter( 'the_content', 'filter_content_link' );
				} 				
				if ( !get_post_format() ) {?>
						
				<div class="blogpostcategory">
																
									
						<div class="blogimage">	
									
							<?php	
								if ( has_post_thumbnail() ){
									$image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full', false);
									$image = $image[0];
									}
								else
									$image = get_template_directory_uri() .'/images/placeholder-580.png'; 
							?>
							
							<a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;h=280&amp;w=580" alt="<?php the_title(); ?>"></a>
						</div>
						
						<div class="entry">
							
							<div class="leftholder">
								<div class = "posted-date"><div class = "date-inside"><a href="<?php 
									$arc_year = get_the_time('Y'); 
									$arc_month = get_the_time('m'); 
									$arc_day = get_the_time('d');
									echo get_day_link($arc_year, $arc_month, $arc_day); ?>"><div class="day"><?php the_time('j') ?></div><div class="month"><?php the_time('M') ?></div> </a></div></div>
								<div class="commentblog"><div class = "circleHolder"><div class = "comment-inside"><?php comments_popup_link('0', '1', '%'); ?></div></div></div>
							</div>
							<div class = "meta">
									
									<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
										<div class="authorblog"><strong><?php echo stripText($data['translation_by']) ?></strong> <?php the_author_posts_link(); ?></div>
									<div class="categoryblog"><strong><?php echo stripText($data['translation_categories']) ?></strong>							
											<?php   if(get_query_var('portfoliocategory')){ 
												echo get_the_term_list( $post->ID, 'portfoliocategory', '', ', ', '' ); 
											} else {
												the_category(', '); 
											}?></div>
									<div class="blogcontent"><?php echo shortcontent('[', ']', '', $post->post_content ,300);?> ...</div>
									<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>
									<a class="blogmore" href="<?php the_permalink() ?>"><?php echo $data['translation_read_more'] ?> &rarr;</a>

							</div>
							
						</div>		
				</div>	
				<?php } ?>		
					<?php endwhile; ?>
					
						<?php
						
							include('includes/wp-pagenavi.php');
							if(function_exists('wp_pagenavi')) { wp_pagenavi(); }
						?>
						
						<?php else : ?>
						
							<div class="postcontent">
								<h1><?php echo $data['errorpagetitle'] ?></h1>
								<div class="posttext">
									<?php echo $data['errorpage'] ?>
								</div>
							</div>
							
						<?php endif; ?>
					
			</div>
		
					<div class="sidebar">	
		
						<?php dynamic_sidebar( 'sidebar-widget' ); ?>
			
					</div>

	</div>
	
</div>				
							
<?php get_footer(); ?>
