<?php
	//check if widget pages are there, then display opted widgets for that page's sidebar, else display default sidebar
	if(is_array($widget_pages_arr=get_option('pageswidget')) && count($widget_pages_arr)>0) {
    //loop thru the widget pages
    foreach ($widget_pages_arr as $widget_pagename) {
      //if current page, get the title	
      if(is_page ($widget_pagename)) {
        $widget_title=get_the_title();//get the title of the widget
      }
    }
    //If current page falls under widget pages, then display sidebar widgets accordingly. Otherwise display default widgets
    if($widget_title) {
      if (function_exists('dynamic_sidebar') && dynamic_sidebar($widget_title) ) : endif;
    } else { 
    if(!function_exists('dynamic_sidebar') || !dynamic_sidebar()) : endif; 
    }
   } else {
    if(!function_exists('dynamic_sidebar') || !dynamic_sidebar()) :	endif;
	}
?>