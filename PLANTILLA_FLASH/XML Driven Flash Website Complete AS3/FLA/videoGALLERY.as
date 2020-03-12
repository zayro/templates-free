package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;

    dynamic public class videoGALLERY extends MovieClip
    {
        public var xmlURL:String;
        public var Xt:Tween;
        public var Ht:Tween;
        public var Yt:Tween;
        public var StageWidth:Number;
        public var StageHeight:Number;
        public var vb:videoBackground;
        public var videoContent:videoPage;
        public var _X:int;
        public var _Y:int;
        public var Wt:Tween;

        public function videoGALLERY()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function resizeHandler(param1:Event) : void
        {
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            _X = Math.round(StageWidth / 2 - 705 / 2);
            _Y = Math.round(StageHeight / 2 - 430 / 2) + 20;
            vb.x = _X;
            vb.y = _Y;
            videoContent.x = _X;
            videoContent.y = _Y;
            return;
        }// end function

        function frame1()
        {
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            vb = new videoBackground();
            addChild(vb);
            videoContent = new videoPage();
            _X = Math.round(StageWidth / 2 - 705 / 2);
            _Y = Math.round(StageHeight / 2 - 430 / 2) + 20;
            pageLoadAnimation();
            stage.addEventListener(Event.RESIZE, resizeHandler, false, 0, true);
            return;
        }// end function

        public function addContent(param1:TweenEvent) : void
        {
            Ht.removeEventListener(TweenEvent.MOTION_FINISH, addContent);
            videoContent.x = Math.round(StageWidth / 2 - 705 / 2);
            videoContent.y = Math.round(StageHeight / 2 - 430 / 2) + 20;
            addChild(videoContent);
            videoContent.kickitoff(xmlURL);
            return;
        }// end function

        public function pageLoadAnimation() : void
        {
            Xt = new Tween(vb, "x", Bounce.easeOut, StageWidth / 2, _X, 1, true);
            Yt = new Tween(vb, "y", Bounce.easeOut, StageHeight / 2, _Y, 1, true);
            Wt = new Tween(vb, "width", Bounce.easeOut, 0, 705, 1, true);
            Ht = new Tween(vb, "height", Bounce.easeOut, 0, 430, 1, true);
            Ht.addEventListener(TweenEvent.MOTION_FINISH, addContent, false, 0, true);
            return;
        }// end function

    }
}
