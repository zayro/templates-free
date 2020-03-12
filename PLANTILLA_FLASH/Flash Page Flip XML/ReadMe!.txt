FLASH PAGE FLIP DOCUMENTATION (Basic-Xml Version)

www.FlashPageFlip.com

//////////////////////////////////////////////////

ADD PAGES
---------
Please refer to included XML file to see examples.


PAGE ONVISIBLE
--------------
Place functions called onVisible and onInvisible in your page SWFs.

function onVisible() {
	trace("Just turned to this page!");
}

function onInvisible() {
	trace("Just left this page!");
}


GO TO PAGE NUMBER
-----------------
To use the links on pages, please refer to the sample file (02.fla) in the "/Source" folder.
Place following code in your buttons actions.

on(rollOver, dragOver){
	_root.canflip=false; // flipping disabled
}
on(rollOut, dragOut, releaseOutside){
	_root.canflip=true; // flipping enabled
}
on(release){
	_root.canflip=true; // flipping active
	_root.gotoPage(8,true); // go to page (8 is page number, true is directly go to page number, use false for flipping animation)
}


USE LINKS
---------
To use the links on pages, please refer to the sample file (11.fla) in the "/Source" folder.
Place following code in your buttons actions.

on(rollOver, dragOver){
	_root.canflip=false; // flipping disabled
}
on(rollOut, dragOut, releaseOutside){
	_root.canflip=true; // flipping enabled
}
on(release){
	_root.canflip=true; // flipping enabled
	getURL("http://www.google.com", target="_blank"); // open link in new window
}


USE ANIMATIONS
--------------
To use the animations on pages, please refer to the sample file (09.fla) in the "/Source" folder.


USE VIDEO
---------
To include video, please refer to the sample file (07.fla) in the "/Source" folder. The video doesn't have to be embedded on the timeline as I've shown (dynamically loading an FLV or SWF would work fine too) but the key is that the video CAN'T start on the first frame.  This WILL cause problems.  I'd recommend using the onVisible and onInvisible functions mentioned above to control the video playback.


CHANGE COLORS
-------------
To change the colors of flash page flip, please edit to Pages.xml file in the "xml" folder.
Please specify to following variables hexadecimal codes of your selected colors.

bgcolor="cccccc" loadercolor="ffffff" bgimage="2" panelcolor="5d5d61" buttoncolor="5d5d61" textcolor="d0e5f7"


CHANGE LANGUAGE
---------------
To change the language of flash page flip, please edit to Lang.txt file in the "txt" folder.


TELL A FRIEND
-------------
If you want to use PHP script instead ASP script please use following parameters on your embed code in your html file and please edit your Config.asp or Config.php file.

<body><script type="text/javascript">
AC_FL_RunContent( 'codebase','http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0','width','100%','height','100%','src','swf/Magazine','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','bgcolor','#cccccc','allowFullScreen','true','allowScriptAccess','sameDomain','movie','swf/Magazine?xmlFile=xml/Pages.xml&tafFile=SendToFriend.php' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%">
  <param name="movie" value="swf/Magazine.swf?xmlFile=xml/Pages.xml&tafFile=SendToFriend.php" />
  <param name="quality" value="high" />
  <param name="bgcolor" value="#cccccc" />
  <param name="allowFullScreen" value="true" />
  <param name="allowScriptAccess" value="sameDomain" />
  <embed src="swf/Magazine.swf?xmlFile=xml/Pages.xml&tafFile=SendToFriend.php" width="100%" height="100%" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" allowFullScreen="true" allowScriptAccess="sameDomain"></embed>
</object></noscript></body>

SUPPORT
-------
support@flashpageflip.com