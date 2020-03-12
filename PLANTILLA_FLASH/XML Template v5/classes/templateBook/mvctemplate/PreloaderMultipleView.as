import mx.transitions.Tween;
import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration
   

class templateBook.mvctemplate.PreloaderMultipleView extends AbstractView {
	  
	var t:TextField
	
////////////////////////////////////////////////////////////////////////////////////////////////
	
    var __nr:Number=1
	var __container:MovieClip
	var __containerPage:MovieClip
	
////////////////////////////////////////////////////////////////////////////////////////////////
	
	function Preloader(){}
	
////////////////////////////////////////////////////////////////////////////////////////////////

   function onLoad(){
	  
	   this.onResize()	   
   }
		

////////////////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:BookModel=BookModel(this.getModel())
	
	this._x=m.__width/2
	this._y=m.__height/2+( Configuration.PAGE_HEIGHT/2 +Configuration.FRAME_SHEET)+Configuration.BUTTON_PADDING_UP
	
}

/////////////////////////////////////////////////////////////////////////////////////////

function onEnterFrame(){
	
	var array:Array=SheetView.currentPageLoading.slice()
	array.sort(Array.NUMERIC)
	this.__containerPage=this.createEmptyMovieClip("mcContainerPage",12)
	 
	var old:MovieClip=undefined
	for(var i=0;i<array.length;i++){
		var value=array[i]
		var mc:MovieClip=this.__containerPage.attachMovie("_numberPage","_numberPage_"+i,i)	
		mc.t.autoSize=true
		mc.t.text=value
		mc.t.textColor = Configuration.PRELOADER_MULTIPLE_TEXT_COLOR
		
		//if(Configuration.PRELOADER_MULTIPLE_BACKGROUND_COLOR.length){
		setColor(mc.background, Configuration.PRELOADER_MULTIPLE_BACKGROUND_COLOR)
		//}
		
		mc.background._width=mc.t._width+2		
		mc._x=(i==0) ? 0 : old._x+old._width+5
		old=mc
		
	}
	
	this.__containerPage._x=-this.__containerPage._width/2
	
	
}


////////////////////////////////////////////////////////////////////////////////////////

function setColor(mc_,color_){
	var k:Color=new Color(mc_)
	k.setRGB(color_)
}

//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
		
	
	
}