import template_form.util.*;
import template_form.mvc.*;
import template_form.I.*



interface template_form.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}