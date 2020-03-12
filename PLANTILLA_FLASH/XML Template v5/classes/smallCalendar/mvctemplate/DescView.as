import pl.drawing.Rysowanie
import smallCalendar.mvctemplate.*
import smallCalendar.mvc.*
import smallCalendar.I.*
import flash.display.BitmapData
import smallCalendar.util.Observable
import smallCalendar.Configuration
import TextField.StyleSheet;

 
 
   
class smallCalendar.mvctemplate.DescView extends AbstractView {
	
var mcArea
var desc:TextField	
var title:TextField
var my_styleSheet
	 
/////////////////////////////////////////////////////////	

public function defaultController (model:Observable):Controller {
  return new DescController(model)
 }
 
/////////////////////////////////////////////////////////////////

function onLoad(){
	this._x=200
	this._y=4
}
 
////////////////////////////////////////////////////////////////

function setTitle(title_){
	this.title.text=title_	
}

//////////////////////////////////////////////////////////////////

function onUpdate(){
	var m:CalendarModel=CalendarModel(this.getModel())

	this.setTitle("")
	createTextArea("")
	this._visible=false
}

/////////////////////////////////////////////////////////////////

function setDesc(desc_:String){
	this.desc.text=desc_
}

////////////////////////////////////////////////////////////////

function onPressNumber(obj:Object){
	var day = Number(obj.target.selectedItem.day)
	var month =  Number(obj.target.selectedItem.month)
	var year =  Number(obj.target.selectedItem.year)
	
	
	var m:CalendarModel=CalendarModel(this.getModel())
	
	var node:XMLNode=m.getEvents(year,month,day)
	var desc:String=node.firstChild.nodeValue
	///var link=node.attributes.link
		
	if(desc!=undefined){
	this._visible=true
	this.setTitle(day+" "+m.__month[month-1]+" "+year)
	createTextArea("<title>"+day+" "+m.__month[month-1]+" "+year+"<br></title>"+desc)
	}else{
		this.setTitle("")
		createTextArea("")
		this._visible=false
	}
		
}

//////////////////////////////////////////////////////////////////

function createTextArea(txt_) {
	mcArea = this.attachMovie("_text", "_text", 2);
	mcArea.styleSheet =Configuration.TEXT_CSS_STYLE
	mcArea._x = Configuration.TEXT_X
	mcArea._y = Configuration.TEXT_Y
	mcArea.setSize(Configuration.TEXT_WIDTH,Configuration.TEXT_HEIGHT);
	mcArea.border = (Configuration.TEXT_BORDER=="true") ? true : false
	mcArea.borderColor = Configuration.TEXT_BORDER_COLOR
	mcArea.colorScrollBackground = Configuration.TEXT_COLOR_SCROLL_BACKGROUND
	mcArea.colorScroll = Configuration.TEXT_COLOR_SCROLL
	mcArea.__speedScroll=Configuration.SPEED_SCROLL
	mcArea.text = txt_;
	
	mask()
	
}


//////////////////////////////////////////////////////////////////

function mask(){
	
	var mcMask:MovieClip=this.createEmptyMovieClip("_mcMask",4343)
	mcMask._x=this.mcArea._x-10
	mcMask._y=this.mcArea._y-10
	Drawing.rectangle(mcMask,0,0,this.mcArea._width+70,this.mcArea._height+20,["0xFF0000",50])
	this.mcArea.setMask(mcMask)
	
	mcMask._xscale=0
	mcMask.tween('_xscale',100,1,'easeOutCubic',0,{})
	
	
}

///////////////////////////////////////////////////////////////////


 

}

