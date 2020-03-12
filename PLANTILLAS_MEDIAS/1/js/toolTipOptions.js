
// ======================================================================
//
//	Tool Tips
//	
//	Documentation:  http://plugins.learningjquery.com/cluetip/
//
// ======================================================================

$j(document).ready(function($) {
	
	// Tooltip hover effect (jQuery clueTip)
	// -------------------------------------------------------------------
		$.fn.cluetip.defaults.cluetipClass	=	'skinned';		// added in the form of 'cluetip-' + clueTipClass
		$.fn.cluetip.defaults.cluezIndex	=	1234;			// z-index style property
		$.fn.cluetip.defaults.dropShadow	=	false;			// use drop shadow (off is best for image skinned tips)
		$.fn.cluetip.defaults.topOffset		=	35;				// px to offset clueTip from top

		$.fn.cluetip.defaults.fx = {							// effect and speed for opening clueTips
			open:		'fadeIn', 	// can be 'show' or 'slideDown' or 'fadeIn'
			openSpeed:	'100'		// speed of effect
		};
		$.fn.cluetip.defaults.hoverIntent	= {					// settings for hoverIntent plugin	
			sensitivity:  3,		
			interval:     100,		// delay before showing tip
			timeout:      80		// delay hiding tip
		};
		$.fn.cluetip.defaults.onShow		=	function(ct, c){
			// on display fix spacing for title only tips
			if ($('#cluetip-inner').html() == '') {
				// add helper class
				(jQuery.browser.msie) ? $('#cluetip').addClass('ieFix') : $('#cluetip').addClass('mozFix');				
			} else {
				// remove helper class
				(jQuery.browser.msie) ? $('#cluetip').removeClass('ieFix') : $('#cluetip').removeClass('mozFix');	
			}
		};
		
	// Select items to show tool tips for
	// -------------------------------------------------------------------
		$('.tip').cluetip({showtitle: false, arrows: true, splitTitle: '|'});			// standard tips showing "title" attribute (requires class "tip")
		$('.tipInclude').cluetip({attribute: 'rel', showtitle: false, arrows: true});	// external file or page indluded in tips (requires class "tipInclude")
		
		// tool tips on ALL links (disabled by default)
/*		
		$('a[title != ""]').each( function() {
			// don't apply to any links in the drop down menu
			if ( !$j(this).parents('.sf-menu').length ) {
				$j(this).cluetip({showtitle: false, arrows: true, splitTitle: '|'});		// tool tips on ALL links with "title" attributes (excludes main menu links)
			}
		});	
*/
});