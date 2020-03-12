
	// Cufon text replacememnt, add more elements to replace text with cufon generated text.
	Cufon.replace('ul.sf-menu a, h3, h1, a.btn, .cufon, .content h1, .content h2, .content h3, .content h4, .content h5, .content h6, #footer h4',{hover: true});
	
	//Anything with the class .image_load that hols and image will use the ajax loader.
	$(function () {
		$('.image_load img').hide();//hide all the images on the page
	});

	var i = 0;//initialize
	var int=0;//Internet Explorer Fix
	$(window).bind("load", function() {//The load event will only fire if the entire page or document is fully loaded
		var int = setInterval("doThis(i)",500);//500 is the fade in speed in milliseconds
	});

	function doThis() {
		var images = $('.image_load img').length;//count the number of images on the page
		if (i >= images) {// Loop the images
			clearInterval(int);//When it reaches the last image the loop ends
		}
		$('.image_load img:hidden').eq(0).fadeIn(500);//fades in the hidden images one by one
		i++;//add 1 to the count
	}
	
$(document).ready(function() { 
		
		//Main navigation dropdowns
        $('ul.sf-menu').superfish({ 
            delay:       300,                            // one second delay on mouseout 
            animation:   {height:'show'},  // fade-in and slide-down animation 
            speed:       'fast',                          // faster animation speed 
            autoArrows:  false,                           // disable generation of arrow mark-up 
            dropShadows: false                            // disable drop shadows 
        }); 

		//Coin slider customization
		$('#coin-slider').coinslider({ width: 920, height: 337, navigation: true, opacity: 1 });
		
		$('input.sidetext, .sidebar input, input.large, input.medium, input.small, input.extra_small').focus(function() {
			$(this).addClass("input_hover");
    	});

		$('input.sidetext, input.large, input.medium, input.small, input.extra_small').blur(function() {
			$(this).removeClass("input_hover");
    	});
		
		$('input.green').focus(function() {
			$(this).addClass("green_hover");
    	});
		
		$('input.green').blur(function() {
			$(this).removeClass("green_hover");
    	});
		
		$('input.red').focus(function() {
			$(this).addClass("red_hover");
    	});
		
		$('input.red').blur(function() {
			$(this).removeClass("red_hover");
    	});
		
		$('input.yellow').focus(function() {
			$(this).addClass("yellow_hover");
    	});
		
		$('input.yellow').blur(function() {
			$(this).removeClass("yellow_hover");
    	});

		$('input.large, input.medium, input.small, input.extra_small').blur(function() {
			$(this).removeClass("input_hover");
    	});
		
		//email fields change class using css sprites
		$('#email').focus(function() {
			$('.input_small').removeClass("input_small").addClass("input_small_highlight");
    	});
		
		//Make any email field return to normal on blur
    	$('#email').blur(function() {
    		$('.input_small_highlight').removeClass("input_small_highlight").addClass("input_small");
    	});
		
		//Submit button class change using css sprites
		$(".submit").hover(function () {
			$(this).addClass("submit_hover");
	  		}, 
	  		function () {
			$(this).removeClass("submit_hover");
	  		}
		);
		
		$('#cycle').cycle({ 
			fx:      'fade', 
			speed:    500, 
			timeout:  5000 
		});
}); 