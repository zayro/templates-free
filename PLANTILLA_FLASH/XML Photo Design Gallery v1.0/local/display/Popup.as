package local.display
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import elemental.display.Rotator;
	import elemental.effects.AlphaFade;
	import elemental.effects.Tween;
	import elemental.utils.Global;
	
	public class Popup extends Sprite
	{
		private static const fadeEasing:  Number = 4;
		private static const scaleEasing: Number = 3;
		private static const edgeBuffer:  Number = 10;
		private static const border:      Number = 10;
		
		private var rotator: Rotator = new Rotator(0);
		
		private var loader: Loader;
		private var showing: Boolean;
		private var image:*;
		
		public function Popup() : void
		{
			rotator.stop();
			rotator.scaleX = rotator.scaleY = .5;
			addChild(rotator);
			rotator.visible = false;
			
			loader = new Loader();
			
			alpha = 0;
			mouseChildren = false;
			mouseEnabled = false;
			showing = false;
			
			addEventListener(MouseEvent.CLICK, clicked);
		}
		
		public function show(url: String) : void
		{
			rotator.start();
			rotator.visible = true;
			AlphaFade.fadeTo(this, 1.01, fadeEasing);
			mouseChildren = true;
			mouseEnabled = true;
			showing = true;
			
			loader.load( new URLRequest(url) );
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
		}
		
		public function hide() : void
		{
			clearLoader();
			
			rotator.stop();
			rotator.visible = false;
			AlphaFade.fadeTo(this, 0, fadeEasing);
			mouseChildren = false;
			mouseEnabled = false;
			showing = false;
			
			if (image)
				AlphaFade.fadeOut(image, 2);
			
			Tween.tween(imageBackground, "width",  50, scaleEasing);
			Tween.tween(imageBackground, "height", 50, scaleEasing);
		}
		
		private function showImage(bmp: Bitmap) : void
		{
			image = bmp;
			
			var maxSize: Number;
			
			var sW: int = Global.stage.stageWidth;
			var sH: int = Global.stage.stageHeight;
			
			var ratW: Number = image.width  / sW;
			var ratH: Number = image.height / sH;
			
			maxSize = ratW > ratH ? sW : sH;					
			maxSize -= (edgeBuffer << 1) + (border << 1);
			
			if (image.width > maxSize || image.height > maxSize)
			{
				if (ratW > ratH)
					{ image.width = maxSize; image.scaleY = image.scaleX; }
				else
					{ image.height = maxSize; image.scaleX = image.scaleY; }
			}
				
			image.x = -image.width >> 1;
			image.y = -image.height >> 1;
			
			Tween.tween(imageBackground, "width",  image.width + (border<<1), scaleEasing);
			Tween.tween(imageBackground, "height", image.height+ (border<<1), scaleEasing);
				
			image.smoothing = true;
			
			rotator.stop();
			rotator.visible = false;
			
			addChild(image);
			AlphaFade.fadeIn(image, fadeEasing);
		}
		
		private function loadComplete(event: Event) : void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
			var content:* = loader.content;
			
			if (content is Bitmap)
				showImage(content as Bitmap);
		}
		
		private function clearLoader() : void
		{
			try { loader.close()  } catch (e: Error) {}
			try { loader.unload() } catch (e: Error) {}
			
			if (loader.contentLoaderInfo.hasEventListener(Event.COMPLETE))
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
		}
		
		private function clicked(event: MouseEvent) : void
		{
			hide();
		}
	}
}