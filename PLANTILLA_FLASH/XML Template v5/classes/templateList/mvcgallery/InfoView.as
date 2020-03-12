﻿import mx.data.encoders.Num;
import templateList.util.*;
import templateList.mvc.*
import templateList.I.*
import templateList.mvcgallery.*

class templateList.mvcgallery.InfoView extends AbstractView {
 
var mc_slide:MovieClip
var __visibility:Boolean=true
var __inter
var bcg:MovieClip
var positionY:Number=10
var tween

///////////////////////////////////////////////////////////////////////////////////////

 function InfoView(){
	 addEvents()
	 this._alpha=0
	
}

/////////////////////////////////////////////////////////////////////////////////////////

function onIntroEnd(){
	var m:GalleryModel=GalleryModel(this.getModel())
	if(m.__slide!=true){
	this.enabled=true	
	}
	
	this.shov()
}

/////////////////////////////////////////////////////////////////////////////////////////

function onExitStart(){
	this.enabled=false
}

/////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
	this.enabled = false
	bcg._y=positionY
	///Stage.addListener(this)
	
}

////////////////////////////////////////////

function onResize(){
	this.onImageResize()	
}

///////////////////////////////////////////////////////////////////////////////////////// 

 function onLoadThumb(){
	 this.hide()
 }
 
 
///////////////////////////////

function onPressClose(){
	this.hide()	
}
 
/////////////////////////////////////////////////////////////////////////////////////////

function shov(){
this._visible = true
//this._alpha = 0
this.tween('_alpha', 100, 0.5, 'easeOutCubic')

if(getDesc().length) {
	this.enabled=true
}else {
	this.enabled=false
}

}

/////////////////////////////////////////////////////////////////////////////////////////

function hide(){
this._visible=false
}

//////////////////////////////////////////////////////////////////////////////////////////  

public function defaultController (model:Observable):Controller {
   return new BCloseImageController(model);
}


//////////////////////////////////////////////////////////////////////////////////////////  

  function addEvents(){
 

  }
  

//////////////////////////////////////////////////////////////////////////////////////////    

function onPress(){
	var m:GalleryModel=GalleryModel(this.getModel())
	m.slide_stop()
	
	
	m.dispatchEvent({target:this,type:"onShovInfo"})
	
	
	this.onRollOut()
}

////////////////////////////////////////////////////////////////////////////////////////// 

function onRollOver(){
	 	 this.gotoAndStop(2)
		 
		 this.bcg.tween('_y',0,.3,'easeOutCubic')
}

//////////////////////////////////////////////////////////////////////////////////////////    

function onRollOut(){
	 	 this.gotoAndStop(1)
		 this.bcg.tween('_y',positionY,.3,'easeOutCubic')
}

//////////////////////////////////////////////////////////////////////////////////////////

function onImageResize(){
setPositionSlide()
}

////////////////////////////////////////////////

private function setPositionSlide(){
	var model:GalleryModel=GalleryModel(this.getModel())
	var gallery:Gallery=model.__target
	var image:ImageView=gallery.__image
	this._x=image._x+image.getWidth()/2-image.__space/2-200
	this._y=image._y-image.getHeight()/2
}

/////////////////////////////////////////////////////////////////////////////////////////

function onStopSlide(){
	this.enabled=true
}

/////////////////////////////////////////////////////////////////////////////////////////

function getDesc(){
var model:GalleryModel=GalleryModel(this.getModel())
var attributes:Object=model.getAttributes()
return attributes.child.firstChild.nodeValue
}


  
}