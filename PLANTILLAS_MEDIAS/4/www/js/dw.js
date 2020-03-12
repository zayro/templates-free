$( function()
{
	var config =
	{
		// list of elements that will expand functionality afetr add class js
		jsdepend: '#services, ul.tabs-nav',
		// list of element containing cloudy tooltips
		tooltips: 'ul#social li, ul.portfolio li, div.social ul li, div.image',
		// list of inputs/textareas with default text
		formtips: '#search input[name="search"]',
		// list of elements containing drop down menu
		dropdown: 'ul#nav li',
		// speed of drop down sliding
		dropdown_scroll: 500,
		// speed of services scrolling
		services_scroll: 700,
		// speed of tweets scrolling
		tweets_scroll: 500,
		// slider scrolling speed
		slider_scroll: 500,
		// lists of 'a' elements containing image, using ibox (lightbox) gallery
		ibox: 'ul.portfolio > li > a'
	};
	
	var cache =
	{
		services:
		{
			odd: false,
			width: 0
		},
		
		tweets:
		{
			width: 0
		},
		
		page_tabs:
		{
			current: null
		},
		
		slider:
		{
			items: 0,
			width: 0,
			total_width: 0
		}
	};

	$(config.jsdepend).addClass('js');
	
	// TOOLTIPS BEGIN
	
	$(config.tooltips).css('z-index', 99999);
	
	$(config.tooltips).hover( function(event)
	{
		$tooltip = $(this).children('div.tooltip');
		$tooltip.show();
	}, function()
	{
		$tooltip = $(this).children('div.tooltip');
		$tooltip.hide();
	});
	
	$(config.tooltips).mousemove( function(event)
	{
		$this = $(this);
		$tooltip = $(this).children('div.tooltip');
		
		$tooltip.css
		({
			'top': event.pageY - $this.offset().top + 20,
			'left': event.pageX - $this.offset().left - $tooltip.width() + 10
		});
	});
	
	//TOOLTIPS END
	
	// FORMTIPS BEGIN
	
	$(config.formtips).each( function()
	{
		$(this).data('tip', $(this).val());
	});

	$(config.formtips).focus( function()
	{
		if ($(this).val() == $(this).data('tip'))
		{
			$(this).val('');
		}
	});
		
	$(config.formtips).blur( function()
	{
		if ($(this).val() == '')
		{
			$(this).val($(this).data('tip'));
		}
	});
	
	// FORMTIPS END
	
	// FROM VALIDATION BEGIN
	
	function is_valid_email(email)
	{
		return /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email);
	}

	$('#name,#message').blur( function()
	{
		$(this).removeClass('valid');
		
		if ($(this).val() == '')
		{
			$(this).addClass('error');
		} else
		{
			$(this).removeClass('error').addClass('valid');
		}
	});
	
	$('#email').blur( function()
	{
		$(this).removeClass('valid');
		
		if ( ! is_valid_email($(this).val()))
		{
			$(this).addClass('error');
		} else
		{
			$(this).removeClass('error').addClass('valid');
		}
	});
	
	$('#comment #submit').click( function()
	{
		$('#name,#message,#email').blur();

		if ($('#comment input.error').length > 0)
		{
			return false;
		}
	});
	
	// FROM VALIDATION END
	
	// DROPDOWN MENU
	
	$(config.dropdown).hover( function()
	{
		$(this).children('ul').not(':animated').slideDown(config.dropdown_slide);
	}, function()
	{
		$(this).children('ul').slideUp(config.dropdown_slide);
	});
	
	// DROPDOWN MENU
	
	// SERVICES NAVIGATION BEGIN
	
	$srv = $('div#services ul.items');
	$srv_items = $srv.children('li');
	
	$srv_nav_prev = $('<li />').
		addClass('prev').
		append($('<a />').
	text('Previous'));
	
	$srv_nav_next = $('<li />').
		addClass('next').
		append($('<a />').
	text('Next'));
	
	$srv_nav = $('<ul />').
		addClass('nav').
		css('margin-top', $srv.height()).
		append($srv_nav_prev).
	append($srv_nav_next);
	
	$srv.after($srv_nav);
	
	$srv.
		css('position', 'absolute').
		css('left', 0).
		parent().
	css('position', 'relative');
	
	cache.services.width = ($srv_items.length - 2) * $srv_items.outerWidth(true);
	cache.services.odd = false;
	
	$srv_nav_prev.click( function()
	{
		var scroll = $srv.parent().width();

		if ($srv.position().left < 0)
		{
			cache.services.odd = ! cache.services.odd;
			
			$srv.not(':animated').animate
			({
				'left': '+=' + scroll
			}, config.services_scroll);
		}
		
		return false;
	});
	
	$srv_nav_next.click( function()
	{
		var scroll = $srv.parent().width();
		
		if ($srv.position().left > -cache.services.width)
		{
			cache.services.odd = ! cache.services.odd;
			
			$srv.not(':animated').animate
			({
				'left': '-=' + scroll
			}, config.services_scroll);
		}
		
		return false;
	});
	
	// TWEETS NAVIGATION BEGIN
	
	$tweets = $('div.tweets ul');
	$tweets_items = $tweets.children('li');
	
	$tweets_nav_prev = $('<li />').
		addClass('prev').
		append($('<a />').
	text('Previous'));
	
	$tweets_nav_next = $('<li />').
		addClass('next').
		append($('<a />').
	text('Next'));
	
	$tweets_nav = $('<ul />').
		addClass('nav').
		append($tweets_nav_prev).
	append($tweets_nav_next);
	
	$tweets.parent().after($tweets_nav);
	
	$tweets.
		css('position', 'absolute').
		parent().
	css
	({
		'position': 'relative',
		'height': $tweets_items.height()
	});
	
	cache.tweets.width = ($tweets_items.length - 2) * $tweets_items.outerWidth(true);
	
	$tweets_nav_prev.click( function()
	{
		var scroll = $tweets_items.outerWidth(true);

		if ($tweets.position().left < 0)
		{
			$tweets.not(':animated').animate
			({
				'left': '+=' + scroll
			}, config.tweets_scroll);
		}
		
		return false;
	});
	
	$tweets_nav_next.click( function()
	{
		var scroll = $tweets_items.outerWidth(true);

		if ($tweets.position().left > -cache.tweets.width)
		{
			$tweets.not(':animated').animate
			({
				'left': '-=' + scroll
			}, config.tweets_scroll);
		}
		
		return false;
	});
	
	// TWEETS NAVIGATION END
	
	// PAGE TABS BEGIN
	
	$page_tabs = $('ul.tabs-nav > li');
	$page_content = $('ul.tabs-content > li');
	
	cache.page_tabs.current = $page_tabs.index($page_tabs.filter('.current'));
	
	if (cache.page_tabs.current == -1)
	{
		cache.page_tabs.current = 0;
	}
		
	$page_content.hide().eq(cache.page_tabs.current).show();
	
	$page_tabs.click( function()
	{
		cache.page_tabs.current = $page_tabs.index(this);
		
		$page_content.hide().eq(cache.page_tabs.current).show();
		$page_tabs.removeClass('current');
		$(this).addClass('current');
		
		return false;
	});
	
	// PAGE TABS END
	
	// WANNABE BOX BEGIN
	
	$.fn.ibox = function(config)
	{
		config = $.extend
		({
			fade_in: 1000,
			fade_out: 500,
			resize: 1000,
			button_label: '',
			button_link: '',
			wrapper: 'ibox-wrapper',
			id: 'ibox',
			loading: 'Loading...',
			close: 'Close'
		}, config);
		
		position = function()
		{
			$('#' + config.wrapper).css
			({
				'top': $(window).scrollTop(),
				'left': $(window).scrollLeft()
			});
				
			$('#' + config.id).css
			({
				'top': $(window).scrollTop() + $(window).height()/2 - $('#' + config.id).outerHeight()/2,
				'left': $(window).scrollLeft() + $(window).width()/2 - $('#' + config.id).outerWidth()/2
			});
		};
		
		resize = function(width, height)
		{
			$('#' + config.id).css
			({
				'top': $(window).scrollTop() + $(window).height()/2 - $('#' + config.id).outerHeight()/2,
				'left': $(window).scrollLeft() + $(window).width()/2 - $('#' + config.id).outerWidth()/2
			});
		};
		
		$group = $(this);
		
		$group.click( function()
		{
			$this = $(this);
			$images = $group.find('img');
			index = $group.index(this);
			image = $this.attr('href');
			label = $this.children('img').attr('alt');
			
			$wrapper = $('<div />').attr('id', config.wrapper).hide();
				
			$wrapper.css
			({
				'background': '#000',
				'position': 'absolute',
				'width': $(window).width(),
				'height': $(window).height(),
				'z-index': 1337,
				'opacity': 0
			});
				
			$wrapper.click( function(event)
			{
				$(this).fadeOut(config.fade_out, function()
				{
					$(this).remove();
				});
				
				$('#' + config.id).fadeOut(config.fade_out, function()
				{
					$(this).remove();
				});
				
				event.preventDefault();
				
				return false;
			});
				
			$wrapper.appendTo('body').show().fadeTo(1000, 0.7);
			
			$(window).scroll( function()
			{
				position();
			});
				
			$(window).resize( function()
			{
				position();
			});
				
			$box = $('<div />').attr('id', config.id);
			
			$box.css
			({
				'z-index': 1338,
				'position': 'absolute'
			});
			
			$box.append
			(
				$('<h2 />').
				text(config.loading)
			).append
			(
				$('<ul />')
				.addClass('items')
				.css
				({
					'position': 'relative',
					'width': 40,
					'height': 40
				})
			).append
			(
				$('<a />')
					.addClass('close')
					.attr('href', '#close')
					.text(config.close)
					.hide()
				.click( function(event)
				{
					$('#' + config.wrapper).fadeOut(config.fade_out, function()
					{
						$(this).remove();
					});
						
					$('#' + config.id).fadeOut(config.fade_out, function()
					{
						$(this).remove();
					});
						
					event.preventDefault();
						
					return false;
				})
			);
						
			$group.each( function()
			{
				$item = $(this);
				$image = $(this).children('img');
				image = $(this).attr('href');
				label = $image.attr('alt');
				item_index = $group.index($item);
				
				$box.children('ul.items').append
				(
					$('<li />').append
					(
						$('<img />').data('index', item_index).attr('alt', label).load( function()
						{
							$img = $(this);
							
							if ($img.data('index') == index)
							{
								$img.parent('li').show().css('opacity', 0.01);

								$box.children('ul.items').animate
								({
									'width': $img.outerWidth(),
									'height': $img.outerHeight()
								},
								{
									duration: config.resize,
									step: function()
									{
										$box.css
										({
											'top': $(window).scrollTop() + $(window).height()/2 - $box.outerHeight()/2,
											'left': $(window).scrollLeft() + $(window).width()/2 - $box.outerWidth()/2
										});
									},
									complete: function()
									{
										$img = $(this).children('li:visible').children('img');
										
										$(this).prev('h2').text($img.attr('alt'));
										$(this).children('li').eq($img.data('index')).fadeTo(config.fade_in, 1.0);
										$box.children('a.close').fadeIn(config.fade_in);
										$box.children('a.more').fadeTo(config.fade_in, 1.0);
										$box.children('ul.nav').fadeTo(config.fade_in, 1.0);
									}
								});
							} else
							{
								$img.parent('li').hide();
							}
						}).attr('src', image + '?' + (new Date()).getTime())
					).css
					({
						'position': 'absolute'
					}).hide()
				);
			});
					
			if ($images.length > 0)
			{
				$box.children('ul.items').after
				(
					$('<ul />')
						.addClass('nav')
						.css('opacity', 0.01)
					.append
					(
						$('<li />')
							.addClass('prev')
						.append
						(
							$('<a />')
								.attr('href', '#prev')
							.click( function(event)
							{
								$item = $box.children('ul.items').children('li');
								var current = $item.index($box.children('ul.items').children('li:visible'));
								var prev = current-1;
									
								if (prev < 0)
								{
									prev = $item.length-1;
								}
								
								$item.eq(current).fadeOut(config.fade_out);
								$item.eq(prev).show().css('opacity', 0.01);
								$img = $item.eq(prev).children('img');
								$box.children('h2').text(config.loading);
								$box.children('a.close').fadeOut(config.fade_out);
								$box.children('a.more').fadeTo(config.fade_out, 0.01);
								$box.children('ul.nav').fadeTo(config.fade_out, 0.01);
								
								$box.children('ul.items').animate
								({
									'width': $img.outerWidth(),
									'height': $img.outerHeight()
								},
								{
									duration: config.resize,
									step: function()
									{
										$box.css
										({
											'top': $(window).scrollTop() + $(window).height()/2 - $box.outerHeight()/2,
											'left': $(window).scrollLeft() + $(window).width()/2 - $box.outerWidth()/2
										});
									},
									
									complete: function()
									{
										$img = $(this).children('li:visible').children('img');
										
										$(this).prev('h2').text($img.attr('alt'));
										$(this).children('li').eq(prev).fadeTo(config.fade_in, 1.0);
										$box.children('a.close').fadeIn(config.fade_in);
										$box.children('a.more').fadeTo(config.fade_in, 1.0);
										$box.children('ul.nav').fadeTo(config.fade_in, 1.0);
									}
								});
								
								event.preventDefault();
								return false;
							})
						)
					).append
					(
						$('<li />')
							.addClass('next')
						.append
						(
							$('<a />')
								.attr('href', '#next')
							.click( function(event)
							{
								$item = $box.children('ul.items').children('li');
								var current = $item.index($box.children('ul.items').children('li:visible'));
								var next = current+1;
								
								if (next > $item.length-1)
								{
									next = 0;
								}
								
								$item.eq(current).fadeOut(config.fade_out);
								$item.eq(next).show().css('opacity', 0.01);
								$img = $item.eq(next).children('img');
								$box.children('h2').text(config.loading);
								$box.children('a.close').fadeOut(config.fade_out);
								$box.children('a.more').fadeTo(config.fade_out, 0.01);
								$box.children('ul.nav').fadeTo(config.fade_out, 0.01);
								
								$box.children('ul.items').animate
								({
									'width': $img.outerWidth(),
									'height': $img.outerHeight()
								},
								{
									duration: config.resize,
									step: function()
									{
										$box.css
										({
											'top': $(window).scrollTop() + $(window).height()/2 - $box.outerHeight()/2,
											'left': $(window).scrollLeft() + $(window).width()/2 - $box.outerWidth()/2
										});
									},
									
									complete: function()
									{
										$img = $(this).children('li:visible').children('img');
										
										$(this).prev('h2').text($img.attr('alt'));
										$(this).children('li').eq(next).fadeTo(config.fade_in, 1.0);
										$box.children('a.close').fadeIn(config.fade_in);
										$box.children('a.more').fadeTo(config.fade_in, 1.0);
										$box.children('ul.nav').fadeTo(config.fade_in, 1.0);
									}
								});
								
								event.preventDefault();
								
								return false;
							})
						)
					)
				);
			}
				
			if (config.button_label != '' && config.button_link != '')
			{
				$box.append
				(
					$('<a />')
						.addClass('more')
						.attr('href', config.button_link)
					.text(config.button_label).hide()
				);
			}

			$box.appendTo('body').hide().fadeIn(config.fade_in);
			
			position();
			
			
			return false;
		});
		
		return this;
	};
	
	$(config.ibox).ibox();
	
	// WANNABE BOX END
	
	// TOP SLIDE BEGIN
	
	$slider = $('div.featured ul.images');
	$slider_items = $slider.children('li');
	
	$slider
		.css('position', 'absolute')
		.parent('div')
	.css
	({
		'overflow': 'hidden',
		'position': 'relative',
		'height': $slider.height()
	});
	
	$slider_items.css
	({
		'display': 'inline'
	});
	
	$slider_nav_prev = $('<li />').
		addClass('prev').
		append($('<a />').
	text('Previous').attr('href', '#prev'));
	
	$slider_nav_next = $('<li />').
		addClass('next').
		append($('<a />').
	text('Next').attr('href', '#prev'));
	
	$slider_nav = $('<ul />').
		addClass('nav').
		append($slider_nav_prev).
	append($slider_nav_next);
	
	$slider.after($slider_nav);
	
	cache.slider.items = $slider_items.length;
	cache.slider.width = $slider.parent('div').width();
	cache.slider.total_width = cache.slider.items * $slider.parent('div').width();
	
	$slider_nav.css('left', cache.slider.width/2 - $slider_nav.width()/2);
	
	$slider_nav_prev.click( function()
	{
		if ($slider.position().left < 0)
		{
			$slider.not(':animated').animate
			({
				'left': '+=' + cache.slider.width
			}, config.slider_scroll);
		}
		
		return false;
	});
	
	$slider_nav_next.click( function()
	{
		if ($slider.position().left > -((cache.slider.items-1) * cache.slider.width))
		{
			$slider.not(':animated').animate
			({
				'left': '-=' + cache.slider.width
			}, config.slider_scroll);
		}
		
		return false;
	});
	
	// TOP SLIDER END
});
