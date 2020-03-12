
jQuery(document).ready(function() {
	
	var url = window.location.href;
	if (jQuery.cookie('unique_cookie_layout')!='block' && (url=='http://templates.persitheme.com/unique/home-1-block.html' || url=='home-2-block.html')) {
		alert('Please choose "block" from style-selector in the right side to see this page correctly >>>');
	}
	
	if (jQuery.cookie('unique_cookie_layout')== null) jQuery.cookie('unique_cookie_layout', 'boxed', { expires: 1, path: '/' });
	if (jQuery.cookie('unique_cookie_bar')== null) jQuery('#top-nav-container').animate({height:'auto'},'fast').delay(4000).animate({height:'5px'},'fast');
	jQuery('#style-selector').animate({right:0},'fast').delay(4000).animate({right:-285},'fast');
	
	jQuery('#style-selector select[name="bar"]').change(function() {
		var currentbar = jQuery(this).val();
		if (currentbar == 'off') {
			jQuery('#top-nav-container').css({'height':'5px'});
			jQuery.cookie('unique_cookie_bar', 'off', { expires: 1, path: '/' });
		} else {
			jQuery('#top-nav-container').css({'height':'auto'});
			jQuery.cookie('unique_cookie_bar', 'on', { expires: 1, path: '/' });
		}
	});
	
	jQuery('#style-selector select[name="info"]').change(function() {
		var currentinfo = jQuery(this).val();
		if (currentinfo == 'off') {
			jQuery('.top-information').hide('fast');
			jQuery.cookie('unique_cookie_info', 'off', { expires: 1, path: '/' });
		} else {
			jQuery('.top-information').show('fast');
			jQuery.cookie('unique_cookie_info', 'on', { expires: 1, path: '/' });
		}
	});
	
	jQuery('#style-selector select[name="layout"]').change(function() {
		var current = jQuery(this).val();
		if (current == 'block') {
			jQuery('.body-wrapper').css({'width':'auto', 'margin':'0 auto'});
			jQuery('#slogan .slogan-control').css({'left':'0'});
			jQuery('#menu-wrap, #slider-wrapper, #slogan-wrapper, #breadcrumb-wrapper').css({'width':'auto', 'margin-left':'auto', 'margin-right':'auto'});
			jQuery('#slogan').css({'width':'960px', 'margin-left':'auto', 'margin-right':'auto'});
			jQuery('#header-down').css({'padding':'0'});
			jQuery('#main').not('.main-transparent').css({'margin':'60px auto', 'padding':'60px 20px', 'border-radius':'20px'});
			jQuery('#main').not('.main-transparent').addClass('container_12').children('#sub-main').removeClass('container_12');
			jQuery('#header').css('background', 'none');
			jQuery('body').css('background-image', 'url(http://templates.persitheme.com/unique/images/pattern/pattern4.png)');
			jQuery.cookie('unique_cookie_layout', 'block', { expires: 1, path: '/' });
		} else if (current == 'boxed') {
			jQuery('.body-wrapper').css({'width':'1020px','margin':'50px auto'});
			jQuery('#slogan .slogan-control').css({'left':'10px'});
			jQuery('#header-down').css({'padding':'0 0 40px'});
			jQuery('#menu-wrap, #slider-wrapper, #slogan-wrapper, #slogan, #breadcrumb-wrapper').css({'width':'940px', 'margin-left':'auto', 'margin-right':'auto'});
			jQuery('#main').not('.main-transparent').css({'margin':'0 auto', 'padding':'40px 10px 60px', 'border-radius':'0'});
			jQuery('#main').not('.main-transparent').removeClass('container_12').children('#sub-main').addClass('container_12');
			jQuery('#header').css('background', 'url(http://templates.persitheme.com/unique/images/light-pattern.png)');
			jQuery('body').css('background-image', 'url(http://templates.persitheme.com/unique/images/pattern/pattern19.png)');
			jQuery.cookie('unique_cookie_layout', 'boxed', { expires: 1, path: '/' });
		} else if (current == 'wide') {
			jQuery('.body-wrapper').css({'width':'auto', 'margin':'0 auto'});
			jQuery('#slogan .slogan-control').css({'left':'0'});
			jQuery('#header-down').css({'padding':'0 0 40px'});
			jQuery('#menu-wrap, #slider-wrapper, #slogan-wrapper, #breadcrumb-wrapper').css({'width':'auto', 'margin-left':'auto', 'margin-right':'auto'});
			jQuery('#slogan').css({'width':'960px', 'margin-left':'auto', 'margin-right':'auto'});
			jQuery('#main').not('.main-transparent').css({'margin':'0 auto', 'padding':'40px 10px 60px', 'border-radius':'0'});
			jQuery('#main').not('.main-transparent').removeClass('container_12').children('#sub-main').addClass('container_12');
			jQuery('#header').css('background', 'url(http://templates.persitheme.com/unique/images/light-pattern.png)');
			jQuery('body').css('background-image', 'none');
			jQuery.cookie('unique_cookie_layout', 'wide', { expires: 1, path: '/' });
		}
	});
	
	jQuery('#style-selector-css').attr('href', jQuery.cookie('unique_cookie_css'));
	jQuery('#style-selector select[name="layout"]').val(jQuery.cookie('unique_cookie_layout')).trigger('change');
	jQuery('#style-selector select[name="bar"]').val(jQuery.cookie('unique_cookie_bar')).trigger('change');
	
	jQuery('#style-selector .style-toggle').click(function() {
		if (jQuery(this).hasClass("active")) {
			jQuery(this).parent().animate({right:-285},"fast");
			jQuery(this).removeClass("active").css("background-position","center top");
		} else {
			jQuery(this).parent().animate({right:0},"fast");
			jQuery(this).addClass("active").css("background-position","center bottom");
		}
	});

	jQuery('.reset').click(function(e) {
		e.preventDefault();
		jQuery('#style-selector-css').attr('href','');
		jQuery('#style-selector select[name="bar"]').val('off').trigger('change');
		jQuery('#style-selector select[name="layout"]').val('boxed').trigger('change');
		jQuery.cookie('unique_cookie_css', '', { expires: 1, path: '/' });
		jQuery.cookie('unique_cookie_layout', 'boxed', { expires: 1, path: '/' });
	});

	jQuery('.customs a').click(function(e) {
		e.preventDefault();
		jQuery(this).addClass('active').siblings().removeClass('active');

		var name = jQuery(this).attr('title');
		jQuery('#style-selector-css').attr('href','http://www.persitheme.com/themes/files/unique/'+name+'.css');
		jQuery.cookie('unique_cookie_css', jQuery("#style-selector-css").attr('href'), { expires: 1, path: '/' });
		
		if (name=='custom1') {
		jQuery('#style-selector select[name="bar"]').val('on').trigger('change');
		jQuery.cookie('unique_cookie_bar', 'on', { expires: 1, path: '/' });
		jQuery('#style-selector select[name="layout"]').val('block').trigger('change');
		jQuery.cookie('unique_cookie_layout', 'block', { expires: 1, path: '/' });
		} if (name=='custom2') {
		jQuery('#style-selector select[name="bar"]').val('on').trigger('change');
		jQuery.cookie('unique_cookie_bar', 'on', { expires: 1, path: '/' });
		jQuery('#style-selector select[name="layout"]').val('boxed').trigger('change');
		jQuery.cookie('unique_cookie_layout', 'boxed', { expires: 1, path: '/' });
		} if (name=='custom3') {
		jQuery('#style-selector select[name="bar"]').val('on').trigger('change');
		jQuery.cookie('unique_cookie_bar', 'on', { expires: 1, path: '/' });
		jQuery('#style-selector select[name="layout"]').val('boxed').trigger('change');
		jQuery.cookie('unique_cookie_layout', 'boxed', { expires: 1, path: '/' });
		}
	});

	jQuery('.skins a').click(function(e) {
		e.preventDefault();
		jQuery(this).addClass('active').siblings().removeClass('active');

		var name = jQuery(this).attr('title');
		jQuery('#style-selector-css').attr('href','http://templates.persitheme.com/unique/css/skins/'+name+'.css');
	
		jQuery.cookie('unique_cookie_css', jQuery("#style-selector-css").attr('href'), { expires: 1, path: '/' });
	});

	jQuery('.patterns a').click(function(e) {
		e.preventDefault();
		jQuery(this).addClass('active').siblings().removeClass('active');

		var name = jQuery(this).attr('title');
		if (name == 'nopattern') {
		jQuery('body').css('background-image', 'none');
		} else {
		jQuery('body').css('background-image', 'url(http://templates.persitheme.com/unique/wp-content/themes/unique/images/pattern/'+name+'.png)');
		}
		
	});
	
	/*if (jQuery('#style-selector-css').attr('href') == 'http://www.persitheme.com/themes/files/unique/custom2.css') jQuery('.blocks a[title="custom2"]').trigger('click');
	if (jQuery('#style-selector-css').attr('href') == 'http://www.persitheme.com/themes/files/unique/custom3.css') jQuery('.blocks a[title="custom3"]').trigger('click');*/
	
});