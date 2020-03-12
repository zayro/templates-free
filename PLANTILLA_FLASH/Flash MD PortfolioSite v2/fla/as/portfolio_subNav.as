/**
*
* MD PortfolioSite - Portfolio SubNav Script [build1.0]
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
//=========================================================================================
//------ Public Variables - Change these to desired values
//=========================================================================================
var subNav:Array 			= _level0.subNav_arr;
var subNavXML:Array 		= _level0.subNav_xml;
var subNavSpacer:Number 	= _level0.subNavSpacer;
var subNavTextColor:String 	= _level0.subNavColor;

//=========================================================================================
//------ Private Variables - Don't Change
//=========================================================================================
var subNavX:Number = 383;
var subNavStartY:Number = subNavSpacer * (subNav.length - 1);
var currentSubNav:String;
var subNavOpen:Boolean;
var subNavBuilt:Boolean;
var mainTL:MovieClip = _parent._parent;

//=========================================================================================
//------ Build Portfolio SubNav
//=========================================================================================
function buildSubNav():Void {
	
	// open mini port
	mainTL.portMini_mc.slideTo(383, null, 1, 'easeInOutExpo');
	mainTL.portMini_mc.bg_mc.colorTo(_level0.navHighlight, 0);
	mainTL.portMini_mc.portName_txt.colorTo(subNavTextColor, 0);
	mainTL.portMini_mc.portIcon_mc.colorTo(subNavTextColor, 0);
	

	// build subnav
	if (subNavBuilt != true) {
		for (var n:Number = 0; n < subNav.length; n++) {
			mainTL.subNavContainer_mc.attachMovie("mc.subNav", "sub" + n, n, {_x:550, _y:(384 - subNavStartY) + (n * subNavSpacer)});
			mainTL.subNavContainer_mc["sub" + n].title_mc.name_txt.text = "> " + subNav[n];
			mainTL.subNavContainer_mc["sub" + n].slideTo(subNavX, null, 1, 'easeInOutExpo', n * .125);

			mainTL.subNavContainer_mc["sub" + n].onRollOver = function() {
				this.bg.colorTo(_level0.navHighlight, 0);
				this.slideTo(subNavX + 10, null, .5, 'easeOutExpo');
				this.title_mc.colorTo(subNavTextColor, 0);
			}
		
			mainTL.subNavContainer_mc["sub" + n].onRollOut = function() {
				this.bg.colorTo(null);
				this.slideTo(subNavX, null, .5, 'easeOutExpo');
				this.title_mc.colorTo(null);
			}
		
			mainTL.subNavContainer_mc["sub" + n].onRelease = function() {
				var quickNum:Number = Number(this._name.substr(3));
				portfolio_xml.load(_level0.XMLPath + subNavXML[quickNum]);

				currentSubNav = subNav[quickNum];	
			
				// hide subnav
				closeSub();
				mainTL.portMini_mc.enabled = false;
				mainTL.portMini_mc.slideTo(520, null, 1, 'easeInOutExpo', null, reEnable);
				mainTL.portMini_mc.portName_txt.text = currentSubNav;			
			
				subNavOpen = false;
			}
		}	
		subNavBuilt = true;
	} else {
		openSub();
	}
	
	subNavOpen = true;
	portfolioNeedsReset = true;
};


//=========================================================================================
//------ Functions to open and close subnav
//=========================================================================================
function openSub():Void {
	mainTL.subNavContainer_mc.slideTo(0, null, 1, 'easeOutExpo');		
	subNavOpen = true;
};

function closeSub():Void {
	mainTL.subNavContainer_mc.slideTo(550, null, 1, 'easeOutExpo');		
	subNavOpen = false;
};

//=========================================================================================
//------ Build Portfolio MINI 
//=========================================================================================

// re-activate portfolio nav & bring in mini nav
mainTL.portMini_mc.bg_mc._alpha = 50;

mainTL.portMini_mc.onRollOver = function() {
	if (subNavOpen != true) {
		// bring subNav back out
		openSub();
		this.slideTo(383, null, 1, 'easeOutExpo');		
	}
}

mainTL.portMini_mc.onRollOut = function() {
	if (subNavOpen != true) {
		// hide subNav again
		closeSub();
		this.slideTo(520, null, 1, 'easeOutExpo');		
	}
}

mainTL.portMini_mc.onRelease = function() {
	if (subNavOpen == true) {
		closeSub();
		this.slideTo(520, null, 1, 'easeOutExpo');
	}
}

function reEnable():Void {
	mainTL.portMini_mc.enabled = true;
}


//=========================================================================================
//------ Remove Portfolio MINI 
//=========================================================================================
function removeMiniNav():Void {
	closeSub();
	mainTL.portMini_mc.slideTo(550, null, 1, 'easeInOutExpo');
	currentSubNav = "please select";
}
