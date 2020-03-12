import pl.drawing.Rysowanie
import smallCalendar.mvctemplate.*
import smallCalendar.mvc.*
import smallCalendar.I.*
import flash.display.BitmapData
import smallCalendar.util.Observable
import smallCalendar.Configuration


 

  
class smallCalendar.mvctemplate.NextMonthView extends AbstractView {
	
	
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new MonthController(model)
 }
 
//////////////////////////////////////////////////////////////////

function onPress(){
	var m:CalendarModel=CalendarModel(this.getModel())
	m.nextMonth()
}

//////////////////////////////////////////////////////////////////


function onUpdate(){
	var m:CalendarModel=CalendarModel(this.getModel())
	
	
}

//////////////////////////////////////////////////////////////////

function onLoad(){
	var m:CalendarModel=CalendarModel(this.getModel())
	this._x = 7 * (m.__width + m.__spaceX) - this._width - 3
	NewColor.setColor(this, Configuration.COLOR_ARROW.split(",")[0])
	this._alpha=Configuration.COLOR_ARROW.split(",")[1]
}
 
//////////////////////////////////////////////////////////////////

}

