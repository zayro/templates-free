package com.massiveProCreation.ball.sections
{
	/*/  IMPORTS /*/
	import flash.display.Sprite;
	import flash.events.Event;
	
	import caurina.transitions.*;
	
	import com.massiveProCreation.events.CustomEvent;
	import com.massiveProCreation.ball.sections.gallery.GalleryMain;
	import com.massiveProCreation.gallery.thumbnails.BallThumbnailPanel;
	import flash.geom.ColorTransform;

	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;

	public class Gallery extends Sprite	{

		// thumbnails panel
		private var thumbnails:BallThumbnailPanel = new BallThumbnailPanel(7 , "vertical");
		// gallery engine
		private var gallery:GalleryMain;
		// url to xml
		private var _xmlURL:String;
		// i variable, which indicates how many images where loaded
		private var i:int = 0;
		
		private var _cfg:Boolean = false;
		// slideShow veriable (true/false)
		private var _slideShow:String;
		// background color
		private var _bgcolor:uint;
		// font color
		private var _fontcolor:uint;
		// opacity/alpha
		private var _opacity:Number;
		// color transform
		private var _ct:ColorTransform = new ColorTransform();
		// text format
		private var _tf:TextFormat = new TextFormat();
		private var _th:String;
		

		public function Gallery()
		{
			super();
		}
		public function construct(xmlURL:String, slideShow:String = "true", bgcolor:uint = 0x000000, fontcolor:uint = 0xFFFFFF, opacity:Number = 0.38, th:String = "thumbnails"):void {
			// assign atributes from the constractor to the class properties
			_bgcolor = bgcolor;
			_fontcolor = fontcolor;		
			_th = th;
			
			if(opacity == 0)
				_opacity = 0.38;
			else
				_opacity = opacity;			

			_ct.color = _bgcolor;
			_tf.color = _fontcolor;
			_slideShow = slideShow;
			_xmlURL = xmlURL;
			this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);
		}
		private function added(e:Event):void {
			//galleryControl.y = stage.stageHeight - 28;
			// setup the position of galllery, thumbanils and thumbpanel
			galleryControl.x = stage.stageWidth  - 28;
			thumbPanel.x = stage.stageWidth;
			thumbPanel.addChild(thumbnails);
			thumbnails.y = ((stage.stageHeight - thumbnails.size) / 2) - 28;
		//	thumbPanel.arrowUp.y = thumbnails.y - 10;
		//	thumbPanel.arrowDown.y = thumbnails.y + thumbnails.size + 10;
			thumbnails.x = 20;
			thumbnails.name = "thumbnails";
			
			// add events to the thumbPanel, and setup control of the thumbPanel
			thumbPanel.thumbName.buttonMode = true;
			thumbPanel.thumbName.mouseChildren = false;
			thumbPanel.thumbName.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			thumbPanel.thumbName.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			thumbPanel.thumbName.addEventListener(MouseEvent.CLICK, thumbNameClick, false, 0, true);
			thumbPanel.thumbName.y = stage.stageHeight - 50;
			thumbPanel.bg.height = stage.stageHeight - 28;
			thumbPanel.thumbName.open = false;
			thumbPanel.arrowDown.buttonMode = true;
			thumbPanel.arrowUp.buttonMode = true;
			thumbPanel.arrowDown.alpha = 0;
			thumbPanel.arrowUp.alpha = 0;
			

			
			
			thumbPanel.arrowDown.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			thumbPanel.arrowDown.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			thumbPanel.arrowUp.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			thumbPanel.arrowUp.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			thumbPanel.arrowUp.addEventListener(MouseEvent.CLICK, arrowUpClick, false, 0, true );
			thumbPanel.arrowDown.addEventListener(MouseEvent.CLICK, arrowDownClick, false, 0, true );


			gallery = new GalleryMain(_xmlURL, 5000);
			//gallery.slideShowStart();
			addChildAt(gallery,0);
			// add events to the gallery
			gallery.addEventListener(CustomEvent.THUMBNAIL_LOADED, updateThumbs);
			gallery.addEventListener(CustomEvent.IMAGE_CHANGE, imageChange);
			gallery.addEventListener(CustomEvent.IMAGE_LOADED, galleryReady);
			
			thumbnails.addEventListener(CustomEvent.THUMB_CLICKED, thumbClicked, false, 0, true);
			 
			stage.addEventListener(Event.RESIZE, onResize, false, 0, true);
			this.addEventListener(Event.REMOVED_FROM_STAGE, remove, false, 0, true);
			// setup the colors of the gallery: font color and background color
			galleryControl.bg.getChildAt(0).transform.colorTransform = _ct;
			thumbPanel.bg.alpha = _opacity;
			thumbPanel.bg.getChildAt(0).transform.colorTransform = _ct;
			
			thumbPanel.thumbName.thumbText.text = _th;
			thumbPanel.thumbName.thumbText.autoSize = TextFieldAutoSize.LEFT;
			thumbPanel.thumbName.thumbText.setTextFormat(_tf);
			thumbPanel.thumbName.bg.getChildAt(0).transform.colorTransform = _ct;
			thumbPanel.thumbName.bg.width = thumbPanel.thumbName.thumbText.width + 20;	
			thumbPanel.thumbName.thumbText.x = 10;
			
			_ct.color = _fontcolor;
			thumbPanel.arrowUp.getChildAt(0).transform.colorTransform = _ct;
			thumbPanel.arrowDown.getChildAt(0).transform.colorTransform = _ct;
		}
		private function galleryReady(e:CustomEvent):void {
			// this function is called when gallery is ready to display
			setupGalleryControl();
			dispatchEvent(new CustomEvent(CustomEvent.READY_TO_DISPLAY, true, false));	
			
		}
		private function imageChange(e:CustomEvent):void {
			// this function is called when image is changed
			if(_cfg)
				thumbnails.dispatchThumbClick(gallery.currentImage);
			_cfg = true;	
			// we have to change the indicator in the control panel and apply the Text Format to it
			galleryControl.galleryText.text = String(gallery.currentImage + 1) + " of " + String(gallery.numberOfImages);
			galleryControl.galleryText.setTextFormat(_tf);
			//if(gallery.slideShowRunning)
			// at the end we reset the slide show
			gallery.resetSlideShow();
		}
		
		private function setupGalleryControl ():void {
			// we setup the control panel for the gallery
			galleryControl.galleryText.text = "0 of " + String(gallery.numberOfImages);
			galleryControl.galleryText.setTextFormat(_tf);
			
			
			galleryControl.bNext.buttonMode = true;
			galleryControl.bBack.buttonMode = true;
			// we chech if the slideShow is a default option, then we add event listeners to the gallery control panel
			if(_slideShow == "true"){
				galleryControl.bPlay.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
				galleryControl.bPlay.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
				galleryControl.bPlay.addEventListener(MouseEvent.CLICK, bPlayClick, false, 0, true);
				galleryControl.bPlay.buttonMode = true;
				galleryControl.bPlay.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
				galleryControl.bPlay.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
				gallery.displayImage(0);
			} else {
				galleryControl.bPause.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
				galleryControl.bPause.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
				galleryControl.bPause.addEventListener(MouseEvent.CLICK, bPauseClick, false, 0, true);
				galleryControl.bPause.buttonMode = true;
				galleryControl.bPause.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
				galleryControl.bPause.dispatchEvent(new MouseEvent(MouseEvent.CLICK));				
			}
			// at the end we add event listeners to the Next and Preview button of the gallery controls
			galleryControl.bNext.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			galleryControl.bNext.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			galleryControl.bBack.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			galleryControl.bBack.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			
			galleryControl.bBack.addEventListener(MouseEvent.CLICK, bBackClick, false, 0, true);
			galleryControl.bNext.addEventListener(MouseEvent.CLICK, bNextClick, false, 0, true);
		}
		private function bPauseClick(e:MouseEvent):void {
			// this function is called when user clicks the pouse button, we remove the 
			// events from the pause button and we add them to the play button, also we pause the slide show 
			gallery.slideShowPause();
			e.target.removeEventListener(MouseEvent.ROLL_OVER, bOver);
			e.target.removeEventListener(MouseEvent.ROLL_OUT, bOut);
			e.target.removeEventListener(MouseEvent.CLICK, bPauseClick);
			e.target.buttonMode = false;
			galleryControl.bPlay.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			galleryControl.bPlay.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			galleryControl.bPlay.addEventListener(MouseEvent.CLICK, bPlayClick, false, 0, true);
			galleryControl.bPlay.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
			galleryControl.bPlay.buttonMode = true;
			

		}
		private function bPlayClick(e:MouseEvent):void {
			// this function is called when user clicks the play button, we remove the 
			// events from the play button and we add them to the pause button also we start the the slideshow
			
			gallery.slideShowStart();
			e.target.removeEventListener(MouseEvent.ROLL_OVER, bOver);
			e.target.removeEventListener(MouseEvent.ROLL_OUT, bOut);
			e.target.removeEventListener(MouseEvent.CLICK, bPauseClick);
			e.target.buttonMode = false;
			galleryControl.bPause.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			galleryControl.bPause.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			galleryControl.bPause.addEventListener(MouseEvent.CLICK, bPauseClick, false, 0, true);
			galleryControl.bPause.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
			galleryControl.bPause.buttonMode = true;
		}
		private function bBackClick(e:MouseEvent):void {
			// we call previews image to be displayed
			gallery.previewImage();
		}
		private function bNextClick(e:MouseEvent):void {
			// we call the next image to be displayed
			gallery.nextImage();
		}
		
		private function thumbClicked(e:CustomEvent):void {
			// when the thumbnail is clicked we call the display image function and we pass the index of the thumbnail
			_cfg = false;
			gallery.displayImage(thumbnails.curentId);
		}
		
		private function arrowUpClick(e:MouseEvent):void {
			thumbnails.scrollPreview(); 
			arrowsY();
		}
		private function arrowDownClick(e:MouseEvent):void {
			thumbnails.scrollNext();
			arrowsY();
		}
		
		private function arrowsY():void {
			// here we setup the position of the arrow in the thumbnails panel
				thumbPanel.arrowUp.y = thumbnails.y - 10;
				thumbPanel.arrowDown.y = thumbnails.y + thumbnails.size + 10;

		}
		
		private function bOver(e:MouseEvent):void {
			// button over effect
			Tweener.addTween(e.target, {alpha:0.6, time:1, transition:"easeOutExpo"});
		}
		private function bOut(e:MouseEvent):void {
			// button out effect
			Tweener.addTween(e.target, {alpha:1, time:1, transition:"easeOutExpo"});
		}	
		private function thumbNameClick(e:MouseEvent):void {
			// this function is called when we click the thumbnails name button, which opens the thumbnails Panel
			if(e.target.open){
				Tweener.addTween(e.target.parent, {x:stage.stageWidth, time:1, transition:"easeOutExpo"});
				e.target.open = false; 
			} else {
				Tweener.addTween(e.target.parent, {x:stage.stageWidth - 100, time:1, transition:"easeOutExpo"});
				e.target.open = true; 				
			}
		}	
		
		private function updateThumbs(e:CustomEvent):void {
			// this function updates the position of the thumbanils panel
			thumbnails.dataProvider = gallery.thumbnails;
			i++
			if(i > 7 ){
				arrowsY();
				Tweener.addTween(thumbPanel.arrowDown, {alpha:1, time:1, transition:"easeOutExpo"});
				Tweener.addTween(thumbPanel.arrowUp, {alpha:1, time:1, transition:"easeOutExpo"});
			}

		}
		private function onResize(e:Event):void {
			// this function is called when the stage is resized, we set the posiotn of all the panels
			galleryControl.y = stage.stageHeight - 28;
			galleryControl.x = stage.stageWidth  - 28;
			thumbPanel.y = 0;
			thumbPanel.bg.height = stage.stageHeight - 28;
			thumbPanel.thumbName.y = stage.stageHeight - 50;
					
			if(thumbPanel.thumbName.open){
				thumbPanel.x = stage.stageWidth - 100;
			}else{
				thumbPanel.x = stage.stageWidth;	
			}
			thumbPanel.getChildByName("thumbnails").y = ((stage.stageHeight - thumbnails.size) / 2) - 28;
			thumbPanel.arrowUp.y = thumbPanel.getChildByName("thumbnails").y - 10;
			thumbPanel.arrowDown.y = thumbPanel.getChildByName("thumbnails").y + thumbnails.size + 10;			
		}
		private function remove(e:Event):void {
			this.removeEventListener(Event.RESIZE, onResize);
		}
	}
}