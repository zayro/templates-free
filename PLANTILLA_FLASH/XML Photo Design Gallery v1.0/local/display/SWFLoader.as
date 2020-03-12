package local.display
{
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.AVM1Movie;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import elemental.display.Rotator;
	import elemental.effects.AlphaFade;
	
	public class SWFLoader extends Sprite
	{
		public static const LEFT_PADDING: Number = 60;
		
		public static var instance: SWFLoader;
		
		public var loader: Loader;
		
		private var rotator: Rotator = new Rotator(0x000000);
		private var tempW: int;
		private var tempH: int;
		
		public function SWFLoader() : void
		{
			instance = this;
			mouseEnabled = false;
			mouseChildren = false;
			
			rotator.scaleX = rotator.scaleY = .5;
			rotator.stop();
			rotator.visible = false;
			addChild(rotator);
		}
		
		public function show(str: String, w: int, h: int) : void
		{
			killLoader(loader);
			loader = new Loader();
			showRotator();
			
			tempW = w;
			tempH = h;
			
			loader.load( new URLRequest(str) );
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler, false, 0, true);
			
			loader.x = -tempW / 2;
			loader.y = -tempH / 2;
			loader.x += LEFT_PADDING;
		}
		
		public function clear() : void
		{
			killLoader(loader);
			hideRotator();
		}
		
		private function completeHandler(event: Event) : void
		{
			// BEGIN BUGFIX
			// Monday, Oct 20, 2008 - Interactive content is static due to mouseChildren being false.
			mouseChildren = true;
			// END   BUGFIX
			
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
			hideRotator();
			addChild(loader);
		}
		
		private function showRotator() : void
		{
			rotator.start();
			rotator.visible = true;
		}
		
		private function hideRotator() : void
		{
			rotator.stop();
			rotator.visible = false;
		}
		
		private function killLoader(ldr: Loader) : void
		{
			if (ldr == null)
				return void;
			
			if (loader.contentLoaderInfo.hasEventListener(Event.COMPLETE))
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
			
			try
			{
				ldr.close();
			}
			catch(error: Error)
			{
				try
				{
					ldr.unload();
				}
				catch(e: Error)
				{
				
				}
			}
		}
	}
}