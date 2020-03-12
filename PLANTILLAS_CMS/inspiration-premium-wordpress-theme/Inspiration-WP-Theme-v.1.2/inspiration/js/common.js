jQuery(document).ready(function(){
	
	// Fluid Menu
	if (jQuery(".ddsmoothmenu").length) {
		jQuery('.ddsmoothmenu li').hover(function(){
			jQuery(this).find('.menuslide').slideDown();
		},
		function(){
			jQuery(this).find('.menuslide').slideUp();
		});
	}
	
	// jQuery Uniform Plugin
	if (jQuery("select, input:checkbox, input:radio").length) {
		jQuery("select, input:checkbox, input:radio").uniform();
	}
	
	// jQuery flexible columns
		//jQuery("#fsb").autoColumn(50, ".widget-container");
		//jQuery("#fsb").autoHeight(".widget-container");
		jQuery("#fsb").autoAlign(".widget-container", 50);
		
		jQuery(".columns").autoColumn(50, ".column");
		jQuery(".columns").autoHeight(".column");

	// *************************************** Images ******************************************************//
	
	//Horizontal Sliding
		jQuery('.gallery_item').hover(function(){
			jQuery(".cover", this).stop().animate({left:'214px'},{queue:false,duration:250});
		}, function() {
			jQuery(".cover", this).stop().animate({left:'0px'},{queue:false,duration:900});
		});
	
	// find the div.fade elements and hook the hover event
	if (jQuery(".portfolio_thumb").length) {
		jQuery('.portfolio_thumb a').hover(function() {
			// on hovering over find the element we want to fade *up*
			var fade = jQuery('> .hover_img, > .hover_vid', this);
			// if the element is currently being animated (to fadeOut)...
			if (fade.is('img')) {
				// ...stop the current animation, and fade it to 1 from current position
				fade.stop().fadeTo(300, 1);
			} else {
				fade.fadeIn(300);
			}
		}, function () {
			var fade = jQuery('> .hover_img, > .hover_vid', this);
			if (fade.is('img')) {
				fade.stop().fadeTo(300, 0);
			} else {
				fade.fadeOut(300);
			}
		});

		// get rid of the text
		jQuery('.portfolio_thumb a > .hover_img, .portfolio_thumb a > .hover_img').empty();
	}
	
	// jQuery Roundabout Plugin for portfolio page
	if (jQuery(".portfolio_rotator").length) {
		jQuery('.portfolio_rotator ul').roundabout({
			bearing: 0.0,			// The starting direction in which the Roundabout should point.
			tilt: 0.0,				// The starting angle at which the Roundabout’s plane should be tipped.
			minZ: 10,				// The lowest z-index value that a moveable item can be assigned. (Will be the z-index of the item farthest from the focusBearing.)
			maxZ: 100,				// The greatest z-index value that a moveable item can be assigned. (Will be the z-index of the item in focus.)
			minOpacity: 0.3,		// The lowest opacity value that a moveable item can be assigned. (Will be the opacity of the item farthest from the focus bearing.)
			maxOpacity: 1.0,		// The greatest opacity value that a moveable item can be assigned. (Will be the opacity of the item in focus.)
			minScale: 0.6,			// The lowest percentage of font-size that a moveable item can be assigned. (Will be the scale of the item farthest from the focus bearing.)
			maxScale: 1.0,			// The greatest percentage of font-size that a moveable item can be assigned. (Will be the scale of the item in focus.)
			duration: 800,			// The length of time (in milliseconds) that all animations take to complete by default.
			btnNext: null,			// A jQuery selector of elements that will have a click event assigned to them. On click, the Roundabout will move to the next child (counterclockwise).
			btnPrev: null,			// A jQuery selector of elements that will have a click event assigned to them. On click, the Roundabout will move to the previous child (clockwise).
			easing: 'swing',		// The easing method to be used for animations by default. jQuery comes with “linear” and “swing,” although any of the jQuery Easing plugin’s values can be used if the easing plugin is included.
			clickToFocus: true,		// When an item is not in focus, should it be brought into focus via an animation? If true, will disable any click events on elements within the moving element that was clicked. Once the element is in focus, click events will no longer be blocked.
			focusBearing: 0.0,		// The bearing at which a moving item’s position must match on the Roundabout to be considered “in focus.”
			shape: 'waterWheel',	// For use with the Roundabout Shapes plugin. Sets the shape of the path over which moveable items will travel.
			debug: false,			// Changes the HTML within moving elements into a list of information about that element. Helpful for advanced configurations.
			childSelector: 'li',	// Changes the set of elements Roundabout will look for within the holding element for moving.
			startingChild: 0,		// Starts a given child at the focus of the Roundabout. This is a zero-based number positioned in order of appearance in the HTML file.
			reflect: false			// Setting to true causes the elements to be placed around the Roundabout in reverse order. Also flips the direction of “next” and ”previous” buttons. 
		});
	}
	
	// Partners Page
	if (jQuery(".partner_item").length) {
		//move the image in pixel
		var move = -15;
		//zoom percentage, 1.2 =120%
		var zoom = 1.2;
		//On mouse over those thumbnail
		jQuery('.partner_item').hover(function() {
			
			//Set the width and height according to the zoom percentage
			width = jQuery('.partner_item').width() * zoom;
			height = jQuery('.partner_item').height() * zoom;
			
			//Move and zoom the image
			jQuery(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200});
			
			//Display the caption
			jQuery(this).find('div.caption').css({"visibility":"visible",opacity:0.8});
		},
		function() {
			//Reset the image
			jQuery(this).find('img').stop(false,true).animate({'width':jQuery('.partner_item').width(), 'height':jQuery('.partner_item').height(), 'top':'0', 'left':'0'}, {duration:100});	
	
			//Hide the caption
			jQuery(this).find('div.caption').css({"visibility":"hidden",opacity:0});
		});
	}
	
		// *************************************** Shortcodes ******************************************************//

	// jQuery Toggle
	if (jQuery(".toggle_container").length) {
		jQuery(".toggle_container").hide(); //Hide (Collapse) the toggle containers on load
		//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
		jQuery("b.trigger").click(function(){
			jQuery(this).toggleClass("active").next().slideToggle("slow");
			return false; //Prevent the browser jump to the link anchor
		});
	}

	// jQuery Accordion
	if (jQuery(".acc_container").length) {
		//Set default open/close settings
		jQuery('.acc_container').hide(); //Hide/close all containers
		jQuery('.acc_trigger:first').addClass('active').next().show(); //Add "active" class to first trigger, then show/open the immediate next container
		
		//On Click
		jQuery('.acc_trigger').click(function(){
			if( jQuery(this).next().is(':hidden') ) { //If immediate next container is closed...
				jQuery('.acc_trigger').removeClass('active').next().slideUp(); //Remove all "active" state and slide up the immediate next container
				jQuery(this).toggleClass('active').next().slideDown(); //Add "active" state to clicked trigger and slide down the immediate next container
			}
			return false; //Prevent the browser jump to the link anchor
		});
	}

	// jQuery Tabs
	if (jQuery(".tab_content").length) {
		//When page loads...
		jQuery(".tab_content").hide(); //Hide all content
		jQuery("ul.tabs li:first").addClass("active").show(); //Activate first tab
		jQuery(".tab_content:first").show(); //Show first tab content
	
		//On Click Event
		jQuery("ul.tabs li").click(function() {
	
			jQuery("ul.tabs li").removeClass("active"); //Remove any "active" class
			jQuery(this).addClass("active"); //Add "active" class to selected tab
			jQuery(".tab_content").hide(); //Hide all tab content
	
			var activeTab = jQuery(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			jQuery(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	}

	// Sliding menu items in sidebar
	if (jQuery("#sidebar").length) {
		slide("#sidebar .widget_categories", 10, 0, 150, .8);
		slide("#sidebar .widget_archive", 10, 0, 150, .8);
		slide("#sidebar .widget_nav_menu", 10, 0, 150, .8);
		slide("#sidebar .widget_links", 10, 0, 150, .8);
		slide("#sidebar .widget_recent_entries", 10, 0, 150, .8);
		slide("#sidebar .widget_recent_comments", 10, 0, 150, .8);
	}
	
	// go to top scroll effect
	if (jQuery(".gototop").length) {
		jQuery.localScroll();
	}
	
	// tabbed widget
	if (jQuery(".widget_tabbed").length) {
		jQuery(".widget_tabbed").tabs({ fx: { height: 'toggle', opacity: 'toggle' } });
	}
	
	// jQuery data-rel to rel
	if (jQuery("a[data-rel]").length) {
		jQuery('a[data-rel]').each(function() {jQuery(this).attr('rel', jQuery(this).data('rel'));});
	}
	
	// PrettyPhoto
	if (jQuery().prettyPhoto) {
		pp_lightbox(); 
	}

});

jQuery(function(){
		
	// jQuery tipsy
	if (jQuery(".social").length) {
		jQuery('.social a').tipsy(
		{
			gravity: 's', // nw | n | ne | w | e | sw | s | se
			fade: true
		});
	}

	// jQuery Watermark Plugin
	if (jQuery(".widget_search").length) {
		jQuery('input[name="s"]').each(function() {
			jQuery(this).Watermark("Enter keywords");
		});
	}
	
	// jQuery Uniform Plugin
	if (jQuery("select, input:checkbox, input:radio").length) {
		jQuery("select, input:checkbox, input:radio").uniform();
	}
	
});

// PrettyPhoto
function pp_lightbox() {
	jQuery("a[rel^='prettyPhoto']").prettyPhoto({
		animation_speed: 'normal', /* fast/slow/normal */
		opacity: 0.70, /* Value between 0 and 1 */
		show_title: false, /* true/false */
		allow_resize: true, /* true/false */
		counter_separator_label: '/', /* The separator for the gallery counter 1 "of" 2 */
		theme: 'pp_default', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
		overlay_gallery: true, /* display or hide the thumbnails on a lightbox when it opened */
		deeplinking: false
	});
}
	
function gallery_caption() {
	jQuery('.gallery_item').hover(function(){
		jQuery(".cover", this).stop().animate({left:'214px'},{queue:false,duration:250});
	}, function() {
		jQuery(".cover", this).stop().animate({left:'0px'},{queue:false,duration:900});
	});
}

jQuery(document).ready(function() {
	// jquery quicksand
	var $filterType = jQuery('#filter a');
	var $list = jQuery('#portfolio');
	var $data = $list.clone();
	$filterType.click(function(event) {
		if (jQuery(this).attr('rel') == 'gallery') {
		  var $sortedData = $data.find('li');
		} else {
			var $sortedData = $data.find('.'+ jQuery(this).attr('rel'));
		}
		jQuery('#filter li a').removeClass('current_link');
		jQuery(this).addClass('current_link');
		$list.quicksand($sortedData, {
		  attribute: 'id',
		  duration: 800,
		  easing: 'easeInOutQuad',
		  adjustHeight: 'auto',
		  useScaling: 'false'
		}, function() {
			pp_lightbox();
			gallery_caption();
			Cufon.refresh();
		});
		return false;
	});
	
});

// *************************************** Functions ******************************************************//

function slide(navigation_id, pad_out, pad_in, time, multiplier)
{
	// creates the target paths
	var list_elements = navigation_id + " li";
	var link_elements = list_elements + " a";
	
	// initiates the timer used for the sliding animation
	var timer = 0;
	
	// creates the slide animation for all list elements 
	jQuery(list_elements).each(function(i)
	{
		// margin left = - ([width of element] + [total vertical padding of element])
		jQuery(this).css("margin-left","-15px");
		// updates timer
		timer = (timer*multiplier + time);
		jQuery(this).animate({ marginLeft: "0" }, timer);
		jQuery(this).animate({ marginLeft: "15px" }, timer);
		jQuery(this).animate({ marginLeft: "0" }, timer);
	});

	// creates the hover-slide effect for all link elements 		
	jQuery(link_elements).each(function(i)
	{
		jQuery(this).hover(
		function()
		{
			jQuery(this).animate({ paddingLeft: pad_out }, 150);
		},		
		function()
		{
			jQuery(this).animate({ paddingLeft: pad_in }, 150);
		});
	});
}