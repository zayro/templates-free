import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*

import caurina.transitions.*
import caurina.transitions.properties.FilterShortcuts;

import flash.filters.BlurFilter;

import com.asual.swfaddress.SWFAddress;
import com.asual.swfaddress.SWFAddressEvent;
  
import LuminicBox.Log.*


class templateLoader.mvctemplate.ContainerView extends AbstractView {
		
	
var __container:MovieClip
var __loader:MovieClipLoader	
var twen_intro:Tween
var tween_exit:Tween
var blurValue:Number=30

/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new ContainerController(model)
 }
 
//////////////////////////////////////////////////////////////////////////

function stop_tweens() {
///Tweener.remoc
twen_intro.stop()
tween_exit.stop()
}

///////////////////////////////////////////////////////////////////////////

function onLoad() {
	FilterShortcuts.init();
	this.onResize()	
}

///////////////////////////////////////////////////////////////////////////

function onChangedPositionMenu(){
   // stop_tweens()
   
	var m:LoaderModel=LoaderModel(this.getModel())
	if(m.currentNode.attributes.template.length){
	m.exitStart()
	}else {
        	if(m.currentNode.parentNode.parentNode==null){
	 m.exitEnd()
            }
	}
    
	this.__container.onChangedPositionMenu()
	
}
 
//////////////////////////////////////////////////////////////////
 
private function load(){
	
	
	var m:LoaderModel=LoaderModel(this.getModel())
	if(!this.__container){
		this.__container=this.createEmptyMovieClip("mc_container",1)		
	}
	m.__loader.unloadClip(__container)
	m.__loader.loadClip(m.__swf,this.__container)
}

////////////////////////////////////////

function onLoadXml(){
	var m:LoaderModel=LoaderModel(this.getModel())
	//if(!this.__container){
	this.stop_tweens()
	this.load()
	
	//}else{
	//m.exitStart()
	///}
}

///////////////////////////////////////////////////////

function onLoadComplete(target:MovieClip) {
	target._visible=false
}

///////////////////////////////////////////////////////

function onLoadInit(target) {
	
	var m:LoaderModel=LoaderModel(this.getModel())
	target.ini(m.__dateTemplate, m.__configTemplate)
	target._visible=true
	target.onResize({model:m})
	
	var m:LoaderModel=LoaderModel(this.getModel())
	m.introStart()
	
}

/////////////////////////////////////////////////////////////

function onResize() {
	var m:LoaderModel=LoaderModel(this.getModel())
	this.__container.onResize({model:m})	
	this._y=0///m.__footerHeightUp//130
}

//////////////////////////////////////////////////////////

function onIntroStart(){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	stop_tweens()
	
	////old
	//var filter:BlurFilter = new BlurFilter(blurValue,blurValue, 2);
   // var filterArray:Array = new Array();
   // filterArray.push(filter);
  //  this.__container.filters = filterArray;
	///__container._x=-m.width
	
	__container._alpha=0
	
	Tweener.addTween(__container,{_alpha:100,time:.4,delay:0,transition:"easeInOutCubic",onComplete:function() { m.introEnd() }})
	
    
	
	
	//////////if template gallery
	var m:LoaderModel=LoaderModel(this.getModel())
	var arrayNames:Array = SWFAddress.getPathNames()
	var strNames:String = SWFAddress.getValue()
	var name:String = arrayNames[arrayNames.length - 1]
	if(name.indexOf(m.PREFIX_IMAGE)>=0){
	    name = name.split(m.PREFIX_IMAGE)[1]
		var container:MovieClip = m.__target.__container.__container
		var model_gallery = container.getModel()
		var index:Number=Number(name)
		model_gallery.loadImage(index)
	}
	//////////////////////////////////////////////////
	
	
}

////////////////////////////

function onIntroEnd(){
	//var m:LoaderModel=LoaderModel(this.getModel())
	this.__container.onIntroEnd()
	
	
	
	
	
	
}

////////////////////////////////////////////////////

function onExitStart(){
var m:LoaderModel=LoaderModel(this.getModel())
stop_tweens()

if(__container.getBytesTotal()==undefined) {
	m.exitEnd()
	return;
}  
        

///Tweener.removeTweens(__container)
///Tweener.addTween(__container,{_alpha:0,time:.7,delay:0,transition:"easeInOutCubic",onComplete:function() {  m.exitEnd() }})

__container.tween('_alpha',0,.4,'easeOutCubic',.1,{scope:m,func:m.exitEnd})

this.__container.onExitStart()

}

///////////////////////////////////////////////////////////////////////////////////////////////////

function onExitEnd(){
	var m:LoaderModel=LoaderModel(this.getModel())
	m.__loader.unloadClip(__container)
	///this.load()
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadStart(){
		
}

///////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadProgress(){
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////
}

