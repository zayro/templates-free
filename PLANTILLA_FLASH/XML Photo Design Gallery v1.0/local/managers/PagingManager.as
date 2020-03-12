package local.managers
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import local.display.PictureStage;
	
	public class PagingManager extends Sprite
	{
		private static const increment: int = 5;
		
		private static var _buffer: Array = new Array();
		private static var startIndex: int = 0;
		private static var endIndex:   int = increment;
		
		public static var instance: PagingManager;
		
		public static function set buffer(val: Array) : void
		{
			_buffer = val;
			startIndex = 0;
			endIndex = increment;
			instance.showIndex();
		}
		
		public function PagingManager() : void
		{
			instance = this;
			visible = false;
			alpha = 1;
			
			left.addEventListener(MouseEvent.CLICK, dn);
			right.addEventListener(MouseEvent.CLICK, up);
		}
		
		private function showIndex() : void
		{
			visible = true;
			
			PictureStage.instance.clear();
			var arr: Array = new Array();
			
			for (var i: int = startIndex; i < endIndex; i++)
			{
				if (i == _buffer.length) break;
				arr.push(_buffer[i]);
			}
			
			PictureStage.instance.populate(arr);
			showText();
		}
		
		private function up(event: MouseEvent) : void
		{
			startIndex += increment;
			endIndex += increment;
			
			instance.showIndex();
		}
		
		private function dn(event: MouseEvent) : void
		{
			startIndex -= increment;
			endIndex -= increment;
			
			instance.showIndex();
		}
		
		private function showText() : void
		{
			var num1: int = startIndex + 1;
			var num2: int = endIndex;
			
			if (num2 > _buffer.length)
				num2 = _buffer.length;
				
			var string: String = "viewing " + num1 + " through " + num2 + " of " + _buffer.length;
			status.text = string;
			
			if (num1 == 1)
				left.visible = false;
			else
				left.visible = true;
				
			if (num2 ==_buffer.length)
				right.visible = false;
			else
				right.visible = true;
		}
	}
}