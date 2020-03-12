import templateBook.mvctemplate.*;
import templateBook.I.*
import templateBook.util.Observable
import flash.display.BitmapData
import mx.events.EventDispatcher
import templateBook.Configuration

class templateBook.mvctemplate.BookModel extends Observable{
//EVENTS:
///onTweenPageStart
///onTweenPageEnd
///onResize
///onLoadingRight
///onLoadingLeft
///onRemoveAll
///onTweenPageExit
///onLoadBackground

var __container:Book	
var __pages:Array
var __nr:Number  ///nr page
var __currentRight:SheetView  
var __currentLeft:SheetView
var __background:String
var __width:Number  ///stage width
var __height:Number  ////stage height
var __blockade:Boolean=false
		
///////////////////////////////////KONSTRUKTOR//////////////////////////////

function BookModel(book_:Book){
this.__container=book_
Stage.addListener(this)
}

//////////////////////////////change browser////////////////////////////////////////////

private function onResize(){  
	if (Configuration.STAGE_WIDTH == "Stage.width" && Configuration.STAGE_HEIGHT == "Stage.height") {
	   ///this.setSize(Stage.width,Stage.height)
	}
}

/////////////////////////////////////////////////////////////////////////////

function setDate(xml_:XML):Void{
	this.__pages=XML_.getArrayObject(xml_.firstChild);
	this.__pages.unshift("")
}

//////////////////////////////////////////////////////////////////////////

function setPage(nr_:Number):Void{
	this.__nr=nr_
	this.dispatchEvent({target:this,type:"onSetPage"})	
}

//////////////////////////////////////////////////////////////////////////

function nextPage(){
	if(this.__blockade==false){
	this.dispatchEvent({target:this,type:"onNextPage"})		
	__currentRight.onMouseDown(true)
	
	}
}

///////////////////////////////////////////////////////////////////////////////

function prevPage(){
	if(this.__blockade==false){
	this.dispatchEvent({target:this,type:"onPrevPage"})		
	__currentLeft.onMouseDown(true)
	
	}
}

///////////////////////////////////////////////////////////////////////////////

function setBackground(background_:String){
	this.__background=background_
	this.dispatchEvent({target:this,type:"onChangeBackground"})	
}

//////////////////////////////////////////////////////////////////////////////////

function setSize(width_:Number,height_:Number):Void{
	if(width_=="Stage.width"){
	 __width=Stage.width
	}else{
	__width=width_
	}
	
	if(height_=="Stage.height"){
	__height=Stage.height
	}else{
	__height=height_			
	}
	
	this.dispatchEvent({target:this,type:"onResize"})
}

//////////////////////////////////////////////////////////////////////////////////

function getPageLength(){
	return this.__pages.length-1	
}

//////////////////////////////////////////////////////////////////////////////////
  
}