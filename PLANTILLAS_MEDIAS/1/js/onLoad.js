/*
/*	Dynamic design functions and onLoad events
/*	----------------------------------------------------------------------
/* 	Creates added dynamic functions and initializes loading.
*/


// ======================================================================
//
//	On document ready functions
//
// ======================================================================

$j(document).ready(function($) {
	
	
	// initialise main-menu (jQuery superfish plug-in)
	// -------------------------------------------------------------------
	
	if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) < 7) {
		// IE 6 has problem with supersubs plugin so we don't use it here...
		$('ul.sf-menu').superfish({  		// initialize superfish
				delay:       400,			// one second delay on mouseout 
				animation: {				// fade-in and slide-down animation 
					height:	'show'
				},
				speed:		275
			});
	} else {
		// all other browsers, include supersubs plugin.
		$('ul.sf-menu').supersubs({ 
	            minWidth:    12,	// minimum width of sub-menus in em units 
	            maxWidth:    27,	// maximum width of sub-menus in em units 
	            extraWidth:  0		// extra width for slight rounding differences in fonts 
	        }).superfish({  		// initialize superfish
	            delay:       400,	// one second delay on mouseout 
	            animation: {		// fade-in and slide-down animation 
					height:	'show'
				},
	            speed:		275
	        });
	}
	
		
	// initialize modal (fancybox)
	// -------------------------------------------------------------------
	
	// Quickly setup some special references
	// fancybox doesn't like #name references at the end of links so we find
	// them and modify the link to use a class and remove the #name.
	$('a[href$="#popup"]').addClass('zoom').each( function() {
		theHref = $(this).attr('href');
		$(this).attr('href', theHref.replace('#popup',''))
	});
	$('a[href$="#login"]').addClass('login').each( function() {
		theHref = $(this).attr('href');
		$(this).attr('href', theHref.replace('#login',''))
	});

	var overlayColor = '#2c2c2c';

	$('a.zoom').fancybox({
		'padding': 4,
		'overlayOpacity': 0.2,
		'overlayColor': overlayColor, 
		'onComplete': modalStart		
	});
	
	$('a.login').fancybox({
		'centerOnScroll': true,
		'type': 'ajax',
		'ajax' : { cache : false }, 
		'titleShow': false,
		'overlayOpacity': 0.2,
		'overlayColor': overlayColor, 
		'showCloseButton': false,
		'autoDimensions': false,
		'width': 419,
		'height': 231,
		'onComplete': modalStart		
	});
	
	
	// Slide down top content (topReveal) 
	// -------------------------------------------------------------------
	$('.topReveal, a[href$="#topReveal"]').click( function() {
		// show/hide the content area
		$('#TopReveal').slideToggle(800,'easeOutQuart');
		// IE sucks feature 
		if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) <= 8) {
			document.body.style.overflowX = 'scroll';  // force overflow-x = scroll, prevents IE scrollbar
		}
		$.scrollTo(document.body);
		return false;
	});


	// image hover effects	
	// -------------------------------------------------------------------
	$("a.img").hover( function () {
		if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) <= 8) {
			$(this).stop(false, true).toggleClass('imgHover');
		} else {
			$(this).stop(false, true).toggleClass('imgHover', 200);
		}
	});
			
			
	// Text and password input styling
	// -------------------------------------------------------------------
	
	// This should be in the CSS file but IE 6 will ignore it.
	// If you have an input you don't want styles, add the class "noStyle"

	$("input[type='text']:not(.noStyle), input[type='password']:not(.noStyle)").each(function(){
		$(this).addClass('textInput');
	});


	// Show/Hide slide show buttons
	// -------------------------------------------------------------------
		
	// This will show/hide the slide show buttons for Next and Previous
	// on the jQuery Cycle plugin slide show.
	
	// on mouse over/out functions
	if (typeof $.fn.hoverIntent == 'function') {
		$('.cycleSS').hoverIntent(function() {showSlideNav($j)}, function() {hideSlideNav($j)});
	} else {
		$('.cycleSS').hover(function() {showSlideNav($j)}, function() {hideSlideNav($j)});
	}
	// Hide on page load...
	if ($('#SlideNextPrev')) {
		var initHideSlideNav = setTimeout("hideSlideNav($j)", 1000);	// delay in milliseconds
	}
	
						   
	// input lable replacement
	// -------------------------------------------------------------------
	$("label.overlabel").overlabel();
	
	// apply custom search input functions
	// -------------------------------------------------------------------
	searchInputEffect();
		
	// apply custom button styles
	// -------------------------------------------------------------------
	buttonStyles();
	
	// initialize anchor tag scrolling effect (scrollTo)
	// -------------------------------------------------------------------
	$j.localScroll();

	// CSS Rounded Corners (not for IE)
	// -------------------------------------------------------------------
	if (!jQuery.browser.msie) {
		$("a.img, a.img img, div.img, div.img img, .pagination a, .textInput, input[type='text'], input[type='password'], textarea").addClass('rounded');	// items to add rounded class
		roundCorners(); // execute it!
	}
	
});




// ======================================================================
//
//	Design functions
//
// ======================================================================


	
// Modal after load functions
// -------------------------------------------------------------------

function modalStart() {
	// apply font replacement
	Cufon.replace('#fancybox-title-main');
	
	// updated styles
	$j('#fancybox-outer').addClass('rounded');
	roundCorners();
}



// Search input - custom effects for mouse over and focus.
// -------------------------------------------------------------------

// Search input - custom effects for mouse over and focus.
// -------------------------------------------------------------------

function searchInputEffect() {

	var	searchFocus = false,
		searchHover = false,
		searchCtnr = $j('#Search'),
		searchInput = $j('#SearchInput'),
		searchSubmit = $j('#SearchSubmit');
	// Search input - mouse events
	if (searchCtnr.length > 0) {
		searchCtnr.hover(
			function () {	// mouseover
				if (!searchFocus) $j(this).addClass('searchHover');
				searchHover = true; }, 
			function () {	// mouseout
				if (!searchFocus) $j(this).removeClass('searchHover');
				searchHover = false;
		}).mousedown( function() {
			if (!searchFocus) $j(this).removeClass('searchHover').addClass('searchActive');
		}).mouseup( function() {
			searchInput.focus();
			searchSubmit.show();
			searchFocus = true;
		});
		// set focus/blur events
		searchInput.blur( function() {
			if (!searchHover) {
				searchCtnr.removeClass('searchActive');
				searchSubmit.hide();
				searchFocus = false;
			}
		});
	}
}



// button styling function
// -------------------------------------------------------------------

function buttonStyles() {
	// Button styles
	
	// This will style buttons to match the theme. If you don't want a button
	// styled, give it the class "noStyle" and it will be skipped.
	$j("button:not(:has(span),.noStyle), input[type='submit']:not(.noStyle), input[type='button']:not(.noStyle)").each(function(){
		var	b = $j(this),
			tt = b.html() || b.val();
		
		// convert submit inputs into buttons
		if (!b.html()) {
			b = ($j(this).attr('type') == 'submit') ? $j('<button type="submit">') : $j('<button>');
			b.insertAfter(this).addClass(this.className).attr('id',this.id);
			$j(this).remove();	// remove input
		}
		b.text('').addClass('btn').append($j('<span>').html(tt));	// rebuilds the button
	});
	
	// Get all styled buttons
	var styledButtons = $j('.btn');
	
	// Fix minor problem with Mozilla and WebKit rendering (can also be done adding this to CSS, 
	// button::-moz-focus-inner {border: none;}
	// @media screen and (-webkit-min-device-pixel-ratio:0) { button span {margin-top: -1px;} }
	if (jQuery.browser.mozilla || jQuery.browser.webkit) {
		styledButtons.children("span").css("margin-top", "-1px");
	}
	
	// Button hover class (IE 6 needs this)
	styledButtons.hover(
		function(){ $j(this).addClass('submitBtnHover'); },		// mouseover
		function(){ $j(this).removeClass('submitBtnHover'); }	// mouseout
	);
}



// Functions to show and hide slide navigation controls (for cycle SS)
// -------------------------------------------------------------------

	// show slide navigation
	function showSlideNav($) {
		if ($('#SlideNextPrev')) {
			if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) < 7) {
				$('#SlideNextPrev').css('display','block');
			} else {
				$('#SlideNextPrev').animate({ 'height': '30px' }, 300, function() {});
			}
		}		
	}
	// hide slide navigation
	function hideSlideNav($) {
		if ($('#SlideNextPrev')) {
			if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) < 7) {
				$('#SlideNextPrev').css('display','none');
			} else {
			$('#SlideNextPrev').animate({ 'height': '0px' }, 400, function() {});
			}
		}
	}



// Rounded corner styles
// -------------------------------------------------------------------

function roundCorners() {
	$j('.rounded, .ui-corner-all').css({
		'-moz-border-radius': '4px',
		'-webkit-border-radius': '4px',
		'border-radius': '4px'
	});
}
	

// Font replacement
// -------------------------------------------------------------------


if ( setBySkin != true ) {
	// we have an exception to allow custom styles to be applied by the demo.js
	// file if skinning is active. If skinning is not used the is not needed.
	Cufon.replace('h1, h2, h3, h4, h5, h6, #fancybox-title-main')
				('#MainMenu a.isMenuItem', {
				hover: true, textShadow: '-1px -1px rgba(0, 0, 0, 0.8)'})
				('.headline, .title:not(.isMenuItem), .smallTitle, .blogPostHeader h1, .blogDate, .blogPostInfo', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 1)'})
				('.alternate .pageTitle', {
				hover: true, textShadow: '-1px -1px rgba(0, 0, 0, 0.3)'});
}
