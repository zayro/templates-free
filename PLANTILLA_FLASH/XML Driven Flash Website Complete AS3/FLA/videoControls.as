package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.text.*;
    import flash.utils.*;

    dynamic public class videoControls extends MovieClip
    {
        public var vid_loaded:MovieClip;
        public var rootVars:MovieClip;
        public var volRectangle:Rectangle;
        public var vc_back:MovieClip;
        public var imageLoader:Loader;
        public var url:URLRequest;
        public var vid_glow:MovieClip;
        public var BMP:Bitmap;
        public var vid_scrub:MovieClip;
        public var volumeLevel:Number;
        public var vc_play:MovieClip;
        public var volume_GLOW:MovieClip;
        public var vidBorder:MovieClip;
        public var dash:TextField;
        public var rectangle:Rectangle;
        public var volume_SCRUB:MovieClip;
        public var bmpURL:String;
        public var vid_fullScreen:MovieClip;
        public var current_time:TextField;
        public var volume_BASE:MovieClip;
        public var total_time:TextField;
        public var loadTimer:Timer;

        public function videoControls()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function startVolumeMove(param1:MouseEvent) : void
        {
            volume_SCRUB.startDrag(false, volRectangle);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, volumeSliderMoving);
            stage.addEventListener(MouseEvent.MOUSE_UP, volumeStopMove);
            return;
        }// end function

        public function addImage(param1) : void
        {
            url = new URLRequest(param1);
            imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded, false, 0, true);
            imageLoader.load(url);
            return;
        }// end function

        public function stopMove(param1:MouseEvent) : void
        {
            var _loc_2:Number;
            stage.removeEventListener(Event.ENTER_FRAME, updateRectangle);
            _loc_2 = Math.floor(rootVars.duration * ((vid_scrub.x - 100) / 240));
            rootVars.netSTREAM.seek(_loc_2);
            rootVars.netSTREAM.resume();
            rootVars.stage.addEventListener(Event.ENTER_FRAME, rootVars.enterFrame);
            vid_scrub.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP, stopMove);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, sliderMoving);
            return;
        }// end function

        public function volumeStopMove(param1:MouseEvent) : void
        {
            volume_SCRUB.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, volumeSliderMoving);
            stage.removeEventListener(MouseEvent.MOUSE_UP, volumeStopMove);
            return;
        }// end function

        public function seekToClick(param1:MouseEvent) : void
        {
            var _loc_2:Number;
            if (rootVars.enableScrub)
            {
                rootVars.stage.removeEventListener(Event.ENTER_FRAME, rootVars.enterFrame);
                _loc_2 = Math.floor(rootVars.duration * ((mouseX - 100) / 240));
                rootVars.netSTREAM.seek(_loc_2);
                rootVars.netSTREAM.resume();
                rootVars.stage.addEventListener(Event.ENTER_FRAME, rootVars.enterFrame);
            }// end if
            return;
        }// end function

        public function backOutHandler(param1:Event) : void
        {
            param1.target.gotoAndStop(1);
            return;
        }// end function

        public function imageLoaded(param1:Event) : void
        {
            BMP = new Bitmap();
            imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageLoaded);
            BMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(BMP);
            setChildIndex(BMP, 0);
            return;
        }// end function

        public function startMove(param1:MouseEvent) : void
        {
            if (rootVars.enableScrub)
            {
                stage.addEventListener(Event.ENTER_FRAME, updateRectangle);
                rootVars.stage.removeEventListener(Event.ENTER_FRAME, rootVars.enterFrame);
                updateRectangle(null);
                vid_scrub.startDrag(false, rectangle);
                stage.addEventListener(MouseEvent.MOUSE_MOVE, sliderMoving);
                stage.addEventListener(MouseEvent.MOUSE_UP, stopMove);
            }// end if
            return;
        }// end function

        function frame1()
        {
            imageLoader = new Loader();
            bmpURL = "./site_images/vidBase.jpg";
            addImage(bmpURL);
            loadTimer = new Timer(2000, 1);
            loadTimer.addEventListener(TimerEvent.TIMER, getParent);
            loadTimer.start();
            volRectangle = new Rectangle(375, 14, 70, 0.1);
            rectangle = new Rectangle(100, 14, vid_loaded.width - 10, 0.1);
            return;
        }// end function

        public function getParent(param1:TimerEvent) : void
        {
            rootVars = MovieClip(parent);
            kickItOff(null);
            return;
        }// end function

        public function updateRectangle(param1:Event) : void
        {
            rectangle.width = vid_loaded.width - 10;
            return;
        }// end function

        public function backOverHandler(param1:Event) : void
        {
            param1.target.gotoAndStop(2);
            return;
        }// end function

        public function enableFullScreenBtn() : void
        {
            vid_fullScreen.buttonMode = true;
            vid_fullScreen.mouseChildren = false;
            vid_fullScreen.addEventListener(MouseEvent.CLICK, rootVars.switchFull);
            return;
        }// end function

        public function disableFullScreenBtn() : void
        {
            vid_fullScreen.buttonMode = false;
            vid_fullScreen.mouseChildren = true;
            vid_fullScreen.removeEventListener(MouseEvent.CLICK, rootVars.switchFull);
            return;
        }// end function

        public function sliderMoving(param1:MouseEvent)
        {
            vid_glow.width = vid_scrub.x - 100;
            return;
        }// end function

        public function kickItOff(param1:TimerEvent) : void
        {
            var _loc_2:Boolean;
            volume_SCRUB.buttonMode = true;
            var _loc_2:* = _loc_2;
            vid_scrub.buttonMode = _loc_2;
            var _loc_2:* = _loc_2;
            vc_play.buttonMode = _loc_2;
            var _loc_2:* = _loc_2;
            vc_back.buttonMode = _loc_2;
            vid_loaded.buttonMode = _loc_2;
            vc_play.addEventListener(MouseEvent.CLICK, rootVars.playVid);
            vc_back.addEventListener(MouseEvent.CLICK, rootVars.startVideoOver);
            vid_scrub.addEventListener(MouseEvent.MOUSE_DOWN, startMove);
            vid_loaded.addEventListener(MouseEvent.CLICK, seekToClick);
            volume_SCRUB.x = 396;
            volume_GLOW.width = 21;
            volume_GLOW.mouseChildren = true;
            volume_SCRUB.addEventListener(MouseEvent.MOUSE_DOWN, startVolumeMove);
            enableFullScreenBtn();
            var _loc_2:Boolean;
            dash.selectable = false;
            var _loc_2:* = _loc_2;
            total_time.selectable = _loc_2;
            current_time.selectable = _loc_2;
            return;
        }// end function

        public function volumeSliderMoving(param1:MouseEvent)
        {
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:Number;
            volume_GLOW.width = volume_SCRUB.x - 375;
            _loc_2 = Math.floor(375);
            _loc_3 = volume_SCRUB.x - _loc_2;
            _loc_4 = _loc_3 / 70;
            volumeLevel = _loc_4;
            if (this.parent != null)
            {
                rootVars.VolumeLevel = volumeLevel;
                rootVars.netSTREAM.soundTransform = new SoundTransform(rootVars.VolumeLevel);
            }// end if
            return;
        }// end function

    }
}
