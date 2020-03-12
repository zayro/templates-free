package com.massiveProCreation.utils.loaders {
	
	/*/
		HOW TO USE XMLLOADER
		
			var xmlLoader:XMLLoader = new XMLLoader(xmlUrl);
			xmlLoader.addEventListener(CustomEvent.XML_LOADED, getXML);
		
			function getXML(e:CustomEvent):void {
				var xml:XML = xmlLoader.getXML();
			}
	/*/
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.massiveProCreation.events.CustomEvent;

	public class XMLLoader extends Sprite {

		private var _xml:XML;
		
		public function XMLLoader (xmlURL:String) {
			// create url loader
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, xmlLoaded, false, 0 , true);
			urlLoader.load(new URLRequest(xmlURL));
		}
		
		private function xmlLoaded(e:Event):void {
			// xml loaded, dispatch event that xml is loaded
			_xml = new XML(e.target.data);
			dispatchEvent(new CustomEvent(CustomEvent.XML_LOADED, true, false));
		}
		public function getXML():XML{
			// public function which returns xml file
			return _xml;
		}
	}
}