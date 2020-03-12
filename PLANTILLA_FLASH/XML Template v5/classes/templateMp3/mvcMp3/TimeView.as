import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

/**
* ...
* @author Default
* @version 0.1
*/

class templateMp3.mvcMp3.TimeView extends AbstractView {

	
	var t:TextField	
	
	var __current
	var __total
	
	
	
	public function TimeView() {
		
	}
	
///////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new TimeController(model)
 }
 
///////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
	this.onResize()
	Stage.addListener(this)
	
	this.current=0
	this.total=0
}

/////////////////////////////////////////////////////////////////////////////

function set current(current_){
	this.__current=current_	
	
	this.progress(this.__current,total)
}

/////////////////////////////////////////////////////////////////////////////////

function get current(){
	return this.__current
}

/////////////////////////////////////////////////////////////////////////////////

function set total(total_){
	this.__total=total_
	
	progress(current,total)
}

//////////////////////////////////////////////////////////////////////////////

function get total(){
	return __total;
}

////////////////////////////////////////////////////////////////////////////////

function onResize(){
	
	var m:Mp3Model=Mp3Model(this.getModel())
	
	this._x=310
	this._y=3
	
}

////////////////////////////////////////////////////////////////////////////////

private function sekToMin(s_:Number){
	var m:Number=Math.floor(s_/60)
	var s:Number=(s_%60)						
	return format(m)+":"+format(s)
}

////////////////////////////////////////////////////////////////////////////////////

private function format(str_:Number){
		return (str_<=9) ? "0"+str_ : str_
}		
	
////////////////////////////////////////////////////////////////////////////////////

function progress(pos_,dur_){
	var m:Mp3Model=Mp3Model(this.getModel())
	var current=Math.round(pos_)
	var total=Math.round(dur_)
	
	if(isNaN(current)){
		current=0
	}
	
	if(isNaN(total)){
		total=0		
	}
	
	this.t.text=this.sekToMin(current)+" / "+this.sekToMin(total)
	this.t.textColor=m.MP3_TIME_COLOR
}

///////////////////////////////event model////////////////////////////////////////////////////////
 
function onProgressLoad(){
	var m:Mp3Model=Mp3Model(this.getModel())
	current=m.__sound.position/1000
	total=m.__sound.duration/1000
}

///////////////////////////////////////////////////////////////////////////////////////

function onProgressPause(obj:Object){
	var m:Mp3Model=Mp3Model(this.getModel())
	var target:ProgressView=ProgressView(obj.target)
	var scroll:ScrollComponents=ScrollComponents(target.__scroll)
	
	this.progress(scroll.getScrollPosition(),m.__sound.duration/1000)
	
}

/////////////////////////////////////////////////////////////////////////////////////

function onProgressPlay(obj){
	var m:Mp3Model=Mp3Model(this.getModel())
	current=m.__sound.position/1000
	total=m.__sound.duration/1000
}

////////////////////////////////////////////////////////////////////////////////////

function onPlay(){
	//var m:Mp3Model=Mp3Model(this.getModel())
	//this.onEnterFrame=function(){
	//var pos=m.__sound.position/1000
	//var dur=m.__sound.duration/1000
	///this.progress(pos,dur)
	}


/////////////////////////////////////////////////////////////////////////////////////

function onStop(){
///	var m:Mp3Model=Mp3Model(this.getModel())
	///delete this.onEnterFrame
	
	this.current=0
	
}

/////////////////////////////////////////////////////////////////////////////////

function onPause(){
	///delete this.onEnterFrame
	////var m:Mp3Model=Mp3Model(this.getModel())
}

//////////////////////////////////////////////////////////////////////////////////






	
}