import ModolSubmenu.mvcsubmenu.SubMenu;
import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*


  

class templateLoader.mvctemplate.MenuSecondaryView extends AbstractView {
	
	

var __container:MovieClip
var __xml:XML
var __firstNodeName:String
var current:MovieClip

var __colorOut="0xB9D5E1"
var __colorRol="0xFFFFFF"
///////////////////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new MenuSecondaryController(model)
 }
 
//////////////////////////////////////////////////////////////////////////	
  
function MenuPrimaryView(){

}

////////////////////////////////////////////////////////////

function get xml():XML{
	return this.__xml
}

/////////////////////////////////////////////////////////////////

function set xml(xml_:XML){
	this.__xml=xml_
	__firstNodeName=this.xml.firstChild.nodeName
	this.create(this.__xml.firstChild)
}

////////////////////////////////////////////////////////////

function onLoad(){
		this.onResize()
}
  
////////////////////////////////////////////////

private function create(date_){
	var m:LoaderModel=LoaderModel(this.getModel())
	current=undefined
	var old
	
	this.__container=this.createEmptyMovieClip("mc_container",1)
	for(var i=0;i<date_.childNodes.length;i++){
		var mc:MovieClip=this.__container.attachMovie("_rowMenuDown","id"+date_.childNodes[i].attributes.id,i)
		///trace(mc)
		mc.node=date_.childNodes[i]
		mc._x=(!old) ? 0 : old._x+old._width+15
		mc.t.autoSize=true
		mc.t.text=mc.node.attributes.label.toUpperCase()
		mc.t.textColor=this.__colorOut
		mc.onPress=Delegate2.create(this,onPressRow,mc)
		mc.onRollOver=Delegate2.create(this,this.onRollOverRow,mc)
		mc.onRollOut=Delegate2.create(this,this.onRollOutRow,mc)
		old=mc
	}
}

/////////////////////////////////////////////////

function onPressRow(mc:MovieClip){
	/////reset menu primary
	var m:LoaderModel=LoaderModel(this.getModel())
	///var menuPrimary:MenuPrimaryView=m.__target.__menuPrimary
	
///menuPrimary.__menu.__model.reset()
	
if(this.current!=mc){
this.onRollOutRow(this.current,true)
}
this.current=mc
	
	var m:LoaderModel=LoaderModel(this.getModel())
	m.load(mc.node)
}

////////////////////////////////////////////////////////////////////////

function onRollOverRow(mc:MovieClip){
	mc.t.stopTween()
	mc.t.colorTo(this.__colorRol,0.5)	
}

//////////////////////////////////////////////////////////////////////

function onRollOutRow(mc:MovieClip,true_:Boolean){
	
	if(this.current!=mc||true_==true){
		mc.t.stopTween()
	mc.t.colorTo(this.__colorOut,0.5)	
	}
}

/////////////////////////////////////////////////

function onChangedPositionMenu(obj:Object){
	
	
	/*
	var m:LoaderModel=LoaderModel(this.getModel())
	var object:Object=m.getStrukture(m.currentNode)
		
   var node:Array=object.node
   var select:Array=object.select
   
   reset()
  
   if(obj.firstNodeName==this.__firstNodeName){
this.create(node[0])	   
 var mc:MovieClip=this.__container["id"+select[0]]
 mc.t.textColor=this.__colorRol
   }

	/*/
	
	
}

////////////////////////////////////////////////////////

function reset(){
	
	
	
	this.current=undefined
	
	for(var i in this.__container){
		
		var mc:MovieClip=this.__container[i]
		
		this.onRollOutRow(mc,true)
		
		//trace("reset Secondary ! = "+mc)
		
	}
	
}

/////////////////////////////////////////////////////////

function onResize(){
	var m:LoaderModel=LoaderModel(this.getModel())
		
	this._x=m.__width-this._width+5
	this._y=m.__height-50
	
}

/////////////////////////////////////////////////////////


 

}

