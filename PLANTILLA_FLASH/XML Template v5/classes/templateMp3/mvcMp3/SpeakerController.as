import templateMp3.util.*;
import templateMp3.mvc.*
import templateMp3.I.*
import templateMp3.mvcMp3.*;

class templateMp3.mvcMp3.SpeakerController extends AbstractController {

 
////////////////////////////////////////////////////////////////////////////////	
	
   public function SpeakerController (model:Observable) {
    super(model);
  }
  
//////////////////////////////////////////////////////////////////////////////// 

 function onPressSpeaker(){
   var m:Mp3Model = Mp3Model(this.getModel())
   
  if (m.muteSound == true) {
	  m.__userDisabledSound=true
     m.muteSound=false
  }
   else {
	   m.__userDisabledSound=false
       m.muteSound=true
   }
	 
 }

 ////////////////////////////////////////////////////////////////////////////////

 
}