import templateNewsy.util.*;
import templateNewsy.mvc.*;
import templateNewsy.I.*



interface templateNewsy.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}