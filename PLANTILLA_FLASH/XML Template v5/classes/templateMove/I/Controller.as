import templateMove.util.*;
import templateMove.mvc.*;
import templateMove.I.*


  

interface templateMove.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}