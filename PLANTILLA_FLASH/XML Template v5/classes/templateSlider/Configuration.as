
class templateSlider.Configuration{
	
	
	
	
/////////////////////////////////////////////////Configuration GALLERY	

	static var THUMB_WIDTH:Number
	static var THUMB_HEIGHT:Number
	static var TIMESLIDE:Number
	static var URL_CONFIG_FLV:String
	static var TIME_INTRO:Number
	static var TIME_EXIT:Number
	
	///css
	static var URL_CSS
	static var CSS_STYLE
	
	
	static var BACKGROUND_COLOR_SLIDER
	static var COLOR_BUTTON_CLOSE
	
	static var COLOR_TIME_CIRCLE
	
	static var COLOR_BACKGROUND_DESC
	
	static var PRELOADER_CURRENT
	static var PRELOADER_BCG
	
	
	static var URL_PLAYER_FLV:String

	
	
	
	
	
	
		
	
	
		
		
	
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