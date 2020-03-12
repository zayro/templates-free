import menu_tree.mvctemplate.TreeModel;
import mx.events.EventDispatcher

class menu_tree.components.Scroll extends MovieClip {
    var __scaleBackground:Boolean=true  ////jesli rowna sie false to nie skaluje tla suwaka
	var __heightNull:Boolean=false  ///jesli = true to ma zastosowanie do np suwaka do galeri filmow
	var __drag:Number   //drag rectangle
	var __last:Number      ////last value
	var __first:Number   ///  first value
	var rectangle:MovieClip  ////scroll
	var arrowUp:MovieClip ////strzalka gorna
	var arrowDown:MovieClip ///strzalka arrowDown
	var __v:Number=10
	 ////wysokosc suwaka
	var __onChange:Function
	var __height:Number=200 ///wysokosc suwaka calego ze strzalkami
	var mcBackground:MovieClip  ////tlo suwaka
	var __proportion:Number   ///
	///////////////////
	var onPressSuwak:Function
	var onReleaseSuwak:Function
	var __tree:TreeModel
	var COLOR_SCROLL
	var COLOR_BACKGROUND_SCROLL
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function Scroll(){
		EventDispatcher.initialize(this)
		
		this.rectangle.onPress=Delegate2.create(this,onPressButton)
		this.rectangle.onRelease=this.rectangle.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		////////
		this.arrowDown.onPress=Delegate2.create(this,onPressButton,"d")
		this.arrowDown.onRelease=this.arrowDown.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		///
		this.arrowUp.onPress=Delegate2.create(this,onPressButton,"g")
		this.arrowUp.onRelease=this.arrowUp.onReleaseOutside=Delegate2.create(this,onReleaseButton)
		//
		///////////////color scroll
		NewColor.setColor(this.rectangle,COLOR_SCROLL.split(",")[0])
		this.rectangle._alpha=COLOR_SCROLL.split(",")[1]
		//////color background scroll
		NewColor.setColor(this.mcBackground,COLOR_BACKGROUND_SCROLL.split(",")[0])
		this.mcBackground._alpha=COLOR_BACKGROUND_SCROLL.split(",")[1]
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
Mouse.addListener(this)	
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function set zakres(t:Array){
		__first=Number(t[0])
		__last=Number(t[1])
		stosunek=Number(t[2])
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function set stosunek(f){
		__proportion=(f>1) ? 1 : f
		rectangleHeight=__drag*__proportion
		size()
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function set height(war:Number){
		__height=war
		size()
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function set y(war:Number){
		this._y=war+arrowUp._height
		size()
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	 function set x(war:Number){
		this._x=war
		 size()
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

	function set onChange(f:Function){
		__onChange=f
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

	function get rectangleHeight(){  ////zwraca wysokosc suwaka
		return (__heightNull==true) ? 0 : rectangle._height
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

	function set rectangleHeight(value){
		rectangle._height=value
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

	function size(){
		__drag=__height-(arrowDown._height+arrowUp._height)
		this.rectangle._y=0
		arrowDown._y=__drag
		arrowUp._y=-arrowUp._height
		//rectangleHeight=rectangle._height
		__first=(__first==undefined) ? 0 : __first
		if(__scaleBackground==true){
		mcBackground._width=rectangle._width
		}
		mcBackground._height=__drag
		mcBackground.onPress=function(){}
		mcBackground.useHandCursor=false
	}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function setSuwak(war:Number){
		if(war>1){war=1}
		this.rectangle._y=war*(__drag-rectangleHeight)
		refresh()

	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

	function setScrollPosition(value,refresh_){
		var p=Math.min(__first,__last)
		var k=Math.max(__first,__last)
value=Math.max(p,Math.min(k,value))
	rectangle._y=( (value-__first) * (__drag-rectangleHeight) ) / (__last-__first)
	if(refresh_!=false){
	refresh()
	}
	
	}

/////////////////////////////////////////////////////////////////////////////////////////////

	function getScrollPosition(){
	return __first+( this.rectangle._y / (__drag-rectangleHeight) )*(__last-__first)
	}

/////////////////////////////////////////////////////////////////////////////////////////////

	function refresh(button_:String):Void{     
		      var value=getScrollPosition()
			__onChange(value)
		
			if(button_=="d"){  //arrow down press///
				var kon=this.rectangle._y+this.rectangleHeight  //
				if(kon+__v>__drag) {this.rectangle._y=(__drag-this.rectangleHeight)}
				else{this.rectangle._y+=__v}
			}
			else if(button_=="g"){ ///arrow up press
				if(rectangle._y-__v<=0){rectangle._y=0}
				else{rectangle._y-=__v}
			}

	}

/////////////////////////////////////////////////////////////////////////////////////////////

	function onPressButton(button_:String):Void{   //////
	      this.onPressSuwak()	
		if(button_==undefined){this.rectangle.startDrag(false,0,0,0,Math.ceil(__drag-rectangleHeight))}
		this.onEnterFrame=Delegate2.create(this,refresh,button_)
	}

/////////////////////////////////////////////////////////////////////////////////////////////

	function onReleaseButton(){
		this.onReleaseSuwak()
		refresh()
		this.rectangle.stopDrag()
		delete this.onEnterFrame
      }

/////////////////////////////////////////////////////////////////////////////////////////////

function onMouseWheel(delta:Number) {
	 var value=delta*6
	 var containerTree:MovieClip=__tree.__tree.__target
	 var _xmouseTree=containerTree._xmouse
	 var _ymouseTree=containerTree._ymouse
	 
	 
	 if(_xmouseTree>0&&_ymouseTree>0&&_xmouseTree<__tree.width&&_ymouseTree<__tree.height){
			 
	 if(this.__first<this.__last){
		 setScrollPosition(getScrollPosition()-value)
	 }else{
		 setScrollPosition(getScrollPosition()+value)
		 
	 }
	 
	 }
};

/////////////////////////////////////////////////////////////////////////////////////////////





}