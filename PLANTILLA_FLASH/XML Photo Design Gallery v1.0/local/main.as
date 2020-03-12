/*

This is the script that is the main document class for the flash file.
I must stress that you only edit this if you understand AS3, and have
reviewed the inner workings enough to know what you're doing, this is
not a simple Flash file.

*/

package local
{
	import flash.display.MovieClip;
	import flash.ui.ContextMenu;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import elemental.utils.FluidScreen;
	import elemental.utils.Global;
	
	import local.display.Popup;
	import local.display.SWFLoader;
	import local.managers.PopupManager;
	import local.managers.XmlManager;
	import local.managers.MouseManager;
	
	public class main extends MovieClip
	{
		// This string is the path to the XML file, change it to use a different one.
		private const xmlPath: String = "galleries.xml";
		
		// the XML data will be stored here
		private var xml: XML;
		
		// this is the class that handles loading and displaying swf's, see local/display/SWFLoader.as
		public var swfLoader: SWFLoader = new SWFLoader();
		
		// holds the instance of this in a static var so it can be accessed
		public static var instance: main;
		
		// this function gets called when the swf first becomes active
		public function main() : void
		{
			// set the instance var
			instance = this;
			
			// here i'm getting rid of the normal context menu, delete these 3 lines to bring it back
			var cm: ContextMenu = new ContextMenu();
			cm.hideBuiltInItems();
			contextMenu = cm;
			
			// listen to the swfs own loading progress, and starting the XML load once the swf is done
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress);
			loaderInfo.addEventListener(Event.COMPLETE, startXML);
			
			// setting things up for other classes to use
			Global.stage = stage;
			FluidScreen.stage = stage;
			FluidScreen.staticWatch( { value:background, width:1, height:1 } );
			FluidScreen.resize();
			
			// this means that on frame 3 (2 when indexed from 0) the frameCall function will call - LEAVE THIS.
			addFrameScript(2, frameCall);
		}
		
		private function loadProgress(event: ProgressEvent) : void
		{
			// this is dispatched as the loading of this main swf happens use it to preload. the file is very
			// small, so i didn't include one, it loads so quick it's not even necessary.
		}
		
		private function startXML(event: Event) : void
		{
			// do not edit, this starts the XML loading in
			event.target.removeEventListener(ProgressEvent.PROGRESS, loadProgress);
			event.target.removeEventListener(Event.COMPLETE, startXML);
			var xmlLoader: URLLoader = new URLLoader( new URLRequest(xmlPath) );
			xmlLoader.addEventListener(Event.COMPLETE, initialize);
		}
		
		private function initialize(event: Event) : void
		{
			// do not edit, this is dispatched once the swf is done loading it's XML, and
			// starts the ball rolling on the interface starting up.
			event.target.removeEventListener(Event.COMPLETE, initialize);
			xml = XML(event.target.data);
			gotoAndStop(3);
		}
		
		private function frameCall() : void
		{
			// add setup functions here
			setupFluidScreen();
			setupGUI();
			setupMenu();
			setupGallery();
		}
		
		private function setupGUI() : void
		{
			MouseManager.initialize(mouseGraphic, stage, this, bubbleText);
			
			titleText.autoSize = TextFieldAutoSize.LEFT;
			titleText.text = xml.title;
			
			statusText.x = titleText.x + titleText.width + 18;
			XmlManager.statusText = statusText;
			statusText.autoSize = TextFieldAutoSize.LEFT;
			
			footer.setFooter(xml.phone, xml.email);
			
			addChild(swfLoader);
		}
		
		private function setupFluidScreen() : void
		{
			// The FluidScreen class handles keeping elements of the stage where
			// they are supposed to be even as the browser resizes.
			FluidScreen.staticWatch( { value:footer,      x:.5, y:1  } );
			FluidScreen.staticWatch( { value:activity,    x:.5, y:1  } );
			FluidScreen.staticWatch( { value:paging,      x:.5, y:1  } );
			FluidScreen.staticWatch( { value:galleryMenu, x:0,  y:1  } );
			FluidScreen.staticWatch( { value:popup,       x:.5, y:.5 } );
			FluidScreen.staticWatch( { value:picStage,    x:.5, y:.5 } );
			FluidScreen.staticWatch( { value:swfLoader,   x:.5, y:.5 } );
			
			FluidScreen.staticWatch( { value:popup.background,   width:1, height:1 } );
			FluidScreen.staticWatch( { value:galleryMenu.window, width:.75, height:1 } );
			
			FluidScreen.resize();
		}
		
		private function setupMenu() : void
		{
			// this is where the home gets added to the menu, and then the other
			// items get added
			XmlManager.initialize(xml);
			
			if (xml.@home == "true")
				menu.addItem( "Home", XmlManager.populateAsHome );
			
			setupLinksAndGalleries();
		}
		
		private function setupGallery() : void
		{
			picStage.activity = activity;
			PopupManager.popup = popup;
			//XmlManager.populateAsHome(); // before the home could not be changed, now it can!
			menu.gotoFirst(); // whatever is the first button will be home
		}
		
		private function setupLinksAndGalleries() : void
		{
			// to add a new type to the XML, do it here, this is where it parses them apart
			for each (var node: XML in xml.elements())
				if (node.@type == "gallery")
					menu.addItem(node.@name, XmlManager.showGallery, [node]);
				else if (node.@type == "link")
					menu.addLink(node.@name, node, node.@window);
				else if (node.@type == "swf")
					menu.addItem(node.@name, XmlManager.showSWF, [node.@link, int(node.@width), int(node.@height), node.@name]);
		}
	}
}