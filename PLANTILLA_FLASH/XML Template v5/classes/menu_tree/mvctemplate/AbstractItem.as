import pl.drawing.Rysowanie
import menu_tree.mvctemplate.*
import menu_tree.mvc.*
import menu_tree.I.*
import flash.display.BitmapData
import menu_tree.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*

class menu_tree.mvctemplate.AbstractItem extends AbstractView {
var y
var tween
var _tween
var stopTween
var t:TextField
var node:XMLNode
var arrow:MovieClip
var item
var __visibility:Boolean=true /////visibility button
var __expanded:Boolean=false ////expanded button
var model_abstract	
var color_rol
var color_out
var colorTo
var __active:Boolean=true

///////////////////////////////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new AbstractItemController(model)
 }
 
////////////////////////////////////////////////////////////////////////////////////////

function AbstractItem(){
	this.setModel(model_abstract)
	var model:TreeModel=TreeModel(this.getModel())
	setColorOut(model.COLOR_TEXT[item].OUT)
	setColorRol(this.color_rol=model.COLOR_TEXT[item].ROL)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

function setColorOut(color_){
	if(color_!=undefined){
	color_out=color_
	this.onRollOut()
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

function setColorRol(color_){
	if(color_!=undefined){
	color_rol=color_
	}
}
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

function set active(value_:Boolean) {
	__active=value_
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

function get active():Boolean {
   return __active
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
 
function onRollOver(){
     this.colorTo(this.color_rol,0.5)
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function onRollOut(value_) {
	var m:TreeModel=TreeModel(this.getModel())
	if(m.currentLocal[item]!=this||value_==true){
        this.colorTo(this.color_out,0.5)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function onPress(boolean_:Boolean){
	var m:TreeModel=TreeModel(this.getModel())
	
	m.currentLocal[item].hideRow()
	m.currentLocal[item].onRollOut(true)
	m.currentLocal[item].active=true
		
	if(__expanded==false){  //////////face childNodes
	this.shovRow()
	}else{                  /////shov childNodes
	this.hideRow()
	}
	this.active=false
	m.currentLocal[item]=this
	m.current=this
	this.onRollOver()
	m.updatePosition()
	
	
	if(boolean_!=false){
	m.dispatchEvent({target:this,type:"onPressRow"})
	}
}

///////////////////////////////////////////////////////////////////////////////

function shovRow(){
		var m:TreeModel=TreeModel(this.getModel())
	    this.__expanded=true
		for(var i=0;i<node.childNodes.length;i++){
		var value=node.childNodes[i]
		var ref=value.attributes.ref
	if(ref.getVisibility()==false){
		ref.setVisibility(true)
		ref.onRollOut(true)
		ref.active=true
		ref.arrow.gotoAndStop(1)
		m.currentLocal[ref.item]=undefined
		if(ref.node.hasChildNodes()==false){
			ref.arrow._visible=false
		}
		ref._alpha=0
		ref.tween('_alpha',100,0.5,'easeInOutCubic',.4)
		}
	}
	
	onShovRow()
	
}

////////////////////////////////////////////////////////////////////////////////////////////

function onShovRow(){
	this.arrow.gotoAndStop(2)
}

///////////////////////////////////////////////////////////////////////////////////////

function hideRow(){
    var m:TreeModel=TreeModel(this.getModel()) 
	this.__expanded=false	
	
	m.currentLocal[item].onRollOut(true)
	m.currentLocal[item].active=true
		
	
		var array=m.getHasChildNodes(node,0,undefined,1)
		for(var i=0;i<array.length;i++){
			var value=array[i]
			var ref=value.child.attributes.ref
			ref.setVisibility(false)
		}
	onHideRow()
}

///////////////////////////////////////////////////////////////////////////////////////

function onHideRow(){
	this.arrow.gotoAndStop(1)
	
}

///////////////////////////////////////////////////////////////////////////////////////

function setVisibility(visibility_:Boolean){
	this.__visibility=visibility_
	
	if(__visibility==true){
		this._visible=true
		this.__expanded=false
	}else{
		this._visible=false
		this.__expanded=false
	}
	
}

///////////////////////////////////////////////////////////////////////////////////////

function getVisibility(){
	return this.__visibility
	
}

///////////////////////////////////////////////////////////////////////////////////////

function getHeight(){
	return this.t._height-2
}

///////////////////////////////////////////////////////////////////////////////////////



 

}

