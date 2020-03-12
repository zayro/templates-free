import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*
import templateMove.util.Observable
import templateMove.mvcFLV.*
import templateMove.Configuration

class templateMove.mvcFLV.FLV{
	
		
static var __instance:FLV
	
////container
var __container:MovieClip

  // Model
 var __model:FLVModel
    
 ////image
 var __image:ImageView
  
 ////tools viev 
  var __tools:ToolsView
   
 ///scroll progress
 var __progress:ProgressView
   
 //////buffer
 var __buffer:BufferView
 
 //////////sound
 var __sound:SoundView
    
 ////preloader 
 var __preloader:PreloaderView
 
 //////////background
 var __background:BackgroundView
 
 /////playpause
 var __playPause:PlayPauseView
 
 ///////////playPauseCenter
 var __playPauseCenter:PlayPauseCenterView
 
 //////button stop
 var __stop:StopView
 
 /////speaker
 var __speaker:SpeakerView
 
 ///////////time
 var __time:TimeView
 
 ///////////button fullscreen
 var __fullScreen:FullScreenView
 
 //////////////preview
 var __preview:PreviewView
 
 
 
 
    
  
////////////////////////////////////////////////////////

  static function getInstance(){
	  return __instance
  }
  
 //////////////////////////////////////////////////////////
  
  public function FLV(target:MovieClip) {
	  this.__container=target
	
	 __instance=this
	 __model=new FLVModel(this)
	 
	 
this.faceView()
	  
  }

///////////////////////////////////////////////////////////////////////////////////////

function faceView(){
	
		
	 
	  //////////////////////////////////////////////////////////Image

	  __image=ImageView(__container.attachMovie("_obrazFLV","obraz",5))
	  __image.setModel(__model)
	  __model.addEventListener("onStart",__image)
	  __model.addEventListener("onStop",__image)
	  __model.addEventListener("onResize",__image)
	  __model.addEventListener("onMetaData",__image)
	  __model.addEventListener("onSetUrl",__image)
	  __model.addEventListener("onVisibleImage",__image)
	  
	
	  
	  
	   //////////////////////////////////////////////////////////tools

	  __tools=ToolsView(__container.attachMovie("_toolsFLV","tools",75))
	  __tools.setModel(__model)
	  __model.addEventListener("onStart",__tools)
	  __model.addEventListener("onStop",__tools)
	  __model.addEventListener("onPauze",__tools)
	  __model.addEventListener("onSoundEnabled",__tools)
	  __model.addEventListener("onSoundDisabled",__tools)
	  __model.addEventListener("onResize", __tools)
	    __model.addEventListener("onChangeArea", __tools)

	 /////////////////////////////////////////////////////////////button stop
      
     this.__stop=StopView(__tools.attachMovie("_StopFlvView  ","_StopFlvView  _",465467))
	 this.__stop._x=100
	 this.__stop.setModel(__model)
	  __model.addEventListener("onStart",this.__stop)
	  __model.addEventListener("onStop",this.__stop)
	  __model.addEventListener("onPauze",this.__stop)
	  __model.addEventListener("onMetaData",this.__stop)
	  __model.addEventListener("onMetaData",this.__stop)
	  __model.addEventListener("onResize",this.__stop)
	  
	  	  
 
/////////////////////////////////////////////////////background
      
      this.__background=BackgroundView(__container.attachMovie("BackgroundFlvView","_BackgroundFlvView_",-56))
	  this.__background.setModel(__model)
	  __model.addEventListener("onStart",this.__background)
	  __model.addEventListener("onStop",this.__background)
	  __model.addEventListener("onMetaData",this.__background)
	  __model.addEventListener("onResize", this.__background)
	  __model.addEventListener("onChangeArea", this.__background)
	  

//////////////////////////////////////////////////////////////playpause
      
      this.__playPause=PlayPauseView(__tools.attachMovie("_PlayPauseFlv","_PlayPauseFlv_",46544))
	  this.__playPause.setModel(__model)
	  __model.addEventListener("onStart",this.__playPause)
	  __model.addEventListener("onStop",this.__playPause)
	  __model.addEventListener("onPauze",this.__playPause)
	  __model.addEventListener("onMetaData",this.__playPause)	  
	  __model.addEventListener("onResize",this.__playPause)
	  
	   
//////////////////////////////////////////////////////////////playpause Center
      
    this.__playPauseCenter=PlayPauseCenterView(__tools.attachMovie("_playPauseCenter","_playPauseCenter_",5419))
	this.__playPauseCenter.setModel(__model)
	  __model.addEventListener("onStart",this.__playPauseCenter)
	  __model.addEventListener("onStop",this.__playPauseCenter)
	  __model.addEventListener("onPauze",this.__playPauseCenter)
	  __model.addEventListener("onMetaData",this.__playPauseCenter)	  
	  __model.addEventListener("onResize",this.__playPauseCenter) 
	  __model.addEventListener("onLoadInitPreview",__playPauseCenter)
	  __model.addEventListener("onHitTestImageTrue",__playPauseCenter)
	  __model.addEventListener("onHitTestImageFalse",__playPauseCenter)
	  __model.addEventListener("onSetUrl",__playPauseCenter)
	 	  
////////////////////////////////////////////////////////////speaker 
       
     this.__speaker=SpeakerView(__tools.attachMovie("_speakerView ","_speakerView _",465463))
	 this.__speaker._x=200
	 this.__speaker.setModel(__model)
	  __model.addEventListener("onStart",this.__speaker)
	  __model.addEventListener("onStop",this.__speaker)
	  __model.addEventListener("onPauze",this.__speaker)
	  __model.addEventListener("onMetaData",this.__speaker)	  
	  __model.addEventListener("onSoundEnabled",this.__speaker)
	  __model.addEventListener("onSoundDisabled",this.__speaker)
	  __model.addEventListener("onResize",this.__speaker)

	  
///////////////////////////////////////////////////////////progress move
	  
	  __progress=ProgressView(__tools.attachMovie("_progres","suwak",54,{__model:__model}))
	  __progress.setModel(__model)
	  __model.addEventListener("onStart",__progress)
	  __model.addEventListener("onStop",__progress)
	  __model.addEventListener("onProgress",__progress)
	  __model.addEventListener("onMetaData",__progress)
	  __model.addEventListener("onResize",__progress)
 
			
/////////////////////////////////////////////////////////sound view

	   __sound=SoundView(__tools.attachMovie("_soundView","soundView",124))
	   __sound.setModel(__model)
	  __model.addEventListener("onStart",__sound)
	  __model.addEventListener("onStop",__sound)
	  __model.addEventListener("onProgress",__sound)
	  __model.addEventListener("onMetaData",__sound)
	  __model.addEventListener("onVolume",__sound)
	  __model.addEventListener("onSoundEnabled",__sound)
	  __model.addEventListener("onSoundDisabled",__sound)
	    __model.addEventListener("onResize",__sound)
	
//////////////////////////////////////////////////////////bufffer  

	  __buffer=BufferView(__tools.attachMovie("_bufferFLV","_bufferFLV_",78,{_x:__model.__maxWidthMove/2,_y:__model.__maxHeightMove/2}))
	  __buffer.setModel(__model)
	  __model.addEventListener("onStart",__buffer)
	  __model.addEventListener("onStop",__buffer)
	  __model.addEventListener("onPauze",__buffer)
	  __model.addEventListener("onBufferStop",__buffer)
	  __model.addEventListener("onBufferStart",__buffer)
	  __model.addEventListener("onResize",__buffer)
	  __model.addEventListener("onProgress",__buffer)
	  
/////////////////////////////////////////////////////time

 	  this.__time=TimeView(__tools.attachMovie("_time","_time_",842))
	  this.__time._x=240
	  this.__time._y=261
	  this.__time.setModel(__model)
	  __model.addEventListener("onStart",this.__time)
	  __model.addEventListener("onBufferStop",this.__time)
	  __model.addEventListener("onBufferStart",this.__time)
	  __model.addEventListener("onProgress",this.__time)
	  __model.addEventListener("onMetaData",this.__time)	
	  __model.addEventListener("onResize",this.__time)
	  __model.addEventListener("onSetUrl",this.__time)
	  
	  
/////////////////////////////////////////////////////////////fullscreen
      
     this.__fullScreen=FullScreenView(__tools.attachMovie("_FullScreenFlvView","_FullScreenFlvView_",46545))
	 this.__fullScreen.setModel(__model)
	 __model.addEventListener("onStart",this.__fullScreen)
	 __model.addEventListener("onStop",this.__fullScreen)
	 __model.addEventListener("onPauze",this.__fullScreen)
	 __model.addEventListener("onResize",this.__fullScreen)
	 __model.addEventListener("onFullScreenYes",this.__fullScreen)
	 __model.addEventListener("onFullScreenNo",this.__fullScreen)
	 
	 
	 ////////////////////////////////////////////////////////////preview
      
     this.__preview=PreviewView(__container.attachMovie("_preview_flv","_preview_flv_",2))
	__preview.setModel(__model)
	 __model.addEventListener("onStart",__preview)
	 __model.addEventListener("onStop",__preview)
	 __model.addEventListener("onPauze",__preview)
	 __model.addEventListener("onResize",__preview)
	 __model.addEventListener("onSetUrl",__preview)

	  
	////////////////////////////////////////////////////////preloader move
   __preloader=PreloaderView(__progress.__scroll.attachMovie("_preloaderFLV","_preloader_flv",99,{_x:2,_y:0}))
   __preloader.setModel(__model)
   __model.addEventListener("onStart",__preloader)
   __model.addEventListener("onStop",__preloader)
   __model.addEventListener("onMetaData",__preloader)
   __model.addEventListener("onResize",__preloader)
   __model.addEventListener("onSetUrl",__preloader)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
 
}