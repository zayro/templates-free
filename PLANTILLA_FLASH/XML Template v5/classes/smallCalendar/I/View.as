import smallCalendar.util.*;
import smallCalendar.mvc.*;
import smallCalendar.I.*
 


interface smallCalendar.I.View {
  
  public function setModel (m:Observable):Void; 
 
  
  public function getModel ():Observable;

 
  public function setController (c:Controller):Void;

  
  public function getController ():Controller;


  public function defaultController (model:Observable):Controller;
}