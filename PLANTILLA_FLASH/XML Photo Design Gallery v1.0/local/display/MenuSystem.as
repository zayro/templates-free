package local.display
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import local.display.MenuButton;
	import local.display.MenuLink;
	
	public class MenuSystem extends Sprite
	{
		private static const spacing: int = 20;
		public static var instance: MenuSystem;
		
		private var items: Array = new Array();
		private var index: int = 0;
		
		public function MenuSystem() : void
		{
			instance = this;
		}
		
		public function addItem(text: String, closure: Function, args: Array = null) : MenuButton
		{
			var btn: MenuButton = new MenuButton(text, closure, args);
			btn.y = index;
			addChild(btn);
			index += spacing;
			items.push(btn);
			return btn;
		}
		
		public function addLink(text: String, link: String, window: String) : MenuLink
		{
			if (window == "" || window == null)
				window = "_blank";
			
			var btn: MenuLink = new MenuLink(text, link, window);
			btn.y = index;
			addChild(btn);
			index += spacing;
			items.push(btn);
			return btn;
		}
		
		public function gotoFirst() : void
		{
			if  (items && items.length > 0)
				items[0].dispatchEvent( new MouseEvent(MouseEvent.CLICK) );
		}
	}
}