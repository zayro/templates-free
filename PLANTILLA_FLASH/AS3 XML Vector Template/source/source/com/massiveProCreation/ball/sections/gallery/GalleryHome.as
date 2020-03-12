package com.massiveProCreation.ball.sections.gallery
{
	import com.massiveProCreation.gallery.GalleryCore;
	import com.massiveProCreation.events.CustomEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class GalleryHome extends GalleryCore
	{
		public function GalleryHome(xmlUrl:String, slideShowDelay:int)
		{
			super(xmlUrl, slideShowDelay);
		}
		// we override the resize function of out gallery core function because we want our images o fill 100% of the screen
		override protected function resize(tmp:Sprite):Sprite {

			var multiply:Number;
			tmp.width *= 10;
			tmp.height *= 10;
			
			if(tmp.height > stage.stageHeight){
				multiply = stage.stageHeight / tmp.height;
				tmp.height = stage.stageHeight;
				tmp.width = tmp.width * multiply
			} 
			if(tmp.width < stage.stageWidth){
				multiply = stage.stageWidth / tmp.width;
				tmp.width = stage.stageWidth;
				tmp.height = tmp.height * multiply;
			}
			
			return tmp;
		}
		// we override the image laoded function because we dont want the thumbnail to be laoded
		override protected function imageLoaded(e:Event):void {
			_images.push(_imageLoader.content);
			_images[_ci].smoothing = true;

			if(_ci == 0 && _slideShowTimer.running){
				nextImage();
				dispatchEvent(new CustomEvent(CustomEvent.IMAGE_LOADED, true, false));	
			}

			loadThumbnail(_ci);
		}
	}
}