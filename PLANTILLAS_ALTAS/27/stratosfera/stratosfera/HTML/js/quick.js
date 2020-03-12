// DOMContentLoaded
$(function() {

  // bind radiobuttons in the form
  var $filterType = $('.filter li a');

  // get the first collection
  var $applications = $('#list');

  // clone applications to get a second collection
  var $data = $applications.clone();

  // attempt to call Quicksand on every form change
	$filterType.click(function(e) {
		$('.filter li a').removeClass('selected');
		$(this).addClass('selected');
		if ($(this).attr('id') == 'all') {
		  var $filteredData = $data.find('li');
		} else {
		  var $filteredData = $data.find('li[class=' + $(this).attr('id') + ']');
		}

		// finally, call quicksand
		$applications.quicksand($filteredData, {
			duration: 800,
			easing: 'easeInOutQuad',
			attribute: 'id'
		}, function() {
			preparingMagnificGlass();
			$("a[rel^='prettyPhoto']").prettyPhoto({ animationSpeed:'slow',theme:'facebook',slideshow:2000});
		});
	});
});