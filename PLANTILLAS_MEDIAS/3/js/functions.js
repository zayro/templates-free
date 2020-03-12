  $(document).ready(function() {

    
    /* Dropdown Menu */    
    ddsmoothmenu.init({
     mainmenuid: "mainnav", //menu DIV id
     orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
     classname: 'ddsmoothmenu', //class added to menu's outer DIV
     //customtheme: ["#1c5a80", "#18374a"],
     contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })
    
    /* Animate Portfolio Items */
    if ($.browser.msie && $.browser.version < 7) return;
    $(".imgportfolio").fadeTo(1, 1);
    $(".imgportfolio").hover(
      function () {
        $(this).fadeTo("fast", 0.66);
      },
      function () {
        $(this).fadeTo("slow", 1);
      }
    );
    
    
    /* initialize prettyphoto */
    $("a[rel^='prettyPhoto']").prettyPhoto({
      allowresize: true,
  		theme: 'light_rounded'
    });
    
    /* Cufon Setting*/
    Cufon.replace('h1,h2,h3,h4,h5', {hover: 'true'});
	   
            
	});	
	