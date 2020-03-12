/**
*
* MD PortfolioSite - Portfolio Script [build2.0]
* Copyright (c) 2007 D. Molanphy, Molanphy Design
* 
* This software may be used in personal and commercial projects provided the 
* source code retains the above copyright notice.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
* NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*
* This script handles all portfolio functions for the site. You shouldn't need to change anything in here,
* unless of course, you're feeling like geeking out a bit.
* 
*
*/
#include "portfolio_subNav.as"


//=========================================================================================
//------ Private Variables - Don't Change
//=========================================================================================
var portfolioNeedsReset:Boolean;
var portfolioOpen:Boolean;
var currentPortfolio:MovieClip;
var portfolio_obj:Object = new Object();
var spacer:Number = 26;
var blackdropOpen:Boolean;
var portfolioDelay:Number;




//=========================================================================================
//------ Function to Initialize Portfolio 
//=========================================================================================
function initPortfolio():Void {
	if (subNav.length > 1) {
		portfolioDelay = 0;
		buildSubNav();
	} else {
		portfolioDelay = 1;
		portfolio_xml.load(_level0.XMLPath + subNavXML[0]);		
	}

	this.attachMovie("portfolio.mask", "portMask_mc", 200, {_x:0, _y:0, _width:550, _height:0});
	portfolioNav_mc.setMask(portMask_mc);
	portfolioNav_mc.mask._height = 0;
};




//=========================================================================================
//------ Build Portfolio
//=========================================================================================
function buildPortfolioNav():Void {
	portfolioNav_mc.createEmptyMovieClip("navNums", 100);
	portMask_mc.tween("_height", 25, 1, 'easeInOutExpo', portfolioDelay);
	mainCopy_mc.slideTo(null, 60, 1, 'easeInOutExpo', portfolioDelay);
	
	for (var i:Number = 1; i <= portfolio_obj.numNodes; i++) {

		// create numbers
		portfolioNav_mc.navNums.attachMovie("portfolio.00", "port" + i, i, {_x: -5 + (spacer * i), _y:6});
		if (i < 10) { 
			portfolioNav_mc.navNums["port"+i].num.text = "0" + i;
		} else {
			portfolioNav_mc.navNums["port"+i].num.text = i;
		}
		
		// assign actions to each number
		portfolioNav_mc.navNums["port"+i].onRollOver = function() {
			this.colorTo(_level0.navHighlight, 0);
		}
		
		portfolioNav_mc.navNums["port"+i].onRollOut = function() {
			this.colorTo(null);
		}
		
		portfolioNav_mc.navNums["port"+i].onRelease = function() {
			// enable/disable nav
			currentPortfolio.enabled = true;
			currentPortfolio.colorTo(null);
			
			currentPortfolio = this;
			currentPortfolio.colorTo(_level0.navHighlight, 0);
			currentPortfolio.enabled = false;
			
			// find out what number this one is
			var quickNum:Number = Number(this._name.substr(4)) - 1;
			
			// load correct image
			loadPic(quickNum);
			
		}
		
		if (i == 1) {
			// set the first portfolio item as active
			portfolioNav_mc.navNums["port"+i].enabled = false;
			portfolioNav_mc.navNums["port"+i].colorTo(_level0.navHighlight, 0);
			currentPortfolio = portfolioNav_mc.navNums["port"+i];
		}
	}

	// open up portfolio area
	if (portfolioOpen != true) {
		_parent._parent.contentHolder_mc.contentPortfolio_mc.slideTo(null, -420, 1, 'easeInOutExpo', portfolioDelay);
		_parent._parent.logo_mc.slideTo(550, null, 1, 'easeInOutExpo', portfolioDelay);
		portfolioOpen = true;
	}
	
	// load default photo
	loadPic(0);
	
	portfolioNeedsReset = true;
};




//=========================================================================================
//------ Read Portfolio XML
//=========================================================================================
var portfolio_xml:XML = new XML();
portfolio_xml.ignoreWhite = true;

portfolio_xml.onLoad = function(success:Boolean) {
	if (success) {
		portfolio_obj.portURL 	= new Array();
		portfolio_obj.siteURL	= new Array();
		portfolio_obj.portTitle = new Array();
		portfolio_obj.portDesc 	= new Array();
		
		var rootNode:XMLNode = this.firstChild;
		portfolio_obj.numNodes = rootNode.childNodes.length;
		
		// store all info into portfolio object
		for (var n:Number = 0; n < portfolio_obj.numNodes; n++) {
			portfolio_obj.portURL[n] 	= rootNode.childNodes[n].firstChild.firstChild.nodeValue;
			portfolio_obj.siteURL[n] 	= rootNode.childNodes[n].firstChild.nextSibling.attributes.siteURL;
			portfolio_obj.portTitle[n] 	= rootNode.childNodes[n].firstChild.nextSibling.firstChild.nodeValue;
			portfolio_obj.portDesc[n]	= rootNode.childNodes[n].firstChild.nextSibling.nextSibling.firstChild.nodeValue;
		}

		// create portfolio nav
		buildPortfolioNav();
		
	} else {
		trace ("Unable to load xml file");
	}
};




//=========================================================================================
//------ Portfolio MCL
//=========================================================================================
var mcl:MovieClipLoader = new MovieClipLoader();
var mcl_listener:Object = new Object();
mcl.addListener(mcl_listener);

mcl_listener.onLoadStart = function():Void {
	// start loader
	var loaderX:Number = _level0.site_mc.siteBG_mc._width / 2;
	var loaderY:Number = _level0.site_mc.siteBG_mc._height / 2;
	
	if (!_level0.site_mc.loader_mc) {
		_level0.site_mc.attachMovie("mc.loader", "loader_mc", _level0.site_mc.getNextHighestDepth(), {_x:loaderX - 5, _y:loaderY - 115});
	}			
}

mcl_listener.onLoadProgress = function(mc:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void {
	var percentage:Number = bytesLoaded/bytesTotal * 100;
	_level0.site_mc.loader_mc.percentage_txt.text = percentage;
}

mcl_listener.onLoadInit = function(mc:MovieClip):Void {
	_level0.site_mc.loader_mc.removeMovieClip();

	// resize it correctly
	mc._width = 550;
	mc._height = 420;
	
	mc._alpha = 0;
	mc.alphaTo(100, 1, 'easeOutSine');

	// zoom mouse actions
	mc.onRollOver = function():Void { zoomPointer(true); }
	mc.onRollOut = function():Void { zoomPointer(false); }
	mc.onRelease = mc.onReleaseOutside = function():Void { zoomIn(true);}
}




//=========================================================================================
//------ Portfolio ZOOM MCL
//=========================================================================================
var port_mcl:MovieClipLoader = new MovieClipLoader();
var port_listener:Object = new Object();
port_mcl.addListener(port_listener);

port_listener.onLoadStart = function():Void {
	// start loader
	var loaderX:Number = _level0.site_mc.siteBG_mc._width / 2;
	var loaderY:Number = _level0.site_mc.siteBG_mc._height / 2;
	
	if (!_level0.site_mc.loader_mc) {
		_level0.site_mc.attachMovie("mc.loader", "loader_mc", _level0.site_mc.getNextHighestDepth(), {_x:loaderX - 5, _y:loaderY - 115});
	}			
}

port_listener.onLoadProgress = function(mc:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void {
	var percentage:Number = bytesLoaded/bytesTotal * 100;
	_level0.site_mc.loader_mc.percentage_txt.text = percentage;
}

port_listener.onLoadInit = function(mc:MovieClip):Void {
	_level0.site_mc.loader_mc.removeMovieClip();
	_level0.blackdrop_mc.tween(["_width", "_height"], [mc._width + 10,mc._height + 10], 1, 'easeInOutExpo');
	_level0.blackdrop_mc.slideTo(Stage.width/2 - mc._width/2 - 5, Stage.height/2 - mc._height/2 - 5, 1, 'easeInOutExpo');
	blackdropOpen = true;	
	
	
	mc._x = Stage.width/2 - mc._width/2;
	mc._y = Stage.height/2 - mc._height/2;
	
	mc._alpha = 0;
	mc.alphaTo(100, 1, 'easeOutSine', 1);

	zoomPointer(false);
	mc.onRelease = function():Void {
		zoomIn(false, this);
	}
}

//=========================================================================================
//------ Function to Switch Mouse (+)
//=========================================================================================
var mouseListener:Object = new Object();
var zoomContainer:MovieClip;
/*
// this is still a little buggy - so use at your own risk

function zoomPointer(condition:Boolean):Void {
	if (condition == true) {
		zoomContainer = this.attachMovie("portfolio.zoom", "zoom_mc", this.getNextHighestDepth(), {_x:_xmouse, _y:_ymouse});
		zoomContainer.blendMode = 7; // difference
		Mouse.hide();

		mouseListener.onMouseMove = function() {
		    zoomContainer._x = _xmouse;
		    zoomContainer._y = _ymouse;
		    updateAfterEvent();
		};
		Mouse.addListener(mouseListener);
	} else {
		this.zoom_mc.removeMovieClip();
		Mouse.removeListener();
		Mouse.show();
	}
};
*/



//=========================================================================================
//------ Function to Display Large Portfolio Item
//=========================================================================================
function zoomIn(condition:Boolean, mc:MovieClip):Void {
	if (condition == true) {
		_level0.attachMovie("portfolio.mask", "blackdrop_mc", _level0.getNextHighestDepth(), {_width:0, _height:0, _x:Stage.width/2, _y:Stage.height/2, _alpha:50});
		_level0.blackdrop_mc.colorTo(0x000000, 0);
	
		_level0.createEmptyMovieClip("portCloseup_mc", _level0.getNextHighestDepth());
		var quickNum:Number = Number(currentPortfolio._name.substr(4));
		port_mcl.loadClip(_level0.portfolioPath + portfolio_obj.portURL[quickNum - 1], _level0.portCloseup_mc);
	} else {
		_level0.blackdrop_mc.removeMovieClip();
		mc.removeMovieClip();
		blackdropOpen = false;
	}
};




//=========================================================================================
//------ KEY Commands
//=========================================================================================
var key_obj:Object = new Object();
Key.addListener(key_obj);

key_obj.onKeyDown = function() {
	var quickNum:Number;
	
	// find key down
    switch (Key.getCode()) {
	    case Key.LEFT :
			if (blackdropOpen != true && portfolioNeedsReset == true) {
				quickNum = Number(currentPortfolio._name.substr(4)) - 1;
			}
	    	break;

	    case Key.RIGHT :
			if (blackdropOpen != true && portfolioNeedsReset == true) {
				quickNum = Number(currentPortfolio._name.substr(4)) + 1;
			}
	    	break;
	
		case Key.DOWN :
			if (blackdropOpen == true && portfolioNeedsReset == true) {
				zoomIn(false, _level0.portCloseup_mc);
			}
			break;
			
		case Key.UP :
			if (blackdropOpen != true && portfolioNeedsReset == true) {
				zoomIn(true);
			}
			break;
	}

	// make it loop
	if (quickNum < 1) {
		quickNum = portfolio_obj.numNodes;	
	} else if (quickNum == portfolio_obj.numNodes + 1) {
		quickNum = 1;
	}
	
	// call the action
	portfolioNav_mc.navNums["port"+quickNum].onRelease();
};




//=========================================================================================
//------ Function to load portfolio image
//=========================================================================================
function loadPic(which:Number) {
	if(!portfolioHolder_mc) {
		this.createEmptyMovieClip("portfolioHolder_mc", this.getNextHighestDepth());
		portfolioHolder_mc._x = 0;
		portfolioHolder_mc._y = -420;
	}
	
	// load image
	mcl.loadClip(_level0.portfolioPath + portfolio_obj.portURL[which], portfolioHolder_mc);
	
	// switch copy
	mainCopy_mc.fadeOut(1, 'easeOutSine');
	if (!portfolioCopy_mc) {
		this.attachMovie("portfolio.ItemCopy", "portfolioCopy_mc", this.getNextHighestDepth(), {_x:550, _y:60});
	} else {
		portfolioCopy_mc._x = 550;
	}
	portfolioCopy_mc.title_txt.autoSize = true;
	portfolioCopy_mc.body_txt.autoSize = true;
	portfolioCopy_mc.title_mc.title_txt.multiline = true;
	portfolioCopy_mc.body_txt.multiline = true;
	portfolioCopy_mc.title_mc.title_txt.text = portfolio_obj.portTitle[which];
	portfolioCopy_mc.body_txt.text = portfolio_obj.portDesc[which];
	portfolioCopy_mc.slideTo(56, null, 1, 'easeInOutExpo', portfolioDelay);
	
	
	// title functions
	portfolioCopy_mc.title_mc.onRollOver = function():Void {
		if (portfolio_obj.siteURL[which] != "") {
			this.colorTo(_level0.navHighlight,0);
		}
	}
	
	portfolioCopy_mc.title_mc.onRollOut = function():Void {
		if (portfolio_obj.siteURL[which] != "") {
			this.colorTo(null);
		}
	}
	
	portfolioCopy_mc.title_mc.onRelease = portfolioCopy_mc.title_mc.onReleaseOutside = function():Void {
		var targetMode = "_blank";
		if (portfolio_obj.siteURL[which] != "") {
			_level0.getURL(portfolio_obj.siteURL[which], targetMode);
		} else {
			delete this.onRelease;
		}
	}
};




//=========================================================================================
//------ Function to Reset Portfolio 
//=========================================================================================
function resetPortfolio():Void {	
	portMask_mc.tween("_height", 0, 1, 'easeInOutExpo');
	portfolioCopy_mc.removeMovieClip();
	
	mainCopy_mc.slideTo(null, 40, 1, 'easeInOutExpo');
	mainCopy_mc.fadeIn(1, 'easeInOutExpo');
	
	// make sure Mouse goes back to normal
	zoomContainer.removeMovieClip();
	Mouse.removeListener();
	Mouse.show();

	
	// close up portfolio area
	_parent._parent.contentHolder_mc.contentPortfolio_mc.slideTo(null, 0, 1, 'easeInOutExpo');
	_parent._parent.logo_mc.slideTo(390, null, 1, 'easeInOutExpo');
	
	// reset nav
	currentPortfolio.enabled = true;
	currentPortfolio.colorTo(null);
	currentPortfolio = null;
	
	// close mini portfolio
	removeMiniNav();
	
	portfolioOpen = false;
	portfolioNeedsReset = false;
};