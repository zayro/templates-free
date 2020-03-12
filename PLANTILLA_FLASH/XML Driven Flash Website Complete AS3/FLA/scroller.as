package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class scroller extends MovieClip
    {
        public var url:URLRequest;
        public var verScrubLoader:Loader;
        public var verScrubString:String;
        public var verScrubBMP:Bitmap;

        public function scroller()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            verScrubString = "./site_images/verticalScrollScrub.jpg";
            verScrubBMP = new Bitmap();
            url = new URLRequest(verScrubString);
            verScrubLoader = new Loader();
            verScrubLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, verScrubLoaded, false, 0, true);
            verScrubLoader.load(url);
            return;
        }// end function

        public function verScrubLoaded(param1:Event) : void
        {
            verScrubLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, verScrubLoaded);
            verScrubLoader = null;
            verScrubBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(verScrubBMP);
            return;
        }// end function

    }
}
