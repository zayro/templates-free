var $slider_type = jQuery("meta[name=slider_type]").attr('content');
var $nivo_slider_effect = jQuery("meta[name=nivo_slider_effect]").attr('content');
var $slider_url = jQuery("meta[name=slider_url]").attr('content');
if($slider_type == 'nivo_slider')
	{
	$(window).load(function() {
		$('#slider').nivoSlider({
		effect:$nivo_slider_effect, // sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft, fold, fade, random
		animSpeed:500,
		pauseTime:3000,
		directionNav:false, //Next and Prev
		directionNavHide:false, //Only show on hover
		controlNav:true, //1,2,3...
		pauseOnHover:false, //Stop animation while hovering
		beforeChange: function(){},
		afterChange: function(){}
		});
	});
}
