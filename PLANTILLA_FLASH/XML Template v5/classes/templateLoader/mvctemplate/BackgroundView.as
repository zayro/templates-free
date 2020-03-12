import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData

import flash.display.*;
import flash.geom.*;
import flash.filters.GlowFilter


import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*

  

class templateLoader.mvctemplate.BackgroundView extends AbstractView {
			
/////////////////////////////////////////////////////////////////////////////////////////
var __arrayContainer:Array
var __container:MovieClip
var __containerCurrent:MovieClip
var __bitmap:BitmapData
var __tweenAlpha:Tween
private var __gradient:MovieClip
/////////////////////////////////////////////////////////////////////////////////////////
var __url:String
var __inter:Number
var __target:MovieClip
var __bmp:BitmapData
var __inter_start:Number

var _timeTweenIntro:Number=.7


/////////////////////////////////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new BackgroundController(model)
 }
 
/////////////////////////////////////////////////////////////////////////////////////////

function BackgroundView(){
		__arrayContainer=[]
		this.__container=this.createEmptyMovieClip("mcContainer",1)
}
 
/////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
	var m:LoaderModel=LoaderModel(this.getModel())
    m.__loaderBck.addListener(this)
	__gradient.swapDepths(101)
	__gradient._visible=false
	onResizeAlpha()
}

////////////////////events model ///////////////////////////////////////////////////////////

function onChangedPositionMenu() {
var m:LoaderModel=LoaderModel(this.getModel())	

this.__tweenAlpha.stop()
__tweenAlpha.stop()

 
clearInterval(__inter_start)
///__inter_start=setInterval(this,'start_change_background',600)


}

////////////////////////events model/////////////////////////////////////////////////////////////////

function onExitEnd(){
	start_change_background()
}

///////////////////////////////////////////////////////////////////////////////////////

function onExitStart() {
	
	
}

///////////////////////////////////////////////////////////////////////////////////////

private function start_change_background() {
	clearInterval(__inter_start)
	
	clearInterval(this.__inter)
	var m:LoaderModel=LoaderModel(this.getModel())
	var node:XMLNode=m.currentNode
	var new_url=node.attributes.background
	
	if(new_url.length==0||new_url==undefined||typeof(new_url)!="string"){
	 this.__inter=setInterval(this,'changeBackground',100,ConfigurationSite.DEFAULT_BACKGROUND) 
	}else{
	this.__inter=setInterval(this,'changeBackground',100,new_url)
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

function changeBackground(url_:String){
	clearInterval(this.__inter)
	var new_url=url_
		
	if(new_url==this.__url){  /////old background and new background - tozsamosc
	 this.fadeInEnd()	
	}else{
	   setBackground(new_url)
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

function setBackground(url_:String){
	__url=(url_)
	
	if(__url=="transparent"){
		 this.removeAll()
	     this.fadeInEnd()
	}else{
	
	if(__url.indexOf("x")>=0){
	this.changeColorBackground(__url)  //////////////change Color Background (not loaded)
	}else{
	this.loadBackground(__url)    //////////////////////load file Background
	}
	
	}
}

////////////////////////////////////////////////////////////////////////////////////

private function mask(){
	
	var m:LoaderModel=LoaderModel(this.getModel())
	var mask:MovieClip=this.createEmptyMovieClip("mcMask",125532452)
	
	Drawing.rectangle(mask,0,0,m.__width,m.__height,["0xFF0000",100])
	this.setMask(mask)	

}

///////////////////////////////////////////////////////////////////////////////////

function onResizeAlpha() {
	var m:LoaderModel=LoaderModel(this.getModel())
	
	__gradient._width = m.width
	__gradient._height = m.height//-m.__footerHeightHide
	
}

///////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	onResizeAlpha()
	
	if(__url.indexOf("network")>=0){ ///////network image
	create_network(__bitmap)
	}else if(m.__currentNode.attributes.backgroundResize!="noResize"){
	var resize:Resize=new Resize(m.__width,m.__height,__containerCurrent._width,__containerCurrent._height)
	var new_size:Object=resize.max()
	this.__containerCurrent._width=new_size.w
	this.__containerCurrent._height=new_size.h
	}
	
	this.mask()
	
	this.reset()
	
}

/////////////////////////////////////////////////////////////////////////////////////////

private function changeColorBackground(url){
	this.create_next_movieclip()
	Drawing.rectangle(this.__containerCurrent,0,0,Stage.width,Stage.height,[url,100])
	this.reset()
	this.__containerCurrent._alpha = 0
	__tweenAlpha.stop()
	this.__tweenAlpha=new Tween(__containerCurrent,"_alpha", mx.transitions.easing.Strong.easeIn,0,100,_timeTweenIntro,true);
	this.__tweenAlpha.onMotionFinished = Delegate2.create(this, this.fadeInEnd)
	
	visible_unvisible_gradient()
}

/////////////////////////////////////////////////////////////////////////////////////////

private function loadBackground(url_){
	var m:LoaderModel=LoaderModel(this.getModel())
	
	var dep:Number=this.__container.getNextHighestDepth()
	this.__containerCurrent=this.__container.createEmptyMovieClip("mcContainer"+dep,dep)
	this.__arrayContainer.push(this.__containerCurrent)
	
	
	
	if(url_.indexOf("network")>=0){ ///////network image
	m.__loaderBck.loadClip(url_.split(",")[0],this.__containerCurrent.createEmptyMovieClip("container",1))	
	}else{   ///not network image
	m.__loaderBck.loadClip(url_,this.__containerCurrent.createEmptyMovieClip("container",1))
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

private function create_next_movieclip(){
	var dep:Number=this.__container.getNextHighestDepth()
	this.__containerCurrent=this.__container.createEmptyMovieClip("mcContainer"+dep,dep)
	this.__arrayContainer.push(this.__containerCurrent)	
}

/////////////////////////////////////////////////////////////////////////////////////////

private function create_network(bmp_) {
	var m:LoaderModel=LoaderModel(this.getModel())
	var linkage = "background_rectangle";
	create_next_movieclip()

	/////create network
	var w:Number = m.width
	var h:Number = m.height//-m.__footerHeightHide
	
	
    var matrix = new Matrix(); 
    matrix.rotate(Math.PI/2);
	
	
	this.__containerCurrent.clear();
	this.__containerCurrent.beginBitmapFill(bmp_,matrix);
	this.__containerCurrent.lineTo(w, 0);
	this.__containerCurrent.lineTo(w,h);
	this.__containerCurrent.lineTo(0,h);
	this.__containerCurrent.lineTo(0, 0);
	this.__containerCurrent.endFill();
	
	
	/////////////////////////////////////////////
	/*
	  var filter:GlowFilter = new GlowFilter();
	  filter.color = 0x000000
	  filter.alpha = 200
	  filter.blurX = 700
	  filter.blurY = 700
	  filter.strength = 1.3
	  filter.quality = 3
	  filter.inner = true
	  filter.knockout = false
	  var filterArray:Array = new Array();
      filterArray.push(filter);
      __containerCurrent.filters = filterArray;
	 /*/
	
	
	/*  old version
	var w = __target._width//102;
	var h = __target._height//102;
	var spaceX:Number = 0
	var spaceY:Number = 0
	var lengthX:Number = Math.ceil(Stage.width/(w+spaceX));
	var lengthY:Number = Math.ceil(Stage.height/(h+spaceY))
	var dep:Number = 0;
	for (var x = 0; x<lengthX; x++) {
		for (var y = 0; y<lengthY; y++) {
			var row:MovieClip = this.__containerCurrent.createEmptyMovieClip(linkage+x,dep++);
			row.attachBitmap(bmp_,1)
			row._x = (w+spaceX)*x;
			row._y = (h+spaceY)*y;
		}
	}
	/*/
}

/////////////////////////////////////////////////////////////////////////////////////////

function onLoadComplete(target:MovieClip) {
__target._parent=target
target._parent._alpha=0
}

//////////////////////////////////////////////////////////////////////////////////////////

function onLoadStart() {
	
	
}

//////////////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target:MovieClip){
	this.reset()
		
	if (__url.indexOf("network") >= 0) {  /////jesli bedziemy tworzyc siatke
	//__bitmap.dispose()
	    __bitmap = new BitmapData(target._width, target._height, false)
		target.bmp=__bitmap
		__bitmap.draw(target)
		target._visible=false
		this.create_network(__bitmap)	
		var delay=0
	}else {
		
		if(ConfigurationSite.SMOOTHING_BACKGROUND=="true"){
	//__bmp.dispose()	
	target.bmp = new BitmapData(target._width, target._height, true, 0xFF0000)
	///__bmp=target.bmp
	target.bmp.draw(target)
	target._parent.attachBitmap(target.bmp, 2, "auto", true)
	target.removeMovieClip()
	}
		
		onResize()	
		var delay=1
	}
	
	this.__containerCurrent._alpha = 0
	__tweenAlpha.stop()
	this.__tweenAlpha=new Tween(__containerCurrent,"_alpha", mx.transitions.easing.Strong.easeIn,0,100,_timeTweenIntro,true);
	this.__tweenAlpha.onMotionFinished = Delegate2.create(this, this.fadeInEnd)
	
	visible_unvisible_gradient()
	
}


/////////////////////////////////////////////////////////////////////////////////////////

function visible_unvisible_gradient() {
	
	if (__gradient._visible == false&&ConfigurationSite.GRADIENT_BACKGROUND=="true") {
		__gradient._alpha = 0
		if(ConfigurationSite.GRADIENT_COLOR.length){
		NewColor.setColor(__gradient,ConfigurationSite.GRADIENT_COLOR)
		}
		__gradient._visible = true
		new Tween(__gradient,"_alpha", mx.transitions.easing.Strong.easeIn,0,100,_timeTweenIntro,true);
		
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

function reset(){
	var len:Number=this.__arrayContainer.length-2
	for(var i=0;i<len;i++){
		var mc:MovieClip = MovieClip(this.__arrayContainer.shift())
		mc.bmp.clear()
		mc.bmp.dispose()
		mc.removeMovieClip()
		
	}
	for(var i in this.__arrayContainer){
		var mc:MovieClip=MovieClip(this.__arrayContainer[i])
		mc.stopTween()
	}
}

////////////////////////////////////////////////////////////////////////////////////////

function removeAll(){
	for(var i in this.__arrayContainer){
		var mc:MovieClip=MovieClip(this.__arrayContainer[i])
		mc.stopTween()
		mc.removeMovieClip()
}
}

/////////////////////////////////////////////////////////////////////////////////////////

function fadeInEnd(){
	var m:LoaderModel=LoaderModel(this.getModel())
	m.load()
	
}

/////////////////////////////////////////////////////////////////////////////////////////



}

