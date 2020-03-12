import templateSlider.util.*;
import templateSlider.mvc.*;
import templateSlider.I.*



interface templateSlider.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}