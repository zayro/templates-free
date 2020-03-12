package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class audioBg_86 extends MovieClip
    {
        public var audioBackLoader:Loader;
        public var audioBackString:String;
        public var url:URLRequest;
        public var audioBackBMP:Bitmap;

        public function audioBg_86()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            audioBackString = "./site_images/audioBack.jpg";
            audioBackBMP = new Bitmap();
            url = new URLRequest(audioBackString);
            audioBackLoader = new Loader();
            audioBackLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, audioBackLoaded, false, 0, true);
            audioBackLoader.load(url);
            return;
        }// end function

        public function audioBackLoaded(param1:Event) : void
        {
            audioBackLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, audioBackLoaded);
            audioBackLoader = null;
            audioBackBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(audioBackBMP);
            return;
        }// end function

    }
}
