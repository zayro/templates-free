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

<script type="text/javascript">
jQuery(document).ready(function($){
	    $('#slider').anythingSlider({
		hashTags : false,
		expand		: true,
		autoPlay	: true,
		resizeContents  : false,
		pauseOnHover    : true,
		buildArrows     : false,
		buildNavigation : false,
		delay		: <?php echo $data['pausetime'] ?>,
		resumeDelay	: 0,
		animationTime	: <?php echo $data['anispeed'] ?>,
		delayBeforeAnimate:0,	
		easing : 'easeInOutQuint',
		onSlideBegin    : function(e, slider) {
				$('.nextbutton').fadeOut();
				$('.prevbutton').fadeOut();
		
		},
		onSlideComplete    : function(slider) {
			$('.nextbutton').fadeIn();
			$('.prevbutton').fadeIn();
		
		}		
	    })

	    
	    $('.blogsingleimage').hover(function() {
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
		$('#slider').data('AnythingSlider').startStop(true);  // start the slideshow
	    });
	    $(".slideforward").click(function(){
		$('#slider').data('AnythingSlider').goForward();
	    });
	    $(".slidebackward").click(function(){
		$('#slider').data('AnythingSlider').goBack();
	    });  
	});
	
</script>	

<div id="mainwrap">
	<div id="main" class="clearfix portsingle">
	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	<?php  $portfolio = get_post_custom($post->ID); ?>

	<div class="pad"></div>
	<div class="content fullwidth">

		<div class="blogpost postcontent port" >
			<div class="projectdetails">			
					<div class="blogsingleimage">	
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
							<div id="slider" class="slider">
									<?php
										$i = 0;
										foreach ($attachments as $attachment) {
											//echo apply_filters('the_title', $attachment->post_title);
											$image =  wp_get_attachment_image_src( $attachment->ID, 'full' ); ?>	
												<div>
													<img class="check" src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image[0] ?>&amp;w=610" />				
															
												</div>
												
												<?php 
												$i++;
												} ?>
						
								
							</div>
							<?php if($i > 1){ ?>
						    <div class="prevbutton slidebackward port"></div>
							<div class="nextbutton slideforward port"></div>
							<?php } ?>
						  <?php } else { 
							$image_name = 'feature-image-2';  // sets image name as feature-image-1, feature-image-2 etc.
							if (MultiPostThumbnails::has_post_thumbnail('portfolioentry', $image_name)) {
								$image_id = MultiPostThumbnails::get_post_thumbnail_id( 'portfolioentry', $image_name, $post->ID );  // use the MultiPostThumbnails to get the image ID
								$image_feature_url = wp_get_attachment_image_src( $image_id,'feature-image' ); // define full size src based on image ID
								$image = $image_feature_url[0];
							}
							else{
								$image = get_template_directory_uri() . '/images/placeholder-port.png';
							}?>
							<a href="<?php echo $image ?>" rel="lightbox[port]" title="<?php the_title(); ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $image ?>&amp;w=610" /></a>
						  <?php } ?>
					
					</div>	
			</div>
			<div class="projectdescription">
				<div class = "portnavigation">
					<div class="portprev"><span title="<?php echo stripText($data['translation_next_project']) ?>"><?php previous_post_link('%link','',false,''); ?></span></div>				
					<div class="portnext"><span title="<?php echo stripText($data['translation_previus_project']) ?>"><?php next_post_link('%link','',false,''); ?></span></div>
				</div>
				<div class="datecomment">
					<p>
						<?php if($portfolio['detail_active'][0]) {
							if($portfolio['detail_active'][0]) { ?>
							  <?php echo stripText($data['port_project_url']) ?> <span class="link"><a target="_blank" href="http://<?php echo $portfolio['website_url'][0] ?>" title="project url"><?php echo $portfolio['website_url'][0] ?></a></span>  </br>
						<?php } else { ?>
							   <?php echo stripText($data['port_project_url']) ?> <span class="link"><a title="project url"><?php echo $portfolio['website_url'][0] ?></a></span> 
						<?php }  ?>	
						<?php } ?>
						<?php if($portfolio['author'][0] !='') {?>
							<?php echo stripText($data['port_project_designer']) ?>  <span class="authorp port"><?php echo $portfolio['author'][0] ?></span><br>
						<?php } ?>
						<?php if($portfolio['date'][0] !='') {?>
							<?php echo stripText($data['port_project_date']) ?> <span class="posted-date port"><?php echo $portfolio['date'][0] ?></span><br>
						<?php } ?>
						<?php if($portfolio['customer'][0] !='') {?>
							<?php echo stripText($data['port_project_client']) ?> <span class="author port"><?php echo $portfolio['customer'][0] ?></span><br>
						<?php } ?>		
						
						<?php
						$terms = get_the_terms( $post->ID , 'portfoliocategory');
						if($terms) {
							foreach( $terms as $term ) {
								$cat_obj = get_term($term->term_id, 'portfoliocategory');
								$cat_slug = $cat_obj->slug.',';
							}
						}
							
						?>

						<div class="portcategories"><?php echo get_the_term_list( $post->ID, 'portfoliocategory', '', '', '' ) ?></div>							
					</p>
					
				</div>					
				<div class="posttext"> 
						<div> <?php  the_content(); ?> </div>	
				</div>
				
				<h3 class="portsingleshare"><?php echo stripText($data['port_project_share']) ?></h3>	
				<div class="titleborder"></div>
				<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>	

			</div>
				
			</div>						
	</div>	

	
					
	<?php endwhile; else: ?>
	
	<?php endif; ?>
		<div class="portfolio">		
			<h3><?php echo stripText($data['port_project_related']) ?></h3>	
			<div class="titleborder"></div>		
			<div id="portitems4">
				<?php portfolio(135,233,4,'port',8,substr($cat_slug,0,-1)) ?>	
				
			</div>

		</div>	
	</div>

</div>


