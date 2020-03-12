$(document).ready(function(){

	//Tour and shortcodes tabs
	$('.tabs').tabs({ fx: { opacity: 'toggle', duration:'fast'} });
	
	// Inputs set default value
	$('input[title], textarea').bind({
        focus: function() {
            if ($(this).attr('title') == $(this).attr('value')) {
                $(this).attr('value', '');
            }
        },
        blur: function() {
            if ($(this).attr('value') == '') {
                $(this).attr('value', $(this).attr('title'));
            }
        }
    });

	//Flickr border
	$(".flickr ul li a").hover(function() { 
		$(this).stop().animate({"border-color": "#d93e39"}, 600, 'swing');
	},
	function() {
		$(this).stop().animate({"border-color": "#202020"}, 600, 'swing');
	});


	//Video responsive
	$("body").fitVids();
	
	//Magnific Glass on images
	preparingMagnificGlass();
	
	/* Homepage companies logo */
	$(".companies li").hover(function() { 
		var thumbOver = $(this).find("img").attr("src"); 
		$(this).find("a.thumb").css({'background' : 'url(' + thumbOver + ') no-repeat center bottom'});
		$(this).find("span").stop().fadeTo('normal', 0 , function() {
			$(this).hide()
		}); 
	} , function() {
		$(this).find("span").stop().fadeTo('normal', 1).show();
	});
	
	
	//Animate featured background on homepage
	$(".featured_bg").find('img').hover(
		function () {
			$(this).fadeIn(100).animate({top:"-=10px"},100);
		},
		function () {
			$(this).fadeIn(100).animate({top:"+=10px"},100);
		}
	);

	

	/* Socials Big */
	$("ul.social_networks li").hover(function() { 
		var thumbOver = extractUrl($(this).find("span").css("background-image"));
		$(this).find("span").stop().animate({backgroundPosition: '32px 0'}, 150, 'easeOutQuint') ;
	} , function() {
		$(this).find("span").stop().animate({backgroundPosition: '0 0'}, 150, 'easeOutQuint') ;
	});
	
	/* Footer social */
	$("ul.social_footer	li a").hover(function() { 
		var thumbOver = extractUrl($(this).find("span").css("background-image"));
		$(this).find("span").stop().animate({backgroundPosition: '16px 0'}, 250, 'easeOutQuint') ;
	} , function() {
		$(this).find("span").stop().animate({backgroundPosition: '0 0'}, 250, 'easeOutQuint') ;
	});
	

	
	/* Menu slide down and hide */
	$('.main-menu li:has(ul)').addClass('submenu');
	
	$('.main-menu').on('mouseenter', 'li', function() {
			$(this).children('ul').hide().stop(true, true).fadeIn("normal");
		}).on('mouseleave', 'li', function() {
			$(this).children('ul').stop(true, true).fadeOut("normal");
		});
	
	//Fixing responsive menu
	$(window).resize(function() {
		$('.main-menu').children('ul').children('li').children('ul').hide();
		$('.main-menu').children('ul').children('li').children('ul').children('li').children('ul').hide();
	});
	
	//Categories Text Indent
	$(".categories ul li").hover(
		function () {
			if (!($('a', this).hasClass("selected")))
				$('a', this).stop().animate({textIndent: 15}, 800, 'easeOutQuint');
		},
		function () {
			if (!($('a', this).hasClass("selected")))
				$('a', this).stop().animate({textIndent: 0}, 800, 'easeOutQuint');
		}
	);
	

	/*Shortcodes*/
	$(".toggle_container").hide();
	$(".toggle").click(function(){
		$(this).toggleClass("toggle_active").next().slideToggle("slow");
	});
	$(".opened_toggle").trigger('click');
	/*End Shortcodes*/
	
	/*Pretyphoto*/
		$("a[data-rel^='prettyPhoto']").prettyPhoto({ animationSpeed:'slow',social_tools: false,slideshow:2000});
	/*End Pretyphoto*/
	
	
});

//Excract url from element
function extractUrl(input)
{
	return input.replace(/"/g,"").replace(/url\(|\)$/ig, "");
}

//Preparing Magnific Glasses for images
function preparingMagnificGlass()
{
	$('a.magnific-glass').hover(
        function()
        {
			var offset = $(this).children('img').offset();
			var image_height = parseInt($(this).children('img').height() / 2) - 25;
			var image_width = parseInt($(this).children('img').width() / 2) - 25;
			if($(this).hasClass('video'))
			{
				var image = 'images/zoom_icon_video.png';
			}
			else
			{
				var image = 'images/zoom_icon.png';
			}
			
			var offset = $(this).children('img').offset();
			
			if($(this).parent('div').attr('class') == 'image_block' || $(this).parent('span').attr('class') == 'recent_image')
			{
				offset.top = 5;
				offset.left = 5;
			}
			

			
            $('<a class="zoom"><img src="'+image+'" alt="" class="created" /></a>').appendTo(this).css({
				height:$(this).children('img').height(), 
				width:$(this).children('img').width(),
				'top':offset.top,
				'left':offset.left,
				padding:0}).stop().css({'opacity':0, 'visibility': 'visible'}).animate({'opacity': 1}, 400);
				
			$('.created', this).stop()
			  .css({'top':-100,'left':image_width,'visibility': 'visible'})
			  .animate({'top': image_height}, 500);	
				
        },
        function()
        {
			$('.zoom').stop(true, true).stop().animate({'opacity': 0}, 400, function(){jQuery(this).remove()});
			var image_height = parseInt($(this).children('img').height() / 2) - 25;
			var image_height2 = $(this).children('img').height();
			$('.created', this).stop()
			  .css({'top':image_height,'visibility': 'visible'})
			  .animate({'top': image_height2}, 500);	
        }
    );
}