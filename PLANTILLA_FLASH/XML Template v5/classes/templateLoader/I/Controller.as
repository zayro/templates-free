import templateLoader.util.*;
import templateLoader.mvc.*;
import templateLoader.I.*



interface templateLoader.I.Controller {
  public function setModel (m:Observable):Void;
  public function getModel ():Observable;
  public function setView (v:View):Void;
  public function getView ():View;
}