import banner.mvcgallery.GalleryModel;
import templateList.util.*;
import templateList.mvc.*
import templateList.I.*
import templateList.mvcgallery.*

class templateList.mvcgallery.ArrowNextView extends AbstractView {
	
	var arrow:ArrowView
	var tween
	
///////////////////////////////////////////////////////////////////////

function ArrowNextView() {
	
	
	//_alpha = 0  
	//this.hide()	
	  
}
	
///////////////////////////////////

function onLoad(){
	var m:GalleryModel = GalleryModel(this.getModel())
	var network:NetworkView = m.__gallery
	if (m.__array.length>2 ) {
	this.arrow = ArrowView(this.attachMovie("_arrow_next_prev_record", "_arrow_next_prev_record_", 1))
	}
	
}

////////////////////////////////////////////

function onResize(){
	setPosition()
}

/////////////////////////////////////

function onIntroEnd(){
		this.shov()
}

///////////////////////////////////////////////////////////////////////////////////////// 

function onPressClose(){
this.hide()	
}
	
///////////////////////////////////////////////////////////////////////

function shov(){
	this._visible = true

this.tween('_alpha',100,0.5,'easeOutCubic')
}

/////////////////////////////////////////////////////////////////////

function hide(){
	this._visible=false	
}

///////////////////////////////////////////////////////////////////////	
	
	function onImageResize(){
		this.setPosition()
	}
	
///////////////////////////////////////////////////////////////////////	
	
	function setPosition(){
		
		var m:GalleryModel=GalleryModel(this.getModel())
		var image:ImageView=m.__target.__image
		this._x=m.width+30//image._x+image.getWidth()/2+25
		this._y=m.height/2-25///image._y-this._height/2
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////
	
	function onPress(){
	  var m:GalleryModel=GalleryModel(this.getModel())
	  m.slide_stop()
	  m.next()
	}
  
///////////////////////////////////////////////////////////////////////////////////////////////

  function onRollOver(){
	    arrow.onRollOver()
  }
  
 ///////////////////////////////////////////////////////////////////////////////////////////////
 
  function onRollOut(){
	    arrow.onRollOut()
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  


}