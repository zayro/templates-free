import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

import mx.events.EventDispatcher
 
class templateMp3.mvcMp3.ScrollComponents extends MovieClip { 
    var __scaleBackground:Boolean=false  
	var __rectangleHeightNull:Boolean=false  
	var __drag:Number  
	var __last:Number    //last number
	var __first:Number ///first number
	var rectangle:MovieClip  ////rectangle ktorym dragujesz
	var arrowUp:MovieClip ///arrow gorna
	var arrowDown:MovieClip ///arrow arrowDown
	var __v:Number=10
	var __onChange:Function
	var __height:Number=200 ///height components
	var mcBackground:MovieClip  ////background scroll
	var __proportion:Number  
	var __duration:Number
	var __backgroundColor
	var __colorCurrent
	var rectangleProgress:MovieClip

function dispatchEvent(){}
function addEventListener(){}


//////////////////////////////////////////////////////////////////////////////////////////////////

	function ScrollComponents(){
		EventDispatcher.initialize(this)
		this.rectangle.onPress=Delegate2.create(this,onPressButton)
		this.rectangle.onRelease=this.rectangle.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		////////
		this.arrowDown.onPress=Delegate2.create(this,onPressButton,"d")
		this.arrowDown.onRelease=this.arrowDown.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		///
		this.arrowUp.onPress=Delegate2.create(this,onPressButton,"g")
		this.arrowUp.onRelease=this.arrowUp.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		/////
		this.setColor(this.mcBackground,this.__backgroundColor)
		this.setColor(this.rectangleProgress,this.__colorCurrent)
		
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////

function setColorBackground(color_){
		this.setColor(this.mcBackground,color_)
}

////////////////////////////////////////////////////////////////////////////////////////////////

function setColorProgress(color_){
		this.setColor(this.rectangleProgress,color_)
}
	
//////////////////////////////////////////////////////////////////////////////////////////////////

function setColorGlow(color_){
	if(color_.length){
		var obj=rectangle.filters[0]
		obj.color=color_
		rectangle.filters=new Array(obj)
	}else{
		rectangle.filters=undefined
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////

function setColorCircle(color_){
	this.setColor(this.rectangle.rectangle2,color_)
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function setColor(mc_,color_){
	var k:Color=new Color(mc_)
	k.setRGB(color_)
}

/////////////////////////////////////////////////////////////////////////////////////////////////


	
public function defaultController (model:Observable):Controller {
  return null
 }
	
//////////////////////////////////////////////////////////////////////////////////////////////////
	
function onLoad(){
	this.rectangle.swapDepths(1150)
	this.rectangleProgress.swapDepths(1000)
	this.mcBackground.swapDepths(950)
}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function set firstLast(t:Array){
		__first=Number(t[0])
		__last=Number(t[1])
		proportion=Number(t[2])
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

      function set proportion(f){
		__proportion=(f>1) ? 1 : f
		suwakHeight=__drag*__proportion
		size()
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

      function set height(war:Number){
		__height=war
		size()
		
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

      function set y(war:Number){
		this._y=war+arrowUp._height
		size()
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	 function set x(war:Number){
		this._x=war
		 size()
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function set onChange(f:Function){
		__onChange=f
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function get suwakHeight(){  ////zwraca wysokosc suwaka
		return (__rectangleHeightNull==true) ? 0 : rectangle._height
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function set suwakHeight(value){
		rectangle._height=value
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function size(){
		__drag=__height-(arrowDown._height+arrowUp._height)
		this.rectangle._y=0
		arrowDown._y=__drag
		arrowUp._y=-arrowUp._height
		//suwakHeight=rectangle._height
		__first=(__first==undefined) ? 0 : __first
		//////////////tlo suwaka
		if(__scaleBackground==true){
		///mcBackground._width=rectangle._width
		}
		mcBackground._height=__drag
		///mcBackground.onPress=function(){}
		///mcBackground.useHandCursor=false
	}


//////////////////////////////////////////////////////////////////////////////////////////////////

	function setScroll(war:Number){
		if(war>1){war=1}
		this.rectangle._y=war*(__drag-suwakHeight)
		refresh()

	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function setScrollPosition(wartosc){
		var p=Math.min(__first,__last)
		var k=Math.max(__first,__last)
        wartosc=Math.max(p,Math.min(k,wartosc))
	    rectangle._y=( (wartosc-__first) * (__drag-suwakHeight) ) / (__last-__first)
		
		this.rectangleProgress._height=rectangle._y
	   //refresh()
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////

	function getScrollPosition(){
	return __first+( this.rectangle._y / (__drag-suwakHeight) )*(__last-__first)
	}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function refresh(button_:String):Void{    
	      var wartosc=getScrollPosition()
		  dispatchEvent({target:this,type:"onChangeSuwak"})
		  /////button////
		if(button_=="d"){  //button down//
				var kon=this.rectangle._y+this.suwakHeight  //
				if(kon+__v>__drag) {this.rectangle._y=(__drag-this.suwakHeight)}
				else{this.rectangle._y+=__v}
			}
			else if(button_=="g"){ ///button up
				if(rectangle._y-__v<=0){rectangle._y=0}
				else{rectangle._y-=__v}
			}

	}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onPressButton(button_:String):Void{   
			if(button_==undefined){this.rectangle.startDrag(true,0,0,0,Math.ceil(__drag-suwakHeight))}
		      this.onEnterFrame=Delegate2.create(this,refresh,button_)
			  dispatchEvent({target:this,type:"onPressSuwak"})
			  this.onEnterFrame=function(){
				    dispatchEvent({target:this,type:"onChangeSuwak"})
				  	this.rectangleProgress._height=rectangle._y
				  
			  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////

	function onReleaseButton(){
		  dispatchEvent({target:this,type:"onReleaseSuwak"})
		refresh()
		this.rectangle.stopDrag()
		delete this.onEnterFrame
      }

//////////////////////////////////////////////////////////////////////////////////////////////////




}