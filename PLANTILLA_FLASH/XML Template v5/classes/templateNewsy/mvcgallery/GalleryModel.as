﻿import templateNewsy.mvcgallery.*;
import templateNewsy.I.*
import templateNewsy.util.Observable
import flash.display.BitmapData
import mx.events.EventDispatcher

import templateNewsy.Configuration
  
class templateNewsy.mvcgallery.GalleryModel extends Observable{
 	var __loader:MovieClipLoader
	var __bmp:BitmapData
	var __array:Array  //////array (first number is 1)
	var __index:Number=0
	var __I
	var __slide:Boolean=false
	var __I2
	var __timereal:Number
	var __target:Gallery  ///class Gallery
    var __thumbModel:ThumbModel  /////thumb Classes
	var __configurationFLV:XML
	var __model_flv
	var __width:Number
	var __height:Number
	var __gallery:Gallery
		
//////////////////////////////////////////////////////////////////	
	
function GalleryModel(gallery_:Gallery) {
	__gallery=gallery_
	EventDispatcher.initialize(this)
	///loadConfigurationFLV()
}

///////////////////////////////////////////////////////////////////////////////////

function onResize(){
	//width=Stage.width
	///height=Stage.height
}

/////////////////////////////////////////////////////////////////////////////////////////

function getDesc(){
var attributes:Object=getAttributes()
return attributes.child.childNodes[1].firstChild.nodeValue
}

////////////////////////////////////////////////////////////////////////////////////////

function getTitle(nr_:Number){
var attributes:Object=getAttributes(nr_)
return attributes.child.childNodes[0].firstChild.nodeValue
}

/////////////////////////////////////////////////////////////////////////////////////////

function getIntro(){
var attributes:Object=getAttributes()
return attributes.child.childNodes[1].firstChild.nodeValue
}

/////////////////////////////////////////////////////////////////////////////////////

function set width(value_:Number){
	__width=value_	
	dispatchEvent({target:this,type:"onResize"})
}

//////////////////////////////////////////////////////////////////////////////////

function get width(){
	return __width
}

///////////////////////////////////////////////////////////////////////////////////

function set height(value_:Number){
	__height=value_	
	dispatchEvent({target:this,type:"onResize"})
}

//////////////////////////////////////////////////////////////////////////////////

function get height(){
	return __height
}


///////////////////////////////////////////////////////////////////////////////////

function isFlv(url_:String){
	
	var url:String=(url_==undefined) ? getAttributes().picbig : url_
	
	if(url.indexOf(".flv")>=0){
		return true;	
	}else{
		return false;		
	}
	
	
}

////////////////////////////////////////////////////////////////////////////////////////

function loadConfigurationFLV(){
	
	this.__configurationFLV=new XML()
	this.__configurationFLV.ignoreWhite=true
	this.__configurationFLV.load(Configuration.URL_CONFIG_FLV)
	
}

	
/////////////////////////////////////////////////////////////////////////////

public function loadThumb(){  
		dispatchLoadThumb()
}

///////////////////////////////////////////////////////////////////////////////////

	public function setData(array_:Array){
		this.__array=array_.slice()
		this.__thumbModel=new ThumbModel(array_.slice())
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////	

	public function loadImage(index_:Number){  
		index=index_
		dispatchChangedIndex()
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////EVENTS
	
    function dispatchLoadThumb(){
		dispatchEvent({type:"onLoadThumb",target:this})    
	}
	
	///////////////////////////////////////////////
	
	function dispatchChangedPortion(){
			dispatchEvent({type:"onChangedPortion",target:this})	
	}
	
	///////////////////////////////////////////////
	
	function dispatchTime(value){
		dispatchEvent({target:this,type:"onProgressTime",value:value})
	}
	
	/////////////////////////////////
	
	function dispatchStartSlide(){
	   dispatchEvent({target:this,type:"onStartSlide"})
	}
	
	////////////////////////////////////////////////////
	
	function dispatchStopSlide(){
		dispatchEvent({target:this,type:"onStopSlide"})
	}
	
	//////////////////////////////////////////////////
	function dispatchNext(){
		dispatchEvent({target:this,type:"onNext"})
	}
	
	////////////////////////////////////////////////////////
	
	function dispatchPrev(){
		dispatchEvent({target:this,type:"onPrev"})
	}
	
	/////////////////////////////////////////////////
	
	function onLoadImageStart(){
          dispatchEvent({type:"onLoadImageStart",target:this})   
    }
	
	/////////////////////////////////////////////////////
	
	function dispatchLoadProgress(loader_){
		dispatchEvent({type:"onLoadImageProgress",target:this,loader:loader_})   
	}
	
	///////////////////////////////////////////////
	
	function dispatchLoadInitImage(w,h){
		dispatchEvent({type:"onLoadImageInit",target:this,bmp:this.__bmp,w:w,h:h})   
	}
	
	///////////////////////////////////////
	
	function dispatchIntroStart(){
		dispatchEvent({type:"onIntroStart",target:this})
	}
	
	////////////////////////////////////////////
	
	function dispatchIntroEnd(){
		dispatchEvent({type:"onIntroEnd",target:this})
	}
	
	/////////////////////////////////////////////
	
	function dispatchImageResize(){
		dispatchEvent({type:"onImageResize",target:this})
	}
	
	//////////////////////////////////////////////
	
	function dispatchExitStart(){
		dispatchEvent({type:"onExitStart",target:this})
	}
	
	////////////////////////////////////////
	
	function dispatchExitEnd(){
		dispatchEvent({type:"onExitEnd",target:this})
	}
	
	///////////////////////////////////////////
	
	function dispatchChangedIndex(){
		dispatchEvent({type:"onChangedIndex",target:this})   
	}
	
	////////////////////////////////////////////////////////
	
	function dispatch_onRollOverImage(){
	dispatchEvent({type:"onRollOverImage",target:this})
    }
	
    ///////////////////////////////  
	
	function dispatch_onRollOutImage(){
	dispatchEvent({type:"onRollOutImage",target:this})
    }
	
 ////////////////////////////////////////////////////////////////////////////////////////////////FUNCTION		

public function setPortionThumb(indexThumb_){
		this.__thumbModel.setCurrent(indexThumb_)
		dispatchChangedPortion()
}

//////////////////////////////////////

function next_time(time_:Number){ 
	if(this.__slide==true){
		this.__timereal=getTimer()
		
	var time=(time_==undefined) ? Configuration.TIMESLIDE : time_
	this.__I=setInterval(this,"next",time)
	this.__I2=setInterval(this,"progressTime",1)
	}	
}

/////////////////////////////////

function progressTime(){  
	var value=(  (getTimer()-this.__timereal)/Configuration.TIMESLIDE)*100
	value=Math.max(Math.min(value,100),0)
    dispatchTime(value)
}

////////////////////////////////////

function slide_start(){   
	this.__slide=true
	next()
	dispatchStartSlide()
}

/////////////////////////////////////

function slide_stop(){    
	this.__slide=false
	this.__slide=false
	clearInterval(__I)
	clearInterval(__I2)
	dispatchStopSlide()
}

/////////////////////////////////////////////////////////

function Stop(){
this.slide_stop()
__model_flv.Stop()
this.__target.__image.__container2.stop()
}

///////////////////////////////////////////////next image

function next(){
	clearInterval(__I)
	clearInterval(__I2)
	this.index++
	if(this.index>=this.__array.length){
		this.index=1
	}
	loadImage(this.__index)
	dispatchNext()
}

///////////////////////////////////////////////prev image

function prev(){
	this.index--
	if(this.index<=0){
		this.index=this.__array.length-1
	}
	loadImage(this.__index)
	dispatchPrev()
}

///////////////////////////////////////////////

function getAttributes(nr_:Number) {
	var nr=(nr_==undefined) ? this.index : nr_
	return this.__array[this.index]
}

//////////////////////////////////////

function set index(index_:Number){
	this.__index=index_
}

//////////////////////////////////////////////

function get index():Number{
return this.__index;
}  

////////////////////////////////////////////////

public function load(){
	this.dispatch_onLoadImage()
}

/////////////////////////////////////////////

function dispatch_onLoadImage(){
	dispatchEvent({type:"onLoadImage",target:this})
}

//////////////////////////////////////////////////////////

function imageResize(){
	dispatchImageResize()
}

/////////////////////////////////////////

function introStart(){
	dispatchIntroStart()
}

///////////////////////////////////////////////

function introEnd(){
	dispatchIntroEnd()
}

//////////////////////////////////////////////

function exitStart(){
	dispatchExitStart()
}

//////////////////////////////////////////////

function exitEnd(){
	dispatchExitEnd()
}	
///////////////////////////////////////////////	

function shovNetwork(){
	
	this.dispatchEvent({target:this,type:"onShovNetwork",network:this.__target.__network})	
}

/////////////////////////////////

function hideImage(){
	this.dispatchEvent({target:this,type:"onHideImage"})	
}

//////////////////////////////////////////////
	
  
}