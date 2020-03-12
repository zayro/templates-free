import template_form.mvctemplate.*
import template_form.mvc.*
import template_form.I.*
import flash.display.BitmapData
import template_form.util.Observable

import template_form.Scroll
import mx.utils.Delegate


class template_form.mvctemplate.BackgroundView extends AbstractView {
	

var __maxHeight:Number 
var __scroll:Scroll
var __container:MovieClip
var __mask:MovieClip
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new BackgroundController(model)
 }
 
//////////////////////////////////////////////////////////////////
 
function BackgroundView(){

}


///////////////////////////////////////////////////////////////////

function addItem(obj:Object){
	var m:FormModel=FormModel(this.getModel())
	if(!this.__container){
	this.__container=this.createEmptyMovieClip("mcContainer2",1)	
	}
	
	var type:String=obj.type
	var p:Number=this.__container.getNextHighestDepth()
	var element:AbstractView=AbstractView(this.__container.attachMovie(type+"_view",type+"_view"+p,p))
	element.setModel(m)
	element.setIndex(p)
	element.setKey(obj.key)
	element.setTitle(obj.title)
	element.setVerification(obj.verification)
///	addScroll()
///	createMask()
	return element
}

//////////////////////////////////////////////////////////////////

function addScroll(){
	var m:FormModel=FormModel(this.getModel())
	__scroll=Scroll(this.attachMovie("_scroll", "_scroll_", 101))
	__scroll.height = m.__maxHeight
	__scroll.x =getWidth()+4
	__scroll.y =0
	var a=this.getHeight()-m.__maxHeight
   __scroll.limit = [1,a];
	__scroll.onChange=Delegate.create(this,onChange)
}
	
//////////////////////////////////////////////////////////////////
	
function onChange(value_){
	this.__container._y=value_
}

//////////////////////////////////////////////////////////////////

function getWidth(){
	return this.__container.getBounds(this.__container).xMax
}

////////////////////////////////////////////////////////////////

function getHeight(){
	return this.__container.getBounds(this.__container).yMax
}

////////////////////////////////////////////////////////////////

function createMask(){
	var m:FormModel=FormModel(this.getModel())
	this.__mask=this.createEmptyMovieClip("mcMask",125)
	Drawing.rectangle(this.__mask,0,0,100,m.__maxHeight,["0xFF0000",50])
	
}

////////////////////////////////////////////////////////////////




 

}

