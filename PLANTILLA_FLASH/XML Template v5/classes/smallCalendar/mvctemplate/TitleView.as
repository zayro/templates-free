import pl.drawing.Rysowanie
import smallCalendar.mvctemplate.*
import smallCalendar.mvc.*
import smallCalendar.I.*
import flash.display.BitmapData
import smallCalendar.util.Observable
import smallCalendar.Configuration


 

   
class smallCalendar.mvctemplate.TitleView extends AbstractView {
	

var title:TextField	
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new PrevMonthController(model)
 }
 
//////////////////////////////////////////////////////////////////

function onUpdate(){
	var m:CalendarModel=CalendarModel(this.getModel())
	//this.title.text=m.format(m.month+1)+" . "+m.year
	
	this.title.text=m.__month[m.month]+" , "+m.year
	this.title.textColor=Configuration.COLOR_DATE

}

//////////////////////////////////////////////////////////////////

function onLoad(){
	var m:CalendarModel=CalendarModel(this.getModel())
	this.title._width=7*(m.__width+m.__spaceX)
}
 
//////////////////////////////////////////////////////////////////



 

}

