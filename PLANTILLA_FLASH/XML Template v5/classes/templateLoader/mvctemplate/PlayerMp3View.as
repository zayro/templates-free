import templateLoader.mvctemplate.*
import templateLoader.mvc.*
import templateLoader.I.*
import flash.display.BitmapData
import templateLoader.util.Observable

import mx.transitions.Tween
import mx.transitions.easing.*

import templateMp3.mvcMp3.Mp3Model

 import factory.Swf
  

class templateLoader.mvctemplate.PlayerMp3View extends AbstractView {
		


var __container:MovieClip
var __loader:MovieClipLoader
var __width:Number ////width player
var __height:Number  ///height player

var __config:XML
var __date:XML
var __player:Mp3Model
var __onlyFirst
var __interMp3:Number
var spaceDown:Number=42


///////////////////////////////////////////////////////////

function PlayerMp3View(){
	this.enabled=false	
}

////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new PlayerMp3Controller(model)
 }
 
////////////////////////////////////////////////////////////

function onLoad(){

}

////////////////////////////////////////////////////////////

function onIntroEnd(){
	if(!__onlyFirst){
	
	if (ConfigurationSite.MP3_DATE.length) {
		clearInterval(__interMp3)
        __interMp3=setInterval(this,'loadPlayerInterval',100)
	}
	
	__onlyFirst=1
	}
	
}

/////////////////////////////////////////////////////////////////////////

function loadPlayerInterval() {
	clearInterval(__interMp3)
	
	
	  var swf:Swf=new Swf()	
          var path:String=swf.getSwf("player_mp3")
          this.loadPlayer(path)
}

/////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:LoaderModel=LoaderModel(this.getModel())
	var margin:Number=200	
	
	this.__player.width = m.width-margin*2///m.__width-(m.marginLeft+m.marginRight) //- 100
	this._x=margin
	this._y = m.__footerHeightShow-40//75//m.height-spaceDown
	
	////trace(m.width)
		
	
}

/////////////////////////////////////////////////////////////////////////

function loadPlayer(url_:String,position_:String){
	if(!this.__loader){
	this.__loader=new MovieClipLoader()
	this.__loader.addListener(this)
	}
	this.__container=this.createEmptyMovieClip("mcContainer",1)
	this.__loader.loadClip(url_,this.__container)
}

/////////////////////////////////////////////////////////////////////////

function onLoadInit(target:MovieClip){
	this.loadDate()
}

/////////////////////////////////////////////////////////////////////////

function loadDate(){
	__date = new XML(); ///load date
	__date.ignoreWhite = true;
	__date.onLoad = Delegate2.create(this,this.onLoadDate)
	__date.load(ConfigurationSite.MP3_DATE);
}

/////////////////////////////////////////////////////////////////////////

function onLoadDate(){
	this.loadConfig(__date.firstChild.attributes.url_config)	
}

/////////////////////////////////////////////////////////////////////////

function loadConfig(path_:String){
	 __config=new XML()
	 __config.ignoreWhite=true
	 __config.load(path_)
	 __config.onLoad=Delegate2.create(this,onLoadConfig)
	
}

///////////////////////////////////////////////////////////////////////////////////

function onLoadConfig(){
	this.__player=__container.ini(__date,__config);
	onResize()
	var tweenAlpha:Tween = new Tween(__container, '_alpha', Strong.easeIn, 0, 100, .5, true)
	tweenAlpha.onMotionFinished=Delegate2.create(this,fadeInEnd)
}

///////////////////////////////////////////////////////////////////////////////////

function fadeInEnd() {
	
	var m:LoaderModel = LoaderModel(this.getModel())
	m.dispatchEvent( { target:this, type:"onLoadMp3" } )
	
}

///////////////////////////////////////////////////////////////////////////////////


}

