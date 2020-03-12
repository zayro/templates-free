import pl.drawing.Rysowanie
import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.util.Observable
import mx.events.EventDispatcher
 
class templateMove.mvcFLV.ScrollComponents extends AbstractView {  var __scaleBackground:Boolean=false  
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
	var __colorCircle
	var rectangleProgress:MovieClip
	var __color_rectangleProgress

function dispatchEvent(){}
function addEventListener(){}


//////////////////////////////////////////////////////////////////////////////////////////////////

	function ScrollComponents(){
		EventDispatcher.initialize(this)
		this.rectangle.onPress=Delegate2.create(this,onPressButton)
		this.rectangle.onRelease=this.rectangle.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		this.rectangle.useHandCursor=false
		////////
		this.arrowDown.onPress=Delegate2.create(this,onPressButton,"d")
		this.arrowDown.onRelease=this.arrowDown.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		///
		this.arrowUp.onPress=Delegate2.create(this,onPressButton,"g")
		this.arrowUp.onRelease=this.arrowUp.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		///////////////////////////
		this.mcBackground.onPress=Delegate2.create(this,this.onPressBackground)
		this.mcBackground.onRelease=Delegate2.create(this,this.onReleaseBackgrouond)
		this.mcBackground.onReleaseOutside=Delegate2.create(this,this.onReleaseBackgrouond)
		this.mcBackground.useHandCursor=false
		///////////////
		NewColor.setColor(this.mcBackground,__backgroundColor)
		NewColor.setColor(this.rectangle.rectangle2,__colorCircle)
		NewColor.setColor(this.rectangleProgress,__color_rectangleProgress)
		
	}

//////////////////////////////////////////////////////////////////////////////////////////////////
	
public function defaultController (model:Observable):Controller {
  return null
 }
	
//////////////////////////////////////////////////////////////////////////////////////////////////
	
function onReleaseBackgrouond(){
	onReleaseButton()
	
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onPressBackground(){
		onPressButton()
		rectangle._y=_ymouse
		refresh()
		
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////	

function onLoad(){
	this.rectangle.swapDepths(1150)
	this.rectangleProgress.swapDepths(1000)
	this.rectangleProgress._height=rectangle._y
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
	    ///refresh()
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
			if(button_==undefined){this.rectangle.startDrag(false,0,0,0,Math.ceil(__drag-suwakHeight))}
		      this.onEnterFrame=Delegate2.create(this,refresh,button_)
			  dispatchEvent({target:this,type:"onPressSuwak"})
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