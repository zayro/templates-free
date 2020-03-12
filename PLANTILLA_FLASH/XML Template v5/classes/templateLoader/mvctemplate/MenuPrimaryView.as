import factory.Swf;
import menu_tree.mvctemplate.TreeModel;
import ModolSubmenu.mvcsubmenu.SubMenuModel;
import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*


  import LuminicBox.Log.*;

class templateLoader.mvctemplate.MenuPrimaryView extends AbstractView {
	
	
var __date:XMLNode
var __container:MovieClip
var __containerBig:MovieClip
var __xml:XML
var backgroundMenu:MovieClip
var __onlyFirst
var xml_config:XML
var __shov:Boolean=false
var __inter_hide:Number
var __menu:TreeModel
var __interMenu:Number
var __menuY:Number = 0
private var currentSwapDepth:Number=20
var containerLogo:MovieClip
var spaceVisible:Number = 20
var firstOverMenu:Boolean=false


///////////////////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new MenuPrimaryController(model)
 }
 
//////////////////////////////////////////////////////////////////////////	
  
function MenuPrimaryView() {
	this.__container = this.createEmptyMovieClip("mcContainerMenu", 1).createEmptyMovieClip("mc", 1)
	containerLogo=this.__container._parent.createEmptyMovieClip("mcContainerLogo",1243123)
}

////////////////////////////////////////////////////////////

function get xml():XML{
	return this.__xml
}

/////////////////////////////////////////////////////////////////

function set xml(xml_:XML){
	this.__xml=xml_
}

////////////////////////////////////////////////////////////

private function onIntroEnd() {
	
	  	var m:LoaderModel=LoaderModel(this.getModel())
	__xml=m.menuPrimary
	if (!__onlyFirst && this.__xml.firstChild.childNodes.length) {
		clearInterval(__interMenu)
	__interMenu=setInterval(this,'loadMenu',0)
	__onlyFirst=1
	}
	
	
}

//////////////////////load menu module/////////////////////////////////////////////////////////////////

private function loadMenu() {
	///trace("loadMenu!")
	clearInterval(__interMenu)
	var m:LoaderModel=LoaderModel(this.getModel())
	
	__containerBig = this.__container._parent
	__containerBig._y=0//-120
	__container._x=0
	__container._y=0
	var loader:MovieClipLoader=new MovieClipLoader()
	loader.addListener(this)
	var swf:Swf=new Swf()
	loader.loadClip(swf.getSwf("menuPrimary"),__container)
		
}


////////////////////////////////////////////////////////////

private function onLoad() {
////currentSwapDepth=this.getDepth()	
swapDepths(currentSwapDepth)
}
	
 
////////////////////////////////////////////////////////////

private function onResize(){
	var m:LoaderModel = LoaderModel(this.getModel())
		
	__containerBig._x = 0
	
	///this.__menu.width = 800
	__menu.height=getHeightMenu()
	
	onLoadConfig()
}

/////////////////////////////////////////////////////////////////

function getHeightMenu():Number {
	var m:LoaderModel = LoaderModel(this.getModel())
	var value:Number = ( m.__footerHeightHide )
	
	if(ConfigurationSite.FOOTER_VISIBLE=="true"){
	return m.height - value
	}else {
	return m.height 	
	}
}

//////////////////////////////load configuration menu//////////////

private function loadConfigMenu(url_){
	xml_config=new XML()
	xml_config.ignoreWhite=true
	xml_config.load(url_)
	xml_config.onLoad=Delegate2.create(this,this.onLoadConfig)
}

////////////////////on laod config menu////////////////////////////

private function onLoadConfig(){
	var m:LoaderModel=LoaderModel(this.getModel())
	__menu=__container.ini(this.__xml,xml_config)
	__menu.addEventListener("onPressRow", this)
	__menu.addEventListener("onIntroStartMenu", this)
	__menu.addEventListener("onExitEndMenu",this)
///	__menu.width = 900///m.width
	__menu.height=getHeightMenu()
	__containerBig._x = -__containerBig._width
	
	//////first shov
	shov(.5)
	
	clearInterval(__inter_hide)
	__inter_hide=setInterval(this,'hide_delay',4000)
	
	
	onChangedPositionMenu()
	m.dispatchEvent({target:this,type:"onLoadMenuTree"})
}

////////////

private function onIntroStartMenu() {
	//this.swapDepths(324329244)
}

////////

private function onExitEndMenu() {
	///this.swapDepths(currentSwapDepth)
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

private function hide_delay() {
	clearInterval(__inter_hide)
	if(!isHitTest()){
	hide()
	}
}


/////////////////////on load menu module//////////////////////////////////////////////////////////////////

private function onLoadInit(target:MovieClip) {
	 loadConfigMenu(this.__xml.firstChild.attributes.url_config)  ///load config menu
}

/////////////////  events module //////////////////////////////////////////////////////

private function onPressRow(obj) {
	
	var m:LoaderModel=LoaderModel(this.getModel())
	var target:MovieClip= obj.target;
	var node:XMLNode = target.node
		
	m.setSelectedId(Number(node.attributes.id))
}

///////////////////////////////////////////////////////////////////////////////////////////

private function onChangedPositionMenu(){
	var m:LoaderModel=LoaderModel(this.getModel())
	var id:Number = m.currentNode.attributes.id
	
	__menu.removeEventListener("onPressRow", this)
	
	
    __menu.setSelectedId(id)
	__menu.addEventListener("onPressRow", this)
	
	//if(!__menu.__target.__target.hitTest(_root._xmouse,_root._ymouse,true)){
	//__menu.__target.__menuSubItem.zjazdStart(true)
	//}
	
}

///////////////////////////////////////////////////////////////////////////////////////////

private function shov(delay_) {
	
	
	__shov = true
	var delay = (delay_ == undefined) ? 0 : delay_
	__containerBig.stopTween()
	__containerBig.tween('_x', 0, .6, 'easeInOutCubic', delay)
	
	this.swapDepths(324329244)
}

///////////////////////////////////////////////////////////////////////////////////////////

private function hide() {
	__shov = false
	__containerBig.stopTween()
	__containerBig.tween('_x', -__containerBig._width + spaceVisible, .6, 'easeInOutCubic',0,{scope:this,func:hide_end})
	
	
}

///////////////////////////////////////////////////////////////////////////////////////////

private function hide_end() {
this.swapDepths(currentSwapDepth)
}

///////////////////////////////////////////////////////////////////////////////////////////

private function onMouseMove() {
		
	
	
	if (isHitTest()) {
		firstOverMenu=true
		if(__shov==false){
		this.shov()		
		
		}
	}else if(!isHitTest()) {
		if(__shov==true&&firstOverMenu==true){
		this.hide()		
		}
	}
	
}

///////////////////////////////////////////////////////////////////////////////////////////

private function mask() {
	var m:LoaderModel=LoaderModel(this.getModel())
	var mcMask:MovieClip = this.createEmptyMovieClip("mcMaskClip", 435435)
	Drawing.rectangle(mcMask, 0, -30, 500, m.height + 30, ["0xFF0000", 50])
	this.setMask(mcMask)
}

///////////////////////////////////////////////////////////////////////////////////////////

private function isHitTest() {
	return this.__containerBig.hitTest(_root._xmouse, _root._ymouse, true)
}

///////////////////////////////////////////////////////////////////////////////////////////

 

}

