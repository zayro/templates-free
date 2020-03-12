
class templateText.Configuration
{
	
	
	
	static var TEXT_X:Number
	static var TEXT_Y:Number
	static var TEXT_WIDTH:Number
	static var TEXT_HEIGHT:Number
	static var TEXT_BORDER:Boolean
	static var TEXT_BORDER_COLOR
	static var TEXT_BACKGROUND:Boolean
	static var TEXT_BACKGROUND_COLOR
	static var TEXT_COLOR_SCROLL_BACKGROUND
	static var TEXT_COLOR_SCROLL
	static var SPEED_SCROLL:Number
	
	
	
	
	
	
	
	static var __data:XML
	static var _loaded:Number
///////////////////////////////////////////////////////////////////////////////////////////////
static function load(xml){
		__data=new XML()
		__data.ignoreWhite=true
		__data.onLoad=function(){
			var len=this.firstChild.childNodes.length
			for(var i=0;i<len;i++){
				var nod=this.firstChild.childNodes[i]
				var node_name=nod.nodeName
				
				Configuration[node_name]=nod.firstChild.nodeValue
			}
		Configuration._loaded=1
		}
	__data.load(xml)
	}
///////////////////////////////////////////////////////////////////////////////////////////////	
	static function get loaded(){
		return _loaded
	}
///////////////////////////////////////////////////////////////////////////////////////////////	
}
