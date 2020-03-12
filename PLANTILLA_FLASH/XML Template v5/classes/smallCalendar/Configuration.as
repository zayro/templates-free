


class smallCalendar.Configuration
{
	
	
	////////////////////////////////////////////////////Calendar
	static var COLOR_ARROW
	static var BACKGROUND_COLOR
	
	////name dayWeek
   static var SU:String="Sunday"
   static var MO:String="Monday"
   static var TU:String="Tuesday"
   static var WE:String="Wednesday"
   static var TH:String="Thursday"
   static var FR:String="Friday"
   static var SA:String="Saturday"
	
	///name Month
   static var JANUARY="January"
   static var FEBRUAY="Februay"
   static var MARCH="March"
   static var APRIL="April"
   static var MAY="May"
   static var JUNE="June"
   static var JULY="July"
   static var AUGUST="August"
   static var SEPTEMBER="September"
   static var OCTOBER="October"
   static var NOVEMBER="November"
   static var DECEMBER="December"
   static var COLOR_NUMBER
   static var COLOR_NUMBER_WEEK
   static var COLOR_DATE
   static var COLOR_FRAME_TODAY
   static var COLOR_GLOW_NORMAL
   static var COLOR_GLOW_EVENTS
   static var COLOR_BACKGROUND_NUMBER
   
   
   ////space calendar
   static var WIDTH_BACKGROUND_NUMBER
   static var HEIGHT_BACKGROUND_NUMBER
   static var SPACE_X_NUMBER
   static var SPACE_y_NUMBER
   static var SIZE_NUMBER
	
	
	
	
	static var FIRSTDAYWEEK:Number=0 /////firstDayWeek ( 0-Su ; 1-Mo ; 2-Tu ; 3-We ; 4-Th ; 5-Fr ; 6-Sa )
	static var CALENDAR_X:Number   ///position x
	static var CALENDAR_Y:Number   ///position Y
	static var AUTO_DISPLAY_EVENT:String="true"  /// auto display the event for the current date 
	///static var 
	
	
	
	///////////////////////////////////textArea
	static var TEXT_CSS_STYLE
	static var TEXT_X:Number
	static var TEXT_Y:Number
	static var TEXT_WIDTH:Number
	static var TEXT_HEIGHT:Number
	static var TEXT_BORDER:Boolean
	static var TEXT_BORDER_COLOR
	static var TEXT_COLOR_SCROLL_BACKGROUND
	static var TEXT_COLOR_SCROLL
	static var SPEED_SCROLL:Number
	static var TEXT_URL_STYLE_CSS:String
	
	
	
	
	
	
	
	
	
	
	
	static var __data:XML
	static var _loaded:Number
	
///////////////////////////////////////////////////////////////////////////////////////////////

static function load(xml){
		__data=new XML()
		__data.ignoreWhite=true
		__data.onLoad=function(){
		Configuration._loaded=1
		}
	__data.load(xml)
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////	

	static function get loaded(){
		return _loaded
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////	

static function setXml(date_){
		   var len=date_.firstChild.childNodes.length
			for(var i=0;i<len;i++){
				var nod=date_.firstChild.childNodes[i]
				var node_name=nod.nodeName
				
				Configuration[node_name]=nod.firstChild.nodeValue
			}
		
	
}

///////////////////////////////////////////////////////////////////////////////////////////////	

	
	
	
}
