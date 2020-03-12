import templateMove.mvcFLV.*;
import templateMove.mvc.*;
import templateMove.util.*;
import templateMove.I.*


class templateMove.mvcFLV.FullScreenController extends AbstractController {

	
	var __width:Number
	var __height:Number
	
	
 ///////////////////////////////////////////////////////////////////////////////////////////
	
  public function FullScreenController (model:Observable) {
    super(model);
  }  
 
///////////////////////////////////////////////////////////////////////////////////////////
  
  
  function onPressScreen(){
	   var m:FLVModel=FLVModel(this.getModel())
	   var v:FullScreenView=FullScreenView(this.getView())
	   
	   //m.full_screen()
	   
	    if (m.__allArea == false) {
			v.button.symbol.gotoAndStop(2)
			m.fullArea()			
		}else {
			v.button.symbol.gotoAndStop(1)
			m.normalArea()
		}
	   
	   
	   /*
	   
	   if(m.__allArea==false){
	  m.setFirstPoint()
		var myPoint:Object = {x:0, y:0}; 
       m.__flv.__container._parent.globalToLocal(myPoint);	 
		m.__flv.__container._x=myPoint.x
		m.__flv.__container._y = myPoint.y
		__width = m.width
		__height = m.height
		
		m.width=Stage.width
		m.height = Stage.height
		m.__allArea=true
	   }else {
		   
		  var myPoint:Object = {x:m.__firstGlobalX, y:m.__firstGlobalY};
        m.__flv.__container._parent.globalToLocal(myPoint);
		m.__flv.__container._x=0
		 m.__flv.__container._y=0
		 m.width=__width
		 m.height = __height
		 
		 m.__allArea=false
		
		   
	   }
	   /*/
	   
	   ///if (Stage["displayState"] == "normal") {
		///	Stage["displayState"] = "fullScreen";
		//}else{
		   /// Stage["displayState"] = "normal";	
	   ////}
	   v.onRollOutAll(v.button)
  }
   
 
////////////////////////////////////////////////////////////////////////////////////////
  
 

  
}