$(document).ready(function(){
    /**********************************************
    *Tooltip
    **********************************************/
    $("[rel=tooltip]").tooltip();
    /**********************************************
    *Accordions (FAQ)
    **********************************************/
    $(".collapse").collapse();
    /**********************************************
     *Show hidden top area
     **********************************************/
    $(".show_phone_area").click(function(){
        $('#wrapper_phone_area').slideToggle("normal");
    });
    /**********************************************
     *Main slider
     **********************************************/
    var options = {
            nextButton: true,
            prevButton: true,
            autoPlay: true,
            autoPlayDelay: 5000,
            animateStartingFrameIn: true,
            afterLoaded: function(){
                    $("#nav").fadeIn(100);
                    $("#nav li:nth-child("+(sequence.settings.startingFrameID)+") img").addClass("active");
            },
            beforeNextFrameAnimatesIn: function(){
                    $("#nav li:not(:nth-child("+(sequence.nextFrameID)+")) img").removeClass("active");
                    $("#nav li:nth-child("+(sequence.nextFrameID)+") img").addClass("active");
            }
    };

    var sequence = $("#sequence").sequence(options).data("sequence");
    $("#nav li").click(function(){
        if(!sequence.active){
                $(this).children("img").removeClass("active").children("img").addClass("active");
                $(this).removeClass("active").addClass("active");
                sequence.nextFrameID = $(this).index()+1;
                sequence.goTo(sequence.nextFrameID);
        }
    });
    /**********************************************
    *Quotes slider
    **********************************************/
    $('#quotes_area').slides({
                    preload: true,
                    play: 0,
                    pause: 3500,
                    hoverPause: true,
                    slideSpeed: 500,
                    container: 'quotes_slides_container',
                    generatePagination: false,
                    generateNextPrev: true,
                    next: 'quote_next',
                    prev: 'quote_prev'
            });
            $("#quotes_area").hover(function(){
            $('.quote_prev').animate({ 
            opacity: "1"
            },  300 );
            },function(){
            $('.quote_prev').animate({ 
            opacity: 0
            },  200 );
            });
            $("#quotes_area").hover(function(){
            $('.quote_next').animate({ 
            opacity: "1"
            },  300 );
            },function(){
            $('.quote_next').animate({ 
            opacity: 0
            },  200 );
    });
    /**********************************************
    *News slider
    **********************************************/
    $('#slider_news').slides({
        preload: true,
        play: 5000,
        pause: 4500,
        hoverPause: true,
        slideSpeed: 500,
        next: 'slider_news_next',
        prev: 'slider_news_prev',
        generatePagination: false,
        container: 'news_slides_container'
    });  
    /**********************************************
    *Last projects carousel
    **********************************************/
    $('#carousel').elastislide({
        imageW: 160,
        margin: 24,
        border: 0,
        speed : 450
    });
    /**********************************************
    *Scroll to top
    **********************************************/
    $('.scroll_top_a').click(function() {
            $('body,html').animate({
                scrollTop:0
            },1200);
    });
    /**********************************************
    *Projects Portfolio thumbnails
    **********************************************/
    $('.viewport').mouseenter(function() {
        $(this).children('div').children('span').fadeIn(500);
            $('.project_glass').animate({
                marginLeft: "0px"
            }, 500);
    }).mouseleave(function() {
        $(this).children('div').children('span').fadeOut(200);
            $('.project_glass').animate({
                marginLeft: "-300px"
            }, 100);
    });
    /**********************************************
    *Portfolio Classification
    **********************************************/
    // cache container
    var $container = $('.portfolio_container');
    // initialize isotope
    $container.isotope({
        // options...
        itemSelector : ' .viewport',
        layoutMode : 'fitRows'
    });
    // filter items when filter link is clicked
    $('.filters a').click(function(){
        var selector = $(this).attr('data-filter');
        $container.isotope({ filter: selector });
        return false;
    });
    /**********************************************
    *Drop-down menu
    **********************************************/
    $('.navmenu li').hover(function(){
        $(this).find('.submenu').show(200);
    }, function(){
        $(this).find('.submenu').hide(500);
    });
    /**********************************************
    *Current menu's link
    **********************************************/
    $(".navmenu a").each(function() 
    {   
        if (this.href == window.location.href)
        {
            $(this).addClass("active");
        }
    });
    /**********************************************
    *Twitter feed
    **********************************************/
    $(".widget_twitter").tweet({
            username: "2F_webd", //Your twitter name goes here
            join_text: "auto",
            avatar_size: null,
            count: 2,
            auto_join_text_default: null, 
            auto_join_text_ed: null,
            auto_join_text_ing: null,
            auto_join_text_reply: null,
            auto_join_text_url: null,
            loading_text: "loading tweets..."
    });
    /**********************************************
    *Menu displaying only on the phone -- Thanks to Chris Coyier -> http://css-tricks.com/convert-menu-to-dropdown/
    **********************************************/
    // Create the dropdown base
    $("<select />").appendTo("nav.navmenu");

    // Create default option "Go to..."
    $("<option />", {
        "selected": "selected",
        "value"   : "",
        "text"    : "Go to..."
    }).appendTo("nav.navmenu select");

    // Populate dropdown with menu items
    $("nav.navmenu a").each(function() {
    var el = $(this);
    $("<option />", {
        "value"   : el.attr("href"),
        "text"    : el.text()
    }).appendTo("nav.navmenu select");
    });

        // To make dropdown actually work
        // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
    $("nav.navmenu select").change(function() {
        window.location = $(this).find("option:selected").val();
    });
    /**********************************************
    *Pretty photo
    **********************************************/
    $("a[rel^='prettyPhoto']").prettyPhoto({
            animation_speed: 'normal', /* fast/slow/normal */
            slideshow: 5000, /* false OR interval time in ms */
            autoplay_slideshow: false, /* true/false */
            opacity: 0.80, /* Value between 0 and 1 */
            show_title: true, /* true/false */
            allow_resize: true, /* Resize the photos bigger than viewport. true/false */
            default_width: 500,
            default_height: 344,
            counter_separator_label: '/', /* The separator for the gallery counter 1 "of" 2 */
            theme: 'pp_default', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
            horizontal_padding: 20, /* The padding on each side of the picture */
            hideflash: false, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
            wmode: 'opaque', /* Set the flash wmode attribute */
            autoplay: true, /* Automatically start videos: True/False */
            modal: false, /* If set to true, only the close button will close the window */
            deeplinking: true, /* Allow prettyPhoto to update the url to enable deeplinking. */
            overlay_gallery: true, /* If set to true, a gallery will overlay the fullscreen image on mouse over */
            keyboard_shortcuts: true, /* Set to false if you open forms inside prettyPhoto */
            changepicturecallback: function(){}, /* Called everytime an item is shown/changed */
            callback: function(){}, /* Called when prettyPhoto is closed */
            ie6_fallback: true,
            markup: '<div class="pp_pic_holder"> \
                                    <div class="ppt">&nbsp;</div> \
                                    <div class="pp_top"> \
                                            <div class="pp_left"></div> \
                                            <div class="pp_middle"></div> \
                                            <div class="pp_right"></div> \
                                    </div> \
                                    <div class="pp_content_container"> \
                                            <div class="pp_left"> \
                                            <div class="pp_right"> \
                                                    <div class="pp_content"> \
                                                            <div class="pp_loaderIcon"></div> \
                                                            <div class="pp_fade"> \
                                                                    <a href="#" class="pp_expand" title="Expand the image">Expand</a> \
                                                                    <div class="pp_hoverContainer"> \
                                                                            <a class="pp_next" href="#">next</a> \
                                                                            <a class="pp_previous" href="#">previous</a> \
                                                                    </div> \
                                                                    <div id="pp_full_res"></div> \
                                                                    <div class="pp_details"> \
                                                                            <div class="pp_nav"> \
                                                                                    <a href="#" class="pp_arrow_previous">Previous</a> \
                                                                                    <p class="currentTextHolder">0/0</p> \
                                                                                    <a href="#" class="pp_arrow_next">Next</a> \
                                                                            </div> \
                                                                            <p class="pp_description"></p> \
                                                                            {pp_social} \
                                                                            <a class="pp_close" href="#">Close</a> \
                                                                    </div> \
                                                            </div> \
                                                    </div> \
                                            </div> \
                                            </div> \
                                    </div> \
                                    <div class="pp_bottom"> \
                                            <div class="pp_left"></div> \
                                            <div class="pp_middle"></div> \
                                            <div class="pp_right"></div> \
                                    </div> \
                            </div> \
                            <div class="pp_overlay"></div>',
            gallery_markup: '<div class="pp_gallery"> \
                                                    <a href="#" class="pp_arrow_previous">Previous</a> \
                                                    <div> \
                                                            <ul> \
                                                                    {gallery} \
                                                            </ul> \
                                                    </div> \
                                                    <a href="#" class="pp_arrow_next">Next</a> \
                                            </div>',
            image_markup: '<img id="fullResImage" src="{path}" />',
            flash_markup: '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="{width}" height="{height}"><param name="wmode" value="{wmode}" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="{path}" /><embed src="{path}" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="{width}" height="{height}" wmode="{wmode}"></embed></object>',
            quicktime_markup: '<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" height="{height}" width="{width}"><param name="src" value="{path}"><param name="autoplay" value="{autoplay}"><param name="type" value="video/quicktime"><embed src="{path}" height="{height}" width="{width}" autoplay="{autoplay}" type="video/quicktime" pluginspage="http://www.apple.com/quicktime/download/"></embed></object>',
            iframe_markup: '<iframe src ="{path}" width="{width}" height="{height}" frameborder="no"></iframe>',
            inline_markup: '<div class="pp_inline">{content}</div>',
            custom_markup: '',
            social_tools: 'false'
    });
    /**********************************************
    *Second slider in home4
    **********************************************/
    $('#slider2').slides({
        preload: true,
        play: 3800,
        pause: 4500,
        hoverPause: true,
        slideSpeed: 500,
        generatePagination: true,
        paginationClass: 'slider2_pagination',
        container: 'slider2_container',
        animationStart: function(current){
                $('.caption').animate({
                        bottom:-2000
                },100);
                if (window.console && console.log) {
                        // example return of current slide number
                        console.log('animationStart on slide: ', current);
                };
        },
        animationComplete: function(current){
                $('.caption').animate({
                        bottom:0
                },200);
                if (window.console && console.log) {
                        // example return of current slide number
                        console.log('animationComplete on slide: ', current);
                };
        },
        slidesLoaded: function() {
                $('.caption').animate({
                        bottom:0
                },200);
        }
    }); 
});