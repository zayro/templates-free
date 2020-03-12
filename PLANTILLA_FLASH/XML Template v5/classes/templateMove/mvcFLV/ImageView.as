
import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import flash.display.BitmapData
import util.Observable
import mx.transitions.Tween
import mx.transitions.easing.*

import templateMove.Resize
  

class templateMove.mvcFLV.ImageView extends AbstractView {
	
	 var my_video
	 var tweenAlpha:Tween
	 
/////////////////////////////////////////////////////////////////////////////	 
	 
	 function ImageView(){
		_alpha=0
	 }
	
/////////////////////////////////////////////////////////////////////////////
		
	function onLoad(){
	    var m:FLVModel=FLVModel(this.getModel())
		onResize()
	 }
	 
/////////////////////////////////////////////////////////////////////////////

    function onStart(){
		/* II wariant shov image
		var m:FLVModel=FLVModel(this.getModel())
		onResize()
		if(m.getUrl()){
			this.onEnterFrame=function(){	
			if(m.__ns.bytesLoaded>0){
				shov()
			delete this.onEnterFrame
			}
		}
	}
	/*/
	}
	
///////////////////////////////////////////////////////////////////////////

private function onVisibleImage() {
	trace("show obraz")
	shov()
}
	
////////////////////////////////////////////////////////////////////////////	
	 
     private function reset(){
	   var m:FLVModel=FLVModel(this.getModel())
	   stop_tween()	
	   this._alpha=0
	   this.my_video.attachVideo(m.__ns)
	 }

/////////////////////////////////////////////////////////////////////////////

    function onSetUrl(){
         reset()
	}
	
/////////////////////////////////////////////////////////////////////////////
   
    function onMetaData(obj){  
	
	}
	
/////////////////////////////////////////////////////////////////////////////

private function shov(){
	stop_tween()
	this.tweenAlpha=new Tween(this,'_alpha',Strong.easeInOut,this._alpha,100,1,true)
}

/////////////////////////////////////////////////////////////////////////////

private function hide(){
	stop_tween()
	this.tweenAlpha=new Tween(this,'_alpha',Strong.easeIn,this._alpha,0,2,true)
}

/////////////////////////////////////////////////////////////////////////////

private function stop_tween(){
this.tweenAlpha.stop()	
}
	
/////////////////////////////////////////////////////////////////////////////
	
	function onResize(){
		var m:FLVModel=FLVModel(this.getModel())
		var c:FLVModel=FLVModel(this.getModel())
		
		this._x=(m.width-(m.__marginImageX1+m.__marginImageX2))/2 +m.__marginImageX1 
		this._y=((m.height-(m.__toolsHeight+m.__marginToolsY2+m.__marginImageY1+m.__marginImageY2))/2)+m.__marginImageY1
		
		var widthMove=m.newWidth
		var heightMove=m.newHeight-m.__toolsHeight
		
		//trace("PlayerFlv = " + widthMove + "  /  " + heightMove)
		//trace("PlayerFlv 2= "+ m.width+"  /  "+m.height)
		
		var size:Resize=new Resize(m.__maxWidthMove,m.__maxHeightMove,widthMove,heightMove)
		var new_size:Object=size.min()
		
		this.my_video._width=new_size.w //m.width
		this.my_video._height=new_size.h//m.height-m.__toolsHeight
		
		this._x-=this.my_video._width/2
		this._y-=this.my_video._height/2
	
	}
	
/////////////////////////////////////////////////////////////////////////////   

   
	
	
}

