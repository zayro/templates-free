import banner.mvcgallery.GalleryModel;
import mx.data.encoders.Num;
import templateSlider.util.*;
import templateSlider.mvc.*
import templateSlider.I.*
import templateSlider.mvcgallery.*

class templateSlider.mvcgallery.InfoView extends AbstractView {
 
var mc_slide:MovieClip
var __visibility:Boolean=true
var __inter
var bcg:MovieClip
var positionY:Number=0
var tween
var stopTween

///////////////////////////////////////////////////////////////////////////////////////

 function InfoView(){
	 addEvents()
	
	 this._alpha=0
	
}

/////////////////////////////////////////////////////////////////////////////////////////

function onIntroStart(){
	var m:GalleryModel=GalleryModel(this.getModel())
	if(m.__slide!=true){
	///this.enabled=true	
	}
	
	var model:GalleryModel=GalleryModel(this.getModel())
    var attributes:Object=model.getAttributes()
    var desc = attributes.child.firstChild.nodeValue
	
	if (desc.length) {
		shov()
	}else {
		//hide()
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

function onExitStart(){
	//this.enabled=false
}

/////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
	///this.enabled = false
	bcg._y=positionY
	///Stage.addListener(this)
	
}

////////////////////////////////////////////

function onResize(){
	this.onImageResize()	
}

///////////////////////////////////////////////////////////////////////////////////////// 

 function onLoadThumb(){
	 ///this.hide()
 }
 
 
///////////////////////////////

function onPressClose(){
	////this.hide()	
}
 
////////////////////////////////////////////////////////////////////////////////////////

function onChangedIndex() {
	
	var model:GalleryModel=GalleryModel(this.getModel())
    var attributes:Object=model.getAttributes()
    var desc = attributes.child.firstChild.nodeValue
	
	if (desc.length) {
		//shov()
	}else {
		hide()
	}
	
}

/////////////////////////////////////////////////////////////////////////////////////////

function shov() {
	
	
if (getDesc().length) {
			
this._visible = true
this.stopTween()
this.tween('_alpha', 100, 0.5, 'easeOutCubic')

}else {
	//hide()	
}

}

/////////////////////////////////////////////////////////////////////////////////////////

function hide() {
	this.stopTween()
this.tween('_alpha', 0, 0.5, 'easeOutCubic',0,{scope:this,func:'endHide'})
}

//////////////////////////////////////////////////////////////////////////////////////////  

function endHide() {
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
	//m.slide_stop()
	
	
	m.dispatchEvent({target:this,type:"onShovInfo"})
	
	
	this.onRollOut()
}

////////////////////////////////////////////////////////////////////////////////////////// 

function onRollOver(){
	 	 this.gotoAndStop(2)
		 
		// this.bcg.tween('_y',0,.3,'easeOutCubic')
}

//////////////////////////////////////////////////////////////////////////////////////////    

function onRollOut(){
	 	 this.gotoAndStop(1)
		// this.bcg.tween('_y',positionY,.3,'easeOutCubic')
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
	this._x=image._x+image.getWidth()/2-image.__space-40
	this._y=image._y+image.getHeight()/2-image.__spaceDown/2-10
}

/////////////////////////////////////////////////////////////////////////////////////////

function onStopSlide(){
	///this.enabled=true
}

/////////////////////////////////////////////////////////////////////////////////////////

function getDesc(){
var model:GalleryModel=GalleryModel(this.getModel())
var attributes:Object=model.getAttributes()
return attributes.child.firstChild.nodeValue
}


  
}