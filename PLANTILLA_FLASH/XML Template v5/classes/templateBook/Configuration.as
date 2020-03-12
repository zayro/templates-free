



class templateBook.Configuration {
	
	static var BACKGROUND_BOOK
    static var STAGE_WIDTH  ////Stage width
	static var STAGE_HEIGHT /////Stage height
	static var PAGE_WIDTH        /////////width image in sheet
	static var PAGE_HEIGHT       /////////height image in sheet
	static var FRAME_SHEET       ////frame sheet
	static var COLOR_FRAME
	static var COLOR_BACKGROUND  ////color background sheet
	static var COLOR_BACKGROUND_ONLOADPAGE
	static var BUTTON_PADDING_UP         ////padding button Up
	static var COLOR_NUMBER_PAGE  /////color numer page
	static var VISIBLE_NUMBER_PAGE
	static var COLOR_BUTTON_NEXT_PREV
	static var COLOR_BCG_BUTTON_NEXT_PREV
	static var BUTTON_NEXT_LABEL
	static var BUTTON_PREV_LABEL
	static var PRELOADER_MULTIPLE_TEXT_COLOR
	static var PRELOADER_MULTIPLE_BACKGROUND_COLOR
	static var FIRST_VISIBLE_PAGE
	
	////MANAGER NUMBER PAGE
	static var VISIBLE_MANAGER_PAGE
	static var COLOR_INPUT_MANAGER
	static var COLOR_BORDER_INPUT_MANAGER
	static var COLOR_BACKGROUND_INPUT_MANAGER
	static var LABEL_GOTOPAGE
	static var COLOR_LABEL_GOTOPAGE
	static var LABEL_OK
	static var COLOR_LABEL_OK
	static var BACKGROUND_COLOR_MANAGER
	
	
	
	

	
	
	
	
	static var __data:XML
	static var _loaded:Number
	
///////////////////////////////////////////////////////////////////////////////////////////////

static function load(xml){
		__data=new XML()
		__data.ignoreWhite=true
		__data.onLoad=function(){
	
			//Configuration.setXml(this)
			
		Configuration._loaded=1
		}
	__data.load(xml)
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////	

	static function get loaded(){
		return _loaded
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////	

static function setXml(xml_:XML){
	
			var len=xml_.firstChild.childNodes.length
			for(var i=0;i<len;i++){
				var nod=xml_.firstChild.childNodes[i]
				var node_name=nod.nodeName
				var value=nod.firstChild.nodeValue
				
				if(!isNaN(value)){
				Configuration[node_name]=Number(value)
				}else{
				Configuration[node_name]=value				
				}
				
				
				
			}
	
}

//////////////////////////////////////////////////////////////////////////////////////////////
	
}