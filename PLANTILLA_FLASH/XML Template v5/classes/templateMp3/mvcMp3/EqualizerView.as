import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

class templateMp3.mvcMp3.EqualizerView extends AbstractView {

var __colorOld="0xF7A400"
var __colorNormal="0xC1C1C1"
var __girdLength=5
var container:MovieClip
var __inter
var __oldPosition:Number
	
////////////////////////////////////////////////////////////////////////////////

public function defaultController (model:Observable):Controller {
  return new EqualizerController(model)
 }

 ////////////////////////////////////////////////////////////////////////////////  
 
 function onLoad(){
   var m:Mp3Model=Mp3Model(this.getModel())
  this.__colorOld=m.MP3_EQUALIZER_COLOR_OLD
  this.__colorNormal=m.MP3_EQUALIZER_COLOR_NORMAL
 }
 
////////////////////////////////////////////////////////////////////////////////  

function EqualizerView(){
}

///////////////////////////////////////////////////////////////////////////////

function onSetSize(){
	this.onResize()	
}

////////////////////////////////////////////////////////////////////////////////

function create_rectangle() {
	container = this.createEmptyMovieClip("mc_container", 1);
	for (var i = 0; i<3; i++) {
		var slup = container.createEmptyMovieClip("container2"+i, i);
		slup._x = 6*i;
		for (var j = 0; j<__girdLength; j++) {
			var pas = slup.attachMovie("_girdMp3", "_gird_"+j, j);
			pas._y = -j*3;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////

function tween() {
	 var m:Mp3Model=Mp3Model(this.getModel())
	
	/// trace(m.__sound.position)
	 
if(__oldPosition!=m.__sound.position){
	// this.container._visible=true
	for (var i in container) {
		var slup = container[i];
		var rand = 1+random(__girdLength-1);
		for (var j = 0; j<__girdLength; j++) {
			if (j<=rand) {
				slup["_gird_"+j]._visible = true;
				var col = new Color(slup["_gird_"+j]);
				col.setRGB(__colorNormal);
				if (j == rand) {
					var col = new Color(slup["_gird_"+j]);
					col.setRGB(__colorOld);
				}
			} else {
				slup["_gird_"+j]._visible = false;
			}
		}
	}
	 }else{
		 ///this.container._visible=false		 
	 }
  this.__oldPosition=m.__sound.position
}

////////////////////////////////////////////////////////////////////////////////

function start_() {
	if(!this.container){
		create_rectangle()
	}
	stop_inter()
	tween();
	__inter = setInterval(this, 'tween', 70);
}

////////////////////////////////////////////////////////////////////////////////

function stop_inter() {
	clearInterval(__inter);
}

////////////////////////////////////////////////////////////////////////////////

function onPlay(){
	this.start_()
}

////////////////////////////////////////////////////////////////////////////////

function onStop(){
	this.stop_inter()
}

////////////////////////////////////////////////////////////////////////////////

function onPause(){
	this.stop_inter()
}

////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:Mp3Model=Mp3Model(this.getModel())
	this._x=m.width-27
	this._y=18
}

////////////////////////////////////////////////////////////////////////////////
}