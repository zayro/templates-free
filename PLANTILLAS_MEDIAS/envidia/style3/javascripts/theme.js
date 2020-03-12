Cufon.replace('#menu ul:first>li>a', {
  fontFamily: 'Qlassik Medium',
  hover: 'true'
});
Cufon.replace('h1, h2, h3', {
  fontFamily: 'Qlassik Medium',
  hover: 'true'
});


$(document).ready(function(){
    
  $('form a.submit').click(function(evt){
    $(this).parents('form').get(0).submit();
    evt.preventDefault();
  });


	$("#menu ul li").hover(function(){
    $('ul:first',this).each(function() {
      if ( $(this).parents("ul ul").length==0 ) {
        var center = ( $(this).parent('li').width() - $(this).width() ) / 2
        $(this).css({ left: center });
      }

      $(this).css({visibility: 'visible' });
    });
    
	}, function(){
    $('ul:first',this).css('visibility', 'hidden');
	});
	
  $("#menu ul li ul li ul").parent("li").addClass("submenu");

  $('.slider-gallery').customSlider({ width: 136, distance: 4 });
  var gallery_ul_li_selected = 0;
  $('.slider-gallery ul li').each(function(i, el){

    $('a', el).click(function(event){
      $('#portfolio-big-image').attr('src', $(this).attr('href'));
      
      $('li', $(this).parents('ul')).removeClass('selected');
      $(this).parents('li').addClass('selected');
      
      gallery_ul_li_selected = i;
      
      event.preventDefault();
    });
    
  });

  $('#portfolio-next-image').click(function(event){
    if (gallery_ul_li_selected+1 < $('.slider-gallery ul li a').length) {
      gallery_ul_li_selected++;
    } else {
      gallery_ul_li_selected = 0;
    }
    
    if ( gallery_ul_li_selected % 4 == 0) {
      $('.slider-gallery .right').trigger('click');
    }
    
    var gallery_selected = $('.slider-gallery ul li a').get(gallery_ul_li_selected);
    $('#portfolio-big-image').attr('src', $(gallery_selected).attr('href'));

    $('.slider-gallery ul li').removeClass('selected');
    $(gallery_selected).parents('li').addClass('selected');
    
    event.preventDefault();
  });  
});