/**
*
* MD PortfolioSite - Main Site Script [build2.0]
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
* This script handles all main functions for the site. You shouldn't need to change anything in here,
* unless of course, you're feeling like geeking out a bit.
* 
*
*/
import AddButton.as;

//=========================================================================================
//------ INIT FUNCTION
//=========================================================================================
function initMc():Void {
	copyHolder_mc._alpha = contentHolder_mc._alpha = 0;
	copyHolder_mc.alphaTo(100, 1, 'easeInOutSine', .25);
	contentHolder_mc.alphaTo(100, 1, 'easeInOutSine', .5);

	// place copyright notice
	copyright_mc.copyright_txt.text = _level0.copyright;
	copyright_mc._x = 0 + copyright_mc.copyright_txt.textWidth/2;
	copyright_mc._y = siteBG_mc._height + 5;

	// hide mini portfolio
	portMini_mc._x = Stage.width;

	initLogo();
	buildNav();
};

initMc();


//=========================================================================================
//------ PRIVATE VARIABL - DON'T CHANGE
//=========================================================================================
var currentNav:MovieClip;
var subNavOpen:Boolean = false;

//=========================================================================================
//------ MAIN NAV FUNCTION 
//=========================================================================================
function buildNav():Void {
	var mainNavArray:Array = [ 0, 20, 70, 130, 203, 280];

	// slide in background
	mainNav_mc.background_mc._height = 0;
	mainNav_mc.background_mc._y = 20;
	mainNav_mc.background_mc.tween(["_height", "_y"], [20, 0], 1, 'easeInOutExpo');
	

	for (var i:Number = 1; i <= 5; i++) {
		// slide them in
		mainNav_mc["nav"+i]._x = 600;
		mainNav_mc["nav"+i].slideTo(mainNavArray[i], null, 1, 'easeInOutExpo', i * .125);
		
		// assign actions
		mainNav_mc["nav"+i].onRollOver = function() {
			this.colorTo(_level0.navHighlight, 0);
		}
		
		mainNav_mc["nav"+i].onRollOut = function() {
			this.colorTo(null);
		}
		
		mainNav_mc["nav"+i].onRelease = function() {
			
			//enable old
			currentNav.enabled = true;
			currentNav.colorTo(null);
			
			//disable new
			currentNav = this;
			currentNav.colorTo(_level0.navHighlight, 0);
			currentNav.enabled = false;
			
			//determine nav number to switch section
			var quickNum:Number = this._name.substr(-1);
			switchSection(quickNum);
		}
	}
	
	// set initial nav to MAIN
	currentNav = mainNav_mc.nav1;
	currentNav.colorTo(_level0.navHighlight, 0);
	currentNav.enabled = false;	
};


//=========================================================================================
//------ FUNCTION TO HANDLE ALL LOGO FUNCTIONS
//=========================================================================================
function initLogo():Void {
	logo_mc._x = 550;
	logo_mc.slideTo(550 - logo_mc._width, null, 1, 'easeInOutExpo', 1);
	
	logo_mc.onRelease = function():Void {
		this._parent.switchSection("1");
		
		//enable old
		currentNav.enabled = true;
		currentNav.colorTo(null);
		
		//disable new
		currentNav = mainNav_mc.nav1;
		currentNav.colorTo(_level0.navHighlight, 0);
		currentNav.enabled = false;		
	}	
};


//=========================================================================================
//------ SWITCH SECTION FUNCTION
//=========================================================================================
function switchSection(which:Number):Void {
	
	// delay var if necessary
	var delay:Number = 0;
	
	// reset contact if necessary
	if (copyHolder_mc.copyContact_mc.contactNeedsReset == true) {
		copyHolder_mc.copyContact_mc.resetContactForm();
	}
	
	// reset portfolio if necessary
	if (copyHolder_mc.copyPortfolio_mc.portfolioNeedsReset == true) {
		copyHolder_mc.copyPortfolio_mc.resetPortfolio();

		delay = 1;
	}
	
	switch(which) {
		
		case "1":
			// MAIN
			contentHolder_mc.slideTo(0, null, 1, 'easeInOutExpo', delay);
			copyHolder_mc.slideTo(-2200, null, 1, 'easeInOutExpo', delay);
			delay = 0;
			break;
			
		case "2":
			// ABOUT
			contentHolder_mc.slideTo(-550, null, 1, 'easeInOutExpo', delay);
			copyHolder_mc.slideTo(-1650, null, 1, 'easeInOutExpo', delay);
			delay = 0;

			// ABOUT BUTTON
			if (!aboutBtn_mc) {
				// to add button, follow this convention:
				// new AddButton(kindOfButton:String, targetMC:MovieClip, xPos:Number, yPos:Number, buttonTitle:String, buttonPath:String, fileName:String);
				// There are 2 kinds of buttons: button.pdf, button.normal - you can add any kind of button you wish as long as you set the linkage identifier.
				var aboutBtn_mc:AddButton = new AddButton("button.pdf", copyHolder_mc.copyAbout_mc, 56, 140, "Download Factsheet", "../pdf/FactSheet_MDPortfolio2.pdf", "FactSheet.pdf");
			}
			
			break;
			
		case "3":
			// SERVICES
			contentHolder_mc.slideTo(-1100, null, 1, 'easeInOutExpo', delay);
			copyHolder_mc.slideTo(-1100, null, 1, 'easeInOutExpo', delay);
			delay = 0;
			break;
			
		case "4":
			// PORTFOLIO
			contentHolder_mc.slideTo(-1650, null, 1, 'easeInOutExpo', delay);
			copyHolder_mc.slideTo(-550, null, 1, 'easeInOutExpo', delay);
			
			// build nav
			copyHolder_mc.copyPortfolio_mc.initPortfolio();
			
			delay = 0;
			break;
			
		case "5":
			// CONTACT
			contentHolder_mc.slideTo(-2200, null, 1, 'easeInOutExpo', delay);
			copyHolder_mc.slideTo(0, null, 1, 'easeInOutExpo', delay);
			delay = 0;
			break;
			
	}
};


