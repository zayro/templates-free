package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;

    dynamic public class footerBtns extends MovieClip
    {
        public var volGlow:MovieClip;
        public var volScrub:MovieClip;
        public var volBase:MovieClip;
        public var dragRectangle:Rectangle;
        public var playlist:MovieClip;

        public function footerBtns()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function stopMove(param1:MouseEvent) : void
        {
            volScrub.stopDrag();
            volScrub.tool.visible = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, stopMove);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, scrubberMoving);
            return;
        }// end function

        public function navBtnOutHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnTextOver.text;
            param1.target.btnTextOver.text = "";
            param1.target.btnText.text = _loc_2;
            param1.target.gotoAndPlay(10);
            return;
        }// end function

        public function startMove(param1:MouseEvent) : void
        {
            volScrub.startDrag(false, dragRectangle);
            volScrub.tool.visible = true;
            MovieClip(parent).swapDepthsFooter();
            stage.addEventListener(MouseEvent.MOUSE_MOVE, scrubberMoving, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, stopMove, false, 0, true);
            return;
        }// end function

        public function scrubberMoving(param1:MouseEvent)
        {
            adjustVolume();
            volGlow.width = volScrub.x - volBase.x;
            return;
        }// end function

        function frame1()
        {
            var _loc_1:Boolean;
            volScrub.buttonMode = true;
            playlist.buttonMode = _loc_1;
            var _loc_1:Boolean;
            volScrub.mouseChildren = false;
            playlist.mouseChildren = _loc_1;
            volScrub.tool.visible = false;
            dragRectangle = new Rectangle(volBase.x, volScrub.y, volBase.width - 10, 0);
            playlist.addEventListener(MouseEvent.MOUSE_OVER, navBtnOverHandler, false, 0, true);
            playlist.addEventListener(MouseEvent.MOUSE_OUT, navBtnOutHandler, false, 0, true);
            volScrub.addEventListener(MouseEvent.MOUSE_DOWN, startMove, false, 0, true);
            return;
        }// end function

        public function adjustVolume() : void
        {
            var _loc_1:Number;
            var _loc_2:Number;
            var _loc_3:Number;
            var _loc_4:int;
            var _loc_5:String;
            var _loc_6:String;
            _loc_1 = Math.floor(volBase.x);
            _loc_2 = volScrub.x - _loc_1;
            _loc_3 = _loc_2 / 60;
            _loc_4 = Math.round(_loc_3 * 100);
            _loc_5 = _loc_4.toString();
            _loc_6 = _loc_5 + " %";
            volScrub.tool.dynText.text = _loc_6;
            MovieClip(parent).playa.slider.x = MovieClip(parent).playa.volumeSlider.x - 10 + _loc_2;
            MovieClip(parent).playa.volumeLevel = _loc_3;
            MovieClip(parent).playa.CHNL.soundTransform = new SoundTransform(_loc_3);
            MovieClip(parent).playa.volGLOW.width = MovieClip(parent).playa.slider.x - MovieClip(parent).playa.volumeSlider.x;
            MovieClip(parent).playa.slider.tool.volumeText.text = _loc_6;
            return;
        }// end function

        public function navBtnOverHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnText.text;
            param1.target.btnText.text = "";
            param1.target.btnTextOver.text = _loc_2;
            param1.target.gotoAndPlay(2);
            return;
        }// end function

    }
}
