import smallCalendar.util.*;
import smallCalendar.mvc.*;
import smallCalendar.I.*


 
interface smallCalendar.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}  