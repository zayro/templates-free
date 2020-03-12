<?php
if(function_exists('register_sidebar')){
	register_sidebar(array(
	'before_title'=>'<h3>',
		'after_title'=>'</h3>',
		'before_widget'=>'<div class="syswidget">',
		'after_widget'=>'</div>',
	
	));
register_sidebar(array(
		'name' => 'Home Page',
'id'=>'home_page_widget',
		'description' => __('Select only one widget which will appear on your homepage Sidebar.', 'example'),
	'before_title'=>'<h3>',
		'after_title'=>'</h3>',
		'before_widget'=>'<div class="syswidget">',
		'after_widget'=>'</div>',	
	));
}
if(function_exists('register_sidebar')){
$footerwidgetcount=get_option("footerwidgetcount");
	for($i=1; $i<=$footerwidgetcount; $i++) {
	register_sidebar(array(
	'name' => 'Footer Column' .$i,
		'id'=>'footercolumn'.$i,
		'description' => __('Select only one widget which will appear on your Footer column'.$i, 'example'),
		'before_widget'=>'',
		'after_widget'=>'',
		'before_title'=>'<h3>',
		'after_title'=>'</h3>',
		));

	
	}
}
if ( function_exists('register_sidebar') )
	{		$widgetpages = @implode(",", get_option('pageswidget'));
		 $dynamic_widgets = explode(',',$widgetpages);
		foreach ($dynamic_widgets as $page_name)
		{	
			if($page_name != "")
			register_sidebar(array(
			'name' =>get_the_title($page_name),
			'before_widget'=>'<div class="syswidget">',
			'after_widget'=>'</div>',
			'before_title' => '<h3>', 
			'after_title' => '</h3>', 
			));
		}
	}
	require_once(sys_functions."/widget/contactform.php");
	require_once(sys_functions."/widget/contactinfo.php");
	require_once(sys_functions."/widget/flickr.php");
	require_once(sys_functions."/widget/popularpost.php");
	require_once(sys_functions."/widget/recentpost.php");
	require_once(sys_functions."/widget/sub_navigation.php");
	require_once(sys_functions."/widget/searchform.php");
	require_once(sys_functions."/widget/twitter.php");
	require_once(sys_functions."/widget/advertisement.php");
	require_once(sys_functions."/widget/gmap.php");
?>