package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.text.*;

    dynamic public class player extends MovieClip
    {
        public var loader:Object;
        public var xml:XML;
        public var trackLength:TextField;
        public var uRLRequest:URLRequest;
        public var rootVars:MovieClip;
        public var playaBorder:MovieClip;
        public var pos:Number;
        public var isItLoaded:Boolean;
        public var b:Rectangle;
        public var txt:String;
        public var voltext:String;
        public var volumeLevel:Number;
        public var buffPercent:Number;
        public var NowPlaying:Boolean;
        public var volumeSlider:MovieClip;
        public var tit:String;
        public var index:int;
        public var vol:int;
        public var xmlPath:String;
        public var volGLOW:MovieClip;
        public var slider:MovieClip;
        public var CHNL:SoundChannel;
        public var songlist:XMLList;
        public var currentTrack:TextField;
        public var numTrack:int;
        public var rectangle:Rectangle;
        public var sNdOpen:Boolean;
        public var pane:soundPanel;
        public var sNd:Sound;
        public var numberOfTracks:int;
        public var strok:stroke;
        public var sNdLength:Number;
        public var playedPercentage:Number;
        public var pb:playaBack;
        public var time_txt:TextField;

        public function player()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function createMp3Btns() : void
        {
            var _loc_1:MenuItem;
            var _loc_2:uint;
            var _loc_3:XML;
            _loc_1 = new MenuItem();
            _loc_2 = 0;
            songlist = xml.tracks;
            for each (_loc_3 in songlist)
            {
                // label
                _loc_1 = new MenuItem();
                _loc_1.menuLabel.text = songlist.title.text()[_loc_2];
                _loc_1.indexPlusOne.text = (_loc_2 + 1).toString();
                if (_loc_2 < 9)
                {
                    _loc_1.indexPlusOne.text = 0.toString() + (_loc_2 + 1).toString();
                }// end if
                _loc_1.menuLabel.autoSize = TextFieldAutoSize.LEFT;
                _loc_1.x = 0;
                _loc_1.y = 0 + _loc_2 * 25;
                _loc_1.data = _loc_2;
                _loc_1.buttonMode = true;
                _loc_1.mouseChildren = false;
                _loc_1.addEventListener(MouseEvent.MOUSE_OVER, panelItemOver);
                _loc_1.addEventListener(MouseEvent.MOUSE_OUT, panelItemOut);
                _loc_1.addEventListener(MouseEvent.CLICK, playTrack);
                pane.addChild(_loc_1);
            }// end of for each ... in
            return;
        }// end function

        public function updateDynamicTextFields() : void
        {
            var _loc_1:Number;
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:String;
            pos = CHNL.position;
            _loc_1 = CHNL.position / 1000;
            _loc_2 = Math.floor(CHNL.position / 1000 / 60);
            _loc_3 = Math.floor(_loc_1) % 60;
            if (_loc_3 < 10)
            {
                _loc_4 = String("0" + _loc_3);
            }
            else
            {
                _loc_4 = String(_loc_3);
            }// end else if
            if (_loc_2 < 10)
            {
                time_txt.text = String("0" + _loc_2 + ":" + _loc_4);
            }
            else
            {
                time_txt.text = String(_loc_2 + ":" + _loc_4);
            }// end else if
            return;
        }// end function

        public function stopSound() : void
        {
            CHNL.stop();
            removeEventListener(Event.ENTER_FRAME, EnterTheFrame);
            return;
        }// end function

        public function playSound() : void
        {
            addEventListener(Event.ENTER_FRAME, EnterTheFrame);
            return;
        }// end function

        public function OutHandler(param1:Event) : void
        {
            param1.target.gotoAndStop(1);
            return;
        }// end function

        public function EnterTheFrame(param1:Event) : void
        {
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:Number;
            var _loc_5:Number;
            var _loc_6:String;
            CHNL.soundTransform = new SoundTransform(volumeLevel);
            numTrack = index + 1;
            tit = songlist[index].title.text();
            currentTrack.text = tit;
            _loc_2 = sNd.bytesLoaded;
            _loc_3 = sNd.bytesTotal;
            pos = CHNL.position;
            sNdLength = sNd.length;
            if (sNdOpen == true && _loc_3 > 0)
            {
                NowPlaying = true;
                buffPercent = _loc_2 / _loc_3;
                sNdLength = sNdLength / buffPercent;
                playedPercentage = pos / sNdLength;
                _loc_4 = sNd.length / 1000;
                _loc_5 = Math.floor(_loc_4 / 60);
                _loc_4 = Math.floor(_loc_4 % 60);
                _loc_6 = _loc_5 + ":" + (_loc_4 < 10 ? ("0") : ("")) + _loc_4;
                trackLength.text = _loc_6;
                updateDynamicTextFields();
                if (_loc_2 == _loc_3)
                {
                    isItLoaded = true;
                }
                else
                {
                    isItLoaded = false;
                }// end else if
            }
            else
            {
                NowPlaying = false;
            }// end else if
            if (playedPercentage > 0.987)
            {
                SoundComplete();
            }// end if
            return;
        }// end function

        function frame1()
        {
            rootVars = MovieClip(parent);
            NowPlaying = false;
            sNdOpen = false;
            isItLoaded = false;
            index = 0;
            pane.visible = true;
            volumeLevel = 1;
            volGLOW.width = 25;
            pb = new playaBack();
            pb.x = -303;
            pb.y = -221;
            addChild(pb);
            setChildIndex(pb, 0);
            xmlPath = "./site_configuration/music.xml";
            loader = new URLLoader();
            loader.load(new URLRequest(xmlPath));
            loader.addEventListener(Event.COMPLETE, xmlLoaded);
            b = strok.getBounds(this);
            pane.addEventListener(MouseEvent.MOUSE_OVER, dropDownMenu);
            slider.buttonMode = true;
            slider.x = volumeSlider.x + volumeLevel * 50;
            slider.addEventListener(MouseEvent.MOUSE_DOWN, startMove);
            slider.tool.visible = false;
            vol = Math.round(volumeLevel * 100);
            txt = vol.toString();
            voltext = txt + " %";
            slider.tool.volumeText.text = voltext;
            rectangle = new Rectangle(volumeSlider.x, 31, 50, 0.01);
            currentTrack.selectable = false;
            time_txt.selectable = false;
            trackLength.selectable = false;
            return;
        }// end function

        public function nextClick(param1:MouseEvent)
        {
            advanceTrack(param1.target.name);
            return;
        }// end function

        public function playTrack(param1:Event) : void
        {
            CHNL.soundTransform = new SoundTransform(volumeLevel);
            index = param1.target.data;
            numTrack = index + 1;
            tit = "0" + numTrack + " - " + songlist[index].artist.text() + " - " + songlist[index].title.text();
            currentTrack.text = tit;
            uRLRequest = new URLRequest(songlist[index].url);
            if (NowPlaying == false)
            {
                sNd = new Sound();
                sNd.load(uRLRequest);
                CHNL = sNd.play();
                NowPlaying = true;
                playSound();
                sNd.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
            }
            else
            {
                CHNL.stop();
                uRLRequest = new URLRequest(songlist[index].url);
                sNd = new Sound();
                sNd.load(uRLRequest);
                CHNL = sNd.play();
                NowPlaying = true;
                sNd.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
            }// end else if
            return;
        }// end function

        public function sliderMoving(param1:MouseEvent)
        {
            adjustVolume();
            volGLOW.width = slider.x - volumeSlider.x;
            return;
        }// end function

        public function panelItemOut(param1:Event) : void
        {
            param1.target.gotoAndPlay(3);
            param1.target.menuLabel2.text = "";
            param1.target.menuLabel.text = songlist.title.text()[param1.target.data];
            return;
        }// end function

        public function panelItemOver(param1:Event) : void
        {
            param1.target.gotoAndStop(2);
            param1.target.menuLabel.text = "";
            param1.target.menuLabel2.text = songlist.title.text()[param1.target.data];
            return;
        }// end function

        public function onLoadProgress(param1:ProgressEvent) : void
        {
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:String;
            _loc_2 = sNd.length / 1000;
            _loc_3 = Math.floor(_loc_2 / 60);
            _loc_2 = Math.floor(_loc_2 % 60);
            _loc_4 = _loc_3 + ":" + (_loc_2 < 10 ? ("0") : ("")) + _loc_2;
            trackLength.text = _loc_4;
            return;
        }// end function

        public function stopIt(param1:MouseEvent) : void
        {
            CHNL.stop();
            pos = 0;
            CHNL.stop();
            stopSound();
            return;
        }// end function

        public function openSound(param1:Event) : void
        {
            sNdOpen = true;
            CHNL = sNd.play();
            CHNL.soundTransform = new SoundTransform(volumeLevel);
            playSound();
            return;
        }// end function

        public function xmlLoaded(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            songlist = xml.tracks;
            numberOfTracks = xml.tracks.length();
            tit = "01  " + songlist.title.text()[0];
            currentTrack.text = tit;
            createMp3Btns();
            init(songlist[0].url);
            return;
        }// end function

        public function init(param1:String) : void
        {
            CHNL = null;
            sNd = null;
            sNd = new Sound(new URLRequest(param1));
            sNd.addEventListener(Event.OPEN, openSound);
            return;
        }// end function

        public function stopMove(param1:MouseEvent) : void
        {
            slider.stopDrag();
            adjustVolume();
            slider.tool.visible = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, stopMove);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, sliderMoving);
            return;
        }// end function

        public function playMp3(param1:MouseEvent) : void
        {
            param1.target.gotoAndStop(1);
            playSound();
            CHNL.stop();
            CHNL = sNd.play(pos);
            CHNL.soundTransform = new SoundTransform(volumeLevel);
            return;
        }// end function

        public function resetSound() : void
        {
            sNd = null;
            CHNL.stop();
            stopSound();
            return;
        }// end function

        public function dropDownMenu(param1:MouseEvent) : void
        {
            pane.removeEventListener(MouseEvent.MOUSE_OVER, dropDownMenu);
            pane.addEventListener(Event.ENTER_FRAME, letsStartScrolling);
            return;
        }// end function

        public function SoundComplete()
        {
            index = index + 1;
            if (index >= numberOfTracks)
            {
                index = 0;
            }
            else if (index == -1)
            {
                index = numberOfTracks--;
            }// end else if
            resetSound();
            init(songlist[index].url);
            return;
        }// end function

        public function startMove(param1:MouseEvent) : void
        {
            slider.startDrag(false, rectangle);
            slider.tool.visible = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, sliderMoving);
            stage.addEventListener(MouseEvent.MOUSE_UP, stopMove);
            return;
        }// end function

        public function letsStartScrolling(param1:Event) : void
        {
            var _loc_2:int;
            var _loc_3:*;
            if (mouseX < b.left || mouseX > b.right || mouseY < b.top || mouseY > b.bottom)
            {
                pane.removeEventListener(Event.ENTER_FRAME, letsStartScrolling);
                pane.addEventListener(MouseEvent.MOUSE_OVER, dropDownMenu);
            }// end if
            if (numberOfTracks < 9)
            {
                _loc_2 = 0;
            }// end if
            if (numberOfTracks > 9)
            {
                _loc_2 = (numberOfTracks - 9) * -24.8;
            }// end if
            if (pane.y < _loc_2)
            {
                pane.y = _loc_2;
            }// end if
            if (pane.y > 54)
            {
                pane.y = 54;
            }// end if
            _loc_3 = mouseY - 150;
            pane.y = pane.y + (-_loc_3 / 24);
            return;
        }// end function

        public function adjustVolume() : void
        {
            var _loc_1:Number;
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:MovieClip;
            var _loc_5:int;
            var _loc_6:String;
            var _loc_7:String;
            _loc_1 = Math.floor(volumeSlider.x);
            _loc_2 = slider.x - _loc_1;
            _loc_3 = _loc_2 / 50;
            volumeLevel = _loc_3;
            CHNL.soundTransform = new SoundTransform(volumeLevel);
            _loc_4 = MovieClip(parent);
            _loc_4.updateFooterVolumeSlider(volumeLevel);
            _loc_5 = Math.round(volumeLevel * 100);
            _loc_6 = _loc_5.toString();
            _loc_7 = _loc_6 + " %";
            slider.tool.volumeText.text = _loc_7;
            return;
        }// end function

        public function OverHandler(param1:Event) : void
        {
            param1.target.gotoAndStop(2);
            return;
        }// end function

        public function pauseClickHandler(param1:MouseEvent) : void
        {
            pos = CHNL.position;
            stopSound();
            return;
        }// end function

        public function advanceTrack(param1:String) : void
        {
            if (param1 == "next_btn")
            {
                index = index + 1;
            }
            else if (param1 == "prev_btn")
            {
                index--;
            }// end else if
            if (index >= numberOfTracks)
            {
                index = 0;
            }
            else if (index == -1)
            {
                index = numberOfTracks--;
            }// end else if
            resetSound();
            init(songlist[index].url);
            return;
        }// end function

    }
}
