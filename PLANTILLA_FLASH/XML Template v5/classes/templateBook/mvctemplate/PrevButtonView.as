import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration

 
class templateBook.mvctemplate.PrevButtonView extends AbstractView {
	
	

var t:TextField
var bcg:MovieClip

////////////////////////////////////////////////////////////////////////////////////////////

function PrevButtonView(){
	//this.t.autoSize=true
	this.t.htmlText = Configuration.BUTTON_PREV_LABEL
	NewColor.setColor(bcg,Configuration.COLOR_BCG_BUTTON_NEXT_PREV)
	this.t.textColor=Configuration.COLOR_BUTTON_NEXT_PREV
	this.hide()
}

////////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){

}

/////////////////////////////////////////////////////////////////////////////////////////////

function shov(){
this._visible=true	
}

////////////////////////////////////////////////////////////////////////////////////////////

function hide(){
this._visible=false	
}

//////////////////////event model/////////////////////////////////////////////////////////////////////

function onSetPage(){
	this.hide_shov()
}

////////////////////////////////////events model////////////////////////////////////////////////////////////////

function onNextPage(){
	
}

////////////////////////////////////////events model///////////////////////////////////////////////////

function onPrevPage(){
	var m:BookModel=BookModel(this.getModel())
	if(m.__currentLeft.__nr==2){
		this.hide()
	}
	
}

//////////////////////////////events model//////////////////////////////////////////////////////////////

function onTweenPageEnd(){
	this.hide_shov()
}

///////////////////////////////////////////////////////////////////////////////////////////

function onGotoPage(){
	this.hide_shov()
}

///////////////////////////////////////////////////////////////////////////////////////////

private function hide_shov(){
	var m:BookModel=BookModel(this.getModel())
	
	if(m.__currentLeft==undefined){
		this.hide()
	}else{
	    this.shov()
    }
	
	
}

////////////////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:BookModel=BookModel(this.getModel())
	
	this._x=m.__width/2-(Configuration.PAGE_WIDTH+2*Configuration.FRAME_SHEET)
	this._y=m.__height/2+( Configuration.PAGE_HEIGHT/2 +Configuration.FRAME_SHEET)+Configuration.BUTTON_PADDING_UP
	
}

/////////////////////////////////////////////////////////////////////////////////////////

function onPress(){
	var m:BookModel=BookModel(this.getModel())
	m.prevPage()
	
}


/////////////////////////////////////////////////////////////////////////////////////////

function onRollOver() {
		bcg.gotoAndPlay(2)
}

/////////////////////////////////////////////////////////////////////////////////////////

function onRollOut() {
	bcg.gotoAndPlay("rol")
}

/////////////////////////////////////////////////////////////////////////////////////////


}

