/**
*
* MD PortfolioSite - Full Browser Script [build2.0]
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
* This script handles the full browser aspect of the site. You shouldn't need to change anything in here,
* unless of course, you're feeling like geeking out a bit.
* 
*
*/
//=========================================================================================
//------ Make it Full Screen
//=========================================================================================
fscommand("fullscreen", true);
Stage.scaleMode = "noScale";
Stage.align = "TL";


//=========================================================================================
//------ Function to Add Border
//=========================================================================================
function addBorder(borderSize:Number):Void {
	
	if (borderSize > 0) {
		// add border
		site_mc.siteBG_mc._width = site_mc.siteBG_mc._width + borderSize * 2;
		site_mc.siteBG_mc._height = site_mc.siteBG_mc._height + borderSize * 2;
		
		site_mc.siteBG_mc._x = site_mc.siteBG_mc._x - borderSize;
		site_mc.siteBG_mc._y = site_mc.siteBG_mc._y - borderSize;
	}
	
};

addBorder(borderSize);

//=========================================================================================
//------ Full Browser Flash
//=========================================================================================
var stageListener:Object  = new Object();
Stage.addListener(stageListener);
stageListener.onResize = function() { 
	resizeStage(); 
};

function resizeStage():Void {
	var stageCenterX = Stage.width/2;
	var stageCenterY = Stage.height/2;
	
	background_mc._x = 	Math.round(stageCenterX);
	background_mc._y = Math.round(stageCenterY);

	background_mc._width = Stage.width;
	background_mc._height = Stage.height;

	centerSite();

};

resizeStage();

//=========================================================================================
//------ Center Site Function
//=========================================================================================
function centerSite():Void {
	var newX:Number = Math.round(Stage.width/2 - site_mc.siteBG_mc._width/2);
	var newY:Number = Math.round(Stage.height/2 - site_mc.siteBG_mc._height/2);

	// center it
	site_mc.tween(["_x","_y"], [newX, newY], 1, 'easeInOutExpo', .125);
};