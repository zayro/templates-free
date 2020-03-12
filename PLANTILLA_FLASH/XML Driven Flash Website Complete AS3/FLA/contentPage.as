package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;

    dynamic public class contentPage extends MovieClip
    {
        public var cssLoader:URLLoader;
        public var tempX:Number;
        public var xml:XML;
        public var tempY:Number;
        public var numberOfFeatures:int;
        public var i:int;
        public var goodSheet:StyleSheet;
        public var req:URLRequest;
        public var Image1X:Number;
        public var Image1Y:Number;
        public var textY:Number;
        public var textX:Number;
        public var Image2X:Number;
        public var Image2Y:Number;
        public var feature:XMLList;

        public function contentPage()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function image2Loaded(param1:Event) : void
        {
            var _loc_2:Bitmap;
            _loc_2 = new Bitmap();
            _loc_2 = new Bitmap();
            _loc_2.bitmapData = Bitmap(param1.target.content).bitmapData;
            addChild(_loc_2);
            _loc_2.x = tempX;
            _loc_2.y = tempY;
            Image1Y = Image1Y + 550;
            Image2Y = Image2Y + 550;
            i++;
            loadContent();
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

        public function AddImage2(param1, param2, param3) : void
        {
            var _loc_4:String;
            var _loc_5:URLRequest;
            var _loc_6:*;
            _loc_4 = param3;
            _loc_5 = new URLRequest(_loc_4);
            _loc_6 = new Loader();
            _loc_6.contentLoaderInfo.addEventListener(Event.COMPLETE, image2Loaded, false, 0, true);
            _loc_6.load(_loc_5);
            tempX = param1;
            tempY = param2;
            return;
        }// end function

        public function loadFeatures() : void
        {
            CreateTextField(textX, textY, 550, true, feature[i].f1t.text());
            textY = textY + 550;
            AddImage(Image1X, Image1Y, feature[i].imageURL.text());
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            feature = xml.features.feature;
            numberOfFeatures = feature.length();
            cssLoader = new URLLoader();
            cssLoader.addEventListener(Event.COMPLETE, cssLoaded, false, 0, true);
            cssLoader.load(req);
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
            AddImage2(Image2X, Image2Y, feature[i].imageURL2.text());
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

        function frame1()
        {
            i = 0;
            Image1X = 50;
            Image1Y = 30;
            Image2X = 50;
            Image2Y = 85;
            textX = 50;
            textY = 275;
            req = new URLRequest("site_stylesheets/style.css");
            goodSheet = new StyleSheet();
            return;
        }// end function

        public function loadContent() : void
        {
            if (i < numberOfFeatures)
            {
                loadFeatures();
            }// end if
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
