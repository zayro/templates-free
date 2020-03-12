import templateMove.util.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*;

class templateMove.mvcFLV.StopView extends AbstractView {
	
	
var button:MovieClip
	
///////////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new StopController(model)
 }
	
///////////////////////////////////////////////////////////////////////////////////////////
 
 function StopView(){
	
 }
 
 ///////////////////////////////////////////
 
 function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=m.height-this._height-m.__toolsSymbolPosition
	 this._y=y
	 this._x = m.__marginToolsX1 + 20
		
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////// 
 
   function onMetaData(obj){  
			onResize()
	}
 
/////////////////////////////////////////////////////////////////////////////////////////// 

 function onLoad(){
	  var m:FLVModel=FLVModel(this.getModel())
	 //NewColor.setColor(button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	 
	 var c:StopController=StopController(this.getController())
	 button.onPress=Delegate2.create(c,c.onPressStop)
	 
	 ////rollover/rollout
	 button.onRollOver=Delegate2.create(this,onRollOverAll,button)
	 button.onRollOut=Delegate2.create(this,onRollOutAll,button)
	 
	 
	 this.onResize()
	 
			 
 }
 
 ///////////////////////////////////////////////////////////////////////////////////////////

  function onRollOverAll(mc:MovieClip){
	   var m:FLVModel=FLVModel(this.getModel())
	 mc.znaczek.gotoAndStop(2)
	  var m:FLVModel=FLVModel(this.getModel())
	 ///NewColor.setColor(mc.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOVER)
	 m.sound_rol(this)
  }
  
 ///////////////////////////////////////////////////////////////////////////////////////////
  
  function onRollOutAll(mc:MovieClip){
	   var m:FLVModel=FLVModel(this.getModel())
	mc.znaczek.gotoAndStop(1)
	 ///NewColor.setColor(mc.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	
  }
  
   /////////////////////////////////////////////////////////////////////////////////////////

 
 
 
 
 
	
  
}