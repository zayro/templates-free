import pl.drawing.Rysowanie
import template_form.mvctemplate.*
import template_form.mvc.*
import template_form.I.*
import flash.display.BitmapData
import template_form.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*

import template_form.Configuration
 

class template_form.mvctemplate.TextAreaView extends AbstractView {

var bcg:MovieClip
var title:TextField
var key:String
var value:TextField
var verification:String
var mcBorder:MovieClip
	 

function InputView(){
	this.title.autoSize="left"	
}
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new InputController(model)
 }
 
/////////////////////////////////////////////////////////////////

function onLoad(){
	var m:FormModel=FormModel(this.getModel())
	this.title.textColor=m.__titleColor
	this.value.border=false
	this.value.borderColor=m.__borderColor
	this.value.background=(m.__backgrondColor) ? true : false
	this.value.backgroundColor=m.__backgrondColor
	
	this.value.textColor=m.__inputColor
	
	this.value.onSetFocus = Delegate2.create(this, this.onSetFocus_)
	this.value.onKillFocus=Delegate2.create(this,onKillFocus_)
	value.onChanged = Delegate2.create(this, onChanged)
	
	///color bcg input text
	NewColor.setColor(bcg, Configuration.BACKGROUND_INPUT_TEXT.split(",")[0])
	bcg._alpha=Configuration.BACKGROUND_INPUT_TEXT.split(",")[1]
}

/////////////////////////////////////////////////////////////////

function onChanged() {
	var old:String = getValue()
	var _new = old.toUpperCase()
	setValue(_new)
}
//////////////////////////////////////////////////////////////////

function onSetFocus_() {
	//if(check()==true){
	mcBorder.gotoAndStop(3)	
	border_select()
	//}
}

//////////////////////////////////////////////////////////////////

function border_select() {
	NewColor.setColor(mcBorder, Configuration.COLOR_BORDER_SELECT.split(",")[0])
	mcBorder._alpha=Configuration.COLOR_BORDER_SELECT.split(",")[1]
}

/////////////////////////////////////////////////////////////////

function border_error() {
	NewColor.setColor(mcBorder, Configuration.COLOR_BORDER_ERROR.split(",")[0])
	mcBorder._alpha=Configuration.COLOR_BORDER_ERROR.split(",")[1]
}

//////////////////////////////////////////////////////////////////

function onKillFocus_() {
	if(check()==true){
	mcBorder.gotoAndStop(1)	
	}else if(check()==false) {
		mcBorder.gotoAndStop(2)
		border_error()
	}else {
		mcBorder.gotoAndStop(1)
	}
}
 
//////////////////////////////////////////////////////////////////

public function getValue(){
	return this.value.text
}

//////////////////////////////////////////////////////////////////
 

public function setValue(value_:String){
	this.value.text=value_
}
 
//////////////////////////////////////////////////////////////////

function check(){
    return this[this.verification]()
}

/////////////////////////////////////////////////////////////

private function e_mail() {
	trace("ver email!")
	var t = this.value.text
	if (t.indexOf("@") == t.lastIndexOf("@") && t.indexOf("@")>0 && t.indexOf(".") != -1 && t.indexOf(".") != (t.indexOf("@")+1)) {
		return true;
	} else {
		return false;
	}
}

////////////////////////////////////////////////////////////////

private function not_empty(){
	if(this.getValue().length==0){
		return false
	}else{
		return true		
	}	
}

///////////////////////////////////////////////////////////////

function shovError(){
	var m:FormModel=FormModel(this.getModel())
	//this.value.border=true	
	//this.value.borderColor=m.__errorBorderColor
	mcBorder.gotoAndStop(2)
	border_error()
	
	Selection.setFocus(this.value);
}

///////////////////////

function hideError(){
	var m:FormModel = FormModel(this.getModel())
	mcBorder.gotoAndStop(1)
	//this.value.borderColor=m.__borderColor
}

/////////////////////////////////

function getKey(){
	return this.key
}

/////////////////////////////////

function setKey(key_:String){
	this.key=key_
}

/////////////////////////////////////////

function setIndex(nr_:Number){
		this.value.tabIndex=nr_
}

//////////////////////////////////////////////////////////

function clear(){
	this.setValue("")	
	hideError()
}

////////////////////////////////
  
  function setTitle(title_:String){
	  this.title.text=title_
  }
  
  /////////////////////////
  
  
  function getTitle(){
	  return this.title.text
  }
  
  /////////////////////////
  
  function getHeight(){
	  return this.value._height
  }
  
  /////////////////////////
  
  function getWidth(){
	  
	  
	  
  }
  
  ////////////////////////////////
  
  function setVerification(value_:String){
	  this.verification=value_	  
  }
  ////////////////////////////////
 

}

