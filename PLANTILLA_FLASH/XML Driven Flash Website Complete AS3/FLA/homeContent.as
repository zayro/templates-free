package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import flash.text.*;

    dynamic public class homeContent extends MovieClip
    {
        public var meta:Object;
        public var article1:XMLList;
        public var xml:XML;
        public var rootVars:MovieClip;
        public var video1Playing:Boolean;
        public var vid2:XMLList;
        public var netCONN:NetConnection;
        public var vid1:XMLList;
        public var playPauseTween:Tween;
        public var netSTREAM2:NetStream;
        public var vidHold:smallMovieHolder;
        public var video:Video;
        public var i:uint;
        public var req:URLRequest;
        public var firstClick2:Boolean;
        public var goodSheet:StyleSheet;
        public var videoTween:Tween;
        public var firstClick:Boolean;
        public var vidSprite1:Sprite;
        public var vidSprite2:Sprite;
        public var meta2:Object;
        public var event1:XMLList;
        public var video2URL:String;
        public var event3:XMLList;
        public var event4:XMLList;
        public var event2:XMLList;
        public var videoURL:String;
        public var tempX:Number;
        public var tempY:Number;
        public var netCONN2:NetConnection;
        public var video2Playing:Boolean;
        public var restoreVolumeLevel:Number;
        public var duration2:Number;
        public var video2:Video;
        public var videoClicked:String;
        public var calendar:XMLList;
        public var netSTREAM:NetStream;
        public var duration:Number;
        public var footer:XMLList;
        public var vidHold2:smallMovieHolder;
        public var cssLoader:URLLoader;

        public function homeContent()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function CreateTextField(param1, param2, param3, param4, param5) : void
        {
            var _loc_6:TextField;
            var _loc_7:String;
            _loc_7 = param5;
            _loc_6 = new TextField();
            _loc_6.styleSheet = goodSheet;
            _loc_6.htmlText = _loc_7;
            _loc_6.selectable = false;
            _loc_6.width = param3;
            _loc_6.autoSize = TextFieldAutoSize.LEFT;
            _loc_6.wordWrap = param4;
            _loc_6.x = param1;
            _loc_6.y = param2;
            addChild(_loc_6);
            return;
        }// end function

        public function playVid(param1:Event) : void
        {
            param1.target.play_btn.playBMP.alpha = 0.4;
            videoClicked = param1.target.name;
            if (this.parent != null)
            {
                rootVars = MovieClip(parent.parent.parent);
            }// end if
            if (videoClicked == "vid1")
            {
                if (video1Playing == true)
                {
                    if (video2Playing != true)
                    {
                        rootVars.restoreAudio(restoreVolumeLevel);
                    }// end if
                    param1.target.play_btn.playBMP.visible = true;
                    param1.target.play_btn.pauseBMP.visible = false;
                    video1Playing = false;
                    netSTREAM.togglePause();
                    videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                    return;
                }
                else
                {
                    if (video2Playing != true)
                    {
                        restoreVolumeLevel = rootVars.playa.volumeLevel;
                        rootVars.muteAudio();
                    }// end if
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
                    video1Playing = true;
                    param1.target.play_btn.playBMP.visible = false;
                    param1.target.play_btn.pauseBMP.visible = true;
                }// end if
            }// end else if
            if (videoClicked == "vid2")
            {
                if (video2Playing == true)
                {
                    if (video1Playing != true)
                    {
                        rootVars.restoreAudio(restoreVolumeLevel);
                    }// end if
                    param1.target.play_btn.playBMP.visible = true;
                    param1.target.play_btn.pauseBMP.visible = false;
                    video2Playing = false;
                    netSTREAM2.togglePause();
                    videoTween = new Tween(video2, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                    return;
                }
                else
                {
                    if (video1Playing != true)
                    {
                        restoreVolumeLevel = rootVars.playa.volumeLevel;
                        rootVars.muteAudio();
                    }// end if
                    videoTween = new Tween(video2, "alpha", Regular.easeOut, 0.3, 1, 0.5, true);
                    if (firstClick2)
                    {
                        netSTREAM2.play(video2URL);
                        firstClick2 = false;
                    }
                    else
                    {
                        netSTREAM2.togglePause();
                    }// end else if
                    video2Playing = true;
                    param1.target.play_btn.playBMP.visible = false;
                    param1.target.play_btn.pauseBMP.visible = true;
                }// end if
            }// end else if
            return;
        }// end function

        public function getStatus2(param1:Object) : void
        {
            if (param1.info.code == "NetStream.Play.Stop")
            {
                firstClick2 = true;
                video2Playing = false;
                videoTween = new Tween(video2, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                netSTREAM2.seek(0);
                netSTREAM2.togglePause();
                vidHold2.play_btn.playBMP.visible = true;
                vidHold2.play_btn.pauseBMP.visible = false;
                if (video1Playing != true)
                {
                    rootVars.restoreAudio(restoreVolumeLevel);
                }// end if
            }// end if
            return;
        }// end function

        function frame1()
        {
            video1Playing = false;
            video2Playing = false;
            firstClick = true;
            firstClick2 = true;
            vidHold = new smallMovieHolder();
            vidHold2 = new smallMovieHolder();
            vidSprite1 = new Sprite();
            vidSprite2 = new Sprite();
            video = new Video();
            video2 = new Video();
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
            video.attachNetStream(netSTREAM);
            meta2 = new Object();
            meta2.onMetaData = 
function (param1:Object)
{
    duration2 = param1.duration;
    return;
}// end function
;
            netCONN2 = new NetConnection();
            netCONN2.connect(null);
            netSTREAM2 = new NetStream(netCONN2);
            netSTREAM2.addEventListener(NetStatusEvent.NET_STATUS, getStatus2, false, 0, true);
            netSTREAM2.client = meta2;
            video2.attachNetStream(netSTREAM2);
            req = new URLRequest("site_stylesheets/style.css");
            goodSheet = new StyleSheet();
            i = 0;
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
            var _loc_1:Sprite;
            var _loc_2:MovieClip;
            AddImage(24, 24, article1.imageURL.text());
            CreateTextField(24, 329, 650, true, article1.p1.text());
            CreateTextField(24, 473, 300, false, calendar.title.text());
            CreateTextField(28, 530, 175, true, event1.title.text());
            CreateTextField(28, 547, 175, true, event1.dateTime.text());
            CreateTextField(28, 561, 175, true, event1.eventDesc.text());
            CreateTextField(28, 649, 175, true, event2.title.text());
            CreateTextField(28, 666, 175, true, event2.dateTime.text());
            CreateTextField(28, 680, 175, true, event2.eventDesc.text());
            CreateTextField(28, 768, 175, true, event3.title.text());
            CreateTextField(28, 785, 175, true, event3.dateTime.text());
            CreateTextField(28, 799, 175, true, event3.eventDesc.text());
            CreateTextField(28, 887, 175, true, event4.title.text());
            CreateTextField(28, 904, 175, true, event4.dateTime.text());
            CreateTextField(28, 918, 175, true, event4.eventDesc.text());
            vidSprite1.graphics.clear();
            vidSprite1.graphics.beginFill(592137, 1);
            vidSprite1.graphics.drawRect(300, 473, 370, 210);
            vidSprite1.graphics.endFill();
            addChild(vidSprite1);
            CreateTextField(300, 688, 370, true, vid1.title.text());
            video.x = 305;
            video.y = 478;
            video.width = 360;
            video.height = 200;
            addChild(video);
            videoURL = vid1.URL.text();
            vidHold.x = 300;
            vidHold.y = 473;
            vidHold.data = videoURL;
            vidHold.name = "vid1";
            vidHold.buttonMode = true;
            vidHold.mouseChildren = false;
            vidHold.play_btn.visible = true;
            vidHold.play_btn.playBMP.alpha = 1;
            addChild(vidHold);
            vidHold.addEventListener(MouseEvent.CLICK, playVid, false, 0, true);
            vidHold.addEventListener(MouseEvent.MOUSE_OVER, vidOVER, false, 0, true);
            vidHold.addEventListener(MouseEvent.MOUSE_OUT, vidOUT, false, 0, true);
            vidSprite2.graphics.clear();
            vidSprite2.graphics.beginFill(592137, 1);
            vidSprite2.graphics.drawRect(300, 783, 370, 210);
            vidSprite2.graphics.endFill();
            addChild(vidSprite2);
            CreateTextField(300, 998, 370, true, vid2.title.text());
            video2URL = vid2.URL.text();
            video2.x = 305;
            video2.y = 788;
            video2.width = 360;
            video2.height = 200;
            addChild(video2);
            vidHold2.x = 300;
            vidHold2.y = 783;
            vidHold2.name = "vid2";
            vidHold2.data = video2URL;
            vidHold2.buttonMode = true;
            vidHold2.mouseChildren = false;
            vidHold2.play_btn.visible = true;
            vidHold2.play_btn.playBMP.alpha = 1;
            addChild(vidHold2);
            vidHold2.addEventListener(MouseEvent.CLICK, playVid, false, 0, true);
            vidHold2.addEventListener(MouseEvent.MOUSE_OVER, vidOVER, false, 0, true);
            vidHold2.addEventListener(MouseEvent.MOUSE_OUT, vidOUT, false, 0, true);
            _loc_1 = new Sprite();
            _loc_1.graphics.clear();
            _loc_1.graphics.beginFill(13684944, 1);
            _loc_1.graphics.drawRect(0, 1070, 700, 40);
            _loc_1.graphics.endFill();
            addChild(_loc_1);
            CreateTextField(35, 1081, 415, false, footer.copyright.text());
            CreateTextField(465, 1073, 215, false, footer.p1.text());
            if (this.parent != null)
            {
                _loc_2 = MovieClip(this.parent.getChildByName("scrolla"));
                this.parent.setChildIndex(_loc_2, 2);
            }// end if
            return;
        }// end function

        public function getStatus(param1:Object) : void
        {
            if (param1.info.code == "NetStream.Play.Stop")
            {
                firstClick = true;
                video1Playing = false;
                videoTween = new Tween(video, "alpha", Regular.easeOut, 1, 0.3, 0.5, true);
                netSTREAM.seek(0);
                netSTREAM.togglePause();
                vidHold.play_btn.playBMP.visible = true;
                vidHold.play_btn.pauseBMP.visible = false;
                if (video2Playing != true)
                {
                    rootVars.restoreAudio(restoreVolumeLevel);
                }// end if
            }// end if
            return;
        }// end function

        public function imageLoaded(param1:Event) : void
        {
            var _loc_2:Bitmap;
            _loc_2 = new Bitmap();
            _loc_2 = new Bitmap();
            _loc_2.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(_loc_2);
            _loc_2.x = tempX;
            _loc_2.y = tempY;
            if (i == 0)
            {
                AddImage(24, 84, article1.imageURL2.text());
            }// end if
            if (i == 1)
            {
                AddImage(0, 1108, article1.imageURL3.text());
            }// end if
            i++;
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            article1 = xml.article1;
            event1 = xml.event1;
            event2 = xml.event2;
            event3 = xml.event3;
            event4 = xml.event4;
            calendar = xml.calendar;
            footer = xml.footer;
            vid1 = xml.video1;
            vid2 = xml.video2;
            cssLoader = new URLLoader();
            cssLoader.addEventListener(Event.COMPLETE, cssLoaded, false, 0, true);
            cssLoader.load(req);
            return;
        }// end function

        public function AddImage(param1, param2, param3) : void
        {
            var _loc_4:String;
            var _loc_5:URLRequest;
            var _loc_6:*;
            _loc_4 = param3;
            _loc_5 = new URLRequest(_loc_4);
            _loc_6 = new Loader();
            _loc_6.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded, false, 0, true);
            _loc_6.load(_loc_5);
            tempX = param1;
            tempY = param2;
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
            var _loc_2:*;
            _loc_2 = new URLLoader();
            _loc_2.load(new URLRequest(param1));
            _loc_2.addEventListener(Event.COMPLETE, xmlFinishedLoading);
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
