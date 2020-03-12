import templateGallery.thumb_rotate.*
import flash.display.BitmapData
import mx.events.EventDispatcher

class templateGallery.thumb_rotate.ThumbRotate extends MovieClip
{ 
var mcArea:MovieClip	
var __imageUp:Image
var __imageDown:Image
var __width:Number
var __height:Number
var __title:String="Title 1"
var __oldX:Number
var __oldY:Number
var __orientIn:String
var __loader:MovieClipLoader
var __container:MovieClip
var __bmp:BitmapData
var dispatchEvent:Function
var addEventListener:Function

//////////////////////////////////////////////////////////////////////////////////////////////////

	function ThumbRotate()
	{
		EventDispatcher.initialize(this)	
		mcArea._visible=false
		
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////
	
	function onLoad(){
		this.onRollOver=Delegate2.create(this,this.onRollOverThumb)
		this.onRollOut=Delegate2.create(this,this.onRollOutThumb)
		this.onPress = Delegate2.create(this, this.onPressThumb)
		this.onRelease = Delegate2.create(this, this.onReleaseThumb)
		this.onReleaseOutside= Delegate2.create(this, this.onReleaseOutsideThumb)
		
		this.hitArea = this.mcArea
		this.mcArea._visible=false
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////	

function set width(value_) {
	__width = value_	
	mcArea._width=__width
}

///////////////////////////////////////////////////////////////////////////////////////////////////

function get width() {
	return __width
}

///////////////////////////////////////////////////////////////////////////////////////////////////	

function set height(value_) {
	__height = value_	
	mcArea._height=__height
}

///////////////////////////////////////////////////////////////////////////////////////////////////

function get height() {
	return __height
}
	
///////////////////////////////////////////////////////////////////////////////////////////////////	

public function load(url_:String){
	if(!this.__loader){
		this.__loader=new MovieClipLoader()
		this.__loader.addListener(this)
		this.__container=this.createEmptyMovieClip("mcContainerBmp",1)
	}
	this.__loader.loadClip(url_,this.__container)
}

/////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadComplete(target:MovieClip){
		target._visible=false
	
}

/////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target:MovieClip){
	this.__bmp=new BitmapData(target._width,target._height)
	__bmp.draw(target)
	this.addImage()
	this.dispatchEvent({target:target,type:"onLoadInitThumb"})
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function addImage(){
	    __imageUp=Image(this.attachMovie("ThumbImage","ThumbImageUp",20,{__width:__width,__height:__height}))
		__imageUp.mcContainer.attachBitmap(this.__bmp,1,"auto",true);
		this.__imageUp.setDesc(this.__title)
		//__imageUp.mcDesc._y=__height-__imageUp.mcDesc._height-5
		this.__imageUp.setSize(50,0)
		this.__imageUp.mcDesc._alpha=100
		/////////////////////////////////////////////////////////////////////////////////////////////////
		__imageDown=Image(this.attachMovie("ThumbImage","ThumbImageDown",10,{__width:__width,__height:__height}))	
		__imageDown.mcContainer.attachBitmap(this.__bmp,1,"auto",true);

}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onMouseMove(){
	if(this.hitTest(_root._xmouse,_root._ymouse,true)){
		setOrientRollOver()
	}else{
		////setOrientRollOut()
	}
	this.__oldX=this._xmouse
	this.__oldY=this._ymouse
}

//////////////////////////////////////////////////////////////////////////////

function setOrientRollOut(){
	   if(this._ymouse>=this.__height){
			this.__orientIn="B"
		}
	
		if(this._xmouse>=this.__width){
			this.__orientIn="R"
		}
		if(this._xmouse<=0){
			this.__orientIn="L"
		}
		if(this._ymouse<0){
			this.__orientIn="T"
		}
		
		
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function setOrientRollOver(){
		if(this.__oldX>=this.__width){
			this.__orientIn="R"
		}
		if(this.__oldX<=0){
			this.__orientIn="L"
		}
		if(this.__oldY<=0){
			this.__orientIn="T"
		}
		if(this.__oldY>=this.__height){
			this.__orientIn="B"
		}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function onRollOverThumb(){
	if(this.__orientIn=="L"){
	this.__imageUp.sx=0	
	this.__imageUp.setSizeTween(0,__width,__height,__height)
	this.__imageDown.sx=__width
	this.__imageDown.setSizeTween(__width,0,__height,__height)
	}else if(this.__orientIn=="R"){
	this.__imageUp.sx=__width
	this.__imageUp.setSizeTween(0,__width,__height,__height)
	this.__imageDown.sx=0
	this.__imageDown.setSizeTween(__width,0,__height,__height)
	}else if(this.__orientIn=="T"){
	this.__imageUp.sx=0
	this.__imageUp.sy=0
	this.__imageUp.setSizeTween(__width,__width,0,__height)
	this.__imageDown.sx=0
	this.__imageDown.sy=__height
	this.__imageDown.setSizeTween(__width,__width,__height,0)
	}else if(this.__orientIn=="B"){
	this.__imageUp.sx=0
	this.__imageUp.sy=__height
	this.__imageUp.setSizeTween(__width,__width,0,__height)
	this.__imageDown.sx=0
	this.__imageDown.sy=0
	this.__imageDown.setSizeTween(__width,__width,__height,0)
	}
	
	this.dispatchEvent({target:this,type:"onRollOverThumb"})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function onRollOutThumb(){
		setOrientRollOut()
	///trace("onRollOut!! = "+this.__orientIn+" / "+this._ymouse+" / "+this.__height)
    if(this.__orientIn=="L"){
	this.__imageUp.sx=0
	this.__imageUp.sy=0
	this.__imageUp.setSizeTween(__width,0,__height,__height)
	this.__imageDown.sx=this.__width
	this.__imageDown.sy=0
	this.__imageDown.setSizeTween(0,__width,__height,__height)
	}
	
	if(this.__orientIn=="R"){
	this.__imageUp.sx=__width
	this.__imageUp.sy=0
	this.__imageUp.setSizeTween(__width,0,__height,__height)
	this.__imageDown.sx=0
	this.__imageDown.sy=0
	this.__imageDown.setSizeTween(0,__width,__height,__height)
	}
	
	if(this.__orientIn=="T"){
	this.__imageUp.sx=0
	this.__imageUp.sy=0
	this.__imageUp.setSizeTween(__width,__width,__height,0)
	this.__imageDown.sx=0
	this.__imageDown.sy=__height
	this.__imageDown.setSizeTween(__width,__width,0,__height)
	}

	if(this.__orientIn=="B"){
	this.__imageUp.sx=0
	this.__imageUp.sy=__height
	this.__imageUp.setSizeTween(__width,__width,__height,0)
	this.__imageDown.sx=__width
	this.__imageDown.sy=0
	this.__imageDown.setSizeTween(__width,__width,0,__height)
	}
	
	this.dispatchEvent({target:this,type:"onRollOutThumb"})
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onPressThumb(){
	this.dispatchEvent({target:this,type:"onPressThumb"})
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onReleaseThumb(){
	this.dispatchEvent({target:this,type:"onReleaseThumb"})
}

/////////////////////////////////////////////////////////////////////////////////////////////////

function onReleaseOutsideThumb(){
	this.dispatchEvent({target:this,type:"onReleaseOutsideThumb"})
}

////////////////////////////////////////////////////////////////////////////////////////////

}
