import templateGallery.util.*;
import templateGallery.mvc.*
import templateGallery.I.*
import templateGallery.mvcgallery.*
import templateGallery.Configuration

class templateGallery.mvcgallery.ArrowView extends AbstractView {
	
	
var arrow:MovieClip	
var bcg:MovieClip

////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
		
	
	 ///bcg
	 NewColor.setColor(bcg, Configuration.COLOR_BACKGROUND_BUTTON.split(",")[0])
	 bcg._alpha = Configuration.COLOR_BACKGROUND_BUTTON.split(",")[1]
	 
	 ////symbol
	 NewColor.setColor(arrow, Configuration.COLOR_SYMBOL_BUTTON.split(",")[0])
	arrow._alpha = Configuration.COLOR_SYMBOL_BUTTON.split(",")[1]
	 
	 
}

//////////////////////////////////////////////////////////////////////////////////////////////////

    function onRollOver(){
		arrow.tween('_x',15,.5)
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////

	function onRollOut(){
		arrow.tween('_x',0,1)
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	

}