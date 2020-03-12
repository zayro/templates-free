
import templateMp3.mvcMp3.*;


import templateMp3.mvc.*;
import templateMp3.util.*;
import templateMp3.I.*


class templateMp3.mvcMp3.VolumeController extends AbstractController {

////////////////////////////////////////////////////////////////////////////////	
	
  public function VolumeController (model:Observable) {
    super(model);
  }
  
 ////////////////////////////////////////////////////////////////////////////////
   
  function onChangeScroll(){
	 var v:VolumeView=VolumeView(this.getView())
	 var m:Mp3Model=Mp3Model(this.getModel())
     m.volume=v.__scroll.getScrollPosition()
  }
  
 ////////////////////////////////////////////////////////////////////////////////
  
  
}