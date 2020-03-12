﻿import templateNewsy.util.*;
import templateNewsy.mvc.*
import templateNewsy.I.*
import templateNewsy.mvcgallery.*

class templateNewsy.mvcgallery.ArrowPrevView extends AbstractView {

	
    var arrow:ArrowView
	var tween
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		
	function ArrowPrevView() {
		
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	

   function onLoad(){
	 var m:GalleryModel = GalleryModel(this.getModel())
	if (m.__array.length > 2 ) {
		this.arrow=ArrowView(this.attachMovie("_arrow_next_prev_record","_arrow_next_prev_record_",1))
	this.arrow._xscale *= -1
	}
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////	

  function onResize(){
	setPosition()
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////	 

  function onPressClose(){
  this.hide()	 
  }
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	

  function shov(){
	this._visible = true
    this.tween('_alpha',100,0.5,'easeOutCubic')
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////	

  function hide(){
	this._visible=false	
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////	

  function onIntroEnd(){
		this.shov()
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	function onImageResize(){
		this.setPosition()
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	function setPosition(){
		var m:GalleryModel=GalleryModel(this.getModel())
		var image:ImageView=m.__target.__image
		this._x=-30///image._x-image.getWidth()/2-25
		this._y=m.height/2-25///image._y-this._height/2
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	function onPress(){
	  var m:GalleryModel=GalleryModel(this.getModel())
	  m.slide_stop()
	  m.prev()
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////

  function onRollOver(){
	    arrow.onRollOver()
  }
  
//////////////////////////////////////////////////////////////////////////////////////////////
 
  function onRollOut(){
	    arrow.onRollOut()
  }
  
//////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	
  
}