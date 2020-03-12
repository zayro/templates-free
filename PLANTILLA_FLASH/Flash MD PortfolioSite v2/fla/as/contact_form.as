/**
*
* MD PortfolioSite - Contact Form Script [build1.0]
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
* This script handles the contact form for the site. You shouldn't need to change anything in here,
* unless of course, you're feeling like geeking out a bit.
* 
*
*/
//=========================================================================================
//------ CONTACT FORM FUNCTIONALITY
//=========================================================================================
var sendVars_lv:LoadVars = new LoadVars();
var receiveVar_lv:LoadVars = new LoadVars();
var thisTimeline = this;
var contactNeedsReset:Boolean;

form_mc.form_name.tabIndex = 1;
form_mc.form_email.tabIndex = 2;
form_mc.form_message.tabIndex = 3;


form_mc.send_mc.onRollOver = function() {
	this.text_mc.colorTo(_level0.navHighlight, 0);
};

form_mc.send_mc.onRollOut = function() {
	this.text_mc.colorTo(null);
};


form_mc.send_mc.onRelease = function() {
	
	// validate contact form
	if (form_mc.form_name.text != "" && form_mc.form_email.text != "" && form_mc.form_message.text != "") {

		// no fields are empty, now check email for @ symbol
		var atSymbol:Number = form_mc.form_email.text.indexOf("@");
		
		if (atSymbol > 0) {
			// @ symbol has been found. Now check for a "." after the @ symbol
			var period:Number = form_mc.form_email.text.indexOf(".", atSymbol);
			
			if (period > 0) {
				// period was found. Safe to send data.

				// gather variables
				sendVars_lv.formName 	= form_mc.form_name.text;
				sendVars_lv.formEmail	= form_mc.form_email.text;
				sendVars_lv.formMessage = form_mc.form_message.text;
				
				// send 'em
				sendVars_lv.sendAndLoad("php/mail_script.php", receiveVar_lv, POST);
			} else {
				throwError();
			}
		} else {
			throwError();
		}
	} else {
		throwError();
	}
	
	contactNeedsReset = true;
	
};


// check for success in sending mail message
receiveVar_lv.onLoad = function(success:Boolean) {
	
	if (success) {
		form_mc.slideTo(-550, null, 1, 'easeInOutExpo');
		thisTimeline.attachMovie("contact.success", "success_mc", thisTimeline.getNextHighestDepth(), {_x: 550, _y: 77});
		thisTimeline.success_mc.slideTo(56, null, 1, 'easeInOutExpo');
	} else {
		form_mc.slideTo(-550, null, 1, 'easeInOutExpo');
		thisTimeline.attachMovie("contact.failed", "failed_mc", thisTimeline.getNextHighestDepth(), {_x: 550, _y: 77});
		thisTimeline.failed_mc.slideTo(56, null, 1, 'easeInOutExpo');
		
		thisTimeline.failed_mc.reset_mc.onRollOver = function() {
			this.text_mc.colorTo(_level0.navHighlight, 0);
		};
		
		thisTimeline.failed_mc.reset_mc.onRollOut = function() {
			this.text_mc.colorTo(null);
		};
		
		thisTimeline.failed_mc.reset_mc.onRelease = function() {
			resetContactForm();
		};
	}
	
};


//=========================================================================================
//------ THROW ERROR
//=========================================================================================
function throwError():Void {
	form_mc.alphaTo(30, 1, 'easeOutSine');
	thisTimeline.attachMovie("contact.error", "error_mc", thisTimeline.getNextHighestDepth(), {_x: 56, _y: 65, _alpha: 0});
	thisTimeline.error_mc.alphaTo(100, 1, 'easeOutSine');

	thisTimeline.error_mc.onRelease = function() {
		form_mc.alphaTo(100, 1, 'easeOutSine');
		this.removeMovieClip();
	}
};


//=========================================================================================
//------ FUNCTION TO RESET CONTACT FORM
//=========================================================================================
function resetContactForm():Void {
	form_mc.form_name.text = "";
	form_mc.form_email.text = "";
	form_mc.form_message.text = "";
	
	form_mc.slideTo(56, null, 1, 'easeInOutExpo');
	thisTimeline.error_mc.removeMovieClip();
	thisTimeline.success_mc.removeMovieClip();
	thisTimeline.failed_mc.removeMovieClip();
	
	contactNeedsReset = false;
};

