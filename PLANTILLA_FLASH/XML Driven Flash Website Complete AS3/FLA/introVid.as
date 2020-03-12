package 
{
    import caurina.transitions.*;
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import flash.text.*;
    import flash.utils.*;

    dynamic public class introVid extends MovieClip
    {
        public var hc_H:Number;
        public var meta:Object;
        public var hc_W:Number;
        public var xml:XML;
        public var loader:Object;
        public var hc_X:Number;
        public var hc_Y:Number;
        public var rootVars:MovieClip;
        public var homeHold:MovieClip;
        public var netCONN:NetConnection;
        public var playPauseTween:Tween;
        public var hcYtween:Tween;
        public var vidHold:movieHolder;
        public var video:Video;
        public var ps5:Sprite;
        public var req:URLRequest;
        public var goodSheet:StyleSheet;
        public var videoTween:Tween;
        public var firstClick:Boolean;
        public var videoURL:String;
        public var smallPreload:preloader;
        public var alphaOut:Tween;
        public var restoreVolumeLevel:Number;
        public var video1:XMLList;
        public var hcWtween:Tween;
        public var videoPlaying:Boolean;
        public var netSTREAM:NetStream;
        public var audioFade:Timer;
        public var StageWidth:Number;
        public var textHold:MovieClip;
        public var StageHeight:Number;
        public var duration:Number;
        public var hcXtween:Tween;
        public var xmlURL:String;
        public var hcHtween:Tween;
        public var cssLoader:URLLoader;

        public function introVid()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function resizeHandler(param1:Event) : void
        {
            var _loc_2:Number;
            var _loc_3:Number;
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            _loc_2 = (StageWidth - 604) / 2;
            _loc_3 = (StageHeight - 340) / 2;
            ps5.graphics.clear();
            ps5.graphics.beginFill(0, 1);
            ps5.graphics.drawRect(_loc_2, _loc_3, vidHold.width + 10, vidHold.height + 23);
            ps5.graphics.endFill();
            video.x = _loc_2 + 5;
            video.y = _loc_3 + 5;
            vidHold.x = _loc_2;
            vidHold.y = _loc_3;
            textHold.x = _loc_2;
            textHold.y = _loc_3 + 345;
            smallPreload.x = StageWidth / 2;
            smallPreload.y = StageHeight / 2;
            return;
        }// end function

        public function CreateTextField(param1, param2, param3, param4, param5) : void
        {
            var _loc_6:TextField;
            var _loc_7:String;
            textHold.name = "textHold";
            textHold.x = param1;
            textHold.y = param2;
            addChild(textHold);
            _loc_7 = param5;
            _loc_6 = new TextField();
            _loc_6.styleSheet = goodSheet;
            _loc_6.htmlText = _loc_7;
            _loc_6.selectable = false;
            _loc_6.width = param3;
            _loc_6.autoSize = TextFieldAutoSize.LEFT;
            _loc_6.wordWrap = param4;
            _loc_6.x = 6;
            _loc_6.y = 0;
            textHold.addChild(_loc_6);
            return;
        }// end function

        public function getContent(param1:TweenEvent) : void
        {
            hcHtween.removeEventListener(TweenEvent.MOTION_FINISH, getContent);
            kickitoff(xmlURL);
            stage.addEventListener(Event.RESIZE, this.resizeHandler);
            return;
        }// end function

        public function playVid(param1:Event) : void
        {
            if (videoPlaying == true)
            {
                rootVars.restoreAudio(restoreVolumeLevel);
                vidHold.play_btn.playBMP.visible = true;
                vidHold.play_btn.pauseBMP.visible = false;
                videoPlaying = false;
                netSTREAM.togglePause();
                videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                return;
            }// end if
            rootVars = MovieClip(parent);
            restoreVolumeLevel = rootVars.playa.volumeLevel;
            audioFade = new Timer(3000, 1);
            audioFade.addEventListener(TimerEvent.TIMER, muteAudio, false, 0, true);
            audioFade.start();
            videoTween = new Tween(video, "alpha", Regular.easeOut, 0.3, 1, 0.5, true);
            if (firstClick)
            {
                netSTREAM.play(videoURL);
                firstClick = false;
            }
            else
            {
                netSTREAM.togglePause();
            }// end else if
            videoPlaying = true;
            vidHold.play_btn.playBMP.visible = false;
            vidHold.play_btn.pauseBMP.visible = true;
            return;
        }// end function

        function frame1()
        {
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            videoPlaying = false;
            firstClick = true;
            vidHold = new movieHolder();
            textHold = new MovieClip();
            smallPreload = new preloader();
            ps5 = new Sprite();
            loader = new URLLoader();
            req = new URLRequest("site_stylesheets/intro.css");
            goodSheet = new StyleSheet();
            homeHold = new MovieClip();
            homeHold.name = "homeHold";
            addChild(homeHold);
            pageLoadAnimation();
            video = new Video();
            meta = new Object();
            meta.onMetaData = 
function (param1:Object)
{
    duration = param1.duration;
    return;
}// end function
;
            netCONN = new NetConnection();
            netCONN.connect(null);
            netSTREAM = new NetStream(netCONN);
            netSTREAM.addEventListener(NetStatusEvent.NET_STATUS, getStatus, false, 0, true);
            netSTREAM.client = meta;
            netSTREAM.bufferTime = 5;
            stage.addEventListener(Event.ENTER_FRAME, enterFrame);
            video.attachNetStream(netSTREAM);
            return;
        }// end function

        public function vidOVER(param1:Event) : void
        {
            param1.target.removeEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            param1.target.play_btn.visible = true;
            playPauseTween = new Tween(param1.target.play_btn, "alpha", Regular.easeOut, 0, 0.9, 0.5, true);
            return;
        }// end function

        public function loadContent() : void
        {
            var _loc_1:Number;
            var _loc_2:Number;
            _loc_1 = (StageWidth - 604) / 2;
            _loc_2 = (StageHeight - 340) / 2;
            ps5.graphics.clear();
            ps5.graphics.beginFill(0, 1);
            ps5.graphics.drawRect(_loc_1, _loc_2, vidHold.width + 10, vidHold.height + 23);
            ps5.graphics.endFill();
            addChild(ps5);
            video.x = _loc_1 + 5;
            video.y = _loc_2 + 5;
            video.width = 604;
            video.height = 340;
            addChild(video);
            videoURL = video1.vidURL.text();
            vidHold.x = _loc_1;
            vidHold.y = _loc_2;
            vidHold.data = videoURL;
            vidHold.buttonMode = true;
            vidHold.mouseChildren = false;
            vidHold.play_btn.visible = false;
            addChild(vidHold);
            vidHold.addEventListener(MouseEvent.CLICK, playVid, false, 0, true);
            vidHold.addEventListener(MouseEvent.MOUSE_OVER, vidOVER, false, 0, true);
            vidHold.addEventListener(MouseEvent.MOUSE_OUT, vidOUT, false, 0, true);
            CreateTextField(_loc_1, _loc_2 + 345, 600, false, video1.vidDesc.text());
            playVid(null);
            smallPreload.x = StageWidth / 2;
            smallPreload.y = StageHeight / 2;
            Tweener.addTween(smallPreload.innerCircle, {rotation:750 * 360, time:10, transition:"easeOutBack"});
            Tweener.addTween(smallPreload.outerCircle, {rotation:750 * 360, time:10, transition:"easeOutBack"});
            addChild(smallPreload);
            removeChild(getChildByName("homeHold"));
            resizeHandler(null);
            return;
        }// end function

        public function getStatus(param1:Object) : void
        {
            if (param1.info.code == "NetStream.Play.Stop")
            {
                firstClick = true;
                videoPlaying = false;
                videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                netSTREAM.seek(0);
                netSTREAM.togglePause();
                vidHold.play_btn.playBMP.visible = true;
                vidHold.play_btn.pauseBMP.visible = false;
                rootVars.restoreAudio(restoreVolumeLevel);
            }// end if
            return;
        }// end function

        public function pageLoadAnimation() : void
        {
            hc_X = (StageWidth - 604) / 2;
            hc_Y = (StageHeight - 340) / 2;
            hc_W = 604;
            hc_H = 340;
            homeHold.graphics.beginFill(0, 1);
            homeHold.graphics.drawRect(hc_X, hc_Y, hc_W, hc_H);
            homeHold.graphics.endFill();
            hcXtween = new Tween(homeHold, "x", Bounce.easeOut, StageWidth / 2, 0, 1, true);
            hcYtween = new Tween(homeHold, "y", Bounce.easeOut, StageHeight / 2, 0, 1, true);
            hcWtween = new Tween(homeHold, "width", Bounce.easeOut, 0, hc_W, 1, true);
            hcHtween = new Tween(homeHold, "height", Bounce.easeOut, 0, hc_H, 1, true);
            hcHtween.addEventListener(TweenEvent.MOTION_FINISH, getContent, false, 0, true);
            return;
        }// end function

        public function muteAudio(param1:TimerEvent) : void
        {
            rootVars.muteAudio();
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            loader.removeEventListener(Event.COMPLETE, xmlFinishedLoading);
            loader = null;
            xml = new XML(param1.target.data);
            video1 = xml.introVid;
            cssLoader = new URLLoader();
            cssLoader.addEventListener(Event.COMPLETE, cssLoaded, false, 0, true);
            cssLoader.load(req);
            return;
        }// end function

        public function enterFrame(param1:Event) : void
        {
            var _loc_2:String;
            var _loc_3:Number;
            if (netSTREAM.bufferLength >= 5)
            {
                stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
                alphaOut = new Tween(smallPreload, "alpha", Regular.easeOut, 1, 0, 2, true);
            }// end if
            _loc_3 = netSTREAM.bufferLength / 5.1;
            _loc_2 = Math.floor(_loc_3 * 100).toString();
            smallPreload.percent.text = _loc_2;
            return;
        }// end function

        public function vidOUT(param1:Event) : void
        {
            param1.target.addEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            playPauseTween = new Tween(param1.target.play_btn, "alpha", Regular.easeOut, 0.9, 0, 0.5, true);
            return;
        }// end function

        public function kickitoff(param1) : void
        {
            loader.load(new URLRequest(param1));
            loader.addEventListener(Event.COMPLETE, xmlFinishedLoading);
            return;
        }// end function

        public function cssLoaded(param1:Event) : void
        {
            goodSheet.parseCSS(cssLoader.data);
            cssLoader.removeEventListener(Event.COMPLETE, cssLoaded);
            cssLoader = null;
            loadContent();
            return;
        }// end function

    }
}
