import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

import mx.transitions.Tween

/**
* ...
* @author Default
* @version 0.1
*/

class templateMp3.mvcMp3.DescView extends AbstractView {

	
	var t:TextField
	var background:MovieClip
	
	public function DescView() {
		this._visible=false
	}
	
///////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new DescController(model)
 }
 
///////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
  var m:Mp3Model=Mp3Model(this.getModel())
  this.setColor(this.background,m.MP3_BACKGROUND_COLOR) 	
}

//////////////////////////////////////////////////////////////
 
 function setColor(mc_,color_){
	 var k:Color=new Color(mc_)
	 k.setRGB(color_)
 }
 
 /////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:Mp3Model=Mp3Model(this.getModel())

   // if(m.MP3_ALIGN_TITLE=="R"){
	//this._x=(m.width-40)-this.background._width
	//}else{
	//this._x=m.width-(t._width+2)
	//}
	
	var widthProgress:Number=(m.width-580)
	//this._x=390+widthProgress+20
	this._x=(m.width-this.t._width+2)+145
	this._y=-13
	//var myTween:Tween = new Tween(this, "_y", mx.transitions.easing.None.easeNone,80,0,.2,true);
	
	//this._x = 0
	///this._y = -5
	
	
}

/////////////////////////////////////////////////////////////////////////////

function onChangedCurrent(){
	var m:Mp3Model=Mp3Model(this.getModel())
	this.t.autoSize=true
		
	var value=m.getAttributes().child.firstChild.nodeValue
	this.t.htmlText=value
	this.background._width=this.t._width+15
	
	if(value.length){
		this._visible=true	
	}else{
		this._visible=false
	}
	
	this.onResize()
}

/////////////////////////////////////////////////////////////////////////////

function onSetSize(){
///	var m:Mp3Model=Mp3Model(this.getModel())
	
	onResize()
}

/////////////////////////////////////////////////////////////////////////////




	
}