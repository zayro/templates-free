import templateMove.util.*;
import templateMove.mvc.*;
import templateMove.I.*

 
 
interface templateMove.I.View {
  
  public function setModel (m:Observable):Void;

  
  public function getModel ():Observable;

 
  public function setController (c:Controller):Void;

  
  public function getController ():Controller;


  public function defaultController (model:Observable):Controller;
}