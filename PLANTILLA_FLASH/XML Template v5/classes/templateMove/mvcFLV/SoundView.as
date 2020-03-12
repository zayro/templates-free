import pl.drawing.Rysowanie
import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.util.Observable

class templateMove.mvcFLV.SoundView extends AbstractView {
    
	
	var __scroll:ScrollComponents
	
/////////////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new SoundController(model)
}

/////////////////////////////////////////////////////////////////

	function SoundView(){
	
	

	 
	}

	
//////////////////////////////////////////////////////////////////////////////////

function onLoad(){

this.onResize()	
 var m:FLVModel=FLVModel(this.getModel())

	this.__scroll=ScrollComponents(this.attachMovie("_scrollProgressFLV","_scrollProgressFLV_",1,{__backgroundColor:m.FLV_COLOR_LINE_SOUND,__colorCircle:m.FLV_COLOR_CIRCLE,__color_rectangleProgress:m.FLV_CURRENT_SOUND_LINE}))
	this.__scroll.addEventListener("onChangeSuwak",this)
	this.__scroll.addEventListener("onPressSuwak",this)
	this.__scroll.addEventListener("onReleaseSuwak",this)
	
	__scroll.__scaleBackground = false;
	__scroll.__rectangleHeightNull = true;
	__scroll.height = 50
	__scroll.firstLast = [0,100];
	__scroll._rotation=-90
	__scroll.setScrollPosition(50)
	onChangeSuwak()
	

	this.onResize()
}


//////////////////////////////////////////////////////////////////////////////////
 
 function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=m.height-8-m.__toolsSymbolPosition
	 this._y=y
	 this._x=m.width-m.__marginToolsX2-95
 }
 
//////////////////////////////////////////////////////////////////////////////////////////

	function onVolume(){
		var m:FLVModel=FLVModel(this.getModel())
		this.__scroll.setScrollPosition(m.volume		)
	}
	
//////////////////////////////////////////////////////////////////////////////////////////

	function onPressSuwak(){    

	}

//////////////////////////////////////////////////////////////////////////////////////////

	function onReleaseSuwak(){  
	
	}

//////////////////////////////////////////////////////////////////////////////////////////

	function onChangeSuwak(){   
	var c:SoundController=SoundController(this.getController())
	c.onChangeSuwak()
	}

//////////////////////////////////////////////////////////////////////////////////////////

	function onMetaData(obj){  
		
	}

//////////////////////////////////////////////////////////////////////////////////////////

	function onSoundEnabled(){
		this.__scroll._visible=true
	}

//////////////////////////////////////////////////////////////////////////////////////////

	function onSoundDisabled(){
		this.__scroll._visible=false
	}

//////////////////////////////////////////////////////////////////////////////////////////
	



}