<?php
/*
Template Name: Full Width Page with Full Slider
*/
?>

<?php get_header(); ?>

<script type="text/javascript">
jQuery(document).ready(function($){
if ($.browser.msie && $.browser.version.substr(0,1)<9) {
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


			var height = $('.activePage').find('.check').height();
			var heightIframe = $('.activePage').find('iframe').height();			
			var currheight = $('.anythingSlider').height();
			if(height != null){
				height = currheight/2-20;
				
				$('.nextbutton').css('top',''+height+'px');
				$('.prevbutton').css('top',''+height+'px')
				}
			if(heightIframe != null){
				heightIframe = currheight/2 -20;
				$('.nextbutton').css('top',''+heightIframe+'px');
				$('.prevbutton').css('top',''+heightIframe+'px');				
				}
			$('.nextbutton').fadeIn();
			$('.prevbutton').fadeIn();
		
		}
		
	
	    })
		
 }
  else{
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
		onBeforeInitialize   : function(e, slider) {
			$('.textSlide h1, .textSlide li, .textSlide img, .textSlide h2, .textSlide li.button').css('opacity','0'); 
		},
		
		onSlideBegin    : function(e, slider) {
				$('.nextbutton').fadeOut();
				$('.prevbutton').fadeOut();
		
		},
		onSlideComplete    : function(slider) {


			var height = $('.activePage').find('.check').height();
			var heightIframe = $('.activePage').find('iframe').height();			
			var currheight = $('.anythingSlider').height();
			if(height != null){
				height = currheight/2-20;
				
				$('.nextbutton').css('top',''+height+'px');
				$('.prevbutton').css('top',''+height+'px')
				}
			if(heightIframe != null){
				heightIframe = currheight/2 -20;
				$('.nextbutton').css('top',''+heightIframe+'px');
				$('.prevbutton').css('top',''+heightIframe+'px');				
				}
			$('.nextbutton').fadeIn();
			$('.prevbutton').fadeIn();
		
		}
		
	
	    })
		
  .anythingSliderFx({ 
  
   // base FX definitions can be mixed and matched in here too. 
   '.fade' : [ 'fade' ], 

   // for more precise control, use the "inFx" and "outFx" definitions 
   // inFx = the animation that occurs when you slide "in" to a panel 
   inFx : { 
    '.textSlide h1'  : { opacity: 1, top  : 0, duration: 500, easing : 'linear' }, 
	'.textSlide h2'  : { opacity: 1, top  : 0, duration: 500, easing : 'linear' },
    '.textSlide li.left, .textSlide li.right'  : { opacity: 1, left : 0,  duration: 2000 ,easing : 'easeOutQuint'},
    '.textSlide li.top, .textSlide li.bottom'  : { opacity: 1,  top : 0, duration: 1750 ,easing : 'easeOutQuint'}	,
	'.textSlide li.bottom2'  : { opacity: 1,  top : 0, duration: 2500 ,easing : 'easeOutQuint'}	,
	'.textSlide li.button'  : { opacity: 1,  top : 0, duration: 2500,easing : 'easeOutQuint'}	,
	'.textSlide li.quote'  : { opacity: 1,  top : 0, duration: 5600 ,easing : 'easeOutQuad'}	,
	'.textSlide img' : { opacity: 1, top : -10,  duration: 500 }
   }, 
   // out = the animation that occurs when you slide "out" of a panel 
   // (it also occurs before the "in" animation) 
   outFx : { 
    '.textSlide h1'      : { opacity: 0, top  : '0px', duration: 500 }, 
    '.textSlide li.right'  : { opacity: 0, left : '-600px', duration: 350 }, 
    '.textSlide li.left' : { opacity: 0, left : '200px',  duration: 350 },
    '.textSlide li.bottom' : { opacity: 0, top : '500px',  duration: 350 },
	'.textSlide li.bottom2' : { opacity: 0, top : '500px',  duration: 350 },
    '.textSlide li.top' : { opacity: 0, top : '-500px',  duration: 350 },
	 '.textSlide li.button' : { opacity: 0, top : '500px',  duration: 0 },
	  '.textSlide li.quote' : { opacity: 0, top : '700px',  duration: 350 },
    '.textSlide img' : { opacity: 0, top : '500px',  duration: 350 }
    
   }
  
  }); 
  
  }
	    $('#slider-wrapper').hover(function() {
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
	
<?php $slides = $data['demo_slider']; //get the slides array?>

<div id="slider-wrapper">
<div class="loading"></div>	
<div id="slider">

<?php 
$i = 0;
foreach ($slides as $slide) { ?>
<div>
	
	<div class="panel-<?php echo $i ?>">

					
						<?php if (empty ($slide['video'])) { ?>
							<?php if(!empty($slide['url'])){ ?>
								<div class="images">
									<?php if (!empty ($slide['link'])) { ?>

										<a href="<?php echo $slide['link']; ?>" title="">
											
											<img class="check"  src="<?php echo $slide['url']; ?>"  alt="<?php echo htmlspecialchars(stripslashes($slide['title'])); ?> "/>
										</a>
									
									<?php } else { ?>
										<img class="check" src="<?php echo $slide['url']; ?>" alt="<?php echo htmlspecialchars(stripslashes($slide['title'])); ?>" />	
			
									<?php } ?>

										<div class="textSlide" style="top:<?php echo $slide['top']?>%; left:<?php echo $slide['left']; ?>%">

										<?php echo stripText($slide['description']); ?>	
										
										</div>
								</div>
							<?php } else { ?>
								<div class="images">
									<div class="textSlide" style="top:<?php echo $slide['top']?>%; left:<?php echo $slide['left']; ?>%">

										<?php echo stripText($slide['description']); ?>	
										
									</div>
								</div>
							<?php } ?>
						<?php } else {
							if(strpos($slide['video'], 'vimeo')){	?>
								<div class="iframes">
									<iframe src="<?php echo $slide['video'] ?>" width="550" height="320" frameborder="0"></iframe>
	
									<div class="textSlide" style="top:<?php echo $slide['top']?>%; left:<?php echo $slide['left']; ?>%">

									<?php echo stripText($slide['description']); ?>	
									
									</div>
								</div>
							<?php } else { ?>
								<div class="iframes">
									<iframe src="<?php echo $slide['video'] ?>" width="550" height="320" rel="youtube" frameborder="0"></iframe>
										
									<div class="textSlide" style="top:<?php echo $slide['top']?>%; left:<?php echo $slide['left']; ?>%">

									<?php echo stripText($slide['description']); ?>	
									
									</div>
								</div>								
							<?php } ?>
						<?php } ?>
		</div>
</div>
<?php 
$i++;
} ?>
</div>
    <div class="prevbutton slidebackward"></div>
    <div class="nextbutton slideforward"></div>
		
</div>


		
<div id="mainwrap">

	<div id="main" class="clearfix">


	<div class="pad"></div>

					<div class="content fullwidth nivo">
					
					
							<div class="postcontent">
								<div class="posttext">
									<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
									
									
									<div class="usercontent"><?php the_content('<p class="serif">Read the rest of this page &raquo;</p>'); ?></div>
									
									<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
									
									<?php endwhile; endif; ?>
								</div>
								<div>
									<h3 class="titleborderh"><?php echo stripText($data['translation_share_page']) ?></h3>	
									<div class="titleborder"></div>
								</div>
								<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>	
				
							</div>
					</div>
	</div>
</div>
<?php get_footer(); ?>
