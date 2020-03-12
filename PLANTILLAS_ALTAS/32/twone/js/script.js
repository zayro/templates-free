jQuery(document).ready(function($){

	//Slider--------------------------------------------
	$(window).load(function() {
    	$('.flexslider').flexslider({
          controlsContainer: "#table-show-item-nav",
          controlNav: true,
          directionNav: false, 
          animation: "fade",
          manualControls: "#table-show-item-nav li a",
          pauseOnHover: true,
          touch: true,
          prevText: "",
          nextText: "",
          slideshowSpeed: 7000,
        });
    });
	
		
	//Clouds--------------------------------------------
	$(function () {
	 function cloudRunRapid() {
	    $('#bgs li.rapid').show(1)
	    	.css("left","-25%")
	    	.animate({left: '100%'}, 70000, 'linear')
	    	.animate({left: '-100%'}, 1)
	    	.animate({left: '100%'}, 70000, 'linear')  
	    	.hide(1, cloudRunRapid);
	   }
	   
	   cloudRunRapid();
	});
	
	$(function () {
	 function cloudRunStatic() {
	    $('#bgs li.static').show(1)
	    	.animate({right: '100%'}, 100000, 'linear')
	    	.animate({right: '-100%'}, 1)
	    	.animate({right: '100%'}, 100000, 'linear')  
	    	.hide(1, cloudRunStatic);
	   }
	   
	   cloudRunStatic();
	});

  		
  		
  	  //Tweets--------------------------------------------
	  $(".tweet").tweet({
	      username: "Y_did_u",
	      page: 1,
	      avatar_size: 0,
	      count: 20,
	      loading_text: "Loading ..."
	    }).bind("loaded", function() {
	      var ul = $(this).find(".tweet_list");
	      var ticker = function() {
	        setTimeout(function() {
	          var top = ul.position().top;
	          var h = ul.height();
	          var incr = (h / ul.children().length);
	          var newTop = top - incr;
	          if (h + newTop <= 0) newTop = 0;
	          ul.animate( {top: newTop}, 700 );
	          ticker();
	        }, 5500);
	      };
	      ticker();
	    });
	    
	    
	    
	    //Form--------------------------------------------
	    $("#contact_form").submit(function(e){
		e.preventDefault();
		var boxval = $('#contact_form').serialize();
		var email=$('#email').val();
		
		if((!isValidEmailAddress( email )) || (email=='')) { 
			$('#submit').fadeOut();
			$('#email').fadeOut("fast", function() {
				$('.msg_error').fadeIn( function() {
					setTimeout(function() {
						
						$('.msg_error').fadeOut("fast", function() {
							$("#email").fadeIn();
							$("#email").focus();
						});
						$("#submit").fadeIn();
						
					},2500);
				});
			});
		}
		else {
			$.ajax({
				type: "POST",
				url: "phpmail.php",
				data: boxval,
				cache: false,
				success: function(html, response) {
					$('#submit').fadeOut();
					$('#contact_form .left, #contact_form .clearfix').fadeOut();
					$('#email').fadeOut("fast", function() {
						$('#email').val('');
						$('.msg_success').fadeIn();
					});
	
				}
			});
		}
		});
		
		
		/*Function to determine if the subscriber email is correctly formed */
		function isValidEmailAddress(emailAddress) {
	    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	    return pattern.test(emailAddress);
	};

});
