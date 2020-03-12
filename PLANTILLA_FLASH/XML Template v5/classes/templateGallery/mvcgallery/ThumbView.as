import mx.transitions.Tween;
import mx.transitions.easing.*
import templateGallery.mvcgallery.*
import templateGallery.mvc.AbstractView
import templateGallery.Configuration
import templateGallery.thumb_rotate.ThumbRotate;
import templateLoader.mvctemplate.LoaderModel;

import com.asual.swfaddress.SWFAddress
import com.asual.swfaddress.SWFAddressEvent

class templateGallery.mvcgallery.ThumbView extends AbstractView {
	var __content:MovieClip
	var __columns:Number;
	var __rows:Number;
	var __property:Object
	var __index:Number
	var __network:NetworkView
	var corner:MovieClip
	var __mask:MovieClip
	static var __marginX1:Number=0
	static var __marginY1:Number=0
	static var __marginX2:Number=0
 	static var __marginY2:Number=0

	static var __oldThumb:ThumbView
	var __loader:MovieClipLoader;
	var __background:MovieClip
	var background2:MovieClip
	var title:TextField
	var __alphaRol:Number=100
	var __alphaOut:Number=100
	var __sample:Sound
	var mcLupe:MovieClip
	var colorOut = 0x404240
	var colorRol = 0x404240
	var mcLine:MovieClip
	var __thumbRotate:ThumbRotate
	var tweenAlpha:Tween

	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function ThumbView(){
		mcLupe._alpha=0
		this.enabled = false
		colorOut = Configuration.COLOR_OUT
		colorRol = Configuration.COLOR_ROL
		
		NewColor.setColor(__background, Configuration.COLOR_BCG_THUMB.split(",")[0])
		__background._alpha=Configuration.COLOR_BCG_THUMB.split(",")[1]
		
		
	}
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	function onLoad() {
		
		     if(colorOut!=undefined){
			NewColor.setColor(background2, colorOut)
			 }
		
		
		
			if(!__content&&!__loader){
		__content=this.createEmptyMovieClip("container",1)
		__content._x=__marginX1
		__content._y=__marginY1
		
		this.__background._x=0
		this.__background._y=0
		this.__background._width=ThumbView.getWidth()
		this.__background._height=ThumbView.getHeight()
		
		
		var spaceBackground:Number=0
		this.background2._x=spaceBackground
		this.background2._y=spaceBackground
		this.background2._width=ThumbView.getWidth()-spaceBackground*2
		this.background2._height = ThumbView.getHeight() - spaceBackground * 2
		//var _color:Color = new Color(background2)
		////_color.setRGB(0xFF0000)
		
		//NewColor.setColor(background2, 0xFF0000)
		//trace(colorOut)
		//this.background2.colorTo(colorOut,.1)
		
		
		this.title._width=getWidth()
		this.title._y=getHeight()-this.title._height-2
		this.title._x=0
		this.title.text = this.__property.title
		
		this.mcLine._x = ThumbView.getWidth() + __network.__spaceX / 2
		//mcLine._y=-__network.__spaceY
		mcLine._height=ThumbView.getHeight()//+__network.__spaceY
		
	
		
		
		__loader=new MovieClipLoader()
		__loader.addListener(this)
		}
		
		
		
		
		
		
	}
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function laduj(){
		//__loader.loadClip(this.__property.picsmall, __content)
		
		
	
__thumbRotate = ThumbRotate(attachMovie("_thumbRotate", "ThumbRotate", 3))
__thumbRotate.addEventListener("onLoadInitThumb",this)
__thumbRotate.addEventListener("onRollOverThumb",this)
__thumbRotate.addEventListener("onRollOutThumb",this)
__thumbRotate.addEventListener("onPressThumb",this)
__thumbRotate.addEventListener("onReleaseThumb",this)
__thumbRotate.addEventListener("onReleaseOutsideThumb",this)
__thumbRotate._x=__marginX1
__thumbRotate._y=__marginY1
__thumbRotate.width=Configuration.THUMB_WIDTH
__thumbRotate.height=Configuration.THUMB_HEIGHT
__thumbRotate.__title=this.__property.title
__thumbRotate.load(this.__property.picsmall)
this.hitArea=__thumbRotate.mcArea


}

///////////////////////////////////////events thumb rotate

function onLoadInitThumb(){
	//trace("event onLoadInitThumb")	
	onLoadInit()
}

function onRollOverThumb(){
	//trace("event  onRollOverThumb")	
}

function onRollOutThumb(){
	//trace("event onRollOutThumb")	
}

function onPressThumb(){
	//trace("event  onPresstThumb")	
}

function onReleaseThumb(){
	//trace("event onReleasetThumb")	
}

function onReleaseOutsideThumb(){
	///trace("event onReleaseOutsideThumb")	
}

	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	private function onRollOver(sound_) {
		
		if(this.hitTest(_root._xmouse,_root._ymouse,true)&&sound_!=false&&!__network.__mouseMove){
		this.__sample=new Sound(this)
		this.__sample.attachSound("thumb_sample")
		this.__sample.setVolume(29)
		this.__sample.start(0, 1)
		
		
		}
		
		if(colorRol!=undefined){
		background2.colorTo(colorRol, 0.5)
		}
		
		if(Configuration.ROTATE_THUMB==true){
		__thumbRotate.onRollOverThumb()
		}
		
		///tweenAlpha.stop()
		//tweenAlpha = new Tween(this.__content, '_alpha', Strong.easeOut, this.__content._alpha, __alphaRol, .5, 1)
		
	}
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

	private function onRollOut(par) {
		if (this != ThumbView.__oldThumb || par) {
		//tweenAlpha.stop()
		//tweenAlpha = new Tween(this.__content, '_alpha', Strong.easeOut, this.__content._alpha, __alphaOut, .5, 1)
		if(colorOut!=undefined){
	    background2.colorTo(colorOut, 0.5)
		}
		
		}
		if(Configuration.ROTATE_THUMB==true){
		 __thumbRotate.onRollOutThumb()
		}
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	function onPress(pres:Boolean){
		__oldThumb.onRollOut(1)
		onRollOver(false)
		__oldThumb=this
		/////
		if(pres!=false){
		var model:GalleryModel=GalleryModel(this.getModel())
		////model.slide_stop()
		///model.loadImage(this.__index)
		
		
		
		///////swf Adress
		//var loader_model:LoaderModel = LoaderModel(LoaderModel.getInstance())
		///var adress:String = loader_model.getAdressTemplate() + "/"+loader_model.PREFIX_IMAGE+this.__index
		////SWFAddress.setValue(adress)
		
		model.loadImage_SwfAdress(__index)
		
		
		}
	}
	
/////////////////////////////////////////////////////////	

function onLoadComplete(target:MovieClip){
		target._alpha=0
}

/////////////////////////////////////////////////////////	


	
	function onLoadInit(target:MovieClip) {	
		
	__network.loading()
	var m:GalleryModel=GalleryModel(this.getModel())
	this.enabled=true		
	
	
	//////mask 
	__mask=this.createEmptyMovieClip("mcMask",3212)
    __mask._x=__marginX1
	__mask._y=__marginY1
	Drawing.rectangle(__mask,0,0,Configuration.THUMB_WIDTH,Configuration.THUMB_HEIGHT,["0xFF0000",50])
	///__thumbRotate.setMask(__mask)
	__content.setMask(__mask)
	
	
	
	///////////resize thumb
	//var size:Resize=new Resize(Configuration.THUMB_WIDTH,Configuration.THUMB_HEIGHT,target._width,target._height)
	////var new_size:Object=size.max()
	///target._width=new_size.w
	//target._height=new_size.h
	
	target._alpha = 0
	
	
	
	if(ThumbView.__oldThumb==this){
		this.onRollOver()
	}//else{
		var twen=new Tween(target,'_alpha',Strong.easeOut,0,__alphaOut,1,1)
	//}
	
	////////////////addd icon flv
	var m:GalleryModel=GalleryModel(this.getModel())
	if(m.isFlv(__property.picbig)){
	var icon:MovieClip=this.attachMovie("_IconFlv","__IconFlv__",435435)
	icon._x=Configuration.THUMB_WIDTH/2-icon._width/2+__marginX1
	icon._y=Configuration.THUMB_HEIGHT/2-icon._height/2+__marginY1
	}
	
	////lupe
	mcLupe._x = Configuration.THUMB_WIDTH + __marginX1
	mcLupe._y = Configuration.THUMB_HEIGHT + __marginY1
	mcLupe.tween('_alpha',100,0.5,'easeOutCubic',1)
	
	mcLupe.swapDepths(this.getNextHighestDepth()+100)
	
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////			
	
	static function getWidth(){
	  return Configuration.THUMB_WIDTH+(ThumbView.__marginX2+ThumbView.__marginX1)
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	static function getHeight(){
	   return Configuration.THUMB_HEIGHT+(ThumbView.__marginY2+ThumbView.__marginY1)
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}