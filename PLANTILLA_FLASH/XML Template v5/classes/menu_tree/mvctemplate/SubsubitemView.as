import pl.drawing.Rysowanie
import menu_tree.mvctemplate.*
import menu_tree.mvc.*
import menu_tree.I.*
import flash.display.BitmapData
import menu_tree.util.Observable
import mx.transitions.Tween
import mx.transitions.easing.*

class menu_tree.mvctemplate.SubsubitemView extends AbstractItem {

var background:MovieClip
var color_rol
var color_out
var tween
var colorTo		 
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new SubsubitemController(model)
 }
 
///////////////////////////////////////////////////////////////////////////////////////////////////////	



}

