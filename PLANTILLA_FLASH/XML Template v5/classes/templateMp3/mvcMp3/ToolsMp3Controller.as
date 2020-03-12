import templateMp3.mvcMp3.*;
import templateMp3.mvc.*;
import templateMp3.util.*;
import templateMp3.I.*


class templateMp3.mvcMp3.ToolsMp3Controller extends AbstractController {

//////////////////////////////////////////////////////////////////////////////// 	
	
  public function ToolsMp3Controller (model:Observable) {
    super(model);
  }

 ////////////////////////////////////////////////////////////////////////////////  
  
  function onNext(){
	    var m:Mp3Model=Mp3Model(this.getModel())
		m.next()
  }
  
 ////////////////////////////////////////////////////////////////////////////////
  
  
  function onPrev(){
	    var m:Mp3Model=Mp3Model(this.getModel())
		m.prev()
  }
  
 ////////////////////////////////////////////////////////////////////////////////
    
  function onPlayPause(){
	   var m:Mp3Model=Mp3Model(this.getModel())
	   if(m.state=="stop"||m.state=="pause"){
		  if(m.current==undefined){
			  m.current=0
		  }else{
		   m.Start()	
		  }
		}else if(m.state=="play"){
		   m.Pause()		   
	   }
  }
  
 ////////////////////////////////////////////////////////////////////////////////
   
  function onStop(){
	  var m:Mp3Model=Mp3Model(this.getModel())
	  m.Stop()
  }
	  
////////////////////////////////////////////////////////////////////////////////	  
  
  
 
 
  
 

  
}