/**
*
* MD PortfolioSite - File Download Script [build1.0]
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
* This script handles file downloads
* 
*
*/
//=================================================================================
//--- Function to allow File Downloads
//=================================================================================
import flash.net.FileReference;

var fileRef:FileReference = new FileReference();
var fileListener:Object = new Object();
fileRef.addListener(fileListener);


fileListener.onHTTPError 		= function():Void { attachMessage("Error:\nFailed to download file. Please contact web administrator.", "error"); }
fileListener.onIOError 			= function():Void { attachMessage("Error:\nFailed to download file. Please contact web administrator.", "error"); }
fileListener.onSecurityError 	= function():Void { attachMessage("Error:\nFailed to download file. Please contact web administrator.", "error"); }
fileListener.onCancel			= function():Void { attachMessage("Alert:\nUser cancelled download.", "error"); }


fileListener.onProgress = function(file:FileReference, bytesLoaded:Number, bytesTotal:Number) {
	var percentage:Number = Math.floor((bytesLoaded/bytesTotal) * 100);
	var dlMessage:String = "Downloading:\nFile is " + percentage + "% complete.";
	attachMessage(dlMessage, "download");
};

fileListener.onComplete = function() {
	_level0.error_mc.removeMovieClip();
};


function attachMessage(message:String, state:String) {
	if (!_level0.error_mc) {
		_level0.attachMovie("mc.error", "error_mc", _level0.getNextHighestDepth(), {_x:Stage.width/2, _y: Stage.height/2, _alpha:0});
		_level0.error_mc.gotoAndPlay(state);
		_level0.error_mc.alphaTo(100,1,'easeOutSine');
		_level0.error_mc.error_txt.autoSize=true;
		_level0.error_mc.error_txt.text = message;

		_level0.error_mc.onRelease = function() {
			this.removeMovieClip();
		}
	}
};