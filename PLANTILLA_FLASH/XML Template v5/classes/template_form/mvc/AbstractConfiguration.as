


class template_form.mvc.AbstractConfiguration{
	
	static var dane:XML
	static var _loaded:Number


static function load(xml){
	
		dane=new XML()
		dane.ignoreWhite=true
		dane.onLoad=function(){
			
			var len=this.firstChild.childNodes.length
			for(var i=0;i<len;i++){
				var nod=this.firstChild.childNodes[i]
				var node_name=nod.nodeName
				
				ConfigurationGaleria[node_name]=nod.firstChild.nodeValue
			}
			
			ConfigurationGaleria._loaded=1
		}
		
		dane.load(xml)
	}
	
	static function get loaded(){
		return _loaded
	}
	
	
}