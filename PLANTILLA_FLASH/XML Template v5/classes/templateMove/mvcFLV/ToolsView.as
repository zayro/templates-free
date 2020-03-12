import templateMove.util.*;
import templateMove.mvc.*
import templateMove.I.*
import templateMove.mvcFLV.*;

class templateMove.mvcFLV.ToolsView extends AbstractView {
	
	var background:MovieClip
	
///////////////////////////////////////////////////////////////////////////////////////////
	
  public function defaultController (model:Observable):Controller {
  return new ToolsController(model)
 }
	
///////////////////////////////////////////////////////////////////////////////////////////
 
 function ToolsView(){
	
 }
 
/////////////////////////////////////////////////////////////////////////////////////////// 

function onLoad(){
	
	onResize()	
	 var m:FLVModel=FLVModel(this.getModel())
	NewColor.setColor(this.background, m.FLV_BACKGROUND_TOOLS)
	this.background._alpha=0//m.__alphaAreaNormal
}

//////////////////////////////////////////////////////////////////////////////

function onChangeArea() {
	var m:FLVModel = FLVModel(this.getModel())
	if (m.__allArea == true) {
		//this.background._alpha=m.__alphaAreaFull	
	}else {
		///this.background._alpha=m.__alphaAreaNormal
	}
	
}

/////////////////////////////////////////////////////////////////////////////////////////// 
 
 function onResize(){
	var m:FLVModel=FLVModel(this.getModel())
	this.background._width=m.width
	this.background._y=(m.height-this.background._height)-m.__marginToolsY2
 }
	
/////////////////////////////////////////////////////////////////////////////////////////// 
 
}