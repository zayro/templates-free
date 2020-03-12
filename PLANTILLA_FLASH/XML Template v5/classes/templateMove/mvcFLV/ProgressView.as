import pl.drawing.Rysowanie
import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.util.Observable

class templateMove.mvcFLV.ProgressView extends AbstractView {
    
	
	var __scroll:ScrollComponents
	var __onLoad:Function
	
	var __model:FLVModel
///////////////////////////////////////////////////////////////////////////////////////////	
	
public function defaultController (model:Observable):Controller {
  return new ProgressController(model)
 }
		
///////////////////////////////////////////////////////////////////////////////////////////
	
	function ProgressView(){
	var m:FLVModel=FLVModel(__model)
	this.__scroll=ScrollComponents(this.attachMovie("_scrollProgressFLV","_scrollProgressFLV_",1,{__backgroundColor:m.FLV_COLOR_LINE_PROGRESS,__colorCircle:m.FLV_COLOR_CIRCLE,__color_rectangleProgress:m.FLV_CURRENT_PROGRESS_LINE}))
	this.__scroll.addEventListener("onChangeSuwak",this)
	this.__scroll.addEventListener("onPressSuwak",this)
	this.__scroll.addEventListener("onReleaseSuwak",this)
	__scroll.__scaleBackground = false;
	__scroll.__rectangleHeightNull = true;
	__scroll.height =  m.width-(m.__marginToolsX1+m.__marginToolsX2+265)
	__scroll.firstLast = [0,100];
	__scroll._rotation=-90
	this.__scroll.mcBackground.useHandCursor=false
	
	this.onResize()
		
		this.__onLoad()
		
		
	}
	
/////////////////////////////////////////////////

function onFullScreenYes(){
onProgress()
}

///////////////////////////////////////////////////////////////////

function onFullScreenNo(){
onProgress()
}
	
//////////////////////////////////////////////////////////////////////////////////

 function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=m.height-m.__toolsSymbolPosition-7
	 this._y=y
	 this._x=m.__marginToolsX1+145
	 __scroll.height = m.width-285
 }
 
//////////////////////////////////////////////////////////////////////////////////////////

    function onLoad(){
		
	}
	 
///////////////////////////////////////////////////////////////////////////////////////////

	function onProgress(){  
		var m:FLVModel=FLVModel(this.getModel())
		this.__scroll.setScrollPosition(m.position)
	}
	
///////////////////////////////////////////////////////////////////////////////////////////

	function onPressSuwak(){    
	var c:ProgressController=ProgressController(this.getController())
	c.onPressSuwak()
	}
	
///////////////////////////////////////////////////////////////////////////////////////////

	function onReleaseSuwak(){  
	var c:ProgressController=ProgressController(this.getController())
	c.onReleaseSuwak()
	}
	
///////////////////////////////////////////////////////////////////////////////////////////

	function onChangeSuwak(value){    
	var c:ProgressController=ProgressController(this.getController())
	c.onChangeSuwak()
	}
	
///////////////////////////////////////////////////////////////////////////////////////////

	function onMetaData(obj){  
		var ob=obj.obj
		this.__scroll.firstLast=[0,ob.duration]
		
	}
	
///////////////////////////////////////////////////////////////////////////////////////////
	
	



}