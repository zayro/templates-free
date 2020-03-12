import mx.transitions.Tween;
import mx.transitions.easing.*
import templateMove.util.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*;
class templateMove.mvcFLV.PlayPauseCenterView extends AbstractView {

	var button:MovieClip
	var tween:Tween
	
///////////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new PlayPauseCenterController(model)
 }
	
///////////////////////////////////////////////////////////////////////////////////////////
 
 function PlayPause(){
	
 }
 
//////////////////////////////////////////
 
 function onResize(){
	 var m:FLVModel=FLVModel(this.getModel())
	 var target:FLV=FLV(m.__flv)
	 var image:ImageView=target.__image
	 var y=(m.height-(m.__marginToolsY2+m.__toolsHeight+m.__marginImageY2) )/2-this._height/2
	 this._y=y
	 this._x=m.width/2-this._width/2
	
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////// 
 
   function onMetaData(obj){  
	 	onResize()
	}
 

/////////////////////////////////////////////////////////////////////////////////////////// 

 function onLoad(){
	 var m:FLVModel=FLVModel(this.getModel())
	 NewColor.setColor(button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	 var c:PlayPauseCenterController=PlayPauseCenterController(this.getController())
	 button.onPress=Delegate2.create(c,c.onPressPlay)
	  ////rollover/rollout
	 button.onRollOver=Delegate2.create(this,onRollOverAll,button)
	 button.onRollOut=Delegate2.create(this,onRollOutAll,button)
	 
	 this.onResize()
	 this._visible=false
	 this._alpha=0
 }
 
//////////////////////////////////////////////////////////////////////////////////////////

  function onRollOverAll(mc:MovieClip){
	 var m:FLVModel=FLVModel(this.getModel())
	 NewColor.setColor(mc.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOVER)
	 mc.znaczek.gotoAndStop(2)
	 m.sound_rol(this)
	 button._alpha=80
  }
  
//////////////////////////////////////////////////////////////////////////////////////////
  
  function onRollOutAll(mc:MovieClip){
	mc.znaczek.gotoAndStop(1)
	var m:FLVModel=FLVModel(this.getModel())
	NewColor.setColor(mc.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	button._alpha=100
  }
 
 ///////////////////////////////////////////////////////////////////////////////////////////
  
 function onStart(){
	// button.gotoAndStop("stan_pause")
	var m:FLVModel=FLVModel(this.getModel())
	NewColor.setColor(this.button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	hide()
 }
 
///////////////////////////////////////////////////////////////////////////////////////////
 
 function onStop(){
		button.gotoAndStop("stan_play")
		shov()
			 var m:FLVModel=FLVModel(this.getModel())
		 NewColor.setColor(this.button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
 }
 
 ///////////////////////////////////////////////////////////////////////////////////////////
  
 function onPauze(){
	button.gotoAndStop("stan_play")
	 var m:FLVModel=FLVModel(this.getModel())
	 NewColor.setColor(this.button.znaczek,m.FLV_COLOR_SYMBOL_BUTTON_ROLLOUT)
	shov()
	 
 }
 
 ///////////////////////////////////////////////////////////////////////////////////////////
 
 function shov(){
	      var m:FLVModel=FLVModel(this.getModel())
	      button.enabled=true
	      this._visible=true
		  tween.stop()
		  button._alpha=100
	 	  tween=new Tween(this,'_alpha',Strong.easeOut,this._alpha,100,1,true)
	
 }
 
////////////////////////////////////////////////////////////////////////////////////////
 
 function hide(){
	     button.enabled=false
	     tween.stop()
	  	 tween=new Tween(this,'_alpha',Strong.easeOut,this._alpha,0,1,true)
		 tween.onMotionFinished=Delegate2.create(this,this.endHide)
 }
 
/////////////////////////////////////////////////////////////////////////////////////////
 
 function endHide(){
      this._visible=false	 
 }
  
//////////////////////////////////////////////////////////////////////////////////////////
 
 function onLoadInitPreview(){
	  var m:FLVModel=FLVModel(this.getModel())
	  if(m.stan!="play"){
	 this.shov()
	  }
 }
 
////////////////////////////////////////////////////////////////////////////////////////
 
 function onHitTestImageTrue(){
	 // this.shov()
 }
 
////////////////////////////////////////////////////////////////////////////////////
 
 function onHitTestImageFalse(){
	   ///this.hide()
	 
 }
 
//////////////////////////////////////////////////////////////////////////////////

function onSetUrl(){
	this.hide()	
}

//////////////////////////////////////////////////////////////////////////////////


 
	
  
}