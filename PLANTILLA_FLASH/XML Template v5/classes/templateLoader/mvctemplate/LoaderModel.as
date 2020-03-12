import menu_tree.mvctemplate.TreeModel;
import mx.data.encoders.Num;
import templateGallery.mvcgallery.GalleryModel;
import templateLoader.mvctemplate.*;
import templateLoader.I.*
import templateLoader.util.Observable
import flash.display.BitmapData
import mx.events.EventDispatcher
import templateMp3.mvcMp3.Mp3Model;

import com.asual.swfaddress.SWFAddress;
import com.asual.swfaddress.SWFAddressEvent;

import factory.Swf
import mx.utils.Delegate

import LuminicBox.Log.*


class templateLoader.mvctemplate.LoaderModel extends Observable{

	 
	
var __width:Number  ////site width
var __height:Number ////site height
	
////////////////////////////////////////	
var __factory:Swf	
var __currentNode:XMLNode
var __menuPrimary
var __template:String
var __swf:String
var __xml:String
var __dateTemplate:XML
var __configTemplate:XML
var __loader:MovieClipLoader
var __loaderBck:MovieClipLoader
var __css:TextField.StyleSheet

var adressTemplate:String

var PREFIX_IMAGE:String="img_"

var __zagniezdzone:Array
var SWF_ADRESS_ATTRIB:String
var SWF_TITLE_ATTRIB:String



////////size area for template
//var __footerHeightUp:Number = 0//101 ////footer Up


var __footerHeightHide:Number = 30  ////footer  hide
var __footerHeightShow:Number = 80  ////footer  show

var marginLeft:Number = 50
var marginRight:Number = 50
//var logoWidth:Number = 156
//var spaceLogoAndMenu:Number = 60
var pageWidth:Number=900

	 
var oldId:Number


var __target:Loader
static var __instance:LoaderModel

		
///////////////////////////////////KONSTRUKTOR//////////////////////////////

function LoaderModel(loader_:Loader){
	SWF_ADRESS_ATTRIB = ConfigurationSite.SWF_ADRESS_ATTRIB
	SWF_TITLE_ATTRIB = ConfigurationSite.SWF_TITLE_ATTRIB
	
	
	SWFAddress.addEventListener(SWFAddressEvent.CHANGE, Delegate.create(this, change_swfAdress))
	//SWFAddress.addEventListener(SWFAddressEvent.INIT, Delegate2.create(this, init_swfAdress))
		
		
	///logoWidth = Number(ConfigurationSite.LOGO_WIDTH)
	///spaceLogoAndMenu=Number(ConfigurationSite.SPACE_LOGO_MENU)
	

__loader=new MovieClipLoader()	
__loaderBck=new MovieClipLoader()

__width=Stage.width
__height=Stage.height	
LoaderModel.__instance=this
this.__target=loader_	
	
this.__factory=new Swf()
EventDispatcher.initialize(this)
Stage.addListener(this)


onResize()


}

/////////////////////////////////////////////////////////////

function mute_player(value_:Boolean) {
	var player:Mp3Model=this.__target.__playerMp3.__player
    if (value_ == true) {
		player.muteFlv(true)
	}else {
		player.muteFlv(false)
	}
		
}

/////////////////////////////////////////////////////////////

function setCss(css_:TextField.StyleSheet){
	__css=css_	
}

/////////////////////////////////////////////////////////////

function getCss(){
	return __css
}

////////////////////////////////////////////////////////////

function onResize(){
	
	if (ConfigurationSite.NEW_STAGE_WIDTH == "100%" || ConfigurationSite.NEW_STAGE_WIDTH == "100%") {
		
		this.setSize(Stage.width,Stage.height)
	}else {
		
		if (Stage["displayState"] == "fullScreen") {
			this.setSize(Stage.width,Stage.height)
		}else {
			this.setSize(Number(ConfigurationSite.NEW_STAGE_WIDTH),Number(ConfigurationSite.NEW_STAGE_HEIGHT))
		}
		
	}
	
}

////////////////////////////////////////////////////////////

function setSize(width_:Number,height_:Number):Void{
	this.width=width_
	this.height=height_
}

///////////////////////////////////////////////////////////////

function set width(width_:Number):Void{
	__width = width_
	
	//if (ConfigurationSite.NEW_PAGE_WIDTH == "100%") {
	//pageWidth=this.width-100	
	//}else{
	//pageWidth = Number(ConfigurationSite.NEW_PAGE_WIDTH)
	///}
	
	
	this.dispatchEvent({target:this,type:"onResize",model:this})
}

/////////////////////////////////////////////////////////////

function set height(height_:Number){
	this.__height=height_
	this.dispatchEvent({target:this,type:"onResize",model:this})
}

////////////////////////////////////////////////////////////////

function get width():Number{
	return __width
}

////////////////////////////////////////////////////////////////

function get widthContent() {
	return width
}

///////////////////////////////////////////////////////////////

function get height():Number{
	return __height//-(__footerHeightHide+__footerHeightUp)
}

//////////////////////////////////////////////////////////////////

function get heightContent() {
	return height//__height-(__footerHeightHide+__footerHeightUp)
}

/////////////////////////////////////////////////////////////////

function getAreaHeight() {
	return height-(__footerHeightHide)
}

///////////////////////////////////////////////////////////

function getAreaWidth() {
	return width
}

/////////////////////////////////////////////////////////////

static function getInstance(){
	 return LoaderModel.__instance	
}

////////////////////////////////////////////////////////////////

function set menuPrimary(xml_:XML){
	__menuPrimary=xml_
}

////////////////////////////////////////////////////////////////

function get menuPrimary(){
	return __menuPrimary	
}

///////////////////////////////////////////////////////////////////////

private function private_getHasChildNodes(child:XMLNode,item_:Number,id_:Number){ 
	var len = child.childNodes.length;
	var old:MovieClip;
	for (var i = 0; i<len; i++) {
	var no_id=(id_==undefined||id_!=child.childNodes[i].attributes.id)//////////no id
		
	if(no_id){
	this.__zagniezdzone.push({child:child.childNodes[i],item:item_})
	}

	if (child.childNodes[i].hasChildNodes()&&no_id) {
			if (item_ == 0) {
				private_getHasChildNodes(child.childNodes[i],1,id_);
			} else if(item_ == 1) {
				private_getHasChildNodes(child.childNodes[i],2,id_);
			} else if(item_ == 2){
				private_getHasChildNodes(child.childNodes[i],3,id_);
			}else if(item_ == 3){
				private_getHasChildNodes(child.childNodes[i],4,id_);
				
			}
		}
}
	return this.__zagniezdzone
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function getHasChildNodes(child:XMLNode,item_:Number,id_:Number){  
	this.__zagniezdzone=[]
	return this.private_getHasChildNodes(child,item_,id_)
}

/////////////////////////////////////////////////////////////////

function setSelectedId(id_:Number) {
	
	var node:XMLNode = __menuPrimary.idMap[id_]
	
	////////////////////////////create array with attributes xml
	var array:Array = []
	array.push(node)
	while (node.parentNode.parentNode.parentNode != null && node.parentNode.parentNode.parentNode != undefined) {
		node = node.parentNode
		array.push(node)
	}
	array.reverse()
	
	///////create string
	var str:String=""
	for (var i = 0; i < array.length; i++) {
		str+=array[i].attributes[SWF_ADRESS_ATTRIB]+"/"	
	}
	
		
	SWFAddress.setValue(str.substr(0,str.length-1))
}

/////////////////////////////////////////////////////////////////////

private function init_swfAdress() {
		
	
	/*
	if ((SWFAddress.getPath() == "/")) {   ////start site
			setSelectedId(ConfigurationSite.FIRST_ID)
	}
	
	
	else {
	var newNode:XMLNode
	//////value width adress browser
	var value:String = SWFAddress.getValue()
	if (value.length == (value.lastIndexOf("/") + 1)) {  ////end "/"
	value=value.substr(0,value.length-1)		
	}
	value = unescape(value.substr(value.lastIndexOf("/") + 1))
	
	/////////////////////////////search 
	var array:Array = getHasChildNodes(__menuPrimary, 0)
	        for (var i = 0; i < array.length; i++) {
				var value2 = (array[i].child.attributes[SWF_ADRESS_ATTRIB])
				if (value == value2) {
	               newNode = array[i].child
			    }
	        }
	setSelectedId(Number(newNode.attributes.id))
	
	
	
	}
	/*/
	
}


///////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////

private function change_swfAdress(event:SWFAddressEvent) {
			
	var newNode:XMLNode
	
	if ((SWFAddress.getPath() == "/")) {   ////start site
			setSelectedId(ConfigurationSite.FIRST_ID)
			return;
	}
	
	
	//////get value
	var arrayNames:Array = SWFAddress.getPathNames()
	var strNames:String = SWFAddress.getValue()
	
	var oldName:String=arrayNames[arrayNames.length-1]
	oldName = unescape(oldName)
			
	
	
	
	
	/////////  CHANGE TEMPLATE
	
	///////////////////////////////search label
	var array:Array = getHasChildNodes(__menuPrimary, 0)
	
	if(strNames.indexOf(PREFIX_IMAGE)==-1){
	var name:String = oldName
	
	}else {
	var name:String=arrayNames[arrayNames.length-2]
	}
	name=unescape(name)
	
	for (var i = 0; i < array.length; i++) {
			
	if (name == array[i].child.attributes[SWF_ADRESS_ATTRIB]) {
	 newNode = array[i].child
	 
	}
	}
	
	
	
	if (newNode != undefined && newNode.attributes.id != currentNode.attributes.id) {
		
	currentNode = newNode
	}
	
	/////////   END  CHANGE TEMPLATE
	
	
	
	
	
	
	
	
	
	//////CHANGE IMAGE IN GALLERY
	var menu:TreeModel=__target.__menuPrimary.__menu
	if(currentNode.attributes.template=="gallery"){
	    var container:MovieClip = __target.__container.__container
		var model_gallery:GalleryModel = container.getModel()
		var index:Number=Number(strNames.split(PREFIX_IMAGE)[1])
	
	    if (strNames.indexOf(PREFIX_IMAGE) >= 0) {
		model_gallery.loadImage(index)
		}else {
		model_gallery.slide_stop()
		if(model_gallery.__target.__network._visible==false){
	    model_gallery.dispatchEvent( { target:this, type:"onPressClose" } )
		}
	    }
	}
	///////END CHANGE IMAGE IN GALLERY
	
	
	
}

//////////////////////////////////////////////////////////////////

function getAdressTemplate() {
	var arrayNames:Array = SWFAddress.getPathNames()
	var strNames:String = SWFAddress.getValue()
	
	var value:String
	
	if (strNames.indexOf(PREFIX_IMAGE) >= 0) {
		value=strNames.split(PREFIX_IMAGE)[0]
	}else {
		value=strNames
	}
	
	if (value.length == (value.lastIndexOf("/") + 1)) {  ////end "/"
	value=value.substr(0,value.length-1)		
	}
	
	return value;
}

/////////////////////////////////////////////////////////////////

function set currentNode(currentNode_:XMLNode){
	this.__currentNode = currentNode_	
	oldId=currentNode.attributes.id
	
	var companyName=(ConfigurationSite.COMPANY_NAME.length) ? ConfigurationSite.COMPANY_NAME : ""
	SWFAddress.setTitle(companyName+currentNode.attributes[SWF_TITLE_ATTRIB])
	
	////////link url
	var url=currentNode.attributes.url
	var window=currentNode.attributes.window
	if(url!=undefined&&url.length){
		if(window==undefined||window==""){
			window="_blank"
		}
	getURL(url,window)		
	}
	
	
	
	this.dispatchEvent({target:this,type:"onChangedPositionMenu",firstNodeName:getFirstNode(currentNode_).nodeName})
}

////////////////////////////////////////////////////////////

function get currentNode():XMLNode{
	return this.__currentNode
}


//////////////////////////////////////////////////////////////////

function getFirstNode(node_:XMLNode):XMLNode{
	
	var parent=node_
	
	do{
		parent=parent.parentNode
		
		
	}while(parent.parentNode!=null)
	
	return parent.firstChild
}

/////////////////////////////////////////////////////////////


public function getStrukture(node_:XMLNode):Object{   ////zwraca strukture do glownego menu
	var array_node:Array=[]  ///zawiera childy
	var array_id:Array=[]
	var child:XMLNode=node_

	while(child.parentNode.parentNode!=null){
		array_id.push(child.attributes.id)	
		child=child.parentNode
		array_node.push(child)
	}
	array_node.reverse()
	array_id.reverse()
//////////////////////////////////
if(node_.hasChildNodes()){  //////jesli dana pozycja menu zawiera jakies podkategorie to pokaze je (ale nie zaznaczy zadnej podkategori poniewaz nie dodaje iformajci do tablicy array_id
array_node.push(node_)	
}
return {node:array_node,select:array_id}
}

/////////////////////////////////////////////////////////////


public function load(){

	
	var node_=this.currentNode
	
	
	////load template
	if(node_.attributes.template!=undefined&&typeof(node_.attributes.template)=="string"){
	this.__template=this.currentNode.attributes.template
	this.__xml=this.currentNode.attributes.xml
	this.__swf=this.__factory.getSwf(this.__template)
	this.loadDateTemplate()
	}else {
		introEnd()		
	}
	

}

///////////////////////////////////////////////

function loadDateTemplate(){
	this.__dateTemplate=new XML()
	this.__dateTemplate.ignoreWhite=true
	this.__dateTemplate.onLoad=Delegate2.create(this,this.onLoadFileXml)
	this.__dateTemplate.load(this.__xml)
}

/////////////////////////////////////////////

function onLoadFileXml(){
	
	var url=__dateTemplate.firstChild.attributes.url_config
	if(url.length){
	loadConfigTemplate(url)
	}else{
		onLoadConfigTemplate()		
	}
}

//////////////////////////////////////////////////

function loadConfigTemplate(url_:String){
	this.__configTemplate=new XML()
	this.__configTemplate.ignoreWhite=true
	this.__configTemplate.onLoad=Delegate2.create(this,this.onLoadConfigTemplate)
	this.__configTemplate.load(url_)
}

/////////////////////////////////////////////////////////////////////

function onLoadConfigTemplate(){
	
	dispatchEvent({target:this,type:"onLoadXml"})	
}

///////////////////////////////////////////////////////////////////


function exitStart(){
	dispatchEvent({target:this,type:"onExitStart"})
}

/////////////////////////////////////////////////////////////////////

function exitEnd(){
	dispatchEvent({target:this,type:"onExitEnd"})
}

//////////////////////////////////////////////////////////

function introStart(){
	dispatchEvent({target:this,type:"onIntroStart"})
	
}

//////////////////////////////////////////////////////////

function introEnd(){
	dispatchEvent({target:this,type:"onIntroEnd"})
	
}

//////////////////////////////////////////////////////////


  
}