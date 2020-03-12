package com.massiveProCreation.ball.sections {
	
	/*/  IMPORTS /*/
	import com.massiveProCreation.events.CustomEvent;
	import com.massiveProCreation.ball.utils.ImageResize;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextFieldAutoSize;

	import flash.geom.ColorTransform;
	import flash.display.MovieClip;
	import flash.text.TextFormat;

	public class Text extends Sprite {
		
		// loader
		private var _loader:Loader = new Loader();
		//holer for the background image
		private var _holder:Sprite;
		// image resize
		private var _imageResizer:ImageResize = new ImageResize();
		//logo height
		private var _logoHeight:Number = 0;
		//background color
		private var _bgcolor:uint;
		// font color
		private var _fontcolor:uint;
		// alpha/opactiy
		private var _opacity:Number;
		// color transform
		private var _ct:ColorTransform = new ColorTransform();
		// text field format
		private var _tf:TextFormat = new TextFormat();
		
		public function Text(){
			
		}
		
		public function construct (title:String, text:String, imageURL:String, logoHeight:Number = 0, bgcolor:uint = 0x000000, fontcolor:uint = 0xFFFFFF, opacity:Number = 0.38):void {
			// setup the class properties
			_bgcolor = bgcolor;
			_fontcolor = fontcolor;		
			
			if(opacity == 0)
				_opacity = 0.38;
			else
				_opacity = opacity;			
			// load the image 
			_logoHeight = logoHeight;
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded, false, 0, true);
			_loader.load(new URLRequest(imageURL));
			// setup all the section colors: font color and background color
			_ct.color = _bgcolor;
			_tf.color = _fontcolor;
			bg.alpha = _opacity;
			bg.getChildAt(0).transform.colorTransform = _ct;
			stripes.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.sb.down.bg.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.sb.up.bg.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.sb.thumb.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.sb.track.getChildAt(0).transform.colorTransform = _ct;
			_ct.color = _fontcolor;
			sectionContent.sb.down.getChildAt(1).transform.colorTransform = _ct;
			sectionContent.sb.up.getChildAt(1).transform.colorTransform = _ct;
			
			
			sectionContent.content.textContent.htmlText = text;
			sectionContent.title.htmlText = title;
			sectionContent.content.textContent.autoSize = TextFieldAutoSize.LEFT;
			sectionContent.title.setTextFormat(_tf);
			sectionContent.content.textContent.setTextFormat(_tf);
			
			sectionContent.sb.thumb.buttonMode = true;
			if(sectionContent.content.height < 375)
				sectionContent.sb.visible = false;
			
			
			this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);

		}
		private function loaded(e:Event):void {
			// when background image is loaded add it to the stage, and dispatch the event that the section is ready to be displayed
			_holder = new Sprite();
			_holder.addChild(_loader.content);
			Bitmap(_holder.getChildAt(0)).smoothing = true;
			addChildAt(_holder, 0);
			onResize();
			
			dispatchEvent(new CustomEvent(CustomEvent.READY_TO_DISPLAY, true, false));	
		}
		private function added(e:Event){
			// when added to stage setup the dimentions of each panel
			bg.height = stage.stageHeight;
			stripes.height = stage.stageHeight;
			stage.addEventListener(Event.RESIZE, onResize, false, 0, true);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed, false, 0, true);
			
		}
		private function removed(e:Event):void {
			stage.removeEventListener(Event.RESIZE, onResize);
		}
		private function onResize(e:Event = null):void {
			// when section is resized, we have to resize the background image and its position
			bg.height = stage.stageHeight;
			stripes.height = stage.stageHeight;
			sectionContent.y = ((stage.stageHeight - 350) / 2) + _logoHeight - 100;
			if(_holder != null){
				_holder = _imageResizer.resize(_holder, stage.stageWidth, stage.stageHeight);
				_holder.x = (stage.stageWidth - _holder.width)/2
				_holder.y = (stage.stageHeight - _holder.height)/2;
				
			}
		}
	}
}