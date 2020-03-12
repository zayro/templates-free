var slideDown = false;
var slideObj = null;
var animating = false;

$(document).ready(function(){
    
    if ($('#tabs-container').length)
        $('#tabs-container').tabs({ fxFade: true, fxSpeed: '500' });
    if ($('.colorbox-trigger').length) 
        $(".colorbox-trigger").colorbox({slideshow:true});
    
    
    $("#contact-form input.button").mouseover(function() { 
        $(this).css('background-position','left bottom'); 
    });
    $("#contact-form input.button").mouseout(function() { 
        $(this).css('background-position','left top'); 
    });
    
  $("#main-menu li[class!='active'] .menu ul").hide();
  $("#main-menu li[class!='active'] .player").hide();
  $("#main-menu li[class!='active'] .overlay").hide();
  $("#main-menu li[class!='active'] .overlay_1").hide();
  $("#main-menu li[class!='active'] .overlay_2").hide();
  
  if($("#mm-1").hasClass("active")) { slideObj = 1; slideDown = true; $("#main-menu").addClass("slideDown"); }
  if($("#mm-2").hasClass("active")) { slideObj = 2; slideDown = true; $("#main-menu").addClass("slideDown"); }
  if($("#mm-3").hasClass("active")) { slideObj = 3; slideDown = true; $("#main-menu").addClass("slideDown"); }

  $("#mm-1>a").click(function() { toggleMenu1(); return false; });
  $("#mm-2>a").click(function() { toggleMenu2(); return false; });
  $("#mm-3>a").click(function() { toggleMenu3(); return false; });
  
  
  // paticka
  $("#foot-close").click(function() { toggleFoot(); this.blur(); return false;});
  fancy_list('fancy_list', 'fancy_list_item');
  fancy_list('fancy_list_1', 'fancy_list_item');
  fancy_list('fancy_list_2', 'fancy_list_item');
  
  // cluetip
  $(".tooltip").cluetip({
    splitTitle: '|',
    width: '141px',
    showTitle: false,
    tracking: true,
    dropShadow: false,
    cluetipClass: 'breezy',
    topOffset: 25,
    leftOffset: -15,
    positionBy: 'mouse',
    dropShadow: false,
    fx: {
      open: 'fadeIn',
      openSpeed: ''
    }
  });

  // odkaz v Kontaktech
  $('#contact-send-message-link').click(function(){toggleFoot()});
});

function toggleFoot(skipAnimation) {
  if($("#foot .formBox").hasClass("hidden")) {
    $("#foot .closed ul").hide();
    if(skipAnimation) {
      $("#foot .formBox").removeClass("hidden").css('height', '260px');
    } else {
      $("#foot .formBox").removeClass("hidden").animate({ height: '260px' }, 600);
    }
  } else {
    if(skipAnimation) {
      $("#foot .formBox").css('height' ,'0px');
      $("#foot .formBox").addClass("hidden");
      $("#foot .closed ul").show();
    } else {
      $("#foot .formBox").animate({ height: '0px' }, 600, "", function() {
        $("#foot .formBox").addClass("hidden");
        $("#foot .closed ul").show();
      });
    }
  }
}

function toggleMenu1() {
  if(!$("#mm-1").hasClass("active")) {
    if(animating) return false;
    
    // probiha animace
    animating = true;
    
    // overime, za neni otevreno jine menu
    if($("#mm-2").hasClass("active")) toggleMenu2();
    if($("#mm-3").hasClass("active")) toggleMenu3();
    
    // nastavime oteviraci object
    slideObj = 1;
    slideDown = true;
  
    $("#mm-1").addClass("active_js");
    $("#mm-1 .menu").animate({ height: '160px' }, 600, "", function(){
      $("#mm-1 ul").show();
      if(slideDown) $("#main-menu").addClass("slideDown");
      $("#mm-1 .overlay").animate({ width: '670px' }, 600, "", function(){
        $("#mm-1").addClass("active");
        $("#mm-1 .player").fadeIn();
        animating = false;
      });;
    });
  } else {
    $("#mm-1 .player").hide();
    $("#mm-1 .overlay").animate({ width: 0 }, 200, "", function(){
      $("#mm-1 ul").hide();
      
      if(slideObj == 1) {
        $("#main-menu").removeClass("slideDown");
        slideDown = false;
      }
      
      $("#mm-1 .menu").animate({ height: '22px' }, 600, "", function(){
        $("#mm-1").removeClass("active_js");
        $("#mm-1").removeClass("active");
      });
    });
  }
}

function toggleMenu2() {
  if(!$("#mm-2").hasClass("active")) {
    if(animating) return false;

    // probiha animace
    animating = true;
    
    // overime, za neni otevreno jine menu
    if($("#mm-1").hasClass("active")) toggleMenu1();
    if($("#mm-3").hasClass("active")) toggleMenu3();
    
    // nastavime oteviraci object
    slideObj = 2;
    slideDown = true;
  
    $("#mm-2").addClass("active_js");
    $("#mm-2 .menu").animate({ height: '160px' }, 600, "", function(){
      $("#mm-2 ul").show();
      if(slideDown) $("#main-menu").addClass("slideDown");
      $("#mm-2 .overlay_1").animate({ width: '335px' }, 600);
      $("#mm-2 .overlay_2").animate({ width: '335px' }, 600, "", function(){
        $("#mm-2").addClass("active");
        $("#mm-2 .player").fadeIn();
        animating = false;
      });;
    });
  } else {
    $("#mm-2 .player").hide();
    $("#mm-2 .overlay_1").animate({ width: 0 }, 200);
    $("#mm-2 .overlay_2").animate({ width: 0 }, 200, "", function(){
      $("#mm-2 ul").hide();
      
      if(slideObj == 2) {
        $("#main-menu").removeClass("slideDown");
        slideDown = false;
      }
      
      $("#mm-2 .menu").animate({ height: '22px' }, 600, "", function(){
        $("#mm-2").removeClass("active_js");
        $("#mm-2").removeClass("active");
      });
    });
  }
}

function toggleMenu3() {
  if(!$("#mm-3").hasClass("active")) {
    if(animating) return false;

    // probiha animace
    animating = true;
    
    // overime, za neni otevreno jine menu
    if($("#mm-1").hasClass("active")) toggleMenu1();
    if($("#mm-2").hasClass("active")) toggleMenu2();
    
    // nastavime oteviraci object
    slideObj = 3;
    slideDown = true;
    
    $("#mm-3").addClass("active_js");
    $("#mm-3 .menu").animate({ height: '160px' }, 600, "", function(){
      $("#mm-3 ul").show();
      if(slideDown) $("#main-menu").addClass("slideDown");
      $("#mm-3 .overlay").animate({ width: '670px' }, 600, "", function(){
        $("#mm-3").addClass("active");
        $("#mm-3 .player").fadeIn();
        animating = false;
      });
    });
  } else {
    $("#mm-3 .player").hide();
    $("#mm-3 .overlay").animate({ width: 0 }, 200, "", function(){
      $("#mm-3 ul").hide();
      
      if(slideObj == 3) {
        $("#main-menu").removeClass("slideDown");
        slideDown = false;
      }
      
      $("#mm-3 .menu").animate({ height: '22px' }, 600, "", function(){
        $("#mm-3").removeClass("active_js");
        $("#mm-3").removeClass("active");
      });
    });
  }
}

function fancy_list(id, trida){
    $('#'+id + ' .' + trida + ' a' ).click(function() {
     parent_item = $(this).parent();
     item_overlay(parent_item, trida);

     return false;
    });
}

function item_overlay(parent_item, trida){
     var title = parent_item.children('.fancy_list_heading').html();
     var text = parent_item.children('.fancy_list_text').html();    
     var prev = parent_item.prev('.' + trida).children('a').html();
     var next = parent_item.next('.' + trida).children('a').html();
     var button = new Array(); 

     if(next)
      button[2] = {'text':next, 'link': '#', 'classes': 'fr next'};

     if(prev)
      button[1] = {'text':prev, 'link': '#', 'classes': 'fl prev'};

     showOverlay(title, text, button);
     
     $('#overlay .fancy-navi .prev').click(function() {
      if(parent_item.prev())
       item_overlay(parent_item.prev(), trida);
      return false;    
     });
     
     $('#overlay .fancy-navi .next').click(function() {
      if(parent_item.prev())
       item_overlay(parent_item.next(), trida);
      return false;     
     });          
}


function closeMenu(obj)
{
  $(obj).parents("li").removeClass("active");
  $(obj).parents("li").find(".menu").slideUp("normal");
  $(obj).parents("li").find(".overlay").hide("normal");
}

function showOverlay(title, text, buttons) {
  if(!$('#overlay').length) {
    // generate HTML code
    var html = '<div id="overlay" class="fancy fancyText lightbox">'+
               '<div class="overlay"></div>'+
               '<div class="in">'+
                  '<div class="fancy-top"></div>'+
                  '<div class="fancy-content">'+
                    '<h3></h3>'+
                    '<div class="msg">'+
                      '<p></p>'+
                    '</div>' +
                    '<a href="#" class="overlaid close xclose">ZavÅ™Ã­t<span></span></a>'+
                  '</div>'+
                  '<div class="fancy-navi buttons"><ul></ul></div>'+
                  '<div class="fancy-bottom"></div>'+
                '</div>'+
               '</div>';

    $('body').append(html);

    $('#overlay').click(function() {
      hideOverlay();
    });

    $('#overlay .in').click(function(event) {
      event.stopPropagation();
      return;
    });
  }

  // remove all old buttons
  $('#overlay .buttons ul li').remove();

  if(buttons) {
    // custom buttons
    for(button in buttons) {
      var cssClass = '';
      if(buttons[button].close) {
        cssClass = ' xclose';
      }

      if(!buttons[button].link)
        buttons[button].link = '';
        
      if(!buttons[button].classes)
        buttons[button].classes = '';

      $('#overlay .buttons ul').append('<li><a class=" '+buttons[button].classes +cssClass+'" href="'+buttons[button].link+'">'+buttons[button].text+'</a></li>');
    }
  } else {
    // default button
    $('#overlay .buttons').html('<a class="button button-overlay xclose fr"><span><span>OK</span></span></a>');
  }

  // add actions to close buttons
  $('#overlay a.xclose').click(function(event) {
    hideOverlay();
    event.stopPropagation();
    return false;
  });

  // reset css
  $('#overlay .in').css('height', 'auto');

  // show title & text
  $('#overlay .in h3').text(title);
  $('#overlay .in .msg').html(text);

  // show overlay
  $('#overlay').show();

  // calculate position of the box
  $('#overlay .in').css('top', $(document).scrollTop() + Math.round($(window).innerHeight()/2)-Math.round($('#overlay .in').innerHeight()/2));

  return false;
}

function hideOverlay() {
  $('#overlay').hide();
}