import templateSlider.mvcgallery.*
import templateSlider.mvc.*
import templateSlider.I.*
import flash.display.BitmapData
import templateSlider.util.Observable
import mx.transitions.Tween
import mx.transitions.easing.*
import templateSlider.Configuration
import factory.Swf

class templateSlider.mvcgallery.ImageView extends AbstractView {
	var __background:MovieClip
	var __container:MovieClip
	var __container2:MovieClip
	var __width:Number
	var __height:Number
	var __bmp:BitmapData
	////tweeny
	var tweenIn:Tween
	var tweenW:Tween
	var tweenH:Tween
	var tweenOut:Tween
	////////mouse effect
	var __maxWidth:Number
	var __maxHeight:Number
	var __mask:MovieClip
	var __xmouse
	var __ymouse
	///////////////
	var __spaceDown:Number=60
	var __space:Number=21
	var __hitTest:Boolean=false
	var __loader:MovieClipLoader
	var __visibility:Boolean = false	
	
	var oldWidth:Number
	var oldHeight:Number
	
	var model_flv
	
	var __inter:Number
	var __interMetaData
/////////////////////////////////////////////////////////	
	
function ImageView(){
	this.__background.useHandCursor=false
	this.__background._width=0
	this.__background._height=0
}

/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new ImageController(model)
 }
 
//////////////////////////////////////////////////////////////////
 
 function onLoad() {
	 
	 if(Configuration.BACKGROUND_COLOR_SLIDER.length){
	 NewColor.setColor(__background.bcg, Configuration.BACKGROUND_COLOR_SLIDER.split(",")[0])
	 __background.bcg._alpha = Configuration.BACKGROUND_COLOR_SLIDER.split(",")[1]
	 }
	 
	 
	 //this.__background._width=0
	// this.__background._height=0
	///Stage.addListener(this)	 
 }
 
////////////////////////////////////////////////////////////////////////////
 
 function onResize(){
	  var m:GalleryModel=GalleryModel(this.getModel())
	  this._x=m.width/2
      this._y =m.height/2//(m.height-m.__target.__network.getHeightNetwork())/2
	  
	  
      if(this.__visibility==true){
       m.dispatchExitStart()
     }
 }
 
//////////////////////////////////////////////////////////////////////////////
 
 function onLoadStart(){
	 	var m:GalleryModel=GalleryModel(this.getModel())
	 m.onLoadImageStart()
 }
 
///////////////////////////////////////////////////////////

function setMaxWidth(width_:Number){
	__maxWidth=	width_
}

/////////////////////////////////////////////////////////////////////////////////////////////

function getMaxWidth():Number{
	return __maxWidth
}

///////////////////////////////////////////////////////////////////////////////////////////

function setMaxHeight(height_:Number){
   __maxHeight=height_	
}

//////////////////////////////////////////////////////////////////////////////////////////

function getMaxHeight():Number{
	return __maxHeight	
}

//////////////////////////////////////////////////////////////////event firstIntro and Exit

function onIntroStart() {
	__container2._alpha=100
	 var obiekt = {ra:100, rb:255, ga:100, gb:255, ba:100, bb:255, aa:100, ab:0};
	var k = new Color(this.__container);
	///k.setTransform(obiekt);
	
	
	stop_tween()
	/////////////////////////////
	var m:GalleryModel=GalleryModel(this.getModel())  //model gallery
	
	
	var newW =this.width+this.__space*2
	var newH =this.height+(__space+__spaceDown)
	
	
	
	if (newW != oldWidth || newH !=oldHeight||oldWidth==undefined) {
		var time_resize:Number = 1
	}else {
		var time_resize:Number = .1
	}
	
	
	////////////change size background
	tweenW=new Tween(__background,'_width',Strong.easeInOut,__background._width,newW,time_resize,1)
	tweenW.onMotionChanged=Delegate2.create(m,m.imageResize)
    tweenW.onMotionFinished=Delegate2.create(this,this.intro)
	tweenH=new Tween(__background,'_height',Strong.easeInOut,__background._height,newH,time_resize,1)
			
	this.__container._alpha=0
	this.__container2.__model.setGlobalXY()	
	
	
	
}

////////////////////////////////////////////////////////////////////////////////

function onLoadComplete(target) {
	target._alpha=0	
}

////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target) {
  var m:GalleryModel=GalleryModel(this.getModel())
  //////max height and max width	
  setMaxWidth(m.width)
  setMaxHeight(m.height-150)
	   	
  if(m.isFlv()==false){ ///is image
       onLoadInitImage(target)
	    var m:GalleryModel=GalleryModel(this.getModel())
		m.dispatchLoadInitImage()
		var m:GalleryModel=GalleryModel(this.getModel())
		m.introStart()
	}else{   ////////////////////////is FLV !!
  	    onLoadInitFlv(target)
	}
	
	 oldWidth = this.width + this.__space * 2
	oldHeight = this.height + (__space + __spaceDown)
}

/////////////////////////////////////////////////////////////////////

function set width(value_:Number){
	this.__width=value_
}

////////////////////////////////////////////////////////////////////

function get width(){
	return __width
}

/////////////////////////////////////////////////////////////////////

function set height(value_:Number){
	this.__height=value_
}

////////////////////////////////////////////////////////////////////

function get height(){
	return __height
}

////////////////////////////////////////////////////////////////////

function onLoadInitImage(target){
	  var m:GalleryModel=GalleryModel(this.getModel())
	  var widthXml=m.getAttributes().width
	  var heightXml=m.getAttributes().height
	    if(widthXml!=undefined&&heightXml!=undefined){
			var w=Number(widthXml)
			var h=Number(heightXml)
		}else{
	     	var resize:Resize=new Resize(this.__maxWidth,this.__maxHeight,target._width,target._height)
		    var new_size:Object=resize.min()
		
		if(new_size.typ=="-"){
			var w=new_size.w
			var h=new_size.h
		}else{
			var w=target._width
			var h=target._height
		}
		}
		this.width=w
		this.height=h
		target._width=w
		target._height=h

	this.__container._x=-this.width/2
	this.__container._y=-h/2-(__space+__spaceDown)/2+__space
}

//////////////////////////////////////////////////////////////////////

function onLoadInitFlv(target){
	  var m:GalleryModel=GalleryModel(this.getModel())
	  model_flv=this.__container2.getInstance()
	   m.__model_flv=model_flv
	   ///model_flv.volume=0
	  model_flv.fullScreen=false
	  model_flv.setConfig(m.__configurationFLV)
	 // model_flv.addEventListener("onMetaData",this)
	  model_flv.addEventListener("onEndMove",this)
	   var url:String=m.getAttributes().picbig
	  var preview:String=m.getAttributes().preview
	  model_flv.setUrl(url,preview)
	  model_flv.Stop()
      ////////////////////////////////////////////////////SIZE 
	  var widthXml=m.getAttributes().width
	  var heightXml=m.getAttributes().height
	  
	  if(widthXml!=undefined&&heightXml!=undefined){    ////width and height for xml file
			var w=Number(widthXml)
			var h=Number(heightXml)
	 }else{
	  
	  var resize:Resize=new Resize(this.__maxWidth,this.__maxHeight,model_flv.newWidth,model_flv.newHeight-model_flv.__toolsHeight)
	  var new_size:Object=resize.min()
	  if(new_size.typ=="-"){
			var w=new_size.w
			var h=new_size.h+model_flv.__toolsHeight
	  }else{
			var w=model_flv.newWidth
			var h=model_flv.newHeight
		}
	  }
	  this.width=w
	  this.height = h
	  
	  
	  
	  ///////set width,height,x,y player
	  model_flv.width=this.width
      model_flv.height = this.height
	  
	    
	  this.__container._x=-model_flv.width/2
	  this.__container._y=-model_flv.height/2
	
	 var m:GalleryModel=GalleryModel(this.getModel())
	 m.dispatchLoadInitImage()
	 m.introStart()
}

/////////////////////////////////////////////////////////////////////

function onMetaData(){
	 var m:GalleryModel=GalleryModel(this.getModel())
	  clearInterval(__interMetaData)
	  model_flv.Stop()
	  var resize:Resize=new Resize(this.__maxWidth,this.__maxHeight,model_flv.__widthOrginal,model_flv.__heightOrginal)
	  var new_size:Object=resize.min()
		
	   if(new_size.typ=="-"){
			var w=new_size.w
			var h=new_size.h
		}else{
			var w=model_flv.__widthOrginal
			var h=model_flv.__heightOrginal
		}
		
	this.width = w
	this.height = h + model_flv.__toolsHeight
	
	///////set width,height,x,y player
	  model_flv.width=this.width
      model_flv.height = this.height
	  
	 _root._visible=false
	  
	  this.__container._x=-model_flv.width/2
	  this.__container._y=-model_flv.height/2
	  
	
	 m.dispatchLoadInitImage()
	 m.introStart()
}

//////////////////////////////////////////////////////////////////////////

function onEndMove(){
	var m:GalleryModel=GalleryModel(this.getModel())
	m.next_time(0)
}

//////////////////////////////////////////

function onLoadProgress(target,l,t){
	var m:GalleryModel=GalleryModel(this.getModel())
	var loader_={}
	loader_.target=target
	loader_.l=l
	loader_.t=t
	m.dispatchLoadProgress(loader_)
}

///////////////////////////////////////////////////////////////////////////

	function onChangedIndex(){
		var m:GalleryModel=GalleryModel(this.getModel())
		this.__background._visible=true
		if(!this.__container){
		this.shov()	
		firstIntro()
		}
		else{
		var model:GalleryModel=GalleryModel(this.getModel())
		model.exitStart()
		}
	}

////////////////////////////////////////////////////

function onLoadImage() {
	this.__background.useHandCursor=false
	this.__background.enabled=false	
	
var m:GalleryModel=GalleryModel(this.getModel())
var url = m.getAttributes().picbig

if(url!=undefined){

if(!this.__container){
		this.__loader=new MovieClipLoader()
		this.__loader.addListener(this)
		
}
this.__container=this.createEmptyMovieClip("container",1)	
		this.__container2=this.__container.createEmptyMovieClip("setno",1)

if(m.isFlv()==true){
///var factory_swf:Swf=new Swf()
var swf = Configuration.URL_PLAYER_FLV//factory_swf.getSwf("player_flv")
this.__loader.loadClip(swf,this.__container2)	
}else{
this.__loader.loadClip(url,this.__container2)
}
}


}

//////////////////////////////////////////////////

function getWidth(){
	return this.__background._width
}

///////////////////////

function getHeight(){
	return this.__background._height
}
	
///////////////////////////////////////////////////////////////////////////

function firstIntro(){   
		var model:GalleryModel=GalleryModel(this.getModel())
		__background._width=600
		__background._height=300
		
		var th=this
		__background._alpha=0
		model.imageResize()
				
		this.__background.tween('_alpha',100,1,'easeOutCubic',.1)
		
}

//////////////////////////////////////////////////////////////////////

function onPressClose(){
this.__background.useHandCursor=false
this.__background.enabled=false	
this.hide()	
}
	
///////////////////////////////////////////////////////////////////////////

function shov(){
	this.__visibility=true
}

///////////////////////////////////////////////////////////////////////////

function hide(){
	this.__container2.__model.Pause()
	this.__visibility=false
	this.__container.removeMovieClip()
	delete this.__container
	this.__background.stopTween()
	this.__background.tween('_width',0,.7,'easeInOutSine',0,{scope:this,func:this.endHide})
	this.__background.tween('_height',0,.7,'easeInOutSine',0)
	this.__mask._visible=false
}

//////////////////////////////////////////////////

function endHide(){
	//this.__background._visible=false
}

////////////////////////////////////////////////////////////////////////////

function stop_tween(){
	tweenW.stop()
	tweenH.stop()
	this.tweenIn.stop()
	tweenOut.stop()
	__container.stopTween()
}

////////////////////////////////////////////////////////////////////////////

function intro(){
	this.iniTween()
	stop_tween()
	var m:GalleryModel=GalleryModel(this.getModel()) 

	//this.tweenIn=new Tween(__container,'_alpha',Strong.easeInOut,0,100,1,1)
   /// this.tweenIn.onMotionFinished=Delegate2.create(m,m.introEnd)
   
   var obiekt = {ra:100, rb:255, ga:100, gb:255, ba:100, bb:255, aa:100, ab:0};
	var k = new Color(this.__container);
	//k.setTransform(obiekt);
	
	__container.stopTween()
	__container.colorTransformTo(100, 0, 100, 0, 100, 0, 100, 0,(Configuration.TIME_INTRO/1000), 'easeOutCubic',0,{scope:m,func:m.introEnd});
}

////////////////////////////////////////////////////////////////////////////

function onIntroEnd(){
	var m:GalleryModel=GalleryModel(this.getModel())
		
	  if(model_flv.autoPlay==true||m.__slide==true){
		model_flv.Start()
	  }
	 ////model_flv.volume=model_flv

	var c:ImageController=ImageController(this.getController())
	c.onIntroEnd()
	
	 this.hitArea=this.__container2
	 this.enabled=true
	 //////////////////////jesli jest dany link
	 if(m.getAttributes().url.length){
		 this.__container.enabled=true
	  this.__container.useHandCursor=true
	  this.__container.onPress=Delegate2.create(this,this.onPressBackground)
	 }else{
		this.__container.useHandCursor=false 	
		this.__container.enabled=false
	 }
	 
	
}

////////////////////////////////////////////////////////////////////////////

function onExitStart(){
	delete model_flv
	this.__background.useHandCursor=false
	this.__background.enabled=false
	this.__container2.__model.Pause()	
	stop_tween()
	var m:GalleryModel=GalleryModel(this.getModel())
	
	tweenOut.stop()
	tweenOut=new Tween(__container,'_alpha',Strong.easeOut,__container._alpha,0,(Configuration.TIME_EXIT/1000),1)
	tweenOut.onMotionFinished=Delegate2.create(m,m.exitEnd)
	
	
	///this.__container.colorTransformTo(100, 255, 100, 255, 100, 255, 100, 0,(Configuration.TIME_EXIT/1000), 'easeInOutCubic', 0, {scope:m, func:m.exitEnd, args:[]});
}

////////////////////////////////////////////////////////////////////////////

function onExitEnd(){
	this.__container.frame.removeMovieClip()
	var c:ImageController=ImageController(this.getController())
	c.onExitEnd()
}	

/////////////////////////////////////////////////////////////////////////////////






/////////////////////////////////////////////////////////////////////////////MOUSE EVENT

private function iniTween(){
///this.createMask()
}

////////////////////////////////////////////////////////////

//private function onRollOver(){
	////watchMouse()
	
///}

///////////////////////////////////////

///private function onRollOut(){
	
////}

/////////////////////////////////////


function onPressBackground(){
	var m:GalleryModel=GalleryModel(this.getModel())
	var url=m.getAttributes().url
	var target=m.getAttributes().target
	if(target==undefined){
		target="_blank"
	}
	
	if(url.length){
	  getURL(url,target)
	 }
}


///////////////////////////////////////////////////////////////////////////

function onMouseMove(){
	var m:GalleryModel=GalleryModel(this.getModel())
	
	if(hitTestImage()&&this.__hitTest==false){
	this.__hitTest=true
	m.dispatch_onRollOverImage()
	}else if(!hitTestImage()&&this.__hitTest==true) {
	this.__hitTest=false
	m.dispatch_onRollOutImage()		
	}
}

///////////////////////////////////////////////////////////////////////////


private function resetTween(){
	delete this.onEnterFrame
	this.__container2._x=0
	this.__container2._y=0
}

///////////////////////////////////////////////////////////////////////////

private function createMask(){
	this.resetTween()
	this.__mask///=this.createEmptyMovieClip("mc_mask",3214)
	this.__mask._x=this.__container._x
	this.__mask._y=this.__container._y
	Drawing.rectangle(this.__mask,0,0,this.width,this.height,["0xFF0000",100])
	////this.__container.setMask(this.__mask)
	onRollOver()
}

///////////////////////////////////////////////////////////////////////////

private function hitTestImage(){
	return this.__container2.hitTest(_root._xmouse,_root._ymouse,true)
}

//////////////////////////

private function watchMouse(){
	this.onEnterFrame=function(){
		
	if(hitTestImage()){	
	__xmouse=Math.max(0,Math.min(  this.__mask._xmouse/this.width  ,1))
	__ymouse=Math.max(0,Math.min(  this.__mask._ymouse/this.height  ,1))
	}
	
	var encoreX=this.__container2._width-this.width
	var encoreY=this.__container2._height-this.height
	var valueX=-__xmouse*encoreX
	var valueY=-__ymouse*encoreY
	
	this.__container2._x+=(valueX-this.__container2._x)/6
	this.__container2._y+=(valueY-this.__container2._y)/6
	
	var oddsX=this.__container2._x-this.__container2.x
	var oddsY=this.__container2._y-this.__container2.y
	
	if(oddsX==0&&oddsY==0&&!hitTestImage()){
		delete this.onEnterFrame
		
	}
	this.__container2.x=this.__container2._x
	this.__container2.y=this.__container2._y
}}

///////////////////////////////////////////////////////////////////////////

	
}

