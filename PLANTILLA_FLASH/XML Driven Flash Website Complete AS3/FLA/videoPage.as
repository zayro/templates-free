package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.ui.*;
    import flash.utils.*;

    dynamic public class videoPage extends MovieClip
    {
        public var createThumbOnFirstLoad:Boolean;
        public var meta:Object;
        public var tMsk_W:Number;
        public var tMsk_Y:Number;
        public var vidContTweenX:Tween;
        public var xml:XML;
        public var vidContTweenY:Tween;
        public var tMsk_H:Number;
        public var tMsk_X:Number;
        public var rootVars:MovieClip;
        public var thumbTWEEN:Tween;
        public var netCONN:NetConnection;
        public var thumbContentSprite:Sprite;
        public var playPauseTween:Tween;
        public var VolumeLevel:Number;
        public var videoLoader:Loader;
        public var vidHold:movieHolder;
        public var enableScrub:Boolean;
        public var video:Video;
        public var vtrans1:videoTRAN1;
        public var vtrans2:videoTRAN2;
        public var trans2:TRAN2;
        public var trans1:TRAN1;
        public var i:uint;
        public var tcs_H:Number;
        public var videoTween:Tween;
        public var firstClick:Boolean;
        public var tcs_X:Number;
        public var tcs_Y:Number;
        public var tcs_W:Number;
        public var vidFullScreen:Boolean;
        public var VPS:videoPanelScroll;
        public var vidALBUM:XMLList;
        public var PageTitle:XMLList;
        public var closeVid:closeVideo;
        public var videoUrl:String;
        public var nuGroup:Boolean;
        public var restoreVolumeLevel:Number;
        public var thumbTimer:Timer;
        public var nuGroupTransitionInPrgress:Boolean;
        public var thumbMask_border:vidmaskBorder;
        public var mouseStartingY:Number;
        public var videoPlaying:Boolean;
        public var tr1H:Tween;
        public var tr1W:Tween;
        public var tr1X:Tween;
        public var videoclipIndex:Number;
        public var tr2H:Tween;
        public var tr1Y:Tween;
        public var netSTREAM:NetStream;
        public var thumbx:Number;
        public var thumby:Number;
        public var tr2X:Tween;
        public var tr2Y:Tween;
        public var imageContainer:Sprite;
        public var tr2W:Tween;
        public var partTwo:Timer;
        public var bgCircle:vidCircle;
        public var memberTransitionInProgress:Boolean;
        public var bmp:Bitmap;
        public var duration:Number;
        public var transitionInProgress:Boolean;
        public var albumIndex:Number;
        public var thumbUrl:String;
        public var thumbMask:Sprite;
        public var vidControls:videoControls;
        public var pageFirstLoad:Boolean;
        public var vidContTweenA:Tween;

        public function videoPage()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function createMask() : void
        {
            thumbMask.graphics.clear();
            thumbMask.graphics.beginFill(0, 1);
            thumbMask.graphics.drawRect(tMsk_X, tMsk_Y, tMsk_W, tMsk_H);
            thumbMask.graphics.endFill();
            createThumbnail();
            return;
        }// end function

        public function whenToShow(param1:Event) : void
        {
            var _loc_2:Rectangle;
            _loc_2 = vidControls.vidBorder.getBounds(this);
            if (mouseX < _loc_2.left || mouseX > _loc_2.right || mouseY < _loc_2.top || mouseY > _loc_2.bottom)
            {
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToShow);
                closeVid.buttonMode = true;
                closeVid.mouseChildren = false;
                closeVid.alpha = 1;
                closeVid.addEventListener(MouseEvent.CLICK, vidNormal);
                stage.addEventListener(MouseEvent.MOUSE_MOVE, followMouse, false, 0, true);
                Mouse.hide();
                stage.addEventListener(MouseEvent.MOUSE_MOVE, whenToHide);
            }// end if
            return;
        }// end function

        public function whenToHide(param1:Event) : void
        {
            var _loc_2:Rectangle;
            _loc_2 = vidControls.vidBorder.getBounds(this);
            if (mouseX > _loc_2.left && mouseX < _loc_2.right && mouseY > _loc_2.top && mouseY < _loc_2.bottom)
            {
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, followMouse);
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToHide);
                closeVid.buttonMode = false;
                closeVid.mouseChildren = true;
                closeVid.alpha = 0;
                closeVid.removeEventListener(MouseEvent.CLICK, vidNormal);
                Mouse.show();
                stage.addEventListener(MouseEvent.MOUSE_MOVE, whenToShow);
            }// end if
            return;
        }// end function

        public function playVid(param1:Event) : void
        {
            if (videoPlaying == true)
            {
                stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
                netSTREAM.togglePause();
                enableScrub = false;
                videoPlaying = false;
                if (this.parent != null)
                {
                    rootVars.restoreAudio(restoreVolumeLevel);
                }// end if
                vidHold.play_btn.playBMP.visible = true;
                vidHold.play_btn.pauseBMP.visible = false;
                vidControls.vc_play.playBMP.visible = true;
                vidControls.vc_play.pauseBMP.visible = false;
                if (vidFullScreen == true)
                {
                }
                else
                {
                    vidControls.disableFullScreenBtn();
                    videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.6, 0.5, true);
                }// end else if
                return;
            }
            else
            {
                enableScrub = true;
                if (this.parent != null)
                {
                    rootVars = MovieClip(parent.parent);
                    restoreVolumeLevel = rootVars.playa.volumeLevel;
                    rootVars.muteAudio();
                }// end if
                netSTREAM.soundTransform = new SoundTransform(VolumeLevel);
                if (vidFullScreen == false)
                {
                    videoTween = new Tween(video, "alpha", Regular.easeOut, 0.6, 1, 0.5, true);
                }// end if
                if (firstClick)
                {
                    netSTREAM.play(videoUrl);
                    firstClick = false;
                    if (pageFirstLoad != true)
                    {
                        vidControls.enableFullScreenBtn();
                    }// end if
                    pageFirstLoad = false;
                }
                else
                {
                    netSTREAM.togglePause();
                    vidControls.enableFullScreenBtn();
                }// end else if
                stage.addEventListener(Event.ENTER_FRAME, enterFrame);
                videoPlaying = true;
                vidHold.play_btn.playBMP.visible = false;
                vidHold.play_btn.pauseBMP.visible = true;
                vidControls.vc_play.playBMP.visible = false;
                vidControls.vc_play.pauseBMP.visible = true;
                if (getChildByName("Controls") != null)
                {
                    vidControls.vc_play.gotoAndStop(3);
                }// end if
            }// end else if
            return;
        }// end function

        public function nuGroupVideo1()
        {
            if (videoPlaying == false)
            {
                videoTween = new Tween(video, "alpha", Regular.easeOut, 0.6, 1, 0.5, true);
            }// end if
            vidControls.enableFullScreenBtn();
            enableScrub = true;
            vidHold.play_btn.playBMP.visible = false;
            vidHold.play_btn.pauseBMP.visible = true;
            vidControls.vc_play.playBMP.visible = false;
            vidControls.vc_play.pauseBMP.visible = true;
            vidControls.vc_play.playBMP.visible = false;
            vidControls.vc_play.pauseBMP.visible = true;
            vidControls.enableFullScreenBtn();
            stage.addEventListener(Event.ENTER_FRAME, enterFrame);
            netSTREAM.play(videoUrl);
            return;
        }// end function

        public function vidFull() : void
        {
            var _loc_1:Point;
            var _loc_2:Object;
            var _loc_3:Object;
            vidFullScreen = true;
            vidControls.alpha = 0;
            _loc_1 = new Point(0, 0);
            _loc_2 = video.localToGlobal(_loc_1);
            _loc_3 = vidControls.localToGlobal(_loc_1);
            video.x = video.x - _loc_2.x;
            video.y = video.y - _loc_2.y;
            video.width = stage.stageWidth;
            video.height = stage.stageHeight;
            setChildIndex(video, numChildren--);
            closeVid.alpha = 1;
            setChildIndex(closeVid, numChildren--);
            vidHold.buttonMode = false;
            vidHold.removeEventListener(MouseEvent.CLICK, playVid);
            vidHold.removeEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            vidHold.removeEventListener(MouseEvent.MOUSE_OUT, vidOUT);
            moveAndAlphaControls();
            Mouse.hide();
            closeVid.x = mouseX - 8;
            closeVid.y = mouseY - 2;
            closeVid.addEventListener(MouseEvent.CLICK, vidNormal, false, 0, true);
            stage.addEventListener(Event.RESIZE, resizeHandler, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, followMouse, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, whenToHide, false, 0, true);
            return;
        }// end function

        public function vidNormal(param1:Event) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToHide);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToShow);
            stage.removeEventListener(Event.RESIZE, resizeHandler);
            Mouse.show();
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, followMouse);
            closeVid.removeEventListener(MouseEvent.CLICK, vidNormal);
            closeVid.buttonMode = false;
            closeVid.mouseChildren = false;
            closeVid.alpha = 0;
            vidControls.alpha = 0;
            vidFullScreen = false;
            video.x = 93;
            video.y = 10;
            video.width = 600;
            video.height = 364;
            setChildIndex(video, numChildren - 9);
            vidHold.buttonMode = true;
            vidHold.addEventListener(MouseEvent.CLICK, playVid);
            vidHold.addEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            vidHold.addEventListener(MouseEvent.MOUSE_OUT, vidOUT);
            vidControls.x = 93;
            vidControls.y = 374;
            vidContTweenA = new Tween(vidControls, "alpha", Regular.easeOut, 0, 1, 2, true);
            setChildIndex(vidControls, numChildren - 7);
            return;
        }// end function

        public function createThumb(param1:Event) : void
        {
            var _loc_2:vidTHUMB;
            param1.target.removeEventListener(Event.COMPLETE, createThumb);
            bmp = new Bitmap();
            bmp.bitmapData = Bitmap(param1.target.content).bitmapData;
            bmp.y = thumby;
            _loc_2 = new vidTHUMB();
            bmp.x = thumbx;
            bmp.alpha = 1;
            bmp.cacheAsBitmap = true;
            _loc_2.x = thumbx;
            _loc_2.alpha = 1;
            _loc_2.y = thumby;
            _loc_2.data = i;
            _loc_2.buttonMode = true;
            _loc_2.mouseChildren = true;
            _loc_2.addEventListener(MouseEvent.CLICK, getMember, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OVER, thumbOver, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OUT, thumbOut, false, 0, true);
            VPS.addChild(bmp);
            VPS.addChild(_loc_2);
            thumby = thumby + 86;
            i++;
            videoclipIndex++;
            createThumbnail();
            return;
        }// end function

        public function createthumbContentSprite() : void
        {
            thumbContentSprite.graphics.clear();
            thumbContentSprite.graphics.beginFill(16777215, 0);
            thumbContentSprite.graphics.drawRect(tcs_X, tcs_Y, tcs_W, tcs_H);
            thumbContentSprite.graphics.endFill();
            return;
        }// end function

        public function vidOVER(param1:Event) : void
        {
            param1.target.removeEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            param1.target.play_btn.visible = true;
            playPauseTween = new Tween(param1.target.play_btn, "alpha", Regular.easeOut, 0, 0.9, 0.5, true);
            return;
        }// end function

        function frame1()
        {
            vidHold = new movieHolder();
            vidControls = new videoControls();
            bgCircle = new vidCircle();
            closeVid = new closeVideo();
            closeVid.alpha = 0;
            closeVid.buttonMode = true;
            closeVid.mouseChildren = false;
            VolumeLevel = 0.3;
            albumIndex = 0;
            videoclipIndex = 0;
            video = new Video();
            videoPlaying = false;
            firstClick = true;
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
            netSTREAM.addEventListener(NetStatusEvent.NET_STATUS, getStatus);
            netSTREAM.client = meta;
            video.attachNetStream(netSTREAM);
            pageFirstLoad = true;
            vidFullScreen = false;
            createThumbOnFirstLoad = true;
            transitionInProgress = false;
            nuGroupTransitionInPrgress = false;
            memberTransitionInProgress = false;
            imageContainer = new Sprite();
            trans1 = new TRAN1();
            trans1.alpha = 0;
            trans2 = new TRAN2();
            trans2.alpha = 0;
            vtrans1 = new videoTRAN1();
            vtrans1.alpha = 0;
            vtrans2 = new videoTRAN2();
            vtrans2.alpha = 0;
            nuGroup = false;
            thumbx = 0;
            thumby = 0;
            thumbContentSprite = new Sprite();
            addChild(thumbContentSprite);
            tcs_X = 10;
            tcs_Y = 10;
            tcs_W = 75;
            tcs_H = 410;
            thumbMask = new Sprite();
            addChild(thumbMask);
            tMsk_X = 10;
            tMsk_Y = 10;
            tMsk_W = 75;
            tMsk_H = 410;
            thumbMask_border = new vidmaskBorder();
            thumbMask_border.x = 10;
            thumbMask_border.y = 10;
            thumbMask_border.width = 75;
            thumbMask_border.height = 410;
            addChild(thumbMask_border);
            thumbContentSprite.mask = thumbMask;
            VPS = new videoPanelScroll();
            VPS.x = 10;
            VPS.y = 10;
            thumbContentSprite.addChild(VPS);
            i = 0;
            return;
        }// end function

        public function nuPanel(param1) : void
        {
            var _loc_2:int;
            if (transitionInProgress == true)
            {
                return;
            }// end if
            transitionInProgress = true;
            if (videoPlaying == false)
            {
                if (this.parent != null)
                {
                    rootVars = MovieClip(parent.parent);
                    restoreVolumeLevel = rootVars.playa.volumeLevel;
                    rootVars.muteAudio();
                }// end if
            }// end if
            albumIndex = param1;
            videoclipIndex = 0;
            videoUrl = vidALBUM[albumIndex].clip[videoclipIndex].videoURL.text();
            transition();
            _loc_2 = VPS.numChildren;
            while (_loc_2--)
            {
                // label
                VPS.removeChild(VPS.getChildAt(_loc_2));
            }// end while
            thumbContentSprite.removeEventListener(MouseEvent.MOUSE_OVER, tcsOver);
            thumbContentSprite.removeEventListener(Event.ENTER_FRAME, letsStartMoving);
            thumbContentSprite.removeEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            createThumbnail();
            return;
        }// end function

        public function letsStartMoving(param1:Event) : void
        {
            var _loc_2:*;
            _loc_2 = thumbMask_border.getBounds(this);
            if (mouseY < _loc_2.top || mouseY > _loc_2.bottom || mouseX > _loc_2.right || mouseX < _loc_2.left)
            {
                thumbContentSprite.removeEventListener(Event.ENTER_FRAME, letsStartMoving);
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_OVER, tcsOver);
                thumbContentSprite.removeEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            }// end if
            if (tMsk_H > VPS.height)
            {
            }
            else
            {
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            }// end else if
            return;
        }// end function

        public function thumbClickTransition() : void
        {
            vtrans1.x = 93;
            vtrans1.y = 10;
            vtrans1.width = 0;
            vtrans1.height = 364;
            vtrans2.x = 693;
            vtrans2.y = 10;
            vtrans2.width = 0;
            vtrans2.height = 364;
            vtrans1.alpha = 1;
            vtrans2.alpha = 1;
            tr1W = new Tween(vtrans1, "width", Strong.easeOut, 0, 300, 0.2, true);
            tr2W = new Tween(vtrans2, "width", Strong.easeOut, 0, 300, 0.2, true);
            tr2X = new Tween(vtrans2, "x", Strong.easeOut, 693, 393, 0.2, true);
            tr2X.addEventListener(TweenEvent.MOTION_FINISH, addVideoPreloader);
            partTwo = new Timer(1500, 1);
            partTwo.addEventListener(TimerEvent.TIMER, reverseVideoTransition);
            partTwo.start();
            return;
        }// end function

        public function loadContent() : void
        {
            video.x = 93;
            video.y = 10;
            video.width = 600;
            video.height = 364;
            addChild(video);
            videoUrl = vidALBUM[albumIndex].clip[videoclipIndex].videoURL.text();
            vidHold.x = 93;
            vidHold.y = 10;
            vidHold.buttonMode = true;
            vidHold.mouseChildren = false;
            vidHold.play_btn.visible = false;
            vidControls.x = 93;
            vidControls.y = 374;
            vidControls.name = "Controls";
            addChild(vidHold);
            addChild(vidControls);
            vidHold.addEventListener(MouseEvent.CLICK, playVid);
            vidHold.addEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            vidHold.addEventListener(MouseEvent.MOUSE_OUT, vidOUT);
            getVIDEO();
            addChild(trans1);
            addChild(trans2);
            addChild(vtrans1);
            addChild(vtrans2);
            addChild(closeVid);
            return;
        }// end function

        public function playThumbClicked()
        {
            if (videoPlaying == false)
            {
                vidHold.play_btn.playBMP.visible = false;
                vidHold.play_btn.pauseBMP.visible = true;
                vidControls.vc_play.playBMP.visible = false;
                vidControls.vc_play.pauseBMP.visible = true;
                vidControls.enableFullScreenBtn();
                if (this.parent != null)
                {
                    rootVars = MovieClip(parent.parent);
                    restoreVolumeLevel = rootVars.playa.volumeLevel;
                    rootVars.muteAudio();
                }// end if
            }// end if
            enableScrub = true;
            netSTREAM.close();
            thumbTimer = new Timer(1100, 1);
            thumbTimer.addEventListener(TimerEvent.TIMER, playClickedThumb);
            thumbTimer.start();
            if (video.alpha != 1)
            {
                videoTween = new Tween(video, "alpha", Regular.easeOut, 0.6, 1, 0.5, true);
            }// end if
            videoPlaying = true;
            stage.addEventListener(Event.ENTER_FRAME, enterFrame);
            return;
        }// end function

        public function addPreloader(param1:TweenEvent) : void
        {
            nuGroupVideo1();
            bgCircle.x = 705 / 2;
            bgCircle.y = 430 / 2;
            bgCircle.name = "bgCircle";
            addChild(bgCircle);
            bgCircle.gotoAndPlay(1);
            return;
        }// end function

        public function populateTime() : void
        {
            if (getChildByName("Controls") != null)
            {
                vidControls.current_time.text = current_Time();
                vidControls.total_time.text = total_Time();
            }// end if
            return;
        }// end function

        public function getVIDEO() : void
        {
            videoUrl = vidALBUM[albumIndex].clip[videoclipIndex].videoURL.text();
            playVid(null);
            if (createThumbOnFirstLoad)
            {
                createthumbContentSprite();
                createMask();
                createThumbOnFirstLoad = false;
            }// end if
            memberTransitionInProgress = false;
            return;
        }// end function

        public function getStatus(param1:Object) : void
        {
            if (param1.info.code == "NetStream.Play.Stop")
            {
                stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
                firstClick = true;
                videoPlaying = false;
                videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.6, 0.5, true);
                vidHold.play_btn.playBMP.visible = true;
                vidHold.play_btn.pauseBMP.visible = false;
                vidControls.vc_play.playBMP.visible = true;
                vidControls.vc_play.pauseBMP.visible = false;
                vidControls.disableFullScreenBtn();
                if (this.parent != null)
                {
                    rootVars.restoreAudio(restoreVolumeLevel);
                }// end if
                enableScrub = false;
                if (vidFullScreen)
                {
                    vidNormal(null);
                }// end if
            }// end if
            return;
        }// end function

        public function reverseVideoTransition(param1:TimerEvent) : void
        {
            partTwo.removeEventListener(TimerEvent.TIMER, reverseVideoTransition);
            removeChild(getChildByName("bgCircle"));
            bgCircle.gotoAndStop(0);
            tr1W = new Tween(vtrans1, "width", Strong.easeOut, 300, 0, 1, true);
            tr2W = new Tween(vtrans2, "width", Strong.easeOut, 300, 0, 1, true);
            tr2X = new Tween(vtrans2, "x", Strong.easeOut, 393, 693, 1, true);
            tr2X.addEventListener(TweenEvent.MOTION_FINISH, alphaOutTransitionClips);
            return;
        }// end function

        public function menuItemOver(param1:Event) : void
        {
            param1.target.menuLabel.text = "";
            param1.target.menuLabel2.text = vidALBUM.name.text()[param1.target.data];
            return;
        }// end function

        public function total_Time() : String
        {
            var _loc_1:String;
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:*;
            var _loc_5:String;
            _loc_2 = duration;
            _loc_3 = Math.floor(_loc_2 / 60);
            _loc_4 = Math.floor(_loc_2 % 60);
            if (_loc_4 < 10)
            {
                _loc_4 = "0" + _loc_4;
            }// end if
            if (_loc_3 < 10)
            {
                _loc_3 = _loc_3;
                _loc_1 = "0" + _loc_3;
            }// end if
            _loc_5 = _loc_1 + ":" + _loc_4;
            return _loc_5;
        }// end function

        public function menuItemOut(param1:Event) : void
        {
            param1.target.menuLabel2.text = "";
            param1.target.menuLabel.text = vidALBUM.name.text()[param1.target.data];
            return;
        }// end function

        public function tcsOver(param1:MouseEvent) : void
        {
            thumbContentSprite.addEventListener(Event.ENTER_FRAME, letsStartMoving);
            mouseStartingY = mouseY;
            return;
        }// end function

        public function addVideoPreloader(param1:TweenEvent) : void
        {
            bgCircle.x = 393;
            bgCircle.y = 187;
            bgCircle.name = "bgCircle";
            addChild(bgCircle);
            bgCircle.gotoAndPlay(1);
            playThumbClicked();
            return;
        }// end function

        public function playClickedThumb(param1:TimerEvent) : void
        {
            netSTREAM.play(videoUrl);
            return;
        }// end function

        public function createThumbnail() : void
        {
            var _loc_1:Number;
            var _loc_2:String;
            var _loc_3:URLRequest;
            var _loc_4:Loader;
            thumbContentSprite.y = 0;
            _loc_1 = vidALBUM[albumIndex].clip.length();
            if (i < _loc_1)
            {
                _loc_2 = vidALBUM[albumIndex].clip[videoclipIndex].thumbURL.text();
                _loc_3 = new URLRequest(_loc_2);
                _loc_4 = new Loader();
                _loc_4.contentLoaderInfo.addEventListener(Event.COMPLETE, createThumb);
                _loc_4.load(_loc_3);
            }
            else
            {
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_OVER, tcsOver);
                i = 0;
                thumby = 0;
            }// end else if
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            PageTitle = xml.title;
            vidALBUM = xml.videoAlbum;
            loadContent();
            return;
        }// end function

        public function transition() : void
        {
            trans1.x = -1;
            trans1.y = 0;
            trans1.alpha = 1;
            trans2.x = 706;
            trans2.y = 0;
            trans2.alpha = 1;
            tr1W = new Tween(trans1, "width", Strong.easeOut, 1, 357, 0.2, true);
            tr2W = new Tween(trans2, "width", Strong.easeOut, 1, 356, 0.2, true);
            tr2Y = new Tween(trans2, "x", Strong.easeOut, 706, 356, 0.2, true);
            tr2Y.addEventListener(TweenEvent.MOTION_FINISH, addPreloader);
            partTwo = new Timer(1500, 1);
            partTwo.addEventListener(TimerEvent.TIMER, reverseTransition);
            partTwo.start();
            return;
        }// end function

        public function followMouse(param1:Event) : void
        {
            closeVid.x = mouseX - 8;
            closeVid.y = mouseY - 2;
            return;
        }// end function

        public function enterFrame(param1:Event) : void
        {
            populateTime();
            total_Time();
            updateScrubber();
            return;
        }// end function

        public function vidOUT(param1:Event) : void
        {
            param1.target.addEventListener(MouseEvent.MOUSE_OVER, vidOVER);
            playPauseTween = new Tween(param1.target.play_btn, "alpha", Regular.easeOut, 0.9, 0, 0.5, true);
            return;
        }// end function

        public function moveAndAlphaControls() : void
        {
            var _loc_1:Point;
            var _loc_2:Object;
            _loc_1 = new Point(0, 0);
            _loc_2 = vidControls.localToGlobal(_loc_1);
            vidControls.x = vidControls.x - _loc_2.x + stage.stageWidth / 2 - 600 / 2;
            vidControls.y = vidControls.y - _loc_2.y + stage.stageHeight - 45;
            vidContTweenA = new Tween(vidControls, "alpha", Regular.easeOut, 0, 0.6, 2, true);
            setChildIndex(vidControls, numChildren--);
            return;
        }// end function

        public function getMember(param1:Event) : void
        {
            if (memberTransitionInProgress)
            {
                return;
            }// end if
            memberTransitionInProgress = true;
            videoclipIndex = param1.target.data;
            videoUrl = vidALBUM[albumIndex].clip[videoclipIndex].videoURL.text();
            thumbClickTransition();
            return;
        }// end function

        public function alphaOutTransitionClips(param1:TweenEvent) : void
        {
            trans1.alpha = 0;
            trans2.alpha = 0;
            trans1.x = -1;
            trans1.y = 0;
            trans1.height = 430;
            trans1.width = 1;
            trans2.x = 706;
            trans2.y = 0;
            trans2.height = 430;
            trans2.width = 1;
            transitionInProgress = false;
            memberTransitionInProgress = false;
            return;
        }// end function

        public function thumbOut(param1:Event) : void
        {
            thumbTWEEN = new Tween(param1.target, "alpha", Strong.easeOut, 0, 1, 1, true);
            return;
        }// end function

        public function startVideoOver(param1:Event) : void
        {
            if (videoPlaying == true)
            {
                netSTREAM.seek(0);
            }// end if
            return;
        }// end function

        public function tcsMOVE(param1:Event) : void
        {
            var _loc_2:Tween;
            var _loc_3:Tween;
            var _loc_4:Tween;
            var _loc_5:Tween;
            if (mouseY > mouseStartingY)
            {
                if (thumbContentSprite.y > tMsk_H - VPS.height)
                {
                    _loc_2 = new Tween(thumbContentSprite, "y", Regular.easeOut, thumbContentSprite.y, thumbContentSprite.y - 60, 1, true);
                }// end if
            }// end if
            if (mouseY < mouseStartingY)
            {
                if (thumbContentSprite.y < 0)
                {
                    _loc_3 = new Tween(thumbContentSprite, "y", Regular.easeOut, thumbContentSprite.y, thumbContentSprite.y + 60, 1, true);
                }// end if
            }// end if
            if (mouseY > tcs_Y + 340)
            {
                _loc_4 = new Tween(thumbContentSprite, "y", Regular.easeOut, thumbContentSprite.y, tMsk_H - VPS.height, 1, true);
            }// end if
            if (mouseY < tcs_Y + 80)
            {
                _loc_5 = new Tween(thumbContentSprite, "y", Regular.easeOut, thumbContentSprite.y, 0, 1, true);
            }// end if
            mouseStartingY = mouseY;
            return;
        }// end function

        public function thumbOver(param1:Event) : void
        {
            thumbTWEEN = new Tween(param1.target, "alpha", Strong.easeOut, 1, 0, 1, true);
            return;
        }// end function

        public function reverseTransition(param1:TimerEvent) : void
        {
            partTwo.removeEventListener(TimerEvent.TIMER, reverseTransition);
            removeChild(getChildByName("bgCircle"));
            bgCircle.gotoAndStop(0);
            tr1H = new Tween(trans1, "width", Strong.easeOut, 357, 0, 0.2, true);
            tr2H = new Tween(trans2, "width", Strong.easeOut, 356, 0, 0.2, true);
            tr2X = new Tween(trans2, "x", Strong.easeOut, 356, 706, 0.2, true);
            tr2H.addEventListener(TweenEvent.MOTION_FINISH, alphaOutTransitionClips);
            return;
        }// end function

        public function kickitoff(param1) : void
        {
            var _loc_2:*;
            _loc_2 = new URLLoader();
            _loc_2.load(new URLRequest(param1));
            _loc_2.addEventListener(Event.COMPLETE, xmlFinishedLoading);
            return;
        }// end function

        public function switchFull(param1:MouseEvent) : void
        {
            if (vidFullScreen)
            {
                vidNormal(null);
            }
            else
            {
                vidFull();
            }// end else if
            return;
        }// end function

        public function updateScrubber() : void
        {
            vidControls.vid_loaded.width = netSTREAM.bytesLoaded / netSTREAM.bytesTotal * 250;
            vidControls.vid_glow.width = netSTREAM.time / duration * 250;
            if (100 + netSTREAM.time / duration * 240 > 100)
            {
                vidControls.vid_scrub.x = 100 + netSTREAM.time / duration * 240;
            }// end if
            return;
        }// end function

        public function current_Time() : String
        {
            var _loc_1:String;
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:*;
            var _loc_5:String;
            _loc_2 = netSTREAM.time;
            _loc_3 = Math.floor(_loc_2 / 60);
            _loc_4 = Math.floor(_loc_2 % 60);
            if (_loc_4 < 10)
            {
                _loc_4 = "0" + _loc_4;
            }// end if
            if (_loc_3 < 10)
            {
                _loc_3 = _loc_3;
                _loc_1 = "0" + _loc_3;
            }// end if
            _loc_5 = _loc_1 + ":" + _loc_4;
            return _loc_5;
        }// end function

        public function resizeHandler(param1:Event) : void
        {
            var _loc_2:Point;
            var _loc_3:Object;
            var _loc_4:Object;
            _loc_2 = new Point(0, 0);
            _loc_3 = video.localToGlobal(_loc_2);
            _loc_4 = vidControls.localToGlobal(_loc_2);
            video.x = video.x - _loc_3.x;
            video.y = video.y - _loc_3.y;
            video.width = stage.stageWidth;
            video.height = stage.stageHeight;
            vidControls.x = vidControls.x - _loc_4.x + stage.stageWidth / 2 - 600 / 2;
            vidControls.y = vidControls.y - _loc_4.y + stage.stageHeight - 45;
            return;
        }// end function

    }
}
