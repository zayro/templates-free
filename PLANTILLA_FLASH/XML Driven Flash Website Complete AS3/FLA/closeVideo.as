package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class closeVideo extends MovieClip
    {
        public var closeString:String;
        public var closeLoader:Loader;
        public var closeBMP:Bitmap;
        public var url:URLRequest;

        public function closeVideo()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function closeLoaded(param1:Event) : void
        {
            closeLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, closeLoaded);
            closeLoader = null;
            closeBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(closeBMP);
            return;
        }// end function

        function frame1()
        {
            closeString = "./site_images/close.jpg";
            closeBMP = new Bitmap();
            url = new URLRequest(closeString);
            closeLoader = new Loader();
            closeLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, closeLoaded, false, 0, true);
            closeLoader.load(url);
            return;
        }// end function

    }
}
