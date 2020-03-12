
class templateGallery.Configuration{
	
	
	
	
/////////////////////////////////////////////////Configuration GALLERY	
    static var SMOOTHING

	static var THUMB_WIDTH:Number
	static var THUMB_HEIGHT:Number
	static var TIMESLIDE:Number
	static var URL_CONFIG_FLV:String
	static var TIME_INTRO:Number
	static var TIME_EXIT:Number
	
	///css
	static var URL_CSS
	static var CSS_STYLE
	
	
	static var URL_PLAYER_FLV:String
	static var COLOR_ROL
	static var COLOR_OUT
	static var ROTATE_THUMB
	
	static var COLOR_BCG_BIG_IMAGE
	static var COLOR_BCG_THUMB
	
	static var COLOR_BACKGROUND_BUTTON
	static var COLOR_SYMBOL_BUTTON
	static var COLOR_SLIDE_CIRCLE
	static var COLOR_BUTTON_CLOSE_DESC
	static var COLOR_BCG_DESC
	
	static var COLOR_PRELOADER_CURRENT
	static var COLOR_BCG_PRELOADER
	
	static var COLOR_BCG_PLAYER
	
	static var COLUMNS_LENGTH
	static var ROWS_LENGTH
	
	static var POSITION_NETWORK_X
	static var POSITION_NETWORK_Y
	
	static var 	POSITION_IMAGE_X
	static var 	POSITION_IMAGE_Y
	
	static var MARGIN_HORIZONTAL_BIG_IMAGE
	static var MARGIN_VERTICAL_BIG_IMAGE
	
	static var MARGIN_HORIZONTAL_THUMB
	static var MARGIN_VERTICAL_THUMB
	
	static var TITLE_COLOR_THUMB
	
	static var SPACE_X_THUMB
	static var SPACE_Y_THUMB

	
	
	
	
	
	
		
	
	
		
		
	
	static var __data:XML
	static var _loaded:Number
	
///////////////////////////////////////////////////////////////////////////////////////////////

static function load(xml){
		__data=new XML()
		__data.ignoreWhite=true
		__data.onLoad=function(){
			Configuration.setXml(this)
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
				}
				else if(value=="true"){
				Configuration[node_name]=true
				}
				else if(value=="false"){
				Configuration[node_name]=false
				}
				else{
				Configuration[node_name]=String(value)
				}
                
                if(Configuration[node_name]=="undefined"){
					Configuration[node_name]=undefined
				}
				
			}
	
}


//////////////////////////////////////////////////////////////////////////////////////////////
	
}