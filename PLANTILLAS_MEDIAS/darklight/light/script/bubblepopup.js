$(document).ready(function(){
	$("#menutop li").hover(function() {
		$(this).children("div").animate({opacity: "show", top: "21"}, "slow");
	}, function() {
		$(this).children("div").animate({opacity: "show", top: "21"}, "slow");
	});
});