
import templateGallery.thumb_rotate.*
import mx.transitions.Tween
import mx.transitions.easing.*
import templateGallery.Configuration

class templateGallery.thumb_rotate.Image extends MovieClip
{ 
	
var mcDesc:MovieClip	
var mcContainer:MovieClip
var __sx:Number=0
var __sy:Number=0
var tweenX:Tween
var tweenY:Tween

var __width:Number
var __height:Number

var scaleX
var scaleY

var alphaDesc:Number=80
	 
 //////////////////////////////////////////////////////////////
	
	function Image()
	{
	///trace(" Image Rotate !")
	}
	
///////////////////////////////////////////////////////////

function onLoad() {
	mcDesc.t.autoSize=true
	mcDesc._y = 0//__height - mcDesc._height-8
	mcDesc.bcg._width = __width
	
	mcDesc.bcg._alpha = alphaDesc
	///NewColor.setColor(mcDesc.bcg, Configuration.COLOR_ROL)
	mcDesc.t.textColor=Configuration.TITLE_COLOR_THUMB
	
}

///////////////////////////////////////////////////////////

function setDesc(desc_) {
	if(desc_!=undefined){
	mcDesc.t.text = desc_
	}else {
		mcDesc._visible=false
	}
}
	
///////////////////////////////////////////////////////////
	
function setColor(color_){
	var k:Color=new Color(this)
	k.setRGB(color_)
}
	
///////////////////////////////////////////////////////////

function set sx(sx_){
	///this._alpha=0
	this._width=this.__width
	this._height=this.__height
	this._x=0
	this._y=0
	this.__sx=sx_
	
}

/////////////////////////////////////////////////////////

function get sx(){
return this.__sx
	
}

////////////////////////////////////////////////////////////

function set sy(sy_){
	///this._alpha=0
	this._width=this.__width
	this._height=this.__height
	this._x=0
	this._y=0
	this.__sy=sy_	
}

////////////////////////////////////////////////////////////

function get sy(){
	return this.__sy	
}

////////////////////////////////////////////////////////////


function setSize(w_,h_){
	///this._alpha=100
	
var obj=Converter.convert({x:sx,y:sy},this)

var first_pointX=obj.x
var first_pointY=obj.y

this._width=(w_!=undefined) ? w_ : this._width
this._height=(h_!=undefined) ? h_ : this._height

var obj=Converter.convert({x:sx,y:sy},this)

var last_pointX=obj.x
var last_pointY=obj.y


this._x-=last_pointX-first_pointX
this._y-=last_pointY-first_pointY

}

//////////////////////////////////////////////////////////////

function setSizeTween(startX_,finishX_,startY_,finishY_){
	
	this.tweenX.stop()
	this.tweenY.stop()
	
	
     
	scaleX=startX_
	scaleY=startY_
	this.setSize(startX_,startY_)
	
	
	
	this.tweenX=new Tween(this,'scaleX',Strong.easeOut,startX_,finishX_,.6,1)
	this.tweenY=new Tween(this,'scaleY',Strong.easeOut,startY_,finishY_,.6,1)
	this.tweenX.onMotionChanged=Delegate2.create(this,onChangeScale)
}

//////////////////////////////////////////////////////////////

function onChangeScale(){
	this.setSize(this.scaleX,this.scaleY)
	
}

//////////////////////////////////////////////////////////////
	 
	
	
	
}
