
/* 
/*	The following code is being included only to make special features work in the online demo. 
/*	This includes things like the skin changer and other not theme related items. You do not 
/*	need to have this file in your production website.
*/

//
// Load after the page is completed
// --------------------------------

$j(document).ready(function($) {
	
	// theme changer 
	// -------------------------------------------------------------------
	
	if ($('#SkinPreview').length > 0) {
		$('#SkinPreview').cycle({ 
			fx: 'scrollHorz',
			speed: 600,
			randomizeEffects: false, 
			easing: 'easeOutCubic',
			timeout: 0 
		});
		
		var skinCnt = 5;	// total skins available
		$(function() {
	
			$("#SkinSlider").slider({
				value:	$.cookie("skin") || Math.ceil(skinCnt/2),
				min:	1,
				max:	skinCnt,
				step:	1,
				slide: function(event, ui) {
					$('#SkinPreview').cycle(parseInt(ui.value-1));
				},
				stop: function(event, ui) {
					if (skin != ui.value) {
						// change skin and reload page
						switchSkin(ui.value);
					}
				}
			});
		
		});
		
		var currentSkinNo = $("#SkinSlider").slider("value");
		$('#SkinPreview').cycle(parseInt( currentSkinNo - 1 ));
	}


	// prevent demo links using placeholder href="#" from jumping to top
	$("a[href='#']").click( function(){
		return false;
	});	
	
	
});



/**
 * Cookie plugin
 *
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};


//
// Skin switch function
// ---------------------------
function switchSkin(skin) {
	$j.cookie("skin", skin);
	document.location.reload(true);
}

//
// Include skin style sheet 
// (only necessary if using dynamic skin switching)
// ----------------------------------------------------
	var skin = $j.cookie("skin") || "1";
	var skinCSS = document.getElementById('SkinCSS');
	var last = skinCSS.href.lastIndexOf('/') + 1;
	var cssPath = skinCSS.href.substring(0,last);
	var fileName = "skin-"; //"style-skin-";
	if ($j.cookie("skin")) {
		skinCSS.href = cssPath + fileName + skin + ".css";
	}
	
	var setBySkin = false; // used to track Cufon being set in this file (so onLoad knows what to do)	
		
	// cufon - skin specific styling
	switch(parseInt(skin)) {
		case 2:
			Cufon.replace
				('h1, h2, h3, h4, h5, h6, #fancybox-title-main')
				('#MainMenu a.isMenuItem', {
				hover: true, textShadow: '-1px -1px rgba(0, 0, 0, 1)'})
				('.headline, .title:not(.isMenuItem), .smallTitle, .blogPostHeader h1, .blogDate, .blogPostInfo', {
				hover: true, textShadow: '-1px -1px rgba(0, 0, 0, 1)'});
			setBySkin = true;
			break;
		case 3:
			Cufon.replace
				('h1, h2, h3, h4, h5, h6, #fancybox-title-main')
				('#MainMenu a.isMenuItem', {
				hover: true, textShadow: '-1px -1px rgba(178, 117, 30, 0.8)'})
				('.headline, .title:not(.isMenuItem), .smallTitle, .blogPostHeader h1, .blogDate, .blogPostInfo', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 1)'})
				('.alternate .pageTitle', {
				hover: true, textShadow: '-1px -1px rgba(0, 0, 0, 0.5)'});
			setBySkin = true;
			break;
		case 4:
			Cufon.replace
				('h1, h2, h3, h4, h5, h6, #fancybox-title-main')
				('#MainMenu a.isMenuItem', {
				hover: true, textShadow: '-1px -1px rgba(4, 98, 122, 0.8)'})
				('.headline, .title:not(.isMenuItem), .smallTitle, .blogPostHeader h1, .blogDate, .blogPostInfo', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 1)'})
				('.alternate .pageTitle', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 0.5)'});
			setBySkin = true;
			break;
		case 5:
			Cufon.replace
				('h1, h2, h3, h4, h5, h6, #fancybox-title-main')
				('#MainMenu a.isMenuItem', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 1)'})
				('.headline, .title:not(.isMenuItem), .smallTitle, .blogPostHeader h1, .blogDate, .blogPostInfo', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 1)'})
				('.alternate .pageTitle', {
				hover: true, textShadow: '1px 1px rgba(255, 255, 255, 0.5)'});
			setBySkin = true;
			break;
		default: // do nothing, this is handled by onLoad.js
	}


