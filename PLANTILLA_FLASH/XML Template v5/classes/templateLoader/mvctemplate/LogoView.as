import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*



 
  

class templateLoader.mvctemplate.LogoView extends AbstractView {
		

var __position:String="TL" // TL,TR,TC,BL,BR,BC
var __container:MovieClip
var __loader:MovieClipLoader
var __width:Number ////width logo
var __height:Number  ///height logo
var __marginX:Number=0
var __marginY:Number=0
var __onlyFirst
var __interLogo:Number

///////////////////////////////////////////////////////////

function LogoView(){
	this.enabled=false	
}

////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new LogoController(model)
 }
 
////////////////////////////////////////////////////////////

function onLoad(){
    __marginX = ConfigurationSite.LOGO_X
	__marginY = ConfigurationSite.LOGO_Y
	
}

////////////////////////////////////////////////////////////

function onIntroEnd(){
	if(!__onlyFirst){
		
	
	__interLogo=setInterval(this,'loadLogoInterval',50)
	
	
	__onlyFirst=1
	}
}

////////////////////////////////////////////////////////////////////////

function loadLogoInterval() {
	clearInterval(__interLogo)
	var pos = ConfigurationSite.LOGO_POSITION
	
	this.loadLogo(ConfigurationSite.LOGO_PATH,pos)
	
}

////////////////////////////////////////////////////////////////////////

function onResize(){
		var m:LoaderModel=LoaderModel(this.getModel())
	
	var stage_w=m.width
	var stage_h=m.height
	var w=__width
	var h = __height
	
	
	
	
	if(this.__position=="TL"){
		this.__container._x=__marginX
		this.__container._y = __marginY
		
	}else if(this.__position=="TR"){
		this.__container._x=stage_w-w-__marginX
		this.__container._y=__marginY
	}else if(this.__position=="TC"){
		this.__container._x=stage_w/2-w/2
		this.__container._y=__marginY
	}else if(this.__position=="BL"){
		this.__container._x=__marginX
		this.__container._y=stage_h-h-__marginY
	}else if(this.__position=="BR"){
		this.__container._x=stage_w-w-__marginX
		this.__container._y=stage_h-h-__marginY
	}else if(this.__position=="BC"){
		this.__container._x=stage_w/2-w/2
		this.__container._y=stage_h-h-__marginY
	}
	
	
		
}

/////////////////////////////////////////////////////////////////////////

function loadLogo(url_:String,position_:String){
	
	if(!this.__loader){
	this.__loader=new MovieClipLoader()
	this.__loader.addListener(this)
	}
	this.__container = this.createEmptyMovieClip("mcContainer", 1)
	
	setPosition(position_)
	
	
	this.__loader.loadClip(url_,this.__container)
}

/////////////////////////////////////////////////////////////////////////

function onLoadInit(target:MovieClip){
	this.__width=target._width
	this.__height=target._height
	
	this.onResize()
	
	if(getRedirection().link.length){
		this.enabled=true
	}else{
		this.enabled=false
	}
	
	var tweenLogo:Tween = new Tween(target, '_alpha', Strong.easeInOut, 0, 100, .8, true)
	tweenLogo.onMotionFinished=Delegate2.create(this,onFadeInEndLogo)
}

/////////////////////////////////////////////////////////////////////////

function onFadeInEndLogo() {
		var m:LoaderModel = LoaderModel(this.getModel())
		m.dispatchEvent({target:this,type:"onLoadLogo"})
}

/////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////

function onLoadComplete(target:MovieClip) {
		target._alpha=0
}

/////////////////////////////////////////////////////////////////////////

function setPosition(position_:String){
	this.__position = position_
	__position="TL"
}

/////////////////////////////////////////////////////////////////////////

function getRedirection(){
	var logo_press=ConfigurationSite.LOGO_REDIRECT
	var link=logo_press.split(",")[0]
	var target = logo_press.split(",")[1]
	if (target == undefined) {
		target="_self"
	}
	
	///trace("target ="+target)
	
	return {link:link,target:target}
}

/////////////////////////////////////////////////////////////////////////

function onPress(){
	getURL(getRedirection().link,getRedirection().target)
}

/////////////////////////////////////////////////////////////////////////


}

