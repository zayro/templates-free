package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class seperator_6 extends MovieClip
    {
        public var btnSeperatorLoader:Loader;
        public var url:URLRequest;
        public var btnSeperatorString:String;
        public var btnSeperatorBMP:Bitmap;

        public function seperator_6()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            btnSeperatorString = "./site_images/btnSeperator.png";
            btnSeperatorBMP = new Bitmap();
            url = new URLRequest(btnSeperatorString);
            btnSeperatorLoader = new Loader();
            btnSeperatorLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, btnSeperatorLoaded, false, 0, true);
            btnSeperatorLoader.load(url);
            return;
        }// end function

        public function btnSeperatorLoaded(param1:Event) : void
        {
            btnSeperatorLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, btnSeperatorLoaded);
            btnSeperatorLoader = null;
            btnSeperatorBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(btnSeperatorBMP);
            return;
        }// end function

    }
}
