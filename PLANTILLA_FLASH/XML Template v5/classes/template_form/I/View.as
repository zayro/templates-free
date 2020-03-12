import template_form.util.*;
import template_form.mvc.*;
import template_form.I.*



interface template_form.I.View {
  
  public function setModel (m:Observable):Void;

  
  public function getModel ():Observable;

 
  public function setController (c:Controller):Void;

  
  public function getController ():Controller;


  public function defaultController (model:Observable):Controller;
  
  
  ////////////////////////////////////
   public function getValue()
   
    public function getKey()
	
	 public function setKey()
   
     public function check()
	 
	 public function shovError()
	 
	  public function hideError()
	  
	    public function setIndex()
  
  
} 