import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

/**
* ...
* @author Default
* @version 0.1
*/

class templateMp3.mvcMp3.ProgressView extends AbstractView {

	
	var __scroll:ScrollComponents
	
	
	public function ProgressView() {
	create_sound()
	progress()
	}
	
///////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new ProgressController(model)
 }
 
///////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
var m:Mp3Model=Mp3Model(this.getModel())

this.__scroll.setColorBackground(m.MP3_BACKGROUND_PROGRESS)

this.__scroll.setColorProgress(m.MP3_CURRENT_PROGRESS)

this.__scroll.setColorGlow(m.MP3_PROGRESS_GLOW_COLOR_SCROLL)

this.__scroll.setColorCircle(m.MP3_PROGRESS_COLOR_CIRCLE)

if(m.MP3_CIRCLE_VISIBLE=="false"){
				__scroll.rectangle._alpha=0
	}
	
}

/////////////////////////////////////////////////////////////////////////////////

function onChangedCurrent(){

	this.progress()
	
}

/////////////////////////////////////////////////////////////////////////////////

function create_sound(){
	var m:Mp3Model=Mp3Model(this.getModel())

	this.__scroll=ScrollComponents(this.attachMovie("_scrollProgressFLV","_scrollProgress_",1,{__backgroundColor:m.MP3_BACKGROUND_PROGRESS,__colorCurrent:m.MP3_CURRENT_PROGRESS}))
	this.__scroll.addEventListener("onChangeSuwak",this)
	this.__scroll.addEventListener("onPressSuwak",this)
	this.__scroll.addEventListener("onReleaseSuwak",this)
	__scroll.__scaleBackground = false;
	__scroll.__rectangleHeightNull = true;
	__scroll.height =  500
	__scroll.firstLast = [0,m.__sound.duration/1000];
	__scroll._rotation=-90
	this.__scroll.mcBackground.onPress=Delegate2.create(this,this.onPressBackground)
	this.__scroll.mcBackground.onRelease=Delegate2.create(this,this.onReleaseBackground)
	this.__scroll.mcBackground.useHandCursor=false
	
	
	
	this.onResize()
	Stage.addListener(this)
}

///////////////////////////////////////////////////////////////////////////////////

function progress(){
	var m:Mp3Model=Mp3Model(this.getModel())
	this.__scroll.firstLast=[0,m.getTotalTime()/1000]
	this.__scroll.setScrollPosition(m.__sound.position/1000)
}

////////////////////////////////////////////////////////////////////////////////////

function onPressSuwak(){
	var m:Mp3Model=Mp3Model(this.getModel())
	m.Pause()
	this.onEnterFrame=function(){
		m.dispatchEvent({target:this,type:"onProgressPause"})		
	}
}

/////////////////////////////////////////////////////////////////////////////////

function onReleaseSuwak(){
	delete this.onEnterFrame	
	
	var m:Mp3Model=Mp3Model(this.getModel())
	
	m.Start(undefined,this.__scroll.getScrollPosition())
}

/////////////////////////////////////////////////////////////////////////////////

function onPressBackground(){
	var m:Mp3Model=Mp3Model(this.getModel())
	
	m.Pause()
	__scroll.rectangle._y=__scroll._ymouse
	
	m.Start(undefined,__scroll.getScrollPosition())
}

////////////////////////////////////////////////////////////////////////////////////

function onReleaseBackground(){}

/////////////////////////////////////////////////////////////////////////////////

function onSetSize(){
	this.onResize()	
}

////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:Mp3Model=Mp3Model(this.getModel())
		
	this._x=388
	this._y=12
	
	this.__scroll.height=m.width-385//580
}

///////////////////////////////////////////////////////////////////////////////////


function onPlay(){
	this.onEnterFrame=Delegate2.create(this,this.progress)
}

/////////////////////////////////////////////////////////////////////////////////////

function onStop(){
	delete this.onEnterFrame
	this.__scroll.setScrollPosition(0)
}

/////////////////////////////////////////////////////////////////////////////////

function onPause(){
	delete this.onEnterFrame
	
}

//////////////////////////////////////////////////////////////////////////////////
	
}