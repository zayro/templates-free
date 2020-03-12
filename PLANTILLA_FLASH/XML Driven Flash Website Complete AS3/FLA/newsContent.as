package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.text.*;

    dynamic public class newsContent extends MovieClip
    {
        public var xml:XML;
        public var articleY:Number;
        public var rootVars:MovieClip;
        public var imageY:Number;
        public var i:uint;
        public var preloaderStartingX:Number;
        public var captionDescriptionStartingX:Number;
        public var percentage:Number;
        public var preloaderY:Number;
        public var req:URLRequest;
        public var goodSheet:StyleSheet;
        public var tweenPreloaderIn:Tween;
        public var tweenIT:Tween;
        public var captionDescriptionY:Number;
        public var imageCaptionTitleY:Number;
        public var article:XMLList;
        public var imageStartingX:Number;
        public var sliderBASEStartingX:Number;
        public var articleTween:Tween;
        public var articleTitleStartingX:Number;
        public var articleMaskStartingX:Number;
        public var articleBodyStartingX:Number;
        public var sliderBASEY:Number;
        public var bgCircle:bigCircle;
        public var bmp:Bitmap;
        public var imageCaptionTitleStartingX:Number;
        public var target:MovieClip;
        public var articleTitleY:Number;
        public var articleMaskY:Number;
        public var articleBodyY:Number;
        public var scrollaX:Number;
        public var scrollaY:Number;
        public var articleStartingX:Number;
        public var cssLoader:URLLoader;

        public function newsContent()
        {
            addFrameScript(0, frame1);
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

        public function CreateArticleBodyText(param1, param2, param3, param4, param5) : void
        {
            var _loc_6:TextField;
            var _loc_7:String;
            var _loc_8:articleMask;
            var _loc_9:newsScrollBase;
            var _loc_10:newsSCROLLA;
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
            _loc_6.name = "bodyText" + i;
            addChild(_loc_6);
            _loc_8 = new articleMask();
            _loc_8.width = param3;
            _loc_8.height = 275;
            _loc_8.x = articleMaskStartingX;
            _loc_8.y = articleMaskY;
            addChild(_loc_8);
            articleMaskStartingX = articleMaskStartingX + 668;
            _loc_6.mask = _loc_8;
            _loc_9 = new newsScrollBase();
            _loc_9.x = sliderBASEStartingX;
            _loc_9.y = sliderBASEY;
            _loc_9.width = 1;
            _loc_9.height = 260;
            addChild(_loc_9);
            sliderBASEStartingX = sliderBASEStartingX + 668;
            _loc_10 = new newsSCROLLA();
            _loc_10.x = scrollaX;
            _loc_10.y = scrollaY;
            _loc_10.data = i;
            _loc_10.buttonMode = true;
            addChild(_loc_10);
            _loc_10.addEventListener(MouseEvent.MOUSE_DOWN, startMove);
            scrollaX = scrollaX + 668;
            return;
        }// end function

        function frame1()
        {
            rootVars = MovieClip(parent.parent);
            req = new URLRequest("site_stylesheets/blog.css");
            goodSheet = new StyleSheet();
            articleStartingX = -700;
            articleY = 0;
            preloaderStartingX = -540;
            preloaderY = 125;
            imageStartingX = -690;
            imageY = 10;
            imageCaptionTitleStartingX = -687;
            imageCaptionTitleY = 239;
            captionDescriptionStartingX = -687;
            captionDescriptionY = 254;
            articleTitleStartingX = -374;
            articleTitleY = 38;
            articleBodyStartingX = -366;
            articleBodyY = 81;
            articleMaskStartingX = -366;
            articleMaskY = 81;
            sliderBASEStartingX = -70;
            sliderBASEY = 71;
            scrollaX = -77;
            scrollaY = 76;
            bgCircle = new bigCircle();
            bgCircle.x = preloaderStartingX;
            bgCircle.y = preloaderY;
            bgCircle.name = "bgCircle";
            addChild(bgCircle);
            i = 0;
            percentage = 0;
            return;
        }// end function

        public function stopMove(param1:Event) : void
        {
            param1.target.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, scrollContent);
            stage.removeEventListener(MouseEvent.MOUSE_UP, stopMove);
            return;
        }// end function

        public function scrollContent(param1:Event) : void
        {
            var _loc_2:String;
            var _loc_3:Number;
            _loc_2 = "bodyText" + target.data;
            percentage = (target.y - 76) / 200;
            _loc_3 = getChildByName(_loc_2).height - 200 - 40;
            articleTween = new Tween(getChildByName(_loc_2), "y", Regular.easeOut, getChildByName(_loc_2).y, percentage * (-_loc_3) + 81, 1, true);
            return;
        }// end function

        public function imageLoaded(param1:Event) : void
        {
            var _loc_2:bmpHolder;
            _loc_2 = new bmpHolder();
            _loc_2.x = imageStartingX;
            _loc_2.y = imageY;
            addChild(_loc_2);
            bmp = new Bitmap();
            bmp.bitmapData = Bitmap(param1.target.content).bitmapData;
            bmp.alpha = 1;
            bmp.cacheAsBitmap = true;
            _loc_2.addChild(bmp);
            imageStartingX = imageStartingX + 668;
            i++;
            articleStartingX = articleStartingX + 668;
            createArticles();
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            article = xml.article;
            cssLoader = new URLLoader();
            cssLoader.addEventListener(Event.COMPLETE, cssLoaded, false, 0, true);
            cssLoader.load(req);
            return;
        }// end function

        public function bigPreloader(param1:ProgressEvent) : void
        {
            var _loc_2:Number;
            _loc_2 = Math.round(param1.bytesLoaded / param1.bytesTotal * 100);
            bgCircle.bigTXT.text = _loc_2.toString() + "%";
            bgCircle.gotoAndStop(_loc_2);
            return;
        }// end function

        public function startMove(param1:Event) : void
        {
            var _loc_2:Rectangle;
            _loc_2 = new Rectangle(param1.target.x, scrollaY, 0, 200);
            param1.target.startDrag(false, _loc_2);
            target = MovieClip(param1.target);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, scrollContent);
            stage.addEventListener(MouseEvent.MOUSE_UP, stopMove);
            return;
        }// end function

        public function createArticles() : void
        {
            var _loc_1:newsArticle;
            var _loc_2:String;
            var _loc_3:URLRequest;
            var _loc_4:*;
            _loc_1 = new newsArticle();
            if (i < article.length())
            {
                if (i != 0)
                {
                    preloaderStartingX = preloaderStartingX + 668;
                    bgCircle.x = preloaderStartingX;
                }// end if
                _loc_1 = new newsArticle();
                _loc_1.x = articleStartingX;
                _loc_1.data = i;
                _loc_1.name = "Article" + i;
                _loc_1.mouseChildren = true;
                addChild(_loc_1);
                CreateTextField(imageCaptionTitleStartingX, imageCaptionTitleY, 300, false, article[i].imageCaption.text());
                imageCaptionTitleStartingX = imageCaptionTitleStartingX + 668;
                CreateTextField(captionDescriptionStartingX, captionDescriptionY, 300, true, article[i].captionDesc.text());
                captionDescriptionStartingX = captionDescriptionStartingX + 668;
                CreateTextField(articleTitleStartingX, articleTitleY, 300, false, article[i].articleTitle.text());
                articleTitleStartingX = articleTitleStartingX + 668;
                CreateArticleBodyText(articleBodyStartingX, articleBodyY, 250, true, article[i].articleBody.text());
                articleBodyStartingX = articleBodyStartingX + 668;
                setChildIndex(bgCircle, numChildren--);
                _loc_2 = article[i].imageURL.text();
                _loc_3 = new URLRequest(_loc_2);
                _loc_4 = new Loader();
                _loc_4.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded, false, 0, true);
                _loc_4.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, bigPreloader, false, 0, true);
                _loc_4.load(_loc_3);
            }
            else
            {
                removeChild(getChildByName("bgCircle"));
            }// end else if
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
            createArticles();
            return;
        }// end function

    }
}
