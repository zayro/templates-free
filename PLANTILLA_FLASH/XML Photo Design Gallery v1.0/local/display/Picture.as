package local.display
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import elemental.effects.Move;
	import elemental.effects.Rotate;
	import elemental.utils.Elemath;
	import elemental.utils.Global;
	
	import local.managers.PopupManager;
	import local.managers.MouseManager;
	
	public class Picture extends Sprite
	{		
		private static const maxDimension: Number = 250;
		private static const maxRot:       Number = 35;
		private static const edging:       Number = 10;
		private static const moveEasing:   Number = 6;
		private static const clearEasing:  Number = 12;
		private static const rotEasing:    Number = 12;
		private static const dragEasing:   Number = 5;
		private static const dragThresh:   Number = 2;
		
		private static var selected: Picture;
		private static var dragCnt:  int;
		
		private var xml:    XML;
		private var loader: Loader;
		private var image:  Bitmap;
		
		private var _x: Number;
		private var _y: Number;
		
		private var loaded: Boolean = false;
		
		public function Picture(xml: XML = null, _x: Number = 0, _y: Number = 0) : void
		{
			if (xml == null)
				return void;
			
			this.xml = xml;
			this._x = _x;
			this._y = _y;
			loader = new Loader();
			loader.load( new URLRequest(xml.@icon) );
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageReady);
			
			mouseChildren = false;
			addEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			addEventListener(MouseEvent.MOUSE_OUT,  onRollOut);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			
			visible = false;
		}
		
		public function clear() : void
		{
			mouseEnabled = false;			
			removeEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			removeEventListener(MouseEvent.MOUSE_OUT,  onRollOut);
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			
			
			
			if (!loaded)
				if (parent)
				{
					parent.removeChild(this);
					loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageReady);
					
					try { loader.close(); } catch (e: Error) {};
					try { loader.unload(); } catch (e: Error) {};
					
					return void;
				}
			
			Move.to(this, _x << 2, 1000, clearEasing);
			rotateRandom();
			setTimeout(delayedClear, 500);
		}
		
		private function imageReady(event: Event) : void
		{
			visible = true;
			loaded = true;
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageReady);
			
			var pic: Bitmap = loader.content as Bitmap;
			
			resize(pic, maxDimension);
			
			addChild(pic);
			
			rotateRandom();
			Move.to(this, _x, _y, moveEasing);
			
			dispatchEvent( new Event("COUNT", true) );
		}
		
		private function delayedClear() : void
		{
			if (parent)
				parent.removeChild(this);
		}
		
		private function resize(pic: Bitmap, dimension: Number) : void
		{
			if (pic.width > pic.height)
				{ pic.width = dimension; pic.scaleY = pic.scaleX; }
			else
				{ pic.height = dimension; pic.scaleX = pic.scaleY; }
				
			pic.x = -pic.width >> 1;
			pic.y = -pic.height >> 1;
			
			background.width = pic.width + (edging << 1);
			background.height = pic.height + (edging << 1);
			
			pic.smoothing = true;
		}
		
		private function onRollOver(event: MouseEvent) : void
		{
			MouseManager.show();
		}
		
		private function onRollOut(event: MouseEvent) : void
		{
			MouseManager.hide();
		}
		
		private function mouseDown(event: MouseEvent) : void
		{
			dragCnt = 0;
			selected = this;
			Global.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP,   mouseUp);
			Global.stage.addEventListener(Event.MOUSE_LEAVE,     onLeaveStage);
			
			//parent.addChild(this);
		}
		
		private function mouseUp(event: MouseEvent) : void
		{
			if (selected != this)
				return void;
				
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP,   mouseUp);
			Global.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			Global.stage.removeEventListener(Event.MOUSE_LEAVE,     onLeaveStage);
				
			if (dragCnt <= dragThresh)
				onClick();
		}
		
		private function onLeaveStage(event: Event) : void
		{
			mouseUp(null);
		}
		
		private function mouseMove(event: MouseEvent) : void
		{
			if (++dragCnt > dragThresh)
				Move.to(this, parent.mouseX, parent.mouseY, dragEasing);
				
			if (dragCnt == dragThresh)
			{
				MouseManager.moved++;
				rotateRandom();
			}
		}
		
		private function onClick() : void
		{
			Move.killMove(this);
			PopupManager.show(xml.@full);
			MouseManager.clicked = true;
		}
		
		private function rotateRandom() : void
		{
			Rotate.to(this, Elemath.random(-maxRot, maxRot), rotEasing);
		}
	}
}