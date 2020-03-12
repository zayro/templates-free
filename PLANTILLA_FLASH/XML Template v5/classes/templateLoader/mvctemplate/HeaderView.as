import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*



 
  

class templateLoader.mvctemplate.HeaderView extends AbstractView {
		

var t:TextField	
	
///////////////////////////////////////////////////////////

function HeaderView(){
	
}

////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new HeaderController(model)
 }
 
////////////////////////////////////////////////////////////

function onLoad(){
	    var header=ConfigurationSite.HEADER
        this.t.text=header.split(",")[0]
		this.t.textColor=header.split(",")[1]
		this.onResize()
}

/////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:LoaderModel=LoaderModel(this.getModel())
	this._y=120
}

/////////////////////////////////////////////////////////////////////////




}

