package com.massiveProCreation.ball.sections
{
	/*/  IMPORTS /*/
	import com.massiveProCreation.events.CustomEvent;
	import com.massiveProCreation.ball.utils.ImageResize;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextFieldAutoSize;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;

	import flash.text.TextFormat;
	
	import caurina.transitions.*;

	import flash.events.*;
	
	public class Contact extends Sprite
	{
		// loader for the contact section
		private var _loader:Loader = new Loader();
		// this is the holder
		private var _holder:Sprite;
		// image resizer
		private var _imageResizer:ImageResize = new ImageResize();
		// logo height property
		private var _logoHeight:Number = 0;
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
		
		
		/*/ INPUT TEXT LABELS /*/
		private var _name:String;
		private var _email:String;
		private var _message:String;
		private var _send:String;
		private var _error:String;
		private var _sent:String;
		
		public function Contact()
		{
			
		}
		
		public function construct (title:String, text:String, imageURL:String, name:String = "name", email:String = "email", message:String = "message", send:String = "send", error:String = "Please fill this field", sent:String = "Your message was send.", logoHeight:Number = 0, bgcolor:uint = 0x000000, fontcolor:uint = 0xFFFFFF, opacity:Number = 0.38):void {
			// assign properties from the constractor to properties of the class
			_logoHeight = logoHeight;
			_send = send;
			_name = name;
			_email = email;
			_message = message;
			_error = error;
			_sent = sent;
		
			_bgcolor = bgcolor;
			_fontcolor = fontcolor;		
			// set the colors of the contact section: font color and background color
			if(opacity == 0)
				_opacity = 0.38;
			else
				_opacity = opacity;			

			_ct.color = _bgcolor;
			_tf.color = _fontcolor;
			bg.alpha = _opacity;
			bg.getChildAt(0).transform.colorTransform = _ct;
			stripes.getChildAt(0).transform.colorTransform = _ct;
			
			sectionContent.content.contactForm.bg1.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.content.contactForm.bg2.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.content.contactForm.bg3.getChildAt(0).transform.colorTransform = _ct;
			sectionContent.content.contactForm.send.bg.getChildAt(0).transform.colorTransform = _ct;
			
			sectionContent.content.contactForm.firstname.text = _name;
			sectionContent.content.contactForm.email.text = _email;
			sectionContent.content.contactForm.message.text = _message;
			sectionContent.content.contactForm.send.sendText.text = _send;
			sectionContent.content.contactForm.send.sendText.autoSize = TextFieldAutoSize.LEFT;
			sectionContent.content.contactForm.send.bg.width = sectionContent.content.contactForm.send.sendText.width + 8;
			sectionContent.content.contactForm.send.sendText.x = 4;
			sectionContent.content.contactForm.send.x = 194 - sectionContent.content.contactForm.send.width;
			

			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded, false, 0, true);
			_loader.load(new URLRequest(imageURL));
			
			sectionContent.content.textContent.htmlText = text;
			sectionContent.title.htmlText = title;
			sectionContent.content.contactForm.send.buttonMode = true;
			sectionContent.content.contactForm.send.mouseChildren = false;
			sectionContent.title.setTextFormat(_tf);
			sectionContent.content.textContent.setTextFormat(_tf);
			sectionContent.content.contactForm.firstname.setTextFormat(_tf);
			sectionContent.content.contactForm.email.setTextFormat(_tf);
			sectionContent.content.contactForm.message.setTextFormat(_tf);
			sectionContent.content.contactForm.send.sendText.setTextFormat(_tf);
			
			sectionContent.content.contactForm.firstname.addEventListener(FocusEvent.FOCUS_IN, clearTextField, false, 0, true);
			sectionContent.content.contactForm.email.addEventListener(FocusEvent.FOCUS_IN, clearTextField, false, 0, true);
			sectionContent.content.contactForm.message.addEventListener(FocusEvent.FOCUS_IN, clearTextField, false, 0, true);
			
			sectionContent.content.contactForm.firstname.addEventListener(FocusEvent.FOCUS_OUT, fillTextField, false, 0, true);
			sectionContent.content.contactForm.email.addEventListener(FocusEvent.FOCUS_OUT, fillTextField, false, 0, true);
			sectionContent.content.contactForm.message.addEventListener(FocusEvent.FOCUS_OUT, fillTextField, false, 0, true);
		
			sectionContent.content.contactForm.send.addEventListener(MouseEvent.ROLL_OVER, bOver, false, 0, true);
			sectionContent.content.contactForm.send.addEventListener(MouseEvent.ROLL_OUT, bOut, false, 0, true);
			sectionContent.content.contactForm.send.addEventListener(MouseEvent.CLICK, bClick, false, 0, true);
			//sectionContent.content.textContent.autoSize = TextFieldAutoSize.LEFT;
			this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);

		}
		private function fillTextField(e:FocusEvent):void {
			// here we check if user has inputed anythink into our input field of contact form
			if(e.target.name == "message" && e.target.text == "")
				e.target.text = _message;
			if(e.target.name == "firstname" && e.target.text == "")
				e.target.text = _name;
			if(e.target.name == "email" && e.target.text == "")
				e.target.text = _email;
				
		}
		private function clearTextField(e:FocusEvent):void {
			// this function clears the contact form fields 
			if(e.target.text == _name || e.target.text == _email || String(e.target.text).search(_message) == 0) 
				e.target.text = "";
		}
		
		private function bOver(e:MouseEvent):void {
			// button over effect
			Tweener.addTween(e.target.bg, {alpha:0.4, time:1, transition:"easeOutExpo"});	
		}
		private function bOut(e:MouseEvent):void {
			// button out effect
			Tweener.addTween(e.target.bg, {alpha:0.22, time:1, transition:"easeOutExpo"});
		}
		private function bClick(e:MouseEvent):void {
			// button click handler, which sends the email 
			if(sectionContent.content.contactForm.firstname.text == "name" || sectionContent.content.contactForm.firstname.text == ""){
				sectionContent.content.contactForm.firstname.text = _error;
				return;
			}	
			if(sectionContent.content.contactForm.email.text == "email" || sectionContent.content.contactForm.email.text == ""){
				sectionContent.content.contactForm.email.text = _error;
				return;
			}
			if(String(sectionContent.content.contactForm.message.text).search(_message) == 0  || sectionContent.content.contactForm.message.text == "" || sectionContent.content.contactForm.message.text == _sent){
				sectionContent.content.contactForm.message.text = _error;
				return;
			}	
			
			if( sectionContent.content.contactForm.firstname.text != _error && sectionContent.content.contactForm.email.text != _error 
				&& sectionContent.content.contactForm.message.text != _error) {			
					// when there is no error, we connect to the php file and we snd the required data.			
					trace("jp");											
					var variables:URLVariables = new URLVariables();
					var varSend:URLRequest = new URLRequest("contact_parse.php");
					var varLoader:URLLoader = new URLLoader;
					varSend.method = URLRequestMethod.POST;
					varSend.data = variables;
										
					variables.userName = sectionContent.content.contactForm.firstname.text;
					variables.userEmail = sectionContent.content.contactForm.email.text;
					variables.userMsg = sectionContent.content.contactForm.message.text;
					varLoader.load (varSend);
					// finally we show the message that our email was send
					sectionContent.content.contactForm.message.text = _sent;
			}	
		}
		private function loaded(e:Event):void {
			// background image loaded, add image and resize it to fit the stage
			_holder = new Sprite();
			_holder.addChild(_loader.content);
			Bitmap(_holder.getChildAt(0)).smoothing = true;
			addChildAt(_holder, 0);
			onResize();
			// dispatch event, section is ready to display
			dispatchEvent(new CustomEvent(CustomEvent.READY_TO_DISPLAY, true, false));	
		}
		private function added(e:Event){
			// section is added to stage
			bg.height = stage.stageHeight;
			stripes.height = stage.stageHeight;
			stage.addEventListener(Event.RESIZE, onResize, false, 0, true);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed, false, 0, true);
			
		}
		private function removed(e:Event):void {
			stage.removeEventListener(Event.RESIZE, onResize);
		}
		private function onResize(e:Event = null):void {
			// section resized, resize the sctripes and resize the background image.
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