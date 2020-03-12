import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration

  
class templateBook.mvctemplate.NumberPageView extends AbstractView {
	

var t:TextField
var gotopage:TextField
var mcOk:MovieClip
var background:MovieClip
var mcBorder:MovieClip
var input:MovieClip
////////////////////////////////////////////////////////////////////////////////////////////

function NumberPageView(){
   this.hide()
}

////////////////////////////////////////////////////////////////////////////////////////////

function onLoad() {
   ///this.t.border = true
   this.t.borderColor=Configuration.COLOR_BORDER_INPUT_MANAGER
   this.t.textColor=Configuration.COLOR_INPUT_MANAGER
   this.t.background=(Configuration.COLOR_BACKGROUND_INPUT_MANAGER) ? true :false
   this.t.backgroundColor=Configuration.COLOR_BACKGROUND_INPUT_MANAGER
   this.t.restrict="0-9"
   
   //////input bcg
   NewColor.setColor(input, Configuration.COLOR_BACKGROUND_INPUT_MANAGER)
   
   ////border
   NewColor.setColor(mcBorder,Configuration.COLOR_BORDER_INPUT_MANAGER)
   
   ////gotopage
   this.gotopage.htmlText=(Configuration.LABEL_GOTOPAGE)
   this.gotopage.textColor=Configuration.COLOR_LABEL_GOTOPAGE
   
   /////label ok
   this.mcOk.t.htmlText=Configuration.LABEL_OK
   this.mcOk.t.textColor=Configuration.COLOR_LABEL_OK
   
   //////////////////
   this.t.onSetFocus=Delegate2.create(this,this.onSetFocus)
   this.t.onKillFocus=Delegate2.create(this,this.onKillFocus)
   this.mcOk.onPress = Delegate2.create(this, onPressOk)
   this.mcOk.onRollOver = Delegate2.create(this, onRollOverOk)
   this.mcOk.onRollOut = Delegate2.create(this, onRollOutOk)
   
   
   /////////////////background
   var k:Color=new Color(background)
   k.setRGB(Configuration.BACKGROUND_COLOR_MANAGER)
}

///////////////////////////////////////////////////////////////////////////////////////////

function onRollOverOk() {
	mcOk.bcg.gotoAndPlay(2)	
}

///////////////////////////////////////////////////////////////////////////////////////////

function onRollOutOk() {
	mcOk.bcg.gotoAndPlay("rol")	
}

///////////////////////////////////////////////////////////////////////////////////////////

function onSetFocus() {
	mcBorder.gotoAndPlay(2)
	Key.addListener(this)
}

////////////////////////////////////////////////////////////////////////////////////////////

function onKillFocus() {
	mcBorder.gotoAndPlay("out")
	Key.removeListener(this)
}

///////////////////////////////////////////////////////////////////////////////////////////

function onKeyDown(){
	if(Key.isDown(Key.ENTER)){
		onPressOk()
	}
	
}

////////////////////////////////////////////////////////////////////////////////////////////

function onPressOk(){
	var m:BookModel=BookModel(this.getModel())
	var nr=parseFloat(t.text)
	if(isNaN(nr)){
		nr=1
	}
	m.setPage(nr)
}

/////////////////////////////////////////////////////////////////////////////////////////////

function shov(){
	this._visible=true	
}

////////////////////////////////////////////////////////////////////////////////////////////

function hide(){
    this._visible=false
}

///////////////////////////////////////////////////////////////////////////////////////////

function onGotoPage(){
	  face_current_page()
}

/////////////////////////////////////////////////////////////////////////////////////////////

function onTweenPageEnd(){
    face_current_page()
}

//////////////////////////////////////////////////////////////////////////////////////////

function face_current_page(){
	this.shov()
	var m:BookModel=BookModel(this.getModel())
	
	var left=(m.__currentLeft.__nr)
	var right=(m.__currentRight.__nr)
	
	if(left==undefined){
	t.htmlText="1"
	}else if(right==undefined){
	t.htmlText=m.getPageLength()
	}else{
	t.htmlText=left+"-"+right
	}
	t.textColor=Configuration.COLOR_INPUT_MANAGER
}


////////////////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:BookModel=BookModel(this.getModel())
	this._x=m.__width/2+(Configuration.PAGE_WIDTH+2*Configuration.FRAME_SHEET)-this._width
	this._y=m.__height/2-( Configuration.PAGE_HEIGHT/2 +Configuration.FRAME_SHEET)-48
}

//////////////////////////////////////////////////////////////////////////////////////////



}

