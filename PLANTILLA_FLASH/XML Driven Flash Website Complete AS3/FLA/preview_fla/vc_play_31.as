package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class vc_play_31 extends MovieClip
    {
        public var url:URLRequest;
        public var playLoader:Loader;
        public var playString:String;
        public var pauseUrl:URLRequest;
        public var pauseString:String;
        public var pauseLoader:Loader;
        public var pauseBMP:Bitmap;
        public var playBMP:Bitmap;

        public function vc_play_31()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            playString = "./site_images/smallPlay.png";
            playBMP = new Bitmap();
            url = new URLRequest(playString);
            playLoader = new Loader();
            playLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, playLoaded, false, 0, true);
            playLoader.load(url);
            pauseString = "./site_images/smallPause.png";
            pauseBMP = new Bitmap();
            pauseUrl = new URLRequest(pauseString);
            pauseLoader = new Loader();
            pauseLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, pauseLoaded, false, 0, true);
            pauseLoader.load(pauseUrl);
            return;
        }// end function

        public function playLoaded(param1:Event) : void
        {
            playLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, playLoaded);
            playLoader = null;
            playBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            playBMP.visible = false;
            addChild(playBMP);
            return;
        }// end function

        public function pauseLoaded(param1:Event) : void
        {
            pauseLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, pauseLoaded);
            pauseLoader = null;
            pauseBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            pauseBMP.visible = true;
            addChild(pauseBMP);
            return;
        }// end function

    }
}
