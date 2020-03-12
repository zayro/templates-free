import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*




  
 
class templateLoader.mvctemplate.ContainerPageView extends AbstractView {
		

var mcLine:MovieClip
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new ContainerPageController(model)
 }
 
//////////////////////////////////////////////////////////////////

function onLoad(){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	
	this.onResize()
	
}

//////////////////////////////////////////////////////////////////

function onResize(){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	///this.mcLine._width=m.__pageWidth
	this._x = 0//m.width/2-m.pageWidth/2///Stage.width/2-m.__pageWidth/2
	this._y = 0
	
	
}

//////////////////////////////////////////////////////////////////

 

}

