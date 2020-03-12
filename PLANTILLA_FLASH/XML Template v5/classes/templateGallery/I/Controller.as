import templateGallery.util.*;
import templateGallery.mvc.*;
import templateGallery.I.*



interface templateGallery.I.Controller {
 
  public function setModel (m:Observable):Void;

 
  public function getModel ():Observable;

  
  public function setView (v:View):Void;

 
  public function getView ():View;
}