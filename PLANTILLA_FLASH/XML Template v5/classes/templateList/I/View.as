import templateList.util.*;
import templateList.mvc.*;
import templateList.I.*



interface templateList.I.View {
  
  public function setModel (m:Observable):Void;

  
  public function getModel ():Observable;

 
  public function setController (c:Controller):Void;

  
  public function getController ():Controller;


  public function defaultController (model:Observable):Controller;
}