import pl.drawing.Rysowanie
import template_form.mvctemplate.*
import template_form.mvc.*
import template_form.I.*
import flash.display.BitmapData
import template_form.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*


  

class template_form.mvctemplate.StatusView extends AbstractView {
	
var __inter:Number
var t:TextField
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new StatusController(model)
 }
 
//////////////////////////////////////////////////////////////////

function onSendTrue(){
	var m:FormModel=FormModel(this.getModel())
	m.clear()
	setText(m.__sendTrue)
	 disabled()
}

//////////////////////////////////////

function onSendFalse(){
	var m:FormModel=FormModel(this.getModel())
	m.clear()
	setText(m.__sendFalse)
	 disabled()
}

/////////////////////////////////////////////////////////////////

function setText(value_){
	var m:FormModel=FormModel(this.getModel())
	this.t.text=value_
	this.t.textColor=m.__alertColor
}

//////////////////////////////////////////////////////////////////

function onSend(){
	var m:FormModel=FormModel(this.getModel())
	setText(m.__sendProgress)
	
}

/////////////////////////////////////////////////////////////////

function disabled(){
	clearInterval(this.__inter)
	this.__inter=setInterval(this,'disabled2',3000)
}

//////////////////////////////////////////////////////////////////
 
function disabled2(){
	clearInterval(this.__inter)
	this.t.text=""
}

//////////////////////////////////////////////////////////////////

}

