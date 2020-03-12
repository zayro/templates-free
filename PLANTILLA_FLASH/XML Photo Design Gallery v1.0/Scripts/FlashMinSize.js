/*

DO NOT EDIT THIS! To change the Minimum Sizing functionality, edit it in flash.js.

*/

// ----------------- Begin Main Function -------------------

function setMinimums(id, minW, minH)
{
	fl = getFlash(id);
	mW = minW;
	mH = minH;
	
	window.onresize = drawSwf;
	drawSwf();
}

// ----------------- End Main Function -------------------



var isNetscape  = navigator.appName.indexOf("Netscape")  != -1;
var isMicrosoft = navigator.appName.indexOf("Microsoft") != -1;
var isSafari    = navigator.appVersion.indexOf("Safari") != -1;

var fl;
var mW;
var mH;

function getFlash(movieName)
{
	if (isSafari)
		return window[movieName];
	else if (isMicrosoft)
		return window[movieName];
	else if (isNetscape)
		return document[movieName][1];
	else
		return document[movieName];
}

function drawSwf()
{
	width  = isNetscape ? window.innerWidth  : document.body.clientWidth;
	height = isNetscape ? window.innerHeight : document.body.clientHeight;
	
	fl.style.width  = width  > mW ? "100%" : mW + "px";
	fl.style.height = height > mH ? "100%" : mH + "px";
}