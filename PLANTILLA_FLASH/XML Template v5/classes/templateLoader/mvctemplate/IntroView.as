import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*




  

class templateLoader.mvctemplate.IntroView extends AbstractView {
		
	
var mcCenter:MovieClip
var mcUp:MovieClip
var mcDown:MovieClip
////////////
var __heightUp:Number
var __heightDown:Number


////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new IntroController(model)
 }
 
////////////////////////////////////////////////////////////

function onLoad(){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	
	this.__heightDown=m.__backgroundHeightDown
	this.__heightUp=m.__backgroundHeightUp
	
	this.onResize()
}

/////////////////////////////////////////////////////////////////////////

function onResize(){
	/////////////////////////////////////center
	this.mcCenter._y=this.__heightUp
	this.mcCenter._width=Stage.width
	this.mcCenter._height=Stage.height-(this.__heightUp+this.__heightDown)
	//////////////////////////////////up
	this.mcUp._width=Stage.width
	this.mcUp._height=this.__heightUp
		
	////////////////////////////////////////down
	this.mcDown._y=this.mcCenter._height+this.mcCenter._y
	this.mcDown._height=this.__heightDown
	this.mcDown._width=Stage.width
}

/////////////////////////////////////////////////////////////////////////

}

