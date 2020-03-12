jQuery(document).ready(function(){
// TAB PANEL
tabPanel();
});
function tabPanel(){
	
		//Default Action
			jQuery(".contentwrap").hide(); //Hide all content
			jQuery("#tabnav li:first").addClass("active").fadeIn('fast'); //Activate first tab
			jQuery(".contentwrap:first").show(); //Show first tab content
			
			
			//On Click Event
			jQuery("#tabnav li").click(function() {
				jQuery("#tabnav li").removeClass("active"); //Remove any "active" class
				jQuery(this).addClass("active"); //Add "active" class to selected tab
				jQuery(".contentwrap").hide(); //Hide all content
				var activeTab = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
				jQuery(activeTab).stop().fadeIn('fast'); //Fade in the active content
				return false;
			});
			
			jQuery("#startbtn").click(function(){
				jQuery(".contentwrap").hide(); //Hide all content
				jQuery("#tab2").stop().fadeIn('fast'); //Hide all content
				jQuery("#start").addClass("active");
				jQuery("#welcome").removeClass("active");
				return false;						  
												
			});
	
	}