

import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import flash.display.BitmapData
import templateMove.util.Observable
import mx.transitions.Tween
import mx.transitions.easing.*




 
class templateMove.mvcFLV.TimeView extends AbstractView {
	

var t:TextField

/////////////////////////////
	
public function defaultController (model:Observable):Controller {
  return new TimeController(model)
 }
	
 ///////////////////////////////////////////////////
 
 function TimeView(){
	 this.reset()
 }
 
 /////////////////////////////////////////////
 
 function reset(){
	  this.t.text="00:00/00:00" 	 
 }
 
 ///////////////////////////////////////////////
 
 function onSetUrl(){
	 this.reset()	 
 }
 
///////////////////////////////////////////////

function hide(){
this._visible=false	
}

/////////////////////////////////////////////////////

function shov(){
this._visible=true		
}
  
/////////////////////////////////////////////////////////////////////
	
function onProgress(){   /////zdarzenie rozsylane przed model
		var model:FLVModel=FLVModel(this.getModel())
		var s:Number=Math.round(model.position)
		var total:Number=Math.round(model.__total)		
		
		if(isNaN(total)){
			total=0			
		}
		
		var c=sekToMin(s)
		var t=sekToMin(total)
		
		
		this.t.text=c+"/"+t
		this.t.textColor=model.FLV_COLOR_NUMBER
}

////////////////////////////////////////////////////////   
 
private function sekToMin(s_:Number){
	var m:Number=Math.floor(s_/60)
	var s:Number=(s_%60)						
	return format(m)+":"+format(s)
}

///////////////////////////////////////////////////////

private function format(str_:Number){
		return (str_<=9) ? "0"+str_ : str_
}		
		
/////////////////////////////////////////////////////////

function onLoad(){
	
	this.onResize()
	
}

/////////////////////////////////////////////////////////////////////////////
   
    function onMetaData(){  
	    this.shov()
		onProgress()
	}
	
/////////////////////////////////////////////////////////////////////////////


function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=m.height-this._height-m.__toolsSymbolPosition
	 this._y=y
	 this._x=55
}

/////////////////////////////////////////////

	
	
}

