import templateMove.util.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*;

class templateMove.mvcFLV.SpeakerView extends AbstractView {
	

	
	var button:MovieClip
	
///////////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new SpeakerController(model)
 }
	
///////////////////////////////////////////////////////////////////////////////////////////
 
 function SpeakerView(){
	
 }
 
/////////////////////////////////////////////////////////////////////////////////////////// 

 function onLoad(){
	  var m:FLVModel=FLVModel(this.getModel())
	 NewColor.setColor(button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	 
	 var c:SpeakerController=SpeakerController(this.getController())
	 button.onPress=Delegate2.create(c,c.onPressVolume)
	 
	 ////rollover/rollout
	 button.onRollOver=Delegate2.create(this,onRollOverAll,button)
	 button.onRollOut=Delegate2.create(this,onRollOutAll,button)
			  
			  	 this.onResize()
 }
 
 ///////////////////////////////////////////
 
 function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=m.height-this._height-3-m.__toolsSymbolPosition
	 this._y=y
	 this._x=m.width-m.__marginToolsX2-116
}
 
 /////////////////////////////////////////////////////////////////////////////////////////// 
 
   function onMetaData(obj){  
	 
		onResize()
	}
 

/////////////////////////////////////////////////////////////////////////////////////////// 

  function onRollOverAll(mc:MovieClip){
	 mc.znaczek.gotoAndStop(2)
	  var m:FLVModel=FLVModel(this.getModel())
	  NewColor.setColor(mc,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOVER)
	   m.sound_rol(this)
  }
  
 ///////////////////////////////////////////////////////////////////////////////////////////
  
  function onRollOutAll(mc:MovieClip){
	 var m:FLVModel=FLVModel(this.getModel())
	 mc.znaczek.gotoAndStop(1)
	 NewColor.setColor(mc,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	
  }
  
///////////////////////////////////////////////////////////////////////////////////////////
 
 function onSoundEnabled(){
	 var m:FLVModel=FLVModel(this.getModel())
	 this.button.gotoAndStop(1)
	 NewColor.setColor(button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	
 }
 
 ///////////////////////////////////////////////////////////////////////////////////////////
 
  function onSoundDisabled(){
	    var m:FLVModel=FLVModel(this.getModel())
	this.button.gotoAndStop(2)
	 NewColor.setColor(button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	 
 }
 
///////////////////////////////////////////////////////////////////////////////////////
  

 
 
 
 
 
	
  
}