import mx.utils.Delegate;
import smallCalendar.text_area.Scroll 
import TextField.StyleSheet;
import smallCalendar.Configuration
import templateLoader.mvctemplate.LoaderModel

class smallCalendar.text_area.TextArea extends MovieClip {
	var __width:Number=200  
	var __height:Number=100  
	var t:TextField
	var __scroll:Scroll
	var __styleSheet
	var __text:String
	//////////////////////////////////////color
	var __colorScrollBackground:String="0xCCCCCC"  ///color background scroll
	var __colorScroll:String="0xFF0000"    ////color scroll
	///////////////param
	var __speedScroll:Number=1

	
///////////////////////////////////////////////////
	
	function TextArea(){
	
	}

///////////////////////////////////////////////////

function onLoad(){
 Mouse.addListener(this);
}

///////////////////////////////////////////////////

function addScroll(){
	__scroll=Scroll(this.attachMovie("_scroll", "_scroll_", 1))
	
	colorScrollBackground=colorScrollBackground
	colorScroll=colorScroll
		
	__scroll.height = this.t._height+1
	__scroll.x =this.t._x+this.t._width+17
	__scroll.y =this.t._y
     var proportion=t.bottomScroll/(t.maxscroll+t.bottomScroll)
	__scroll.limit = [1,this.t.maxscroll,proportion];
	__scroll.onChange=Delegate.create(this,onChange)
	
	
	}
	
///////////////////////////////////////////////////////

function removeScroll(){
	this.__scroll.removeMovieClip()	
}

////////////////////////////////////////////////////////////////////////////////////////////////////

	function onChange(value){
	this.t.scroll=value
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////

function setSize(w_:Number,h_:Number){
	this.t._width=w_
	this.t._height=h_
	this.text=this.text
}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////

	function set text(tekst_){
		__text=tekst_
	if(t.styleSheet==undefined){
		loadStyleSheet()
	}
	 this.t.scroll = 0
	 t.embedFonts=true
	 this.t.htmlText=tekst_.split("\n").join("")
	if(this.t.maxscroll>1){
     addScroll()
    }else{
		this.removeScroll()
    }
	
  }
	
///////////////////////////////////////////////////////////////////////////////////////////////////////

function get text(){
	return this.__text
}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////

function loadStyleSheet(styleSheet_){
	__styleSheet = new StyleSheet();
	__styleSheet.onLoad = Delegate2.create(this,onLoadCss)
	__styleSheet.load(Configuration.TEXT_URL_STYLE_CSS);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadCss(){
this.t.styleSheet=__styleSheet
text=__text
}


//////////////////////////////////////////////////////////	
	
function set colorScrollBackground(color_){
	__colorScrollBackground=color_
	this.__scroll.setColorScrollBackground(color_)
}

/////////////////////////////////////////////

function get colorScrollBackground(){
	return __colorScrollBackground
}

//////////////////////////////////////////////////////////	
	
function set colorScroll(color_){
	__colorScroll=color_
	this.__scroll.setColorScroll(color_)
}

/////////////////////////////////////////////

function get colorScroll(){
	return __colorScroll
}

/////////////////////////////////////////

   function set border(value_:Boolean){
	   this.t.border=value_	   
   }
   
/////////////////////////////////////////////// 
 
   function set borderColor(color_){
	this.t.borderColor=color_
   }
   
///////////////////////////////////////////////

 function set textColor(color_){
	this.t.textColor=color_
   }
   
///////////////////////////////////////////////

   function onMouseWheel(delta:Number) {
	   
   var value=(delta/3)*this.__speedScroll
	 
	if(this.hitTest(_root._xmouse,_root._ymouse,true)){
	this.t.scroll-=value
	this.__scroll.setScrollPosition(this.t.scroll,false)   
	} 
	 
    };
	
///////////////////////////////////////////////

function setSelectedId(id_:Number) {
	 var m:LoaderModel = LoaderModel(LoaderModel.getInstance())
	 m.setSelectedId(id_)
 }
 
///////////////////////////////////////////////////////////////
	
	
	
}