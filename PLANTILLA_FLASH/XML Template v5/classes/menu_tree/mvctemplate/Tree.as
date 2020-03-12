import menu_tree.mvc.*
import menu_tree.I.*
import menu_tree.mvctemplate.*
import menu_tree.util.Observable
import menu_tree. mvclogowanie.*


class menu_tree.mvctemplate.Tree{
var __model:TreeModel	
var __target:MovieClip
var __background:BackgroundView
  
///////////////////////////////////////////////////////////////////////////

  public function Tree(target:MovieClip) {
	  this.__target=target
	 __model=new TreeModel(this)
	 this.__background=BackgroundView(this.__target.attachMovie("_bck_menu","_bck_menu_",-1))
	 this.__background.setModel(__model)
	 this.__model.addEventListener("onChangedSize",__background)
  }
 
///////////////////////////////////////////////////////////////////////////





}