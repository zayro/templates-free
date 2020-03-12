import menu_tree.util.*;
import menu_tree.mvc.*;
import menu_tree.I.*



interface menu_tree.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}