// Superfish Menu


jQuery(document).ready(function(){	
	jQuery('#slider .images')
	jQuery(window).load(function () {
	
			jQuery('#slider-wrapper .loading').removeClass('loading');
			jQuery('#slider').css('display','block');
			jQuery('#slider .images').animate({'opacity':1},300);

		})
});

/*browserfix*/

jQuery(document).ready(function(){
if(jQuery.browser.opera)
	jQuery('.homeRacent .category a, .blogpostcategory .meta .category a, .item4 h4 a,.blogpost .author a,#portitems2 .category a,.blogpost .posted-date a,.blogpost .tags a,.portcategories a').css('line-height','1px');

});
	
jQuery(document).ready(function(){
//<![CDATA[
jQuery(".zoom a").append("<span></span>");
//]]>
/*jQuery(".zoom img, .widget-pics img, .widgett img, .flickr_badge_image img, .blogimg img ").hover(function(){
jQuery(this).fadeTo(700, 0.5); 
},function(){
jQuery(this).fadeTo(700, 1.0); 
	});*/
});

jQuery(document).ready(function(){
	jQuery('ul.menu > li').hover(function(){
		jQuery(this).find('ul').stop(true,true).fadeIn(300);

	},
	  function () {
		jQuery(this).find('ul').stop(true,true).fadeOut(300);
	  });
	
});

jQuery(document).ready(function(){
jQuery(".gallery a").attr("rel", "lightbox[gallery]");

});

/*to top*/

jQuery(document).ready(function($){
	$(".totop ").hide();

});

jQuery(window).bind('scroll', function(){
if(jQuery(this).scrollTop() > 200) 
 jQuery(".totop ").fadeIn(200);
else
 jQuery(".totop ").fadeOut(200);
 
if(jQuery(this).scrollTop() > 5) 
 jQuery("#headerwrap").addClass('headerwrapdown');
else
 jQuery("#headerwrap").removeClass('headerwrapdown');

});


jQuery(document).ready(function(){
	jQuery(function() {
		jQuery( ".accordion" ).accordion({
			autoHeight: false,
			navigation: true
		});
	});
	jQuery(function() {
		jQuery( ".progressbar" ).progressbar();
	});

});
function loadprety(){

jQuery(".gallery a").attr("rel", "lightbox[gallery]").prettyPhoto({theme:'light_rounded',overlay_gallery: false,show_title: false});

}
				


jQuery(document).ready(function(){	
	
jQuery('.image').each(function(index,el){
          
       //find this link's child image element
      var img = jQuery(this).find('img');
	  var loading = jQuery(this).children('div');
      //hide the image and attach the load event handler
	  jQuery('.overlink').hide();
	  jQuery('.overgallery').hide();
	  jQuery('.overvideo').hide();
	  jQuery('.overdefult').hide();	  
	  jQuery('.overport').hide();  
	  
      jQuery(img).hide();
	  jQuery(window).load(function () {
            //remove the link's "loading" classname
            //loading.removeClass('loading');
			jQuery('.one_half').find('.loading').attr('class', '');
			jQuery('.one_third').find('.loading').attr('class', '');			
			jQuery('.item').find('.loading').attr('class', '');
			jQuery('.item4').find('.loading').attr('class', '');
			jQuery('.item3').find('.loading').attr('class', '');	
			jQuery('.image').css('background', 'none');
			jQuery('.recentimage').css('background', 'none');	
		
            //show the loaded image
           jQuery(img).fadeIn();
		   var height = img.parents('.one_fifth').height() ;
		   height = height + 10;
		   img.parents('.one_fifth').css("height", height)
		   jQuery('.overlink').show();
		  jQuery('.overgallery').show();
		  jQuery('.overvideo').show();
		  jQuery('.overdefult').show();	  
		  jQuery('.overport').show();	  
      })

	});

});



jQuery(document).ready(function(){	
	jQuery('.blogpostcategory').each(function(index,el){
			  
		   //find this link's child image element
		  var iframe = jQuery(this).find('iframe');
		  var loading = jQuery(this).children('div');
		  //hide the image and attach the load event handler
		  jQuery(iframe).hide();
		  jQuery(window).load(function () {
			   
				//remove the link's "loading" classname
				loading.removeClass('loading');
				
				//show the loaded image
			   jQuery(iframe).fadeIn();
		  })
	});
});



			
jQuery(document).ready(function() {	

	jQuery(".toggle_container").hide(); 

	jQuery("h2.trigger").click(function(){
		jQuery(this).toggleClass("active").next().slideToggle("slow");
	});
});	

jQuery(document).ready(function(){	
	jQuery(function() {
	jQuery(".tabs").tabs(".panes > div");
	});
	
	
});

jQuery(document).ready(function(){	
	function getCookie(c_name)
	{
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++)
	{
	  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	  x=x.replace(/^\s+|\s+$/g,"");
	  if (x==c_name)
		{
		return unescape(y);
		}
	  }
	}



	jQuery('#close').click(function() {
	if(jQuery('#close').hasClass('close')){
		jQuery(this).attr('class','open'); 		
		jQuery('.notification').animate({'margin-top':'-=25px'},200);		
		jQuery('#close').animate({'margin-top':'-=10px'},200);	
	}
	else{
		jQuery(this).attr('class','close'); 	
		jQuery(this).html('');
		jQuery('.notification').animate({'margin-top':'+=25px'},200);	
		jQuery('#close').animate({'margin-top':'+=10px'},200);	
	
	}
	});
});


jQuery(document).ready(function(){	
	jQuery('.gototop').click(function() {
		jQuery('html, body').animate({scrollTop:0}, 'medium');
	});
});

jQuery(document).ready(function(){	
	jQuery('#searchsubmit').val('');
	var screenWidth = screen.availWidth;
	document.cookie="pmcwidth="+screenWidth+";path=/";
});

jQuery(document).ready(function(){	
	jQuery('#remove h2 a:first-child').attr('class','catlink catlinkhover');
	jQuery('.catlink').click(function() {
		jQuery('#remove h2 a').attr('class','catlink');
		jQuery(this).attr('class','catlink catlinkhover');
	});	
});



jQuery(function(){
    jQuery("ul#ticker01").liScroll();
});




	
