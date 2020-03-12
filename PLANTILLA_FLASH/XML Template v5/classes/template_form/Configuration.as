



class template_form.Configuration{
	
	
static var BACKGROUND_COLOR
static var BUTTON_BCG_COLOR
static var URLSEND//="http://www.inter-net.com.pl/test_form/url_send.php"
static var SENDTRUE//="_sendTrue_!!!!!!!!!!"
static var SENDFALSE//="_sendFalse_!!"
static var SENDPROGRESS///="_sendProgress_"
static var BUTTONSEND///="_send_"
static var BUTTONRESET///="_send_"
static var SPACEY//=3
static var ALIGNBUTTON//="R"
static var TITLECOLOR///=0xBBBBBB
static var INPUTCOLOR///=0xBBBBBB
static var BORDERCOLOR///=0xCCCCCC
static var ERRORBORDERCOLOR///=0xFF0000
static var INPUTBACKGRONDCOLOR///=0xFFFFFF
static var ALERTCOLOR///=0xCCCCCC
static var BUTTONTEXTCOLOR///=0xFFFFFF
static var BUTTONBACKGROUNDCOLOR////=0x999999
static var POSITION_X
static var POSITION_Y
static var SENDTO
static var HEADLINE

static var COLOR_BORDER_ERROR
static var COLOR_BORDER_SELECT
static var BACKGROUND_INPUT_TEXT

	
	
	
	
	
	
	
	
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
				
				Configuration[node_name]=nod.firstChild.nodeValue
			}
	
}

//////////////////////////////////////////////////////////////////////////////////////////////
	
}