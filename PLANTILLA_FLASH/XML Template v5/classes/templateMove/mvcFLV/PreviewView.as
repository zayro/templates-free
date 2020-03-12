import mx.transitions.Tween;
import mx.transitions.easing.*

import templateMove.util.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*;

import templateMove.Resize

class templateMove.mvcFLV.PreviewView extends AbstractView {
	
var mcContainer:MovieClip	
var __loader:MovieClipLoader
var __width:Number
var __height:Number
var mcPreloader:MovieClip
var tweenContainer:Tween
	
///////////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new PreviewController(model)
 }
	
///////////////////////////////////////////////////////////////////////////////////////////
 
 function PreviewView(){
	
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////// 
 
 function onLoad(){
	 var m:FLVModel=FLVModel(this.getModel())
	 
	
 }
 
 ////////////////////////////////////////////////////////////////////////////////////////
 
 function onSetUrl(){
	
	  var m:FLVModel=FLVModel(this.getModel())
	 if(m.autoPlay==false){
	    loadPreview(m.getPreview())	 
	 }
 }
 
 ////////////////////////////////////////////////////////////////////////////////////////
 
 function loadPreview(url_){
     if(url_.length==0||url_==undefined){url_="dsfds"}
	 tweenContainer.stop()
	 mcContainer=this.createEmptyMovieClip("mcContainer_",1)
	 __loader=new MovieClipLoader()
	 __loader.addListener(this)
	 __loader.unloadClip(mcContainer)
	 __loader.loadClip(url_,mcContainer)
	 this.mcPreloader.gotoAndStop(2)
 }
 
 ////////////////////////////////////////////////////////////////////////////////////////////
 
 function onLoadError(){
	   var m:FLVModel=FLVModel(this.getModel())
	   this.mcPreloader.gotoAndStop(1)
	   m.dispatchEvent({target:this,type:"onLoadInitPreview"}) 
 }
 
 //////////////////////////////////////////////////////////////////////////////////////////
 
 function onLoadInit(target:MovieClip){
	 this.mcPreloader.gotoAndStop(1)
	__width=target._width
	 __height=target._height
	 
	 tweenContainer= new Tween(mcContainer,'_alpha',Strong.easeIn,0,100,2,true)
	 tweenContainer.onMotionFinished=Delegate2.create(this,this.containerTweenEnd)
	 
	 this.onResize()	 
	 
 }
 
 //////////////////////////////////////////////////////////////////////
 
 function onLoadComplete(target:MovieClip){
	 target._alpha=0
 }
 
 /////////////////////////////////////////////////////////////////////
 
 function onStart(){
	  tweenContainer.stop()
	  tweenContainer= new Tween(mcContainer,'_alpha',Strong.easeIn,mcContainer._alpha,0,1,true)
	}
 
 ////////////////////////////////////////////////////////////////////////
 
 function containerTweenEnd(){
	  var m:FLVModel=FLVModel(this.getModel())
	  m.dispatchEvent({target:this,type:"onLoadInitPreview"})
 }
 
 ///////////////////////////////////////////
 
	function onResize(){
		var m:FLVModel=FLVModel(this.getModel())
		var c:FLVModel=FLVModel(this.getModel())
		
		mcContainer._x=(m.width-(m.__marginImageX1+m.__marginImageX2))/2 +m.__marginImageX1 
		mcContainer._y=((m.height-(m.__toolsHeight+m.__marginToolsY2+m.__marginImageY1+m.__marginImageY2))/2)+m.__marginImageY1
		
		var currentW=__width
		var currentH=__height
		
		
		var size:Resize=new Resize(m.__maxWidthMove,m.__maxHeightMove,currentW,currentH)
		var new_size:Object=size.min()
		
		mcContainer._width=new_size.w
		mcContainer._height=new_size.h
		
		mcContainer._x-=mcContainer._width/2
		mcContainer._y-=mcContainer._height/2
		
		mcPreloader._x=m.width/2
		mcPreloader._y=m.height/2-m.__toolsHeight/2
	
	}
 

 
 /////////////////////////////////////
 
 
 
 
	
  
}