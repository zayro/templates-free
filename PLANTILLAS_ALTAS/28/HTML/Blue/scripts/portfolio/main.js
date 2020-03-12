$(document).ready(function() {

  // get the action filter option item on page load
  var $filterType = $('#filterOptions li.active a').attr('class');
	
  // get and assign the ourHolder element to the
	// $holder varible for use later
  var $holder = $('ul.ourHolder');

  // clone all items within the pre-assigned $holder element
  var $data = $holder.clone();

  // attempt to call Quicksand when a filter option
	// item is clicked
	$('#filterOptions li a').click(function(e) {
		// reset the active class on all the buttons
		$('#filterOptions li').removeClass('active');
		
		// assign the class of the clicked filter option
		// element to our $filterType variable
		var $filterType = $(this).attr('class');
		$(this).parent().addClass('active');
		
		if ($filterType == 'all') {
			// assign all li items to the $filteredData var when
			// the 'All' filter option is clicked
			var $filteredData = $data.find('li');
		} 
		else {
			// find all li elements that have our required $filterType
			// values for the data-type element
			var $filteredData = $data.find('li[data-type=' + $filterType + ']');
		}
		
		// call quicksand and assign transition parameters
		$holder.quicksand($filteredData, {
			duration: 800,
			easing: 'easeInOutQuad'
		});
		
		$('.ourHolder li.trigger').find('strong').trigger('mouseenter');
		
		return false;
	});
    
    
    
    
 var $filterType = $('#filterOptionsSelect option.active').attr('value');
	
  // get and assign the ourHolder element to the
	// $holder varible for use later
  var $holder = $('ul.ourHolder');

  // clone all items within the pre-assigned $holder element
  var $data = $holder.clone();

  // attempt to call Quicksand when a filter option
	// item is clicked
	$('#filterOptionsSelect').change(function(e) {
		// reset the active class on all the buttons
		$('#filterOptionsSelect option').removeClass('active');
		
		// assign the class of the clicked filter option
		// element to our $filterType variable
		var $filterType = $(this).attr('value');
		$(this).addClass('active');
		
		if ($filterType == 'all') {
			// assign all li items to the $filteredData var when
			// the 'All' filter option is clicked
			var $filteredData = $data.find('li');
		} 
		else {
			// find all li elements that have our required $filterType
			// values for the data-type element
			var $filteredData = $data.find('li[data-type=' + $filterType + ']');
		}
		
		// call quicksand and assign transition parameters
		$holder.quicksand($filteredData, {
			duration: 800,
			easing: 'easeInOutQuad'
		});
		
		$('.ourHolder li.trigger').find('strong').trigger('mouseenter');
		
		return false;
	});
	
	
	
});

$(document).ready(function(){
            
            $(".ourHolder li").live('click', function(){
                     var id = $(this).attr("data-id");
                     var array = id.split("-");
                     $(".portfolio_one").slideUp(800);
                     setTimeout(function(){
                        $("#portfolio-"+array[1]).slideDown(800);  
                        $('.flexslider').flexslider();
                     }, 1000);
                     $('html, body').animate({
                            scrollTop: $(".protfolioBox_border").offset().top
                     }, 1200,'easeInOutExpo');
            });
            $(".small_PicBox").live({
                mouseenter:
                   function()
                    {
                        $(this).addClass("borderBox");   
        		          $(this).parent().find('.boxHover').addClass("boxHoverSpan");
                    },
                mouseleave:
                    function()
                    {
                        $(this).removeClass("borderBox");    
                $(this).parent().find('.boxHover').removeClass("boxHoverSpan");
                    }
             });
             
        });