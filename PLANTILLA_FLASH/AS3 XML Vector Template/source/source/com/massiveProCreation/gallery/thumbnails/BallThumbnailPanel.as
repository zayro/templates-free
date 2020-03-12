package com.massiveProCreation.gallery.thumbnails {
	/*/ IMPORTS /*/
	import caurina.transitions.*;
	
	
	import com.massiveProCreation.events.CustomEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import flash.events.MouseEvent;

	public class BallThumbnailPanel extends Sprite {
		
		// array that contains information about thumbnails
		private var _thumbnails:Array = new Array();
		// Sprite that contains all the thumbnails
		private var _thumbs:Sprite = new Sprite();
		// MovieClip that contains thumbnail
		private var _thumb:MovieClip;
		// number of shon thumbnails
		private var _numShown:int;
		// sprite which is a mask that masks the _thumbs sprite
		private var _masker:Sprite = new Sprite();
		// space between each thumbnail
		private static var _gap:int = 10;
		// type of thumbnail
		private static var _type:String;
		
		private var thumbScroll:Number = 0;
		
		private var _thumbShown:int = 0;
		// id of displayed thumbnails
		private var _id:int = -1;
		// thumbnail that is actualy off
		private var _off:Object;
		
		public function BallThumbnailPanel (numberShown:int, type:String = "vertical") {
			// create a mask add attributes from constractor to variables
			_numShown = numberShown;
			_type = type;	
			createMask();
			this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);
		}
		private function added(e:Event):void{
			// key listener for the thumbnail pannel.
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown, false, 0 , true);
		}
		private function createMask():void {
			/*/  Create mask /*/
			_masker.graphics.beginFill(0xFF0000, 1);
			_masker.graphics.drawRect(0,0,300,300);
			_masker.graphics.endFill();
		}
		private function thumbOut(e:MouseEvent):void {
			// thumbnail roll out event
			Tweener.addTween(e.target, {alpha:1, time:1, transition:"easeOutExpo"});
		}
		private function thumbOver(e:MouseEvent):void {
			// thumbnail roll over event
			Tweener.addTween(e.target, {alpha:0.6, time:1, transition:"easeOutExpo"});
		}
		private function thumbClick(e:MouseEvent):void {
			// thumbnail click event
			_id = e.target.id;
			// add events to thumbnail that was disabled
			if(_off != null){
				_off.addEventListener(MouseEvent.ROLL_OVER, thumbOver, false, 0, true);
				_off.addEventListener(MouseEvent.ROLL_OUT, thumbOut, false, 0, true);
				_off.addEventListener(MouseEvent.CLICK, thumbClick, false, 0, true);
				_off.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));

			}
			// disable thumbnail that is curently clicked
			e.target.removeEventListener(MouseEvent.ROLL_OVER, thumbOver);
			e.target.removeEventListener(MouseEvent.ROLL_OUT, thumbOut);
			e.target.removeEventListener(MouseEvent.CLICK, thumbClick);

			// assign our clicked thumbnail to off object
			_off = e.target; 
			// dispatch an event that could be listened from outside that thumbnail was clicked
			dispatchEvent(new CustomEvent(CustomEvent.THUMB_CLICKED, true, false));	
		}
		
		private function displayThumbnails():void {
			
			//display thumbnails
			for(var i:int = _thumbs.numChildren; i  < _thumbnails.length; i++){
				// for loop that adds thumbnails
				// create new thumbnail
				_thumb = new MovieClip();
				var bitmap:Bitmap ;
				// get bitmap data from the array
				bitmap = new Bitmap (_thumbnails[i].bitmapData);
				// turn on the smoothing of the thumbnails bitmap
				bitmap.smoothing = true;
				//bitmap.width *= 0.5;
				//bitmap.height *= 0.5;
				// add the bitmap to the thumbnail
				_thumb.addChild(bitmap);
				// add name property to the thumbnail
				_thumb.name = "thumb" + i;
				// set thumb alpha to 0 
				_thumb.alpha = 0;
				// add id property to the thumbnail
				_thumb.id = i;
				// set property: mouseChildren and buttonMode
				_thumb.mouseChildren = false;
				_thumb.buttonMode = true;
				// add listeners to the thumbnail: click, rollOver, rollOut
				_thumb.addEventListener(MouseEvent.ROLL_OVER, thumbOver, false, 0, true);
				_thumb.addEventListener(MouseEvent.ROLL_OUT, thumbOut, false, 0, true);
				_thumb.addEventListener(MouseEvent.CLICK, thumbClick, false, 0, true);
				// set the x and y property of each thumbnail, whether it's vertical or horizontal.
				if(_type == "vertical"){
					if(_thumbs.getChildByName("thumb"+(i-1)) != null)
						_thumb.y = _thumbs.getChildByName("thumb"+(i-1)).y + _thumbs.getChildByName("thumb"+(i-1)).height + _gap;
					
				} else {
					trace("horizontal");
					if(_thumbs.getChildByName("thumb"+(i-1)) != null)
						_thumb.x = _thumbs.getChildByName("thumb"+(i-1)).x + _thumbs.getChildByName("thumb"+(i-1)).width + _gap;

				}
				// add thumbnail to the thumbnails container
				_thumbs.addChild(_thumb);
				
			}
			// adjust mask that covers the thumbnails
			adjustMasker();
			addChild(_thumbs);
			addChild(_masker);
			_thumbs.mask = _masker;
			// tween the thumbnails alpha from 0 to 1 
			Tweener.addTween(_thumb, {alpha:1, time:1, delay:1, transition:"easeOutExpo"});
		}
		private function checkOff():void {
			/*if(_type == "vertical"){
				if(_off.y < 0){
					scrollNext();
					//checkOff();
				} else if (_off.y > _masker.y + _masker.height){
					scrollPreview();
					//checkOff();
				}
				
			}*/
		}
		public function dispatchThumbClick(id:int):void {
			//trace();
			// this function dispaches the thumbnails click, that function is called from out side of this class.
			if(this._thumbs.getChildByName("thumb"+id) != null){
				//trace("DISPATCH = " + id);
				this._thumbs.getChildByName("thumb"+id).dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
				
				_id = MovieClip(this._thumbs.getChildByName("thumb"+id)).id;
				// add events to thumbnail that was disabled
				if(_off != null){
					_off.addEventListener(MouseEvent.ROLL_OVER, thumbOver, false, 0, true);
					_off.addEventListener(MouseEvent.ROLL_OUT, thumbOut, false, 0, true);
					_off.addEventListener(MouseEvent.CLICK, thumbClick, false, 0, true);
					_off.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
	
				}
				// remove events from the currently clicked thumbnail
				
				this._thumbs.getChildByName("thumb"+id).dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
				this._thumbs.getChildByName("thumb"+id).removeEventListener(MouseEvent.ROLL_OVER, thumbOver);
				this._thumbs.getChildByName("thumb"+id).removeEventListener(MouseEvent.ROLL_OUT, thumbOut);
				this._thumbs.getChildByName("thumb"+id).removeEventListener(MouseEvent.CLICK, thumbClick);
	
				
				_off = this._thumbs.getChildByName("thumb"+id); 
				checkOff();
				
			}
		}
		
		/*/ SCROLL THUMBS/*/
		private function keyDown(e:KeyboardEvent):void {
			// listen for key event, if left or right clicked, scroll the thumb panel left or right
			if(e.keyCode == Keyboard.LEFT)
				scrollPreview();
			else if(e.keyCode == Keyboard.RIGHT)
				scrollNext();		
		}
		public function scrollPreview():void {
			//scroll thumbnails to show previous thumbnails
			if(_thumbShown - _numShown >= 0){
				_thumbShown -= _numShown;
				adjustMasker();
				// set the new position of the thumb panel and scroll it to the new destination point
				if(_type == "vertical"){
					thumbScroll += _masker.height;
					Tweener.addTween(_thumbs, {y:thumbScroll, time:1, transition:"easeOutExpo", onComplete:adjustMasker});
				} else {
					thumbScroll += _masker.width;
					Tweener.addTween(_thumbs, {x:thumbScroll , time:1, transition:"easeOutExpo", onComplete:adjustMasker});
				}
			}
			
		}
		public function scrollNext():void {
			//scroll thumbnails to show next thumbnails
			if(_thumbShown + _numShown <= _thumbnails.length){
				// set the new position of the thumb panel and scroll it to the new destination point
				if(_type == "vertical"){
					thumbScroll -= _masker.height;
					Tweener.addTween(_thumbs, {y:thumbScroll, time:1, transition:"easeOutExpo"});
				}  else {
					thumbScroll -= _masker.width;
					Tweener.addTween(_thumbs, {x:thumbScroll, time:1, transition:"easeOutExpo"});
				}
				
				_thumbShown += _numShown;
				adjustMasker();
				 ///adjustMasker();  
			}
		}
		
		private function adjustMasker():void {
			// this function adjust size of out mask
			var maskerSize:int = 0;
			for(var j:int = _thumbShown; j < (_thumbShown + _numShown); j++){
				if(_type == "vertical"){
					if(_thumbs.getChildByName("thumb"+j) != null)
						maskerSize += _thumbs.getChildByName("thumb"+j).height + _gap;
				} else {
					if(_thumbs.getChildByName("thumb"+j) != null)
						maskerSize += _thumbs.getChildByName("thumb"+j).width + _gap;
					
				}	
			}
			
			if(_type == "vertical")
				_masker.height = maskerSize;
			else
				_masker.width = maskerSize;
			
			//trace(_masker.width);
		}
		/*/ GET/*/
		
		public function get curentId():int {
			// return current thumbnail id
			return _id;
		}
		
		public function get size():Number{
			// return size of the panel 
			if(_type == "vertical"){
				return _masker.height;
			}
				return _masker.width;
		}
		
		/*public function get sizeOther():Number{
			if(_type == "vertical"){
				return _masker.width;
			}
				return _masker.height;
		}*/
		/*/ SETTER /*/
		
		public function set dataProvider(array:Array):void {
			// set data provider for the panel, this function is called each time new thumbnail is loaded
			_thumbnails = array;
			displayThumbnails();
		}
	}
}