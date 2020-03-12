jQuery(document).ready(function($){
			
				$(".slider-720").flexslider({
					animation: "slide",              //String: Select your animation type, "fade" or "slide"
					slideDirection: "horizontal",   //String: Select the sliding direction, "horizontal" or "vertical"
					slideshow: true, //Boolean: Animate slider automatically
					slideshowSpeed: 6000, //Integer: Set the speed of the slideshow cycling, in milliseconds
					animationDuration: 1000, //Integer: Set the speed of animations, in milliseconds
					directionNav: true, //Boolean: Create navigation for previous/next navigation? (true/false)
					controlNav: true,               //Boolean: Create navigation for paging control of each slide? Note: Leave true for manualControls usage
					keyboardNav: true,              //Boolean: Allow slider navigating via keyboard left/right keys
					mousewheel: false,              //Boolean: Allow slider navigating via mousewheel
					pausePlay: false,               //Boolean: Create pause/play dynamic element
					randomize: false,               //Boolean: Randomize slide order
					animationLoop: true,            //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
					pauseOnAction: false,            //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
					pauseOnHover: true,            //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
					controlsContainer: ".vendeirinho-slider",          //Selector: Declare which container the navigation elements should be appended too. Default container is the flexSlider element. Example use would be ".flexslider-container", "#container", etc. If the given element is not found, the default action will be taken.
					easing: "easeInCubic",
					
					start: function(slider) {
					
					    $('.slide-content').css({
					        display: 'block'
					    }).stop().animate({
					        left: '0'
					    });
					    
					},
					
					before: function(slider) {
					
					    $('.slide-content').stop().css({
					        display: 'none',
					        left: '-5px',
					        opacity: '0'
					    });
					},
					
					after: function() {
					
					    $('.slide-content').css({
					        display: 'block'
					    }).stop().animate({
					        left: '0',
					        opacity: '1'
					    });
					    
					}
					
				 });
				 
				 // TODO - wrap this in a function
				 var vendeirinho_slide_720_count = $('.slider-720 li').length; 
				 var vendeirinho_slide_720_count_clone = $('.slider-720 li.clone').length; 
				 var vendeirinho_slide_720_diff = vendeirinho_slide_720_count-vendeirinho_slide_720_count_clone; 
				 var vendeirinho_slide_720_width = 100/vendeirinho_slide_720_diff;
				 
				 $('.vendeirinho-slider.slide-720 .flex-control-nav li').width(vendeirinho_slide_720_width+"%");
				 
  				 $('.vendeirinho-slider.slide-720, .post-slider').hover(function(){
				 	$('.flex-pauseplay span, .vendeirinho-slider.slide-720 .flex-direction-nav li a',this).stop().fadeTo(500, .6);
				 	}, function() {
				 	$('.flex-pauseplay span, .vendeirinho-slider.slide-720 .flex-direction-nav li a',this).stop().fadeTo(500, 0);
				 });
				 
				 $('.slider-720 ul.slides').removeClass('loading');
				 
			});