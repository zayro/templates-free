﻿package com.massiveProCreation.ball.sections{	import flash.display.Sprite;	import flash.display.LoaderInfo;	import flash.display.Loader;	import flash.media.SoundMixer;	import flash.display.StageDisplayState; 			import flash.net.URLRequest;	import com.massiveProCreation.events.CustomEvent;	import flash.events.Event;	public class Swf extends Sprite	{		// swf loaderr		private var _loader:Loader = new Loader();		// swf holder		private var _holder:Sprite = new Sprite();		// swf url		private var _url:String;				public function Swf()		{			super();		}		public function construct(url:String):void {			_url = url ;			//trace(_url);			this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);			this.addEventListener(Event.REMOVED_FROM_STAGE, removed, false, 0, true);		}		private function removed(e:Event):void {			this.removeEventListener(Event.RESIZE, onResize);						/*this.removeChild(_holder);			_holder = null;			_loader.unload();			_loader = null;*/		}		private function added(e:Event):void {			// we assign the events to the loader and then we load the actual swf			_loader = new Loader();			//_loader.unload();			//_loader = null;			//trace(_loader);			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, swfLoaded, false, 0, true);			_loader.load(new URLRequest(_url));			stage.addEventListener(Event.RESIZE, onResize, false, 0, true);		}		private function onResize(e:Event):void {			if(stage.displayState==StageDisplayState.FULL_SCREEN){				_holder.x = (stage.stageWidth - 950) / 2;				_holder.y = (stage.stageHeight - 560) / 2;						} else {				_holder.x = 0;				_holder.y = 0;			}		}		public function swfUnload():void {			_loader.unload();			this.removeChild(_holder);			_holder = null;			_loader = null;			SoundMixer.stopAll();			trace("UNLOAD!!!!!")		}		private function swfLoaded(e:Event):void {			// when swf is loaded we add it to the stage			trace("VIDEO LOADED!!!!!!!!!!!");			//_holder = new Sprite();						//_holder.graphics.beginFill(0xFF0000, 1);			//_holder.graphics.drawRect(0, 0, _loader.content.width, _loader.content.height);			//_holder.graphics.endFill();						//_loader.alpha = 1;			//_loader.visible = true;			_holder.addChild(_loader.content);		//	trace(_loader.content);			this.addChild(_holder);			_holder.getChildAt(0).alpha = 1;			_holder.x = 0;			_holder.y = 0;			//trace(Object(_holder.getChildAt(0)).getChildAt(0));			//var obj:Object = Object(_holder.getChildAt(0)).getChildAt(0);			//trace(obj.getChildAt(0));			//obj.getChildAt(0).killVideo();			//trace("!!!VIDEO!!!");			//trace(this.x);			//trace(this.y);			//trace(this.width);		//	trace(this.height);	//		_holder.alpha = 1;			//this.alpha = 1;		//	this.visible = true;		//	_holder.visible = true;			dispatchEvent(new CustomEvent(CustomEvent.READY_TO_DISPLAY, true, false));			}	}}