$(document).ready(function(){
    
    /**********************************************
    *Scroll to top
    **********************************************/
    $('.scroller').click(function() {
            $('body,html').animate({
                scrollTop:0
            },600);
    });
	/**********************************************
    *Make code pretty
    **********************************************/
    window.prettyPrint && prettyPrint()
	
	/**********************************************
    *Class active
    **********************************************/
	$("#table a").click(function() {
		$("#table a").each(function(){
			$(this).removeClass("active");
		});
		$(this).addClass("active");
	});
});