$(document).ready(function(){
	$("#menutop li").hover(function() {
		$(this).children("div").animate({opacity: "show", top: "23"}, "slow");
	}, function() {
		$(this).children("div").animate({opacity: "show", top: "23"}, "slow");
	});
});