package com.massiveProCreation.utils.loaders {
	import com.massiveProCreation.events.CustomEvent;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	public class ImageLoader extends Sprite{
		
		private var _loader:Loader;
		private var _percent:int;
		private var _image:Sprite;
		
		public function ImageLoader () {
			
		}
		public function loadImage(imageURL:String):void {
			// create laoder and sprite container
			_loader = new Loader();
			_image = new Sprite();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded, false, 0 , true);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress, false, 0, true);
			_percent = 0;
			
			_loader.load(new URLRequest(imageURL));
			trace("2");
		}
		private function imageLoaded(e:Event):void {
			// image loaded, dispatch complete event
			_image = Sprite(_loader.content);
			dispatchEvent(new CustomEvent(CustomEvent.IMAGE_LOADED, true, false));
		}
		private function loadProgress(e:ProgressEvent):void {
			// progress, percent
			_percent = e.bytesTotal / e.bytesTotal;
		}
		/*/<--GET-->/*/
		public function get percentLoaded ():int {
			// return percent
			return _percent;
		}
		public function loadedImage():Sprite {
			// return laoded image
			return _image;
		}
	}
}