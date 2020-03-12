// Start the dropdown menu
(function($){
	$(document).ready(function() { 
        $('ul.sf-menu').superfish({ 
            delay: 200,												// delay on mouseout
            animation: {opacity:'show',height:'show'},
            autoArrows: false,										// disable generation of arrow mark-up 
            dropShadows: false,									// disable drop shadows 
            speed: "fast"
        });
    });
    })(jQuery); 
// Move dropdown links on hover
	(function($){
	$(document).ready(function(){

		$(".sf-menu ul a").css({
			paddingLeft: "15px",
			backgroundPosition: "0px 12px"
			});
		$(".sf-menu ul a").hover(function() {
		$(this).stop().animate({
			paddingLeft: "25px",
			backgroundPosition: "10px 12px"
			}, 'fast');
		}, function() {
		$(this).stop().animate({
			paddingLeft: "15px",
			backgroundPosition: "0px 12px"
			}, 'fast');
		});
	});
	})(jQuery); 
// Set background of dropdown to 90% opacity - fix for IE naturally.

	$(document).ready(function(){
		$(".sf-menu li ul").css({
						
			});
		
		});
//---------------------------------------------

//--------------------------------------------

