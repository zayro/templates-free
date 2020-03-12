import pl.drawing.Rysowanie
import smallCalendar.mvctemplate.*
import smallCalendar.mvc.*
import smallCalendar.I.*
import flash.display.BitmapData
import smallCalendar.util.Observable
import smallCalendar.Configuration


 

   
class smallCalendar.mvctemplate.BackgroundView extends AbstractView {
	

var title:TextField		 

/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new PrevMonthController(model)
 }
 
//////////////////////////////////////////////////////////////////



}

