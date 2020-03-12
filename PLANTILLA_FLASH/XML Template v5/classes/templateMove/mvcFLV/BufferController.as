import templateMove.mvcFLV.*;
import templateMove.mvc.*;
import templateMove.util.*;
import templateMove.I.*
import templateMove.Configuration

class templateMove.mvcFLV.BufferController extends AbstractController {

 //////////////////////////////////////////////////////////////////////////////////////
	
  public function ToolsController (model:Observable) {
    super(model);
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////
    
  function onBufferStart(){
	 var v:BufferView=BufferView(this.getView())
	// v.shov()
	}
  
  ///////////////////////////////////////////////////////////////////////////////////////////
    
  function onBufferStop(){
    var v:BufferView=BufferView(this.getView())
	// v.hide()
	}
  
  ///////////////////////////////////////////////////////////////////////////////////////////
    

  
}