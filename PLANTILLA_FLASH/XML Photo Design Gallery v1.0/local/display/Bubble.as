package local.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import elemental.effects.AlphaFade;
	
	public class Bubble extends Sprite
	{
		public var textFormat: TextFormat = new TextFormat("Arial", 12, 0x666666);
		public var lineStyle: uint;
		public var fillStyle: uint;
		public var maxAlpha: Number = 1;
		
		private var bitmap: Bitmap = new Bitmap();
		private var textField: TextField;
		
		public function Bubble(t: TextField) : void
		{
			textField = t;
			
			this.lineStyle = 0xCCCCCC;
			this.fillStyle = 0xCCCCCC;
			
			alpha = 0;
			mouseEnabled = false;
			mouseChildren = false;
			
			textField.autoSize = TextFieldAutoSize.LEFT;
			
			bitmap.x = 5;
			bitmap.y = -30;
			addChild(bitmap);
		}
		
		public function	show(msg:String) : void
		{
			textField.text = msg;
			
			var data: BitmapData = new BitmapData(textField.width/scaleX, textField.height, true, 0x00000000);
			data.draw(textField);
			
			bitmap.bitmapData = data;
			bitmap.x = -bitmap.width >> 1;
			bitmap.smoothing = true;
			
			graphics.clear();
			graphics.beginFill(fillStyle);
			
			var w: Number = width+10;
			graphics.drawRect(-w>>1, -35, w, 25);
			
			AlphaFade.fadeTo(this, maxAlpha, 4);
		}
		
		public function hide() : void
		{
			AlphaFade.fadeTo(this, 0, 5);
		}
	}
}