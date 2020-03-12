// DreamTravel JavaScript Document

$(document).ready(function() {

	// Superfish drop down menu
	jQuery(function(){
		jQuery('ul#Links').superfish({
			delay:       1000, // one second delay on mouseout 
			pathLevels:    1,  // the number of levels of submenus that remain open or are restored using pathClass 
           	animation:   {opacity:'show',height:'show'}, // fade-in and slide-down animation 
           	speed:       'normal', // faster animation speed 
           	autoArrows:  false, // disable generation of arrow mark-up 
           	dropShadows: false, // disable drop shadows 
			disableHI:   false              // set to true to disable hoverIntent detection 
		});
	});

	// Header Slideshow
	$('#Slideshow').jqFancyTransitions({ 
		width: 970, 
		height: 200, 
		effect: 'curtain', // wave, zipper, curtain
		strips: 5,
		strips: 20, // number of strips
		delay: 4000, // delay between images in ms
		stripDelay: 30, // delay beetwen strips in ms
		titleOpacity: 0.7, // opacity of title
		titleSpeed: 1000, // speed of title appereance in ms
		position: 'alternate', // top, bottom, alternate, curtain
		direction: 'fountainAlternate', // left, right, alternate, random, fountain, fountainAlternate
		navigation: true, // prev and next navigation buttons
		links: false
	});
	
 	// Submenu Menu 
	$("#SubMenu a").fadeTo("slow", 0.6); // This sets the opacity of the thumbs to fade down to 60% when the page loads
	$("#SubMenu a.selected").fadeTo("slow", 1.0); // This is hover FIX for IE

	$("#SubMenu a").hover(function(){
		$(this).fadeTo("slow", 1.0); /// This is hover FIX for IE
		},function(){
		$(this).fadeTo("slow", 0.6); // This is hover FIX for IE
	});
	$("#SubMenu a.selected").mouseout(function(){
		$(this).fadeTo("slow", 1.0); // This should set the opacity to 100% on hover
		},function(){
		$(this).fadeTo("slow", 1.0); // This should set the opacity back to 60% on mouseout
	});	

	// Fancy LightBox
	$("a[rel=group]").fancybox({
		'transitionIn'		: 'elastic',
		'changeFade'		: 'fast',
		'transitionOut'		: 'elastic',
		'titlePosition' 	: 'over',
		'overlayOpacity'	: '0.6',
		'showCloseButton'	: false,
		'overlayColor'		: '#000000',
		'titleFormat'		: function(title, currentOpts) {
				return '<span id="fancybox-title-over">'+ (title.length ? ' &nbsp; ' + title : '') + '</span>';
			}
	});
	
	// Booking form
	$(".BookNow_Lnk").fancybox({
		'transitionIn'		: 'fade',
		'transitionOut'		: 'fade',
		'titleShow'			: false,
		'overlayOpacity'	: '0.6',
		'overlayColor'		: '#000000',
		'showCloseButton'	: false
	});
	
});