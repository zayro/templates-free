  $(document).ready(function() {
	   
    // CONTACT FORM 
  	$('#contactform').ajaxForm({
     	target: '#error',
     	beforeSubmit: function() {	
        $('#error span').remove();
        $('#error').append('<p class="loading">Please wait...</p>');
  		},
  		success: function() {
  			$('#error p.loading').fadeOut();
  			$('#error').fadeIn('slow');
  		}
    });	
            
	});	
	