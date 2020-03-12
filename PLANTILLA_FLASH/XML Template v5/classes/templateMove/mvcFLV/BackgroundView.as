
import templateMove.mvcFLV.*;
import templateMove.mvc.*
import templateMove.I.*
import flash.display.BitmapData
import util.Observable
import mx.transitions.Tween
import mx.transitions.easing.*


import templateMove.Resize
  
 
class templateMove.mvcFLV.BackgroundView extends AbstractView {
	
	var tween:Tween
    var bcg:MovieClip
////////////////////////////////////////////////////////////////////////////
		
	function onLoad(){
		this.onResize()
		var m:FLVModel = FLVModel(this.getModel())
		
	    NewColor.setColor(this, m.FLV_BACKGROUND_PLAYER.split(",")[0])
		this._alpha=m.FLV_BACKGROUND_PLAYER.split(",")[1]
		
		
		this.onPress = function() { }
		this.useHandCursor=false
		this.bcg._alpha=m.__alphaAreaNormal
	}
	
//////////////////////////////////////////////////////////////////////////////

function onChangeArea() {
	var m:FLVModel = FLVModel(this.getModel())
	if (m.__allArea == true) {
		
		
		
		tween.stop()
		this.bcg._alpha = m.__alphaAreaFull	
		//tween=new Tween(this.bcg,'_alpha',Strong.easeOut,this._alpha,m.__alphaAreaFull,1,true)
		
	}else {
		///this.bcg._alpha = m.__alphaAreaNormal
		
		
		tween.stop()
		tween=new Tween(this.bcg,'_alpha',Strong.easeOut,this._alpha,m.__alphaAreaNormal,1,true)
		
	}
	
}
	
/////////////////////////////////////////////////////////////////////////////
   
    function onMetaData(obj){  
		var ob=obj.obj
		onResize(ob.duration)
	}
	
/////////////////////////////////////////////////////////////////////////////
	
	function onResize(){
	var m:FLVModel=FLVModel(this.getModel())
	var c:FLVModel=FLVModel(this.getModel())
	    
	this._width=m.width
	this._height=m.height//-m.__toolsHeight
	}
	
/////////////////////////////////////////////////////////////////////////////   
	
	
	
	
}

