import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration
import mx.transitions.Tween;


   

class templateBook.mvctemplate.BackgroundView extends AbstractView {
			
/////////////////////////////////////////////////////////////////////////////////////////
var __arrayContainer:Array
var __container:MovieClip
var __containerCurrent:MovieClip
var __bitmap:BitmapData
var __tweenAlpha:Tween
/////////////////////////////////////////////////////////////////////////////////////////
var __url:String
var __inter:Number

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
	var m:BookModel=BookModel(this.getModel())
}

////////////////////events model Book///////////////////////////////////////////////////////////////

function onChangeBackground(){
	var m:BookModel=BookModel(this.getModel())
	var url=m.__background
	
     ///this.__inter=setInterval(this,'changeBackground',0,url)
	 changeBackground(url)
}

/////////////////////////////////////////////////////////////////////////////////////////

function changeBackground(url_:String){
	clearInterval(this.__inter)
	var new_url=url_
	if(new_url==this.__url||new_url.length==0&&new_url==undefined||typeof(new_url)!="string"){
	this.fadeInEnd()	
	return;	
	}
	__url=new_url
	
	if(__url=="transparent"){
	     this.fadeInEnd()
	}else{
		this.changeBackground2()
	}
	
	
}

///////////////////////////////////////////////////////////////////////////////////////////

private function changeBackground2(){
	if(__url.indexOf("x")>=0){
	this.changeColorBackground(__url)  //////////////change Color Background (not loaded)
	}else{
	this.loadBackground(__url)    //////////////////////load file Background
	}
	
	
}

////////////////////////////////////////////////////////////////////////////////////

private function mask(){
	var m:BookModel=BookModel(this.getModel())
	var mask:MovieClip=this.createEmptyMovieClip("mcMask",125532452)
	
	Drawing.rectangle(mask,0,0,m.__width,m.__height,["0xFF0000",100])
	this.setMask(mask)	
}

///////////////////////////////////////////////////////////////////////////////////

function onResize(){
	
	if(__url.indexOf("network")>=0){ ///////network image
	create_network(__bitmap)
	}else{
	var resize:Resize=new Resize(Stage.width,Stage.height,this.__container._width,this.__container._height)
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
	this.__containerCurrent._alpha=0
	this.__tweenAlpha=new Tween(__containerCurrent,"_alpha", mx.transitions.easing.Strong.easeOut,0,100,2,true);
	this.__tweenAlpha.onMotionFinished=Delegate2.create(this,this.fadeInEnd)
}

/////////////////////////////////////////////////////////////////////////////////////////

private function loadBackground(url_){
	var loader:MovieClipLoader=new MovieClipLoader()
	loader.addListener(this)
	
	var dep:Number=this.__container.getNextHighestDepth()
	this.__containerCurrent=this.__container.createEmptyMovieClip("mcContainer"+dep,dep)
	this.__arrayContainer.push(this.__containerCurrent)
	
	if(url_.indexOf("network")>=0){ ///////network image
	loader.loadClip(url_.split(",")[0],this.__containerCurrent)	
	}else{   ///not network image
	loader.loadClip(url_,this.__containerCurrent)
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

private function create_next_movieclip(){
	var dep:Number=this.__container.getNextHighestDepth()
	this.__containerCurrent=this.__container.createEmptyMovieClip("mcContainer"+dep,dep)
	this.__arrayContainer.push(this.__containerCurrent)	
}

/////////////////////////////////////////////////////////////////////////////////////////

private function create_network(bmp_){
	var linkage = "background_rectangle";
	create_next_movieclip()
	var w = 102;
	var h = 102;
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
}

/////////////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target){
	this.reset()
		
	if(__url.indexOf("network")>=0){  /////jesli bedziemy tworzyc siatke
	    __bitmap=new BitmapData(target._width,target._height,false)
		__bitmap.draw(target)
		target._visible=false
		this.create_network(__bitmap)	
		var delay=0
	}else{
		onResize()	
		var delay=1
	}
	
	this.__containerCurrent._alpha=0
	this.__tweenAlpha=new Tween(__containerCurrent,"_alpha", mx.transitions.easing.Strong.easeOut,0,100,2,true);
	this.__tweenAlpha.onMotionFinished=Delegate2.create(this,this.fadeInEnd)
}

/////////////////////////////////////////////////////////////////////////////////////////

function reset(){
	var len:Number=this.__arrayContainer.length-2
	for(var i=0;i<len;i++){
		var mc:MovieClip=MovieClip(this.__arrayContainer.shift())
		mc.removeMovieClip()
	}
	for(var i in this.__arrayContainer){
		var mc:MovieClip=MovieClip(this.__arrayContainer[i])
		mc.stopTween()
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

function fadeInEnd(){
	var m:BookModel=BookModel(this.getModel())
	m.dispatchEvent({target:this,type:"onLoadBackground"})
}

/////////////////////////////////////////////////////////////////////////////////////////



}

