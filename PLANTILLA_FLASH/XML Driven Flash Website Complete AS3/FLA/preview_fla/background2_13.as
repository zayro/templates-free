package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class background2_13 extends MovieClip
    {
        public var bg2iconBMP:Bitmap;
        public var bg2iconString:String;
        public var bg2iconLoader:Loader;
        public var url:URLRequest;

        public function background2_13()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function bg2iconLoaded(param1:Event) : void
        {
            bg2iconLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bg2iconLoaded);
            bg2iconLoader = null;
            bg2iconBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(bg2iconBMP);
            return;
        }// end function

        function frame1()
        {
            bg2iconString = "./site_images/bg2icon.jpg";
            bg2iconBMP = new Bitmap();
            url = new URLRequest(bg2iconString);
            bg2iconLoader = new Loader();
            bg2iconLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, bg2iconLoaded, false, 0, true);
            bg2iconLoader.load(url);
            return;
        }// end function

    }
}
