/*

This file will write the flash using the AC_FL_RunContent. The
way things are set up, it will write the swf to be full browser.
To change that, you can change the width and height settings from
100% to the values you desire.

*/




AC_FL_RunContent
( 
	'codebase','http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,45,0',
	'width','100%',
	'height','100%',
	'id','Main',
	'align','middle',
	'src','Main.swf',
	'quality','high',
	'bgcolor','#FFFFFF',
	'name','Main',
	'allowscriptaccess','always',
	'allowFullScreen','true',
	'pluginspage','http://www.macromedia.com/go/getflashplayer',
	'movie','Main'
);
                

/*

This function call sets the minimum size the browser can go without
scrollbars, otherwise, since the flash just adjusts itelf to the window
size, it would never scroll, and it could be too small to use, this
way if thats the case the scroll bars kick on. To change the settings,
the second argument is the minimum width, the third is the minimum height,
and do not edit the first, it tells javascript how to find the flash.

*/

setMinimums("Main", 800, 600);