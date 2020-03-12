import templateMove.mvcFLV.*;
import templateMove.mvc.*;
import templateMove.util.*;
import templateMove.I.*


class templateMove.mvcFLV.StopController extends AbstractController {

 ///////////////////////////////////////////////////////////////////////////////////////////
	
  public function StopController (model:Observable) {
    super(model);
  }  
   
/////////////////////////////////////////////////////////////////////////////////////////
  
  function onPressStop(){
	  var m:FLVModel=FLVModel(this.getModel())
	  m.Stop()
  }
  
///////////////////////////////////////////////////////////////////////////////////////////
 
  
 

  
}