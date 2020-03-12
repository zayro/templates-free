jQuery(document).ready(function($) {
	$('ul li:last-child').addClass('lastItem');
	$('ul li:first-child').addClass('firstItem');
	
/*ScrollToTop button*/
	$(function() {
		$(window).scroll(function() {
			if($(this).scrollTop() != 0) {
				$('.rt-block.totop').fadeIn();	
			} else {
				$('.rt-block.totop').fadeOut();
			}
		});
	});
	
/*Avoid input bg in Chrome*/
	if ($.browser.webkit) {
		$('input').attr('autocomplete', 'off');
	}
	
/*Zoom Icon. Portfolio page*/
	$('#port a.touch').hover(function(){
		$(this).find('span.zoomIcon').stop(true, true).animate({opacity: 1, top: '50%'}, 200);
	},function(){
		$(this).find('span.zoomIcon').stop(true, true).animate({opacity: 0, top: '-50%'}, 100);
	})

	$(function(){
	// IPad/IPhone
		var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
		ua = navigator.userAgent,

		gestureStart = function () {viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6";},

		scaleFix = function () {
			if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
				viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
				document.addEventListener("gesturestart", gestureStart, false);
			}
		};
		
		scaleFix();
	});
	
/*Pagination Active Button*/
	$('.k2Pagination ul li:not([class]), div.pagination ul li:not([class]), div.itemCommentsPagination ul li:not([class])').addClass('num');
});
