import pl.drawing.Rysowanie
import smallCalendar.mvctemplate.*
import smallCalendar.mvc.*
import smallCalendar.I.*
import flash.display.BitmapData
import smallCalendar.util.Observable
import smallCalendar.Configuration


 

  
class smallCalendar.mvctemplate.PrevMonthView extends AbstractView {
	
	
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new PrevMonthController(model)
 }
 
//////////////////////////////////////////////////////////////////

function onPress(){
	var m:CalendarModel=CalendarModel(this.getModel())
	m.prevMonth()
}

//////////////////////////////////////////////////////////////////

function onLoad() {
	_x = 0
	NewColor.setColor(this, Configuration.COLOR_ARROW.split(",")[0])
	this._alpha=Configuration.COLOR_ARROW.split(",")[1]
}



 

}

