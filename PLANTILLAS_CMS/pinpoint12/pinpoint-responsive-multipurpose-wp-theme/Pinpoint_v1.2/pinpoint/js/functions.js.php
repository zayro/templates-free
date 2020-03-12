<?php
    
    header('Content-Type: text/javascript; charset=UTF-8');
    
    require_once('../../../../wp-load.php');
    
    $options = get_option('sf_pinpoint_options');
    
    $showcase_duration = $options['showcase_slide_duration'];
    $showcase_transition = $options['showcase_transition'];
    $showcase_transition_duration = $options['showcase_transition_duration'];
    $showcase_autoplay = $options['showcase_autoplay'];
	
    $use_custom_font_one = $options['use_custom_font_one'];
    $custom_font_one = explode(':', $options['standard_font']);
    $use_custom_font_two = $options['use_custom_font_two'];
    $custom_font_two = explode(':', $options['heading_font']);
    $use_custom_font_impact = $options['use_custom_font_impact'];
    $custom_font_impact = explode(':', $options['impact_font']);
    $custom_fonts = "";
    $google_font_one = str_replace("+", " ", $custom_font_one[0]);
    $google_font_two = str_replace("+", " ", $custom_font_two[0]);
    $google_font_impact = str_replace("+", " ", $custom_font_impact[0]);
        
    if ($use_custom_font_one) {
    	$custom_fonts .= "'".$google_font_one."', ";
    }
    if ($use_custom_font_two) {
    	$custom_fonts .= "'".$google_font_two."', ";
    }
    if ($use_custom_font_impact) {
    	$custom_fonts .= "'".$google_font_impact."', ";
    }
    
?>

/* ==================================================

Custom jQuery functions.

================================================== */

/////////////////////////////////////////////
// NO CONFLICT
/////////////////////////////////////////////

var $j = jQuery.noConflict();

var body = $j('body');

/////////////////////////////////////////////
// PAGE FUNCTIONS
/////////////////////////////////////////////

var page = {
	init: function () {
		
		if($j.browser.msie && (parseInt($j.browser.version, 10) <= 8)) {
			$j('body').addClass("browser-ie");
		}
	
		// FITVIDS
		$j('.portfolio-items,.blog-items,article.type-portfolio,article.type-post,article.type-team,.wpb_video_widget').fitVids();
		          
    	// FOOTER BEAM ME UP LINK
    	$j('.beam-me-up').on('click', 'a', function(e) {
    		e.preventDefault();
    		$j('body,html').animate({scrollTop: 0}, 800);
    	});
    	
    	// ROW FLUID MARGIN AMEND FOR LAST ITEM
    	$j('.row-fluid:last').css('margin-bottom', 0).css('border-bottom', 0);
    
    }
};


/////////////////////////////////////////////
// HEADER
/////////////////////////////////////////////

var menubarControls = $j('#menubar-controls'),
	headerSearchWrap = $j('#header-search'),
	headerSearch = headerSearchWrap.find('form input'),
	searchActivate = $j('#search-activate'),
	headerSubscribeWrap = $j('#header-subscribe'),
	headerSubscribe = headerSubscribeWrap.find('form input'),
	subscribeActivate = $j('#subscribe-activate'),
	headerTranslationWrap = $j('#header-translation'),
	translationActivate = $j('#translation-activate'),
    headerLoginWrap = $j('#header-login'),
    loginActivate = $j('#login-activate'),
    miniHeader = $j('#mini-header'),
    miniHeaderSearch = $j('#mini-search').find('input'),
    miniHeaderSearchLink = $j('.mini-search-link');
    
var header = {
    init: function() {
    	
    	header.miniHeaderInit();
		
        searchActivate.on('click', function(e) {
        	e.preventDefault();
            header.menuControlsActive(searchActivate);
        	header.hideAllAux();
        	if (!headerSearchWrap.is(':visible')) {
        		headerSearchWrap.slideToggle();
        		if (!$j.browser.msie) {
            	headerSearch.focus();
            	}
            	header.menuControlsActive(searchActivate);
            }
        });
	    
	    subscribeActivate.on('click', function(e) {
	    	e.preventDefault();
            header.menuControlsActive(subscribeActivate);
	    	header.hideAllAux();
	    	if (!headerSubscribeWrap.is(':visible')) {
        		headerSubscribeWrap.slideToggle();
        		if (!$j.browser.msie) {
            	headerSubscribe.focus();
            	}
            	header.menuControlsActive(subscribeActivate);
            }
        });
        
        translationActivate.on('click', function(e) {
        	e.preventDefault();
        	header.menuControlsActive(translationActivate);
        	header.hideAllAux();
        	if (!headerTranslationWrap.is(':visible')) {
        		headerTranslationWrap.slideToggle();
        		header.menuControlsActive(translationActivate);
        	}
        });
	    
	    loginActivate.on('click', function(e) {
	    	e.preventDefault();
	    	header.menuControlsActive(loginActivate);
	    	header.hideAllAux();
	    	if (!headerLoginWrap.is(':visible')) {
	    		headerLoginWrap.slideToggle();
	    		header.menuControlsActive(loginActivate);
	    	}
	    });
	    
	    miniHeaderSearchLink.on('click', function(e) {
	    	e.preventDefault();
	    	miniHeaderSearch.animate({
	    		width: 140
	    	}, 200);
	    	miniHeaderSearch.focus();
	    });
	    
	    miniHeaderSearch.blur(function() {
	        $j(this).animate({
	            width: 0
	        }, 200);
	    });
	    
	    $j(window).scroll(function() { 
	    	if (($j(this).scrollTop() > 250) && !body.hasClass('has-mini-header')) {
				header.miniHeaderShow();
			} else if (($j(this).scrollTop() < 200) && body.hasClass('has-mini-header')) {
				header.miniHeaderHide();
			}
		})
	    	            
    },
    hideAllAux: function() {
    	menubarControls.find('a').each( function() {
    		$j(this).removeClass('active');
    		$j(this).parent().removeClass('selected-item');
    	});
    	headerSearchWrap.slideUp();
    	headerSubscribeWrap.slideUp();
    	headerTranslationWrap.slideUp();
    	headerLoginWrap.slideUp();
    },
    menuControlsActive: function($button) {
    	if ($button.hasClass('active')) {
    		$button.removeClass('active');
    		$button.parent().removeClass('selected-item');
    	} else {
    		$button.addClass('active');
    		$button.parent().addClass('selected-item');
    	}
    },
    miniHeaderInit: function() {
    	
    	miniHeader.find('a[title="home"]').html('<i class="icon-home"></i>');
    },
    miniHeaderShow: function() {
    	body.addClass('has-mini-header');
		miniHeader.animate({
			"top": "0"
		}, 400);
    },
    miniHeaderHide: function() {
    	body.removeClass('has-mini-header');
    	miniHeader.animate({
    		"top": "-80"
    	}, 400);
    }
};


/////////////////////////////////////////////
// NAVIGATION
/////////////////////////////////////////////

var nav = {
    init: function(){
    
    	// Add parent class to items with sub-menus
		$j("ul.sub-menu").parent().addClass('parent');
		
		$j(".menu li.parent").hoverIntent({
			 over: function () {
				$j(this).find('ul.sub-menu:first').css("display", "block");
				var menuLeft = "10px";
				if ($j(this).find('ul.sub-menu:first').parent().parent().hasClass("sub-menu")) {
					menuLeft = $j(this).find('ul.sub-menu:first').parent().parent().outerWidth(true) - 2;
				}
				if ($j(this).parent().css("opacity") == 1) {
					$j(this).find('ul.sub-menu:first').stop().animate({
						"opacity": "1",
						"left": menuLeft
					}, 200);
				}
		   	},
			out: function () {
				$j(this).find('ul.sub-menu:first').stop().animate({
					"opacity": "0",
					"left": "-20px"
				}, 200);
				nav.hideNav($j(this).find('ul.sub-menu:first'));
			}
		});

		// MOBILE NAV
        var mobileSelect = $j('.dropdown-menu'),
        	selectedPageText = $j('.selected-option');

		selectedPageText.html(mobileSelect.find('option:selected').text());
		
        mobileSelect.change(function() {
            location = $j(this).find("option:selected").val();
        });
        
        // Prevent #'s being added to the address bar
        $j('nav .menu li').on('click', 'a', function(e) {
        	if ($j(this).attr('href') == "#") {
        		e.preventDefault();
        	}
        });
    	
    },
    hideNav: function(subnav) {
    	setTimeout(function() {
    		if (subnav.css("opacity") == "0") {
    			subnav.css("display", "none");
    		}
    	}, 300);
    }
};


/////////////////////////////////////////////
// FLEXSLIDER FUNCTION
/////////////////////////////////////////////

var slider = {
    init: function() {
    	$j('.flexslider').flexslider({
    		<?php if ($showcase_transition) { ?>
	    	animation: "<?php echo $showcase_transition; ?>",              //String: Select your animation type, "fade" or "slide"
	    	<?php } ?>
	    	slideDirection: "horizontal",   //String: Select the sliding direction, "horizontal" or "vertical"
	    	<?php if ($showcase_autoplay) {?>
	    	slideshow: true,	//Boolean: Animate slider automatically
	    	<?php } else { ?>
	    	slideshow: false,	//Boolean: Animate slider automatically
	    	<?php } ?>
	    	<?php if ($showcase_duration) { ?>
	    	slideshowSpeed: <?php echo $showcase_duration; ?>,           //Integer: Set the speed of the slideshow cycling, in milliseconds
	    	<?php } ?>
	    	<?php if ($showcase_transition_duration) { ?>
	    	animationDuration: <?php echo $showcase_transition_duration; ?>,         //Integer: Set the speed of animations, in milliseconds
	    	<?php } ?>
	    	directionNav: true,             //Boolean: Create navigation for previous/next navigation? (true/false)
	    	controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
	    	keyboardNav: true,              //Boolean: Allow slider navigating via keyboard left/right keys
	    	mousewheel: false,              //Boolean: Allow slider navigating via mousewheel
	    	prevText: "Prev",           //String: Set the text for the "previous" directionNav item
	    	nextText: "Next",               //String: Set the text for the "next" directionNav item
	    	pausePlay: true,               //Boolean: Create pause/play dynamic element
	    	pauseText: '',             //String: Set the text for the "pause" pausePlay item
	    	playText: '',               //String: Set the text for the "play" pausePlay item
	    	randomize: false,               //Boolean: Randomize slide order
	    	slideToStart: 0,                //Integer: The slide that the slider should start on. Array notation (0 = first slide)
	    	animationLoop: true,            //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
	    	pauseOnAction: true,            //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
	    	pauseOnHover: false,            //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
	    	controlsContainer: "",          //Selector: Declare which container the navigation elements should be appended too. Default container is the flexSlider element. Example use would be ".flexslider-container", "#container", etc. If the given element is not found, the default action will be taken.
	    	manualControls: "",             //Selector: Declare custom control navigation. Example would be ".flex-control-nav li" or "#tabs-nav li img", etc. The number of elements in your controlNav should match the number of slides/tabs.
	    	start: function(){},            //Callback: function(slider) - Fires when the slider loads the first slide
	    	before: function(){},           //Callback: function(slider) - Fires asynchronously with each slider animation
	    	after: function(){},            //Callback: function(slider) - Fires after each slider animation completes
	    	end: function(){}               //Callback: function(slider) - Fires when the slider reaches the last slide (asynchronous)
    	});
    }
}

/////////////////////////////////////////////
// PORTFOLIO
/////////////////////////////////////////////

var portfolioContainer = $j('.portfolio-wrap').find('.filterable-items');

var portfolio = {
    init: function() {
        
        if (portfolioContainer.hasClass('masonry-items')) {
        	portfolio.masonrySetup();
        } else {
        	portfolio.standardSetup();
        }
        
        // SET ITEM HEIGHTS
        portfolio.setItemHeight();
        
        // PORTFOLIO WINDOW RESIZE
        $j(window).smartresize(function(e){  
        		portfolio.windowResized();
        });
        
        var filterWrap = $j('.filter-wrap'),
        	portfolioFilter = $j('#portfolio-filter');
                
        // Enable filter options on when there are items from that skill
        $j('.filtering li').each( function() {
        	var filter = $j(this),
        		filterName = $j(this).find('a').attr('class'),
        		portfolioItems = $j('.filterable-items');
        	portfolioItems.find('li').each( function() {
        		if ( $j(this).hasClass(filterName) ) {
        			filter.addClass('has-items');
        		}
        	});
        });

        // filter items when filter link is clicked
        $j('.filtering li').on('click', 'a', function() {
            $j('.filtering li').removeClass('selected');
            $j(this).parent().addClass('selected');
            var selector = $j(this).attr('data-filter');
            var portfolioItems = $j('.filterable-items');
            portfolioItems.isotope({ filter: selector });
            portfolioFilter.slideUp(400);
            return false;
        });
                        
        filterWrap.on('click', function(e) {
        	portfolioFilter.css( 'top', (filterWrap.outerHeight() - 2) + 'px' );
        	portfolioFilter.slideToggle(400);
        	if (filterWrap.hasClass('down')) {
	        	filterWrap.removeClass('down');
        	} else {
        		filterWrap.addClass('down');
        	}
        });        
    },
    masonrySetup: function() {
    	portfolioContainer.isotope({
    		itemSelector : '.portfolio-item',
    		masonry : {
    			columnWidth : 0
    		},
    		animationEngine: 'best-available',
    		animationOptions: {
    		    duration: 300,
    		    easing: 'easeInOutQuad',
    		    queue: false
    		},
    		resizable: true
    	});
    },
    standardSetup: function() {
    	portfolioContainer.isotope({
    	    animationEngine: 'best-available',
    	    animationOptions: {
    	        duration: 300,
    	        easing: 'easeInOutQuad',
    	        queue: false
    	    },
    	    resizable: true,
    	    layoutMode: 'fitRows'
    	});
    },
    setItemHeight: function() {
    	if (!portfolioContainer.hasClass('masonry-items')) {
	    	portfolioContainer.children().css('min-height','0');
	    	portfolioContainer.equalHeights();
    	}
    },
    windowResized: function() {
    	portfolio.setItemHeight();
    }
}


/////////////////////////////////////////////
// BLOG
/////////////////////////////////////////////

var blogItems = $j('.blog-wrap').find('.blog-items');

var blog = {
    init: function() {
    
        if (blogItems.hasClass('masonry-items')) {
	    	blog.masonrySetup();        
        }

    },
    masonrySetup: function() {
    	blogItems.isotope({
    		itemSelector : '.blog-item',
    		masonry : {
    			columnWidth : 0
    		},
    		animationEngine: 'best-available',
    		animationOptions: {
    		    duration: 300,
    		    easing: 'easeInOutQuad',
    		    queue: false
    		},
    		transformsEnabled: false,
    		resizable: true
    	});
    }	
}


/////////////////////////////////////////////
// CAROUSEL FUNCTIONS
/////////////////////////////////////////////

var carouselWidgets = {
    init: function() {

		carouselWidgets.windowResized();
		
		// CAROUSELS
		var carouselWrap = $j('.carousel-wrap'),
			carousel = carouselWrap.find('.carousel-items');
	
		carousel.jcarousel({
			scroll: 1,
			wrap: 'circular',
	        buttonNextHTML: '<i class="icon-chevron-right"></i>',
	        buttonPrevHTML: '<i class="icon-chevron-left"></i>'
		});
		
		$j(window).smartresize(function(e){  
				carouselWidgets.windowResized();
		});
	},
	windowResized: function() {
		var testimonialCarousel = $j('.wpb_testimonial_carousel_widget');
		
		testimonialCarousel.find('li').each(function() {
			$j(this).css("width", testimonialCarousel.width());
		});
	}
}


/////////////////////////////////////////////
// WIDGET FUNCTIONS
/////////////////////////////////////////////

var widgets = {
    init: function() {
       	
    	// TEAM MEMBER BIOS
    	
    	var teamMemberWidget = $j('.wpb_team_carousel_widget'),
    		teamMembers = teamMemberWidget.find('.team-members'),
    		bioShowHide = teamMemberWidget.find('.show-hide-bios');
    	
    	bioShowHide.on('click', function(e) {
    		e.preventDefault();
    		teamMembers.find('.team-member-details-wrap').each(function() {
    			$j(this).slideToggle();
    		});
    		if (bioShowHide.hasClass('open')) {
    			bioShowHide.removeClass('open');
    			bioShowHide.addClass('closed');
    			bioShowHide.text(bioShowHide.attr('data-show'));
    		} else {
    			bioShowHide.removeClass('closed');
    			bioShowHide.addClass('open');
    			bioShowHide.text(bioShowHide.attr('data-hide'));
    		}
    	});    	
    
    }
}


/////////////////////////////////////////////
// FANCYBOX FUNCTION
/////////////////////////////////////////////

var fancybox = {
    init: function() {
    	$j('.fancybox-media').fancybox({
    		margin: 50,
			helpers : {
				media : {}
			}
		});
		$j('.zoom').fancybox({
			margin: 50
		});
    }
};


/////////////////////////////////////////////
// MAP FUNCTIONS
/////////////////////////////////////////////

var map = {
    init:function() {
    	var mapContainer = document.getElementById("map-canvas");
    		mapAddress = mapContainer.getAttribute('data-address'),
    		mapLat = mapContainer.getAttribute('data-lat'),
    		mapLong = mapContainer.getAttribute('data-long'),
    		mapZoom = mapContainer.getAttribute('data-zoom'),
    		mapType = mapContainer.getAttribute('data-maptype'),
    		pinLogoURL = mapContainer.getAttribute('data-pinimage'),
    		mapTypeIdentifier = "";
    	
    	if (mapType == "satellite") {
    	mapTypeIdentifier = google.maps.MapTypeId.SATELLITE
    	} else if (mapType == "terrain") {
    	mapTypeIdentifier = google.maps.MapTypeId.TERRAIN
    	} else if (mapType == "hybrid") {
    	mapTypeIdentifier = google.maps.MapTypeId.HYBRID
    	} else {
    	mapTypeIdentifier = google.maps.MapTypeId.ROADMAP
    	}
    			
		var latlng = new google.maps.LatLng(mapLat, mapLong);
		var settings = {
			zoom: parseInt(mapZoom),
			center: latlng,
			mapTypeControl: true,
			mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
			navigationControl: true,
			navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
			mapTypeId: mapTypeIdentifier
		}
		var map = new google.maps.Map(mapContainer, settings);
		if (pinLogoURL) {
		var companyLogo = new google.maps.MarkerImage(pinLogoURL,
			new google.maps.Size(150,75),
			new google.maps.Point(0,0),
			new google.maps.Point(75,75)
		);
		var companyPos = new google.maps.LatLng(mapLat, mapLong);
		var companyMarker = new google.maps.Marker({
			position: companyPos,
			map: map,
			icon: companyLogo
		});
		} else { 
		var companyPos = new google.maps.LatLng(mapLat, mapLong);
		var companyMarker = new google.maps.Marker({
			position: companyPos,
			map: map,
		});
		}
		google.maps.event.addListener(companyMarker, 'click', function() {
		    window.location.href = 'http://maps.google.com/maps?q='+mapAddress;
		});
    }
};


/////////////////////////////////////////////
// NAV ARROW INDICATOR FUNCTION
/////////////////////////////////////////////

var navArrow = {
    init:function() {
		var navSection = $j("#nav-section");
		var mainNav = $j("#main-navigation");    
		mainNav.append("<div id='nav-pointer'></div>");
		var magicLine = $j("#nav-pointer");
		
		currentMenuItem	= mainNav.find('>div>ul>.current-menu-item, >div>ul>.current_page_item');
		if(!currentMenuItem.length){ currentMenuItem = mainNav.find('.current-menu-ancestor:eq(0), .current_page_ancestor:eq(0)'); }
		
		if (navSection.hasClass('nav-indicator') && currentMenuItem.length > 0) {
		    
		    magicLine
		        .css("left", (currentMenuItem.position().left + (currentMenuItem.width() / 2) - 6))
		        .data("origLeft", magicLine.position().left);
		        
		    $j("#main-navigation > div > ul > li").hover(function() {
		        hoverMenuItem = $j(this).find('a');
		        leftPos = (hoverMenuItem.parent().position().left + (hoverMenuItem.width() / 2) + 6);
		        magicLine.stop().animate({
		            left: leftPos
		        });
		    }, function() {
		        magicLine.stop().animate({
		            left: magicLine.data("origLeft")
		        });    
		    });
		
		} else {
		
			magicLine.hide();
		
		}
	}
}


/////////////////////////////////////////////
// RELOAD FUNCTIONS
/////////////////////////////////////////////

var reloadFunctions = {
    init:function() {

        // Remove title attributes from images to avoid showing on hover 
        $j('img[title]').each(function() {
            $j(this).removeAttr('title');
        });

        // Tabs Shortcode Function
        $j('.tabbed-asset').tabs();
        
        // Accordion Shortcode Function
        $j('.accordion').accordion({
            collapsible: true,
            autoHeight: false
        });
        
        // Button hover tooltips
        $j('.tooltip').each( function() {
        	$j(this).css( 'marginLeft', '-' + Math.round( ($j(this).outerWidth(true) / 2) ) + 'px' );
        });
        
        $j('.comment-avatar').hover( function() {
        	$j(this).find('.tooltip' ).stop().animate({
        		bottom: '44px',
        		opacity: 1
        	}, 500, 'easeInOutExpo');
        }, function() {
        		$j(this).find('.tooltip').stop().animate({
        			bottom: '25px',
        			opacity: 0
        		}, 500, 'easeInOutExpo');
        });
        
        $j('.control-item').hover( function() {
        	$j(this).find('.tooltip' ).stop().animate({
        		bottom: '36px',
        		opacity: 1
        	}, 400, 'easeInOutExpo');
        }, function() {
    		$j(this).find('.tooltip').stop().animate({
    			bottom: '25px',
    			opacity: 0
    		}, 200, 'easeInOutExpo');
        });
        
        // Animate Top Links
        $j('.animate-top').on('click', function(e) {
        	e.preventDefault();
            $j('body,html').animate({scrollTop: 0}, 800);           
        });
    }
}


/////////////////////////////////////////////
// LOAD + READY FUNCTION
/////////////////////////////////////////////

var sfIncluded = $j('#sf-included');

var onReady = {
    init: function(){
        page.init();
        header.init();
        nav.init();
        slider.init();
        widgets.init();
        fancybox.init();
        if (sfIncluded.hasClass('has-carousel')) {
        carouselWidgets.init();
        }
        if (sfIncluded.hasClass('has-map')) {
        map.init();
        }
        reloadFunctions.init();
    }
};
var onLoad = {
    init: function(){
    	if (sfIncluded.hasClass('has-portfolio')) {
        portfolio.init();
        }
        if (sfIncluded.hasClass('has-blog')) {
        blog.init();
        }
        navArrow.init();
    }
};

$j(document).ready(onReady.init);
$j(window).load(onLoad.init);

/////////////////////////////////////////////
// GOOGLE WEB FONT FUNCTION
/////////////////////////////////////////////

WebFontConfig = {
    google: { families: [<?php echo $custom_fonts; ?>'Vidaloka'] }
};

(function() {
	document.getElementsByTagName("html")[0].setAttribute("class","wf-loading")
	//  NEEDED to push the wf-loading class to your head
	document.getElementsByTagName("html")[0].setAttribute("className","wf-loading")
	// for IE…
	
	var wf = document.createElement('script');
	wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
	 '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
	wf.type = 'text/javascript';
	wf.async = 'false';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(wf, s);
})();


/////////////////////////////////////////////
// SMARTRESIZE PLUGIN
/////////////////////////////////////////////

(function($,sr){
 
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;
 
      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null; 
          };
 
          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);
 
          timeout = setTimeout(delayed, threshold || 100); 
      };
  }
	// smartresize 
	$j.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };
 
})(jQuery,'smartresize');


/////////////////////////////////////////////
// EQUALHEIGHTS PLUGIN
/////////////////////////////////////////////

(function($) {
	$.fn.equalHeights = function(px) {
		$(this).each(function(){
			var currentTallest = 0;
			$(this).children().each(function(i){
				if ($(this).height() > currentTallest) { currentTallest = $(this).height(); }
			});
	    if (!px && Number.prototype.pxToEm) currentTallest = currentTallest.pxToEm(); //use ems unless px is specified
			// for ie6, set height since min-height isn't supported
			if ($.browser.msie && $.browser.version == 6.0) { $(this).children().css({'height': currentTallest}); }
			$(this).children().css({'min-height': currentTallest}); 
		});
		return this;
	};
})(jQuery);


/////////////////////////////////////////////
// IE PLACEHOLDER FIX
/////////////////////////////////////////////

(function($) {
	var input = document.createElement("input");
    if(('placeholder' in input)==false) { 
		$('[placeholder]').focus(function() {
			var i = $(this);
			if(i.val() == i.attr('placeholder')) {
				i.val('').removeClass('placeholder');
				if(i.hasClass('password')) {
					i.removeClass('password');
					this.type='password';
				}			
			}
		}).blur(function() {
			var i = $(this);	
			if(i.val() == '' || i.val() == i.attr('placeholder')) {
				if(this.type=='password') {
					i.addClass('password');
					this.type='text';
				}
				i.addClass('placeholder').val(i.attr('placeholder'));
			}
		}).blur().parents('form').submit(function() {
			$(this).find('[placeholder]').each(function() {
				var i = $(this);
				if(i.val() == i.attr('placeholder'))
					i.val('');
			})
		});
	}
})(jQuery);