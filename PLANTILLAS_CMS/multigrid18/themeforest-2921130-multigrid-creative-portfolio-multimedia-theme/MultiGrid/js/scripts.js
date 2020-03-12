var $container = '';
var $tt_rewidth_called = false;
var $tt_single_sidebar;
var $commentResult=false;
var $tt_body_scroll=false;
var $tt_modal_scroll=false;
var $tt_item_width=1;
var $pages=1;
var $next='false';
var $currentURLback=window.location.toString().split("#")[0];
var $currentURL = $currentURLback + (($currentURLback.lastIndexOf("/")==$currentURLback.length-1) ? '' : '/');
var $hisChanging=false;
var $readMore='More';
var $modalSlideTouching=false;
var flexResize=false;
var $modalEnabled=true;
var $wheelInfiniteEnabled=true;
var $ogTitle, $ogURL, $ogImage, $ogSiteName, $ogDescription;

$columnSizes=new Array();
$columnSizes['xl'] = new Array(1, 1, 2, 2, 3, 4, 5);
$columnSizes['l']  = new Array(1, 1, 2, 3, 4, 5, 6);
$columnSizes['m']  = new Array(1, 2, 3, 4, 5, 6, 7);
$columnSizes['s']  = new Array(1, 2, 4, 5, 6, 7, 8);

jQuery(document).ready(function(){
    /* Checking Modal Option */
    if(jQuery('body').hasClass('no-modal') || isMobile.any()){$modalEnabled=false;}
    
    /* pagination */
    tt_pagination();
    
    /* Backup ReadMore Text */
    $readMore = jQuery('.read-more').html();

    /* Repair Menu Class */
    jQuery('.current-menu-item').addClass('active');
    
    $tt_single_sidebar=(jQuery('body').hasClass('single-post') || jQuery('body').hasClass('page-template-default') || jQuery('body').hasClass('error404') || jQuery('body').hasClass('search-no-results'))?true:false;
    /* jQuery Isotope */
    if($tt_single_sidebar){
        $container      = jQuery('.masonry-widgets');
        $container_item = '.widget';
    }else{
        $container      = jQuery('.mansonry-container');
        $container_item = '.item-article';
    }
    $container.isotope({
        itemSelector: $container_item,
        masonry: {
                columnWidth: 1
        }
    });

    jQuery.extend( jQuery.Isotope.prototype, {_masonryResizeChanged : function() { /* Empty */ }});
    
    tt_init();
    setTimeout(function(){
        tt_item_show();   
    },5000);
});

jQuery(window).load(function(){
    jQuery(window).unbind('keydown');
    tt_rewidth();
    tt_item_show();
    jQuery(window).resize(function(){
        /* Header-top */
        tt_header_top();
        var $beforeWidth, $afterWidth;
        if(flexResize){
            setTimeout(function(){flexResize=false;},1000);
        }else{
            $beforeWidth=jQuery(window).width();
            setTimeout(function(){
                $afterWidth=jQuery(window).width();
                if($beforeWidth==$afterWidth && !$tt_rewidth_called){
                    $tt_rewidth_called=true;
                    tt_rewidth();
                    jQuery('.flex-direction-nav .next').click();
                    setTimeout(function(){$tt_rewidth_called=false;},1000);
                }
            },1000);
        }        
        setTimeout(function(){
            if($tt_body_scroll) {$tt_body_scroll.resize(); }
            if($tt_modal_scroll){$tt_modal_scroll.resize();}
        },1000);
    });
    
    /* -------------infinitescroll--------------------- */
    if(jQuery('#page_nav').html()){
        $container.infinitescroll({
                navSelector  : '#page_nav',    /* selector for the paged navigation      */
                nextSelector : '#page_nav a',  /* selector for the NEXT link (to page 2) */
                itemSelector : '.item-article',/* selector for all items you'll retrieve */
/*                debug        : true, */
                loading: {
                    msgText: tt_infinite_loadingMsg,
                    finishedMsg: tt_infinite_finishedMsg,
                    img: tt_infinite_img
                },
                errorCallback: function(){
                    jQuery('.next-items').fadeOut('slow');
                }
            },
            /* call Isotope as a callback */
            function( newElements ) {
                $wheelInfiniteEnabled=true;
                $container.isotope( 'appended', jQuery( newElements ) );
                tt_init_single();
                tt_rewidth();
                tt_item_show();
                /* Readding Bootstrap script */
                if ( typeof initThemeElements === 'function' ) {initThemeElements();}
                if($infinitescroll==$pages){jQuery('.next-items').fadeOut('slow');}
                jQuery('.next-items').html($next+" ("+($infinitescroll++)+"/"+$pages+")");
            }
        );
        if(jQuery('.next-items').html()){
            jQuery(window).unbind('.infscr');
            if($container){
                $pages=parseInt(jQuery('#page_nav').attr('data-pages'));
                $next=jQuery('.next-items').html();
                jQuery('.next-items').html($next+" ("+($infinitescroll-1)+"/"+$pages+")");
                jQuery('.next-items').click(function(){
                    $container.infinitescroll('retrieve');
                });
            }
        }else{
            // No Vertical Scroll
            jQuery(window).bind('mousewheel', function() {if(!hasScroll(document.body, 'vertical')&&jQuery('.tt-modal-box').hasClass('hide')&&$wheelInfiniteEnabled){$wheelInfiniteEnabled=false;$container.infinitescroll('retrieve');}});
            jQuery(window).bind('keydown',    function(e){if(!hasScroll(document.body, 'vertical')&&e.keyCode==40&&jQuery('.tt-modal-box').hasClass('hide')&&$wheelInfiniteEnabled){$wheelInfiniteEnabled=false;$container.infinitescroll('retrieve');}});
        }
    }
    
    jQuery(".navLeft, .navRight").hover(function(){
        jQuery(this).animate({opacity:'1'},'slow');
    },function(){
        jQuery(this).animate({opacity:'0.5'},'slow');
    });
    
    jQuery(window).bind('keydown',
        function(e){
            if(e.keyCode==37){/* left */
                jQuery('.navLeft').click();
            }else if(e.keyCode==39){/* right */
                jQuery('.navRight').click();
            }
        }
    );
    
    /* Filter */
    var $optionSets = jQuery('.option-set'),
    $optionLinks = $optionSets.find('a');

    $optionLinks.click(function(){
        var $this = jQuery(this);
        /* don't proceed if already selected */
//        if ( $this.hasClass('selected') ) {return false;}
        //var $optionSet = $this.parents('.option-set');
        $optionSets.find('.selected').removeClass('selected');
        $this.addClass('selected');

        /* make option object dynamically, i.e. { filter: '.my-filter-class' } */
        var options = {},
        key = $optionSets.attr('data-option-key'),
        value = $this.attr('data-option-value');

        /* parse 'false' as false boolean */
        value = value === 'false' ? false : value;
        options[ key ] = value;
        if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
            /* changes in layout modes need extra logic */
            changeLayoutMode( $this, options )
        } else {
            /* otherwise, apply new options */
            $container.isotope( options );
        }
        setTimeout(function(){if($tt_body_scroll) {$tt_body_scroll.resize(); }},1500);
        return false;
    });
    
	
    /* Header Top */
    tt_header_top();
    
    /* Open Graph Meta Defaults */
    jQuery("meta[property*=title]").after("<meta property='og:url' content='"+$currentURLback+"'/>");
    $ogTitle       = jQuery("meta[property*=title]").attr("content");
    $ogURL         = jQuery("meta[property*=url]").attr("content");
    $ogImage       = jQuery("meta[property*=image]").attr("content");
    $ogSiteName    = jQuery("meta[property*=site_name]").attr("content");
    $ogDescription = jQuery("meta[property*=description]").attr("content");

    /* Location Check */
    tt_location_check();

    setInterval( function() {jQuery( '.twitter-tweet-rendered').css('width','');}, 100 );
    
    removeTweeterStyle();
    
    tt_social_share();
    jQuery('.flex-direction-nav .prev').click();
});

/* Init Single Scripts */
/* -------------------------------------------------------------------- */
function tt_init_single(){    
    /* Init NotInited Items */
    jQuery(".item-not-inited").each(function(){
        $currentArticle=jQuery(this);
        
        /* IMAGE ICON OVERLAY */
        /* This will select the items which should include the image overlays */
        $currentArticle.find("div.entry-image, div.instagram-photo").each(function(){
            var	ctnr = jQuery(this).find('a.item-preview');
            var cntrDiv=jQuery(this);
            /* insert the overlay image */
            ctnr.each(function(){
                if (jQuery(this).children('img')) {
                    if (jQuery(this).hasClass('iconImage')) {
                        jQuery(this).append(jQuery('<div class="image-overlay"><div class="iconImage"></div></div>'));
                    } else if  (jQuery(this).hasClass('iconVideo')) {
                        jQuery(this).append(jQuery('<div class="image-overlay"><div class="iconVideo"></div></div>'));
                    } else if  (jQuery(this).hasClass('iconInstagram')) {
                        jQuery(this).append(jQuery('<div class="image-overlay"><div class="iconInstagram"></div></div>'));
                    }
                }
            })
            var overImg = ctnr.children('.image-overlay');
            if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) < 6) {
            /* IE sucks at fading PNG's with gradients so just use show hide */
            } else {
                /* make sure it's not visible to start */
                overImg.css('display','none');
                cntrDiv.hover(
                    function(){
                        overImg.fadeIn('fast');
                    },		/* mouseover */
                    function(){
                        overImg.fadeOut('fast');
                    }		/* mouseout */
                );
            }
        });
        
        
        /* Image Pre loader */
        if (jQuery.browser.msie){
            $currentArticle.find('.preload').removeClass('preload');
        } else {
            $currentArticle.find('.preload').preloadImages({
                showSpeed: 500,   /* length of fade-in animation, 500 is default */
                easing: 'easeInQuad'   /* optional easing, if you don't have any easing scripts - delete this option */
            });
        }

        /* Ajax Like */
        $currentArticle.find('.meta-like').live('click',function(e){
            var currentLike=jQuery(this);

            if(currentLike.attr('href')!='#' && !currentLike.hasClass('liked')){
                jQuery.post(jQuery(this).attr('href'), function(response) {
                    currentLike.attr('data-count',parseInt(currentLike.attr('data-count'))+1);
                    currentLike.removeAttr('href').addClass('liked').html(currentLike.closest('footer').hasClass('min')?currentLike.attr('data-count'):response);                    
                });
            }
            return false;
        });

        /* Players */
        $currentArticle.find('.jp-jplayer-audio').each(function(){
            jQuery(this).jPlayer({
                ready: function () {
                    jQuery(this).jPlayer("setMedia", {
                        mp3: jQuery(this).attr('src')
                    });
                },
                wmode:"window",
                swfPath: tt_theme_uri + "/js",
                cssSelectorAncestor: "#jp_interface_"+jQuery(this).attr('pid'),
                supplied: "mp3"
            });
        });

        /* YouTube vMode Fix */
        $currentArticle.find("iframe").each(function(){
            var ifr_source = jQuery(this).attr('src');
            if( typeof ifr_source != 'undefined') {
                var pos = ifr_source.indexOf("youtube.com");
                if(pos > -1) {
                    var wmode = "?autohide=1&wmode=opaque";
                    var posQuestionMark = ifr_source.indexOf("?");
                    if(posQuestionMark > -1)
                        wmode = "&autohide=1&wmode=opaque"; 
                    jQuery(this).attr('src',ifr_source+wmode);
                }
            }
        });


        /* Flex Slider */
        $currentArticle.find('.flexslider').flexslider({
            prevText: "←",           /* String: Set the text for the "previous" directionNav item */
            nextText: "→",
            animation: 'slide',
            pauseOnAction: false
        });
        
        /* ThemeTon Modal */
        $currentArticle.find('.item-click-modal').click(function(e){
            if($modalEnabled && jQuery(this).closest('.item-article').hasClass('type-post') && !jQuery(this).hasClass('custom-link')){
                e.preventDefault();
                tt_modal(jQuery(this).closest('.item-article').addClass('modaled').attr('data-permalink'));
            }
        });
        $currentArticle.find('footer a').click(function(e){
            if($modalEnabled && jQuery(this).closest('.item-article').hasClass('type-post') && !jQuery(this).hasClass('footer-meta-like') && !jQuery(this).hasClass('custom-link')){
                e.preventDefault();
                tt_modal(jQuery(this).closest('.item-article').addClass('modaled').attr('data-permalink'));
            }
        });
        $currentArticle.find('.item-title a.item-title-link').click(function(e){
            if($modalEnabled && jQuery(this).closest('.item-article').hasClass('type-post') && !jQuery(this).hasClass('custom-link')){
                e.preventDefault();
                tt_modal(jQuery(this).closest('.item-article').addClass('modaled').attr('data-permalink'));
            }
        });
        /* Theme Elements */
        $currentArticle.find(".well").popover();
        $currentArticle.find(".target_tooltip").tooltip();

        /* Show Category Filter */
        if(jQuery('.category-list').html()){
            jQuery('.category-list li.hide').each(function(){
                $currentFilterClass=jQuery(this).children('a').attr('data-option-value').replace('.','');
                if($currentArticle.hasClass($currentFilterClass)){
                    jQuery(this).removeClass('hide');
                }
            });
        }
		/* Show Tag Filter */
        if(jQuery('.tag-list').html()){
            jQuery('.tag-list li.hide').each(function(){
                $currentFilterClass=jQuery(this).children('a').attr('data-option-value').replace('.','');
                if($currentArticle.hasClass($currentFilterClass)){
                    jQuery(this).removeClass('hide');
                }
            });
        }

        /* Item inited */
        $currentArticle.removeClass('item-not-inited');
    }).promise().done(function(){
        /* Forms init */
        formInit();
    
        setTimeout(function(){
            if($tt_body_scroll){
                $tt_body_scroll.resize();
            }
            if($tt_modal_scroll){
                $tt_modal_scroll.resize();
            }
        },1000);

        /* Modal box Close */
        jQuery('a.modal-close, .modalback').click(function(){
            jQuery('.modaled').removeClass('modaled');
            tt_modal(false);
            return false;
        });

        jQuery("a.modal-close").hover(function(){
            jQuery(this).animate({opacity:'1'},'slow');
        },function(){
            jQuery(this).animate({opacity:'0.5'},'slow');
        });

        jQuery(".large.item .large-info").hover(function(){
            jQuery(this).find('.jcycle-pager').fadeIn("slow");
        },function(){
            jQuery(this).find('.jcycle-pager').fadeOut("slow");
        });

        /*  Modal - TOUCH SWIPE */
        if(isIDevice()){
            jQuery(".tt-modal-box .flexslider").swipe({
                swipeStatus:function(event, phase, direction, distance, fingerCount) {
                    if (phase=="start"){$modalSlideTouching=true;}
                    if (phase=="end")  {setTimeout(function(){$modalSlideTouching=false;},1000);}
                }
            });

            /* Enable swiping... */
            jQuery(".tt-modal-box section").swipe({
                swipe: function swipe(event, direction){
                    if($modalSlideTouching===false){
                        switch(direction){
                            case 'left'  :jQuery('.navRight').click();break;
                            case 'right' :jQuery('.navLeft') .click();break;
                        }
                    }
                }
            });
        }
        /* Modal box Next Prev */
        jQuery('.navLeft').unbind('click').bind('click',function(e){
            e.preventDefault();
            $currentModaled=jQuery('.modaled');
            if($currentModaled.hasClass('item-article')){
                $currentModaled.removeClass('modaled');
                jQuery('.tt-modal-box').addClass('changing');
                do{
                    $currentModaled=$currentModaled.prev();
                    if($currentModaled.html()&&!($currentModaled.hasClass('item-article')&&$currentModaled.hasClass('type-post'))){
                        $currentModaled=$currentModaled.prev();
                    }
                }while($currentModaled.hasClass('custom-link'))

                if($currentModaled.html()){
                    if($currentModaled.find('.item-title a.item-title-link').hasClass('item-title-link')){
                        $currentModaled.find('.item-title a.item-title-link').click();
                    }else if($currentModaled.find('a.item-click-modal').hasClass('item-click-modal')){
                        $currentModaled.find('a.item-click-modal').click();
                    }
                }else{
                    if(jQuery('.item-article.type-post').last().find('.item-title a.item-title-link').hasClass('item-title-link')){
                        jQuery('.item-article.type-post').last().find('.item-title a.item-title-link').click();
                    }else if(jQuery('.item-article.type-post').last().find('a.item-click-modal').hasClass('item-click-modal')){
                        jQuery('.item-article.type-post').last().find('a.item-click-modal').click();
                    }
                }
            }
        });

        jQuery('.navRight').unbind('click').bind('click',function(e){
            e.preventDefault();
            $currentModaled=jQuery('.modaled');
            if($currentModaled.hasClass('item-article')){
                $currentModaled.removeClass('modaled');
                jQuery('.tt-modal-box').addClass('changing');
                do{
                    $currentModaled=$currentModaled.next();
                    if($currentModaled.html()&&!($currentModaled.hasClass('item-article')&&$currentModaled.hasClass('type-post'))){
                        $currentModaled=$currentModaled.next();    
                    }
                }while($currentModaled.hasClass('custom-link'))
                if($currentModaled.html()){
                    if($currentModaled.find('.item-title a.item-title-link').hasClass('item-title-link')){
                        $currentModaled.find('.item-title a.item-title-link').click();
                    }else if($currentModaled.find('a.item-click-modal').hasClass('item-click-modal')){
                        $currentModaled.find('a.item-click-modal').click();
                    }
                }else{
                    if(jQuery('.item-article.type-post').first().find('.item-title a.item-title-link').hasClass('item-title-link')){
                        jQuery('.item-article.type-post').first().find('.item-title a.item-title-link').click();
                    }else if(jQuery('.item-article.type-post').first().find('a.item-click-modal').hasClass('item-click-modal')){
                        jQuery('.item-article.type-post').first().find('a.item-click-modal').click();
                    }
                }
            }
        });
        /* Facebook Comment Reset */
        try{FB.XFBML.parse();}catch(e){}

        /* Twitter reInit */
        jQuery('head').append("<script src=\"http://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>");

        /* Remove Tweeter Style */
        removeTweeterStyle();
    });
}
/* Init Scripts */
/* -------------------------------------------------------------------- */
function tt_init(){
    /* Mouse Wheel */
    jQuery(window).unbind('mousewheel').bind('mousewheel',function(){setTimeout(function(){if(jQuery('body').scrollTop()>0){jQuery('body').addClass('scroll-down');}else{jQuery('body').removeClass('scroll-down');}},300);});
    
    /* MOBILE MENU */
    jQuery('#main-menu-mobile').change(function(){
        if(jQuery(this).val() !== null){
            document.location.href = jQuery(this).val()
        }
    });	
    /* Mega-Menu-Start */
    var temp, menu = jQuery("#navigation .menu");
    menu.find("li").hover(function(){
        jQuery(this).children('.children').hide().slideDown('normal');
        if(jQuery(this).hasClass('mega-item'))
            jQuery(this).children('.children').find('.children').hide().slideDown('normal');
        try{
            $tmp=(jQuery(this).children('.children').offset().left+jQuery(this).children('.children').width())-(jQuery("#header").offset().left+jQuery("#header").width());
            if($tmp>0){
                $childrenPaddingRL = parseInt(jQuery(this).children('.children').css('padding-left').replace('px',''))+parseInt(jQuery(this).children('.children').css('padding-right').replace('px',''));
                $childrenBorderR  = jQuery(this).children('.children').css('border-right-width')==''?'0':jQuery(this).children('.children').css('border-right-width');
                $childrenBorderL  = jQuery(this).children('.children').css('border-left-width') ==''?'0':jQuery(this).children('.children').css('border-left-width');
                $childrenBorderRL = parseInt($childrenBorderR.replace('px','')) + parseInt($childrenBorderL.replace('px',''));
                $tmp=$tmp+$childrenPaddingRL+$childrenBorderRL;
                jQuery(this).children('.children').css("left","-"+$tmp+"px");
                jQuery(this).children('.children::before').css("left","70px");
            }
        }
        catch(e){}
    },function(){
        jQuery(this).children('.children').stop(true,true).hide();
    });

    menu.children("li").each(function(){
        temp = jQuery(this);
        if(temp.children().hasClass("children"))
            temp.addClass("showdropdown");
        jQuery('ul.children ul.children').each(function(){
            jQuery(this).closest('li').addClass('has-children');
        });

        if(temp.hasClass('rel'))
            temp.find('.children').append('<span class="mg-menu-tip" style="width:'+temp.width()+'px"></span>');
        else
            temp.find('.children').append('<span class="mg-menu-tip" style="left:'+(temp.position().left-20)+'px;width:'+temp.width()+'px"></span>');
    });


    menu.find(".children.columns").each(function(){
        $countItems=1;
        jQuery(this).children(".mega-item").each(function(){
            temp = jQuery(this);
            if(temp.hasClass("clearleft")){
                $countItems=4;
            }else if(($countItems%3)==1 && $countItems!=1){
                temp.addClass("clearleft");
            }
            $countItems++;
        });
    });
    /* Mega-Menu-End */
    
    
    /* Nice Scroll */
    if(!isIDevice()){
        $tt_modal_scroll = $tt_modal_scroll?$tt_modal_scroll:jQuery(".tt-modal-box").niceScroll(".tt-modal-box .item-single");
    }
    $tt_body_scroll = $tt_body_scroll?$tt_body_scroll:jQuery("html").niceScroll();
    
    if($tt_body_scroll){
        jQuery('body > [id*="ascrail"]').css('z-index', '1031');
    }
    
    /* Header Top */
    tt_header_top();
        
    /* Item Size */
    jQuery('#toolbar-basegrid-s').click(function(e){
        e.preventDefault();
        $tt_item_size='s';
        jQuery('div.toolbar').removeClass('toolbar-basegrid-m').removeClass('toolbar-basegrid-l').removeClass('toolbar-basegrid-xl').addClass('toolbar-basegrid-s');
        tt_rewidth();
    });
    jQuery('#toolbar-basegrid-m').click(function(e){
        e.preventDefault();
        $tt_item_size='m';
        jQuery('div.toolbar').removeClass('toolbar-basegrid-s').removeClass('toolbar-basegrid-l').removeClass('toolbar-basegrid-xl').addClass('toolbar-basegrid-m');
        tt_rewidth();
    });
    jQuery('#toolbar-basegrid-l').click(function(e){
        e.preventDefault();
        jQuery('div.toolbar').removeClass('toolbar-basegrid-s').removeClass('toolbar-basegrid-m').removeClass('toolbar-basegrid-xl').addClass('toolbar-basegrid-l');
        $tt_item_size='l';
        tt_rewidth();
    });
    jQuery('#toolbar-basegrid-xl').click(function(e){
        e.preventDefault();
        jQuery('div.toolbar').removeClass('toolbar-basegrid-s').removeClass('toolbar-basegrid-m').removeClass('toolbar-basegrid-l').addClass('toolbar-basegrid-xl');
        $tt_item_size='xl';
        tt_rewidth();
    });
    jQuery('#toolbar-basegrid-'+$tt_item_size).click();
    
    /* Init Single */
    tt_init_single();
    
    /* GO TO TOP */
    jQuery('.anchorLink').click(function() {
        jQuery('body,html').animate({
            scrollTop:0
        },'slow');
    });
}
/* Pagination */
/* -------------------------------------------------------------------- */
function tt_pagination(){
    inf_url = window.location.toString();
    inf_url = inf_url.search("#")>=0?inf_url.substring(0,inf_url.lastIndexOf("#")):inf_url;
/*    inf_url = (inf_url.lastIndexOf("/")==inf_url.length-1) ? inf_url.substring(0,inf_url.length-1) : inf_url; */
    ++$infinitescroll;
    inf_url = inf_url.lastIndexOf("?")>=0 ? inf_url.replace('?',"?paged="+$infinitescroll+"&") : inf_url+"?paged="+$infinitescroll;
    jQuery('#page_nav a').attr('href',inf_url);
}
/* Post Single Modal */
/* -------------------------------------------------------------------- */
function tt_modal(postURL){
    if(postURL===false){
        jQuery('.tt-modal-box').scrollTop(0).addClass('hide');
        jQuery('body').removeClass('noscroll');
        jQuery(".tt-modal-box .item-single").html('');
        resetOpenGraphMeta('reset');
        tt_history($currentURLback);
    }else{
        if(jQuery('.tt-modal-box').hasClass('hide') || jQuery('.tt-modal-box').hasClass('changing')){
            jQuery('.tt-modal-box .item-single').addClass('loading').show();
            jQuery('.tt-modal-box').show();
            jQuery(".tt-modal-box .item-single").html('');
            if($tt_modal_scroll){$tt_modal_scroll.resize();}
            modalMarginRepair();
        }
        jQuery.ajax({
            type: "POST",
            url: postURL,
            success: function(data){
                if(jQuery('.tt-modal-box').hasClass('hide') || jQuery('.tt-modal-box').hasClass('changing')){
                    tt_history(postURL);
                    jQuery('.tt-modal-box .item-single').removeClass('loading');
                    jQuery('.tt-modal-box').css('display','');
                    jQuery('.tt-modal-box').removeClass('hide').removeClass('changing');
                    jQuery('body').addClass('noscroll');
                    jQuery(".tt-modal-box .item-single").addClass('item-not-inited').html('<a href="#" class="modal-close">Close</a>'+jQuery(data).find('.item-single').html());
                    tt_init_single();
                    mediaSizeRepair(true);
                    resetOpenGraphMeta('change');
                    
                    tt_social_share();
                    
                    /* Readding Bootstrap script */
                    if ( typeof initThemeElements === 'function' ) {initThemeElements();}
                    if(jQuery('article.modaled .item-media').hasClass('item-media')&&!jQuery('article.modaled .item-media .item-click-modal').hasClass('item-click-modal')){jQuery('article.modaled .item-media').html(jQuery('article.modaled .item-media').html());}
                    
                    /* Modal margin-top Repair */
                    $interCount=1;var iModalMarginRepair = setInterval(function(){modalMarginRepair();if ($interCount>50) {clearInterval(iModalMarginRepair);}$interCount++;}, 100);
                    jQuery('.tt-modal-box').unbind('mousewheel').bind('mousewheel', function() {modalMarginRepair();});
                }else{
                    $commentResult=data;
                }
            }
        });
    }
}
/* Post Show */
/* -------------------------------------------------------------------- */
function tt_item_show(){
    jQuery('#page.loading').removeClass("loading");
    jQuery('.mansonry-container>article.item-hidden').each(function(i){jQuery(this).delay(i*300).fadeIn('fast',function(){jQuery(this).removeClass('item-hidden');});}).promise().done(function(){jQuery('#options a.selected').click();setTimeout(function(){if($container){mediaSizeRepair(jQuery('body').hasClass('noscroll'));$container.isotope('reLayout');}},5000);});
    setTimeout(function(){if($container){mediaSizeRepair(jQuery('body').hasClass('noscroll'));$container.isotope('reLayout');}},1000);
}
/* Header-top */
/* -------------------------------------------------------------------- */
function tt_header_top(){
    jQuery('.wrapper').css( 'padding-top','');
    if(jQuery('.navbar-fixed-top').css('position')=='fixed'){
        if(jQuery('#options.category-list').html()){
            jQuery('#options.category-list').css('margin-top',jQuery('.navbar.navbar-fixed-top').height()+'px');
        }else if(jQuery('#toptions.tag-list').html()){
            jQuery('#toptions.tag-list').css('margin-top',jQuery('.navbar.navbar-fixed-top').height()+'px');
        }else{
            jQuery('.wrapper').css( 'padding-top', jQuery('.navbar-fixed-top').height()+parseInt(jQuery('.wrapper').css( 'padding-top').replace('px','')));
        }
    }else{
        jQuery('#options.category-list').css('margin-top','0px');
        jQuery('#toptions.tag-list').css('margin-top','1px');
    }
}

/* Rewidth */
/* -------------------------------------------------------------------- */
function tt_rewidth(){
    var $windowWidth=jQuery(window).width();
    var $containerWidth=jQuery('.mansonry-container').width();
    var $columnCount;
    var $oneColumnWidth, $twoColumnWidth;
    var $singleSidebarPosition='right';
    
    if($tt_single_sidebar) {
        $columnCount=3;
        
        if(1325<=$windowWidth && $windowWidth<1500){
            $columnCount=2;
        }else if(1236<=$windowWidth && $windowWidth<1325){
            $columnCount=1;
        }else if(986<=$windowWidth && $windowWidth<1236){
            $columnCount=3;
            $singleSidebarPosition='bottom';
        }else if(720<=$windowWidth && $windowWidth<986){
            $columnCount=2;
            $singleSidebarPosition='bottom';
        }else if(480<=$windowWidth && $windowWidth<720){
            $columnCount=1;
            $singleSidebarPosition='bottom';
        }else if($windowWidth<480){
            $columnCount=1;
            $singleSidebarPosition='bottom';
        }
        $singleContainerWidth=jQuery('.single-container').width();
        $singlePaddingRL=parseInt(jQuery('.single-container>.item-single').css('padding-left').replace('px',''))+parseInt(jQuery('.single-container>.item-single').css('padding-right').replace('px',''));
        $singleItemWidth=($singleSidebarPosition=='bottom')?($singleContainerWidth-$singlePaddingRL):'' 
        jQuery('.single-container>.item-single').width($singleItemWidth);
        
        if(typeof jQuery('.single-container>.widgets-container').css('padding-left')!='undefined'){
            $singleItemWidth= jQuery('.single-container>.item-single').width();
            $widgetContainerPaddingRL = parseInt(jQuery('.single-container>.widgets-container').css('padding-left').replace('px',''))+parseInt(jQuery('.single-container>.widgets-container').css('padding-right').replace('px',''));
            $singleBorderR  = jQuery('.single-container>.item-single').css('border-right-width')==''?'0':jQuery('.single-container>.item-single').css('border-right-width');
            $singleBorderL  = jQuery('.single-container>.item-single').css('border-left-width') ==''?'0':jQuery('.single-container>.item-single').css('border-left-width');
            $singleBorderRL = parseInt($singleBorderR.replace('px','')) + parseInt($singleBorderL.replace('px',''));
            $widgetContainerWidth=($singleSidebarPosition=='right')?($singleContainerWidth - $singleItemWidth - $singlePaddingRL - $widgetContainerPaddingRL - $singleBorderRL):($singleItemWidth + $singlePaddingRL - $widgetContainerPaddingRL);
            jQuery('.single-container>.widgets-container').width($widgetContainerWidth);
            $singleWidgetPaddingRL= parseInt(jQuery('.widgets-container>.masonry-widgets>aside.widget').css('padding-left').replace('px',''))+parseInt(jQuery('.widgets-container>.masonry-widgets>aside.widget').css('padding-right').replace('px',''));
            $singleWidgetMarginRL = parseInt(jQuery('.widgets-container>.masonry-widgets>aside.widget').css('margin-left').replace('px','')) +parseInt(jQuery('.widgets-container>.masonry-widgets>aside.widget').css('margin-right').replace('px',''));
            $singleWidgetBorderR  = jQuery('.widgets-container>.masonry-widgets>aside.widget').css('border-right-width')==''?'0':jQuery('.widgets-container>.masonry-widgets>aside.widget').css('border-right-width');
            $singleWidgetBorderL  = jQuery('.widgets-container>.masonry-widgets>aside.widget').css('border-left-width') ==''?'0':jQuery('.widgets-container>.masonry-widgets>aside.widget').css('border-left-width');
            $singleWidgetBorderRL = parseInt($singleWidgetBorderR.replace('px',''))+parseInt($singleWidgetBorderL.replace('px',''));
            $oneColumnWidth = parseInt($widgetContainerWidth/$columnCount)-$singleWidgetPaddingRL-$singleWidgetMarginRL-$singleWidgetBorderRL;
            jQuery('.widgets-container>.masonry-widgets>aside.widget').each(function(){jQuery(this).width($oneColumnWidth);}).promise().done(function(){tt_rewidth_done();});
        }
    } else if(typeof jQuery('.mansonry-container>article').css('margin-left')!='undefined'){
        $tt_item_width=0;
               
        if(1891<=$windowWidth){
            $tt_item_width=6;
        }else if(1587<=$windowWidth && $windowWidth<1891){
            $tt_item_width=5;
        }else if(1236<=$windowWidth && $windowWidth<1587){
            $tt_item_width=4;
        }else if(986<=$windowWidth && $windowWidth<1236){
            $tt_item_width=3;
        }else if(720<=$windowWidth && $windowWidth<986){
            $tt_item_width=2;
        }else if(480<=$windowWidth && $windowWidth<720){
            $tt_item_width=1;
        }else if($windowWidth<480){
            $tt_item_width=0;
        }
        
        $columnCount=$columnSizes[$tt_item_size][$tt_item_width];
        
        $singleArticleMarginRL =parseInt(jQuery('.mansonry-container>article').css('margin-left').replace('px','')) +parseInt(jQuery('.mansonry-container>article').css('margin-right').replace('px',''));
        $oneColumnWidth = parseInt($containerWidth/$columnCount);
        $twoColumnWidth = parseInt($oneColumnWidth*($columnCount==1?1:2));
        $oneColumnWidth -= $singleArticleMarginRL;
        $twoColumnWidth -= $singleArticleMarginRL;

        jQuery('.mansonry-container>article').each(function(){
            jQuery(this).removeClass('item-not-rewidthed');
            if(jQuery(this).children().hasClass('item-featured')){
                jQuery(this).width($twoColumnWidth);
            }else{
                jQuery(this).width($oneColumnWidth);
            }
            
            /* Read More Resize */
            $width = jQuery(this).width();
            $commentCount = jQuery(this).find('.meta-comment')    .html() ? parseInt(jQuery(this).find('.meta-comment')    .attr('data-count')) : false;
            $likeCount    = jQuery(this).find('.footer-meta-like').html() ? parseInt(jQuery(this).find('.footer-meta-like').attr('data-count')) : false;

            if($width>210){
                jQuery(this).find('footer')              .removeClass('min');
                jQuery(this).find('footer .meta-comment').html(($commentCount==0 ? 'No' : $commentCount)+' comment'+($commentCount>1 ? 's' : ''));
                jQuery(this).find('footer .footer-meta-like')   .html($likeCount+' like'+($likeCount>1 ? 's' : ''));
                jQuery(this).find('footer .read-more')   .html($readMore);
                jQuery(this).find('.twt-border .view-details').css('display','');
                jQuery(this).find('.twt-border .twt-follow-button').css('display','');
            }else{
                jQuery(this).find('footer')              .addClass('min');
                jQuery(this).find('footer .meta-comment').html($commentCount);
                jQuery(this).find('footer .footer-meta-like')   .html($likeCount);
                jQuery(this).find('footer .read-more')   .html('→');
                jQuery(this).find('.twt-border .view-details').css('display','none');
                jQuery(this).find('.twt-border .twt-follow-button').css('display','none');
            }
        }).promise().done(function(){tt_rewidth_done();});
    }
}

/* Ajax comment submit contact form */
/* ------------------------------------------------------------------- */
function ajaxComment(theForm) {
    var result = '', c = '';
    jQuery('#loader').fadeIn();
    var formData = jQuery(theForm).serialize();
    var actionURL;
    actionURL = jQuery('#commentform').attr('action');

    jQuery.ajax({
        type: "POST",
        url:  actionURL,
        data: formData,
        success: function(response) {
            tt_modal(jQuery('#commentform').attr('data-comment-link'));
            var i = setInterval(function() {
                if ($commentResult!=false) {
                    if($commentResult) {
                        jQuery('#comments').html(jQuery($commentResult).find('#comments').html());
                        c='success';
                        result='Success';
                        formInit();
                    } else {
                        c='error';
                        result='No coment';
                    }

                    jQuery('#LoadingGraphic').fadeOut('fast', function() {
                        jQuery('#Note').removeClass('success').removeClass('error').text('');
                        jQuery('#Note').show('fast');
                        jQuery('#Note').html(result).addClass(c).slideDown('fast');
                    });
                    $commentResult=false;
                    clearInterval(i);
                }
            }, 40);
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        c = 'error';
        switch(jqXHR.status){
            case 500: {
                    result='Duplicate comment detected; it looks as though you’ve already said that!';break;
            }
            default:{
                    result='not';
            }
        }

        jQuery('#LoadingGraphic').fadeOut('fast', function() {
                jQuery('#Note').removeClass('success').removeClass('error').text('');
                jQuery('#Note').show('fast');
                jQuery('#Note').html(result).addClass(c).slideDown('fast');
        }); /* end loading image fadeOut */
    });

    return false;
}

jQuery.fn.overlabel = function() {
    this.each(function(index) {
        var label = jQuery(this);
        var field;
        var id = this.htmlFor || label.attr('for');
        if (id && (field = document.getElementById(id))) {
            var control = jQuery(field);
            label.addClass("overlabel-apply");
            if (field.value !== '') {
                label.css("display", "none");
            }
            control.focus(function () {
                label.css("display", "none");
            }).blur(function () {
                if (this.value === '') {
                    label.css("display", "block");
                }
            });
            label.click(function() {
                var label = jQuery(this);
                var field;
                var id = this.htmlFor || label.attr('for');
                if (id && (field = document.getElementById(id))) {
                    field.focus();
                }
            });
        }
    });
};

/* Forms init */
/* ------------------------------------------------------------------- */
function formInit(){
    /* comment-reply-link add btn */
    jQuery('.comment-reply-link').each(function(){
        jQuery(this).addClass('btn');
    });
    
    jQuery("#contactform").validate({
        submitHandler: function(form){
            ajaxContact(form);
            return false;
        }
    });
    jQuery("#commentform").validate({
        submitHandler: function(form){
            ajaxComment(form);
            return false;
        }
    });

    jQuery("label.overlabel").overlabel();
    jQuery('.comment-reply-link').click(function(e){
        e.preventDefault();
        jQuery.ajax({
            type: "POST",
            url: jQuery(this).attr('href'),
            success: function(response){
                jQuery('#comments').html(jQuery(response).find('#comments').html());
                formInit();
            }
        });
    });
    jQuery('#cancel-comment-reply-link').click(function(e){
        e.preventDefault();
        tt_modal(jQuery('#commentform').attr('data-comment-link'));
        var i = setInterval(function(){
            if ($commentResult!=false){
                if($commentResult){
                    jQuery('#comments').html(jQuery($commentResult).find('#comments').html());
                    formInit();
                }
                $commentResult=false;
                clearInterval(i);
            }
        }, 40);
    });
}

/* Flex slider repairing */
/* ------------------------------------------------------------------- */
function mediaSizeRepair(isModalBox){
    $additionalSelector= isModalBox?'.tt-modal-box ':'';
    jQuery($additionalSelector+'.flex-viewport').each(function(){
        $currentFlexViewPort=jQuery(this);
        $currentFlexViewPort.find('li').each(function(){
            jQuery(this).find('a').removeClass('preload');
            jQuery(this).find('img').css({opacity: 1, visibility: 'visible'});
        }).promise().done(function(){ flexResize=true; jQuery(window).resize();});
    });

    jQuery('.jp-audio-container').each(function(){
        jQuery(this).find('.jp-progress-container').width( (jQuery(this).width()-149<0)?0:(jQuery(this).width()-149) );
        jQuery(this).find('.jp-progress').width( (jQuery(this).width()-152<0)?0:(jQuery(this).width()-152) );
    });
}

/* Apple checker */
/* ------------------------------------------------------------------- */
function isIPhone() {return (navigator.platform.indexOf("iPhone")!=-1);}
function isIPad()   {return (navigator.platform.indexOf("iPad")!=-1);}
function isIPod()   {return (navigator.platform.indexOf("iPod")!=-1);}
function isIDevice(){return isIPhone()||isIPad()||isIPod() ;}

/* Mobile checker */
/* ------------------------------------------------------------------- */
var isMobile = {
    Android:    function(){return navigator.userAgent.match(/Android/i) ? true : false;},
    BlackBerry: function(){return navigator.userAgent.match(/BlackBerry/i) ? true : false;},
    iOS:        function(){return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;},
    Windows:    function(){return navigator.userAgent.match(/IEMobile/i) ? true : false;},
    any:        function(){return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());}
};

/* Open Graph Meta */
/* ------------------------------------------------------------------- */
function resetOpenGraphMeta(type){
    if(type=='reset'){
        jQuery('head title').html($ogTitle);
        jQuery("meta[property*=title]")      .attr("content", $ogTitle);
        jQuery("meta[property*=url]")        .attr("content", $ogURL);
        jQuery("meta[property*=image]")      .attr("content", $ogImage);
        jQuery("meta[property*=description]").attr("content", $ogDescription);
    }else{
        jQuery('head title').html(jQuery('article.modaled').attr('data-title'));
        jQuery("meta[property*=title]")      .attr("content", jQuery('head title').html());
        jQuery("meta[property*=url]")        .attr("content", window.location.toString());
        jQuery("meta[property*=image]")      .attr("content", jQuery('.tt-modal-box>.item-single .entry-image img').attr('src') ? jQuery('.tt-modal-box>.item-single .entry-image img').attr('src'):jQuery('article.modaled .entry-image img').attr('src'));
        jQuery("meta[property*=description]").attr("content", jQuery('article.modaled .entry-content>p').html());
    }    
}

/* History push */
/* ------------------------------------------------------------------- */
function tt_history(URL){$hisChanging=true;if(!jQuery.browser.msie){window.history.pushState("", "", URL);}}

/* Location Check */
/* ------------------------------------------------------------------- */
function tt_location_check(){
    $locCheckInt=setInterval( function (){
        $tmpLocation=window.location.toString().split("#")[0];
        if(!($tmpLocation==$currentURL||$tmpLocation+"/"==$currentURL)){
            if($hisChanging){
                $hisChanging=false;
                $currentURL=$tmpLocation;
            }else{
                clearInterval($locCheckInt);
                window.location=$tmpLocation;
            }
        }
    }, 1000 );
}

/* Social Share */
/* ------------------------------------------------------------------- */
function tt_social_share(){
	if(typeof tt_sharethis != 'undefined' && tt_sharethis == 'true') {
		jQuery('head').append("<script type=\"text/javascript\" src=\""+tt_theme_uri+"/js/buttons.js\" gapi_processed=\"true\"></script>");
	}
}

function removeTweeterStyle(){
    /* Remove Tweeter Style */
    setTimeout(function(){jQuery('head link').each(function(){if(jQuery(this).attr('href').search("twitter.com")!=-1){jQuery(this).remove();}});},500);
    setTimeout(function(){jQuery('head link').each(function(){if(jQuery(this).attr('href').search("twitter.com")!=-1){jQuery(this).remove();}});},1500);
}

/* Has Scroll */
/* ------------------------------------------------------------------- */
function hasScroll(el, direction){
    direction = (direction === 'vertical') ? 'scrollTop' : 'scrollLeft';
    var result = !! el[direction];

    if(!result){
        el[direction] = 1;
        result = !!el[direction];
        el[direction] = 0;
    }
    return result;
}

/* Modal margin-top Repair */
/* ------------------------------------------------------------------- */
function modalMarginRepair(){
    if(jQuery(window).height()-jQuery('.tt-modal-box .item-single').height()>0){
        jQuery('.tt-modal-box .item-single').css('margin-top',(jQuery(window).height()-jQuery('.tt-modal-box .item-single').height())/2);
    }else{
        jQuery('.tt-modal-box .item-single').css('margin-top','');
    }
    if($tt_modal_scroll){$tt_modal_scroll.resize();}
}

/* ReWidth Done */
/* ------------------------------------------------------------------- */
function tt_rewidth_done(){
    if($container){$container.isotope('reLayout');}
    /* Nice Scroll */
    if($tt_body_scroll){
        $tt_body_scroll.resize();
    }
    if($tt_modal_scroll){
        $tt_modal_scroll.resize();
    }
    /* Flex slider repairing */
    mediaSizeRepair(jQuery('body').hasClass('noscroll'));
    /* Search Form */
    jQuery('#page #searchform #s').each(function(){
        $width=jQuery(this).closest('div').width();        
        $searchPaddingRL= parseInt(jQuery(this).css('padding-left').replace('px',''))+parseInt(jQuery(this).css('padding-right').replace('px',''));
        $searchMarginRL = parseInt(jQuery(this).css('margin-left').replace('px','')) +parseInt(jQuery(this).css('margin-right').replace('px',''));
        $searchBorderR  = jQuery(this).css('border-right-width')==''?'0':jQuery(this).css('border-right-width');
        $searchBorderL  = jQuery(this).css('border-left-width') ==''?'0':jQuery(this).css('border-left-width');
        $searchBorderRL = parseInt($searchBorderR.replace('px',''))+parseInt($searchBorderL.replace('px',''));
        jQuery(this).width($width-$searchPaddingRL-$searchMarginRL-$searchBorderRL);
    });
}