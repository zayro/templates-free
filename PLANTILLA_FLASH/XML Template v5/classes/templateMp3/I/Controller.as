import templateMp3.util.*;
import templateMp3.mvc.*;
import templateMp3.I.*



interface templateMp3.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}