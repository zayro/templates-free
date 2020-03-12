package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;

    dynamic public class imageGallery extends MovieClip
    {
        public var ihaschanged:Boolean;
        public var tMsk_W:Number;
        public var tMsk_X:Number;
        public var tMsk_Y:Number;
        public var loader:Object;
        public var xml:XML;
        public var imageUrl:String;
        public var Rsh:Number;
        public var thumbTWEEN:Tween;
        public var Rsw:Number;
        public var getNuY:Boolean;
        public var nuWidth:Number;
        public var preloadCircle:smallPreloader;
        public var imageL:Loader;
        public var nextBigImageLoad:Boolean;
        public var pcWtween:Tween;
        public var thumbContentSprite:Sprite;
        public var i:uint;
        public var j:uint;
        public var k:Number;
        public var eXternalImage:Bitmap;
        public var rawWidth:Number;
        public var imagelist:XMLList;
        public var tMskBorder_H:Number;
        public var firstBigImageLoad:Boolean;
        public var tMskBorder_W:Number;
        public var tMskBorder_Y:Number;
        public var pccYtween:Tween;
        public var tMskBorder_X:Number;
        public var tit:String;
        public var tcs_H:Number;
        public var containerMarginX:Number;
        public var tcs_X:Number;
        public var tcs_Y:Number;
        public var oldPCC_X:Number;
        public var tcs_W:Number;
        public var tweenComplete:Boolean;
        public var pcXtween:Tween;
        public var pcc:PageContentContainer;
        public var pcHtween:Tween;
        public var tweenPreloaderIn:Tween;
        public var xmlPath:String;
        public var mouseStartingX:Number;
        public var nuPCC_X:Number;
        public var thumbMask_border:maskBorder;
        public var scaledImage:BitmapData;
        public var pccWtween:Tween;
        public var imageLoader:Loader;
        public var TPS:thumbPanelScroll;
        public var thumbx:Number;
        public var thumby:Number;
        public var pcYtween:Tween;
        public var imageContainer:Sprite;
        public var maximumHeight:Number;
        public var rawHeight:Number;
        public var bgCircle:bigCircle;
        public var scale:Number;
        public var bmp:Bitmap;
        public var maximumWidth:Number;
        public var numberOfImages:int;
        public var thumbUrl:String;
        public var nx:Number;
        public var fullImageY:Number;
        public var nuHeight:Number;
        public var ny:Number;
        public var thumbMask:Sprite;
        public var pccXtween:Tween;
        public var pccHtween:Tween;
        public var tMsk_H:Number;
        public var fullImagePCC_Y:Number;

        public function imageGallery()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function createMask() : void
        {
            tMsk_X = Rsw / 2 - 800 / 2;
            tMsk_Y = Rsh - 98;
            thumbMask.graphics.clear();
            thumbMask.graphics.beginFill(0, 1);
            thumbMask.graphics.drawRect(tMsk_X, tMsk_Y, tMsk_W, tMsk_H);
            thumbMask.graphics.endFill();
            tMskBorder_X = Rsw / 2 - 800 / 2;
            tMskBorder_Y = Rsh - 98;
            thumbMask_border.x = tMskBorder_X;
            thumbMask_border.y = tMskBorder_Y;
            TPS.x = Rsw / 2 - 800 / 2;
            TPS.y = Rsh - 98;
            return;
        }// end function

        public function createFullSize(param1:Event) : void
        {
            if (firstBigImageLoad)
            {
                imageLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, bigPreloader);
                imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, createFullSize);
                imageLoader = null;
                firstBigImageLoad = false;
            }// end if
            eXternalImage.bitmapData = Bitmap(param1.target.content).bitmapData;
            tweenPreloaderIn = new Tween(bgCircle, "alpha", Regular.easeOut, 0, 1, 1, true);
            tweenPreloaderIn.addEventListener(TweenEvent.MOTION_FINISH, fullSizeImageLoaded, false, 0, true);
            return;
        }// end function

        public function createThumb(param1:Event) : void
        {
            var _loc_2:thumbHolder;
            ihaschanged = true;
            param1.target.removeEventListener(Event.COMPLETE, createThumb);
            param1.target.removeEventListener(ProgressEvent.PROGRESS, preloader);
            bmp = new Bitmap();
            bmp.bitmapData = Bitmap(param1.target.content).bitmapData;
            bmp.y = thumby;
            _loc_2 = new thumbHolder();
            bmp.x = thumbx;
            bmp.alpha = 1;
            bmp.cacheAsBitmap = true;
            _loc_2.x = thumbx;
            _loc_2.alpha = 1;
            _loc_2.y = thumby;
            _loc_2.data = imageUrl;
            _loc_2.buttonMode = true;
            _loc_2.mouseChildren = true;
            _loc_2.addEventListener(MouseEvent.CLICK, inBetween, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OVER, thumbOver, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OUT, thumbOut, false, 0, true);
            TPS.addChild(bmp);
            TPS.addChild(_loc_2);
            thumbx = thumbx + 74;
            i++;
            j++;
            createThumbnail();
            return;
        }// end function

        public function preloader(param1:ProgressEvent) : void
        {
            var _loc_2:Number;
            _loc_2 = Math.round(param1.bytesLoaded / param1.bytesTotal * 100);
            preloadCircle.smallTXT.text = _loc_2.toString();
            preloadCircle.gotoAndStop(_loc_2);
            if (ihaschanged)
            {
                preloadCircle.gotoAndStop(1);
                preloadCircle.x = preloadCircle.x + 74;
                ihaschanged = false;
            }// end if
            return;
        }// end function

        public function drawImage(param1:TweenEvent) : void
        {
            pcHtween.removeEventListener(TweenEvent.MOTION_FINISH, drawImage);
            imageContainer.graphics.beginBitmapFill(scaledImage);
            imageContainer.graphics.drawRect(0, 0, nuWidth, nuHeight);
            imageContainer.graphics.endFill();
            imageContainer.x = (Rsw - nuWidth) / 2;
            imageContainer.y = fullImageY;
            addChild(imageContainer);
            tweenComplete = true;
            return;
        }// end function

        function frame1()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            Rsw = stage.stageWidth;
            Rsh = stage.stageHeight;
            pcc = new PageContentContainer();
            pcc.alpha = 0;
            addChild(pcc);
            imageContainer = new Sprite();
            bgCircle = new bigCircle();
            preloadCircle = new smallPreloader();
            ihaschanged = false;
            firstBigImageLoad = true;
            nextBigImageLoad = false;
            tweenComplete = true;
            thumbx = 0;
            thumby = 0;
            eXternalImage = new Bitmap();
            nuWidth = rawWidth;
            nuHeight = rawHeight;
            getNuY = false;
            fullImageY = 115;
            fullImagePCC_Y = 105;
            stage.addEventListener(Event.RESIZE, this.resizeHandler);
            pageLoadAnimation();
            thumbContentSprite = new Sprite();
            tcs_X = Rsw / 2 - 800 / 2;
            tcs_Y = Rsh - 98;
            tcs_W = 800;
            tcs_H = 70;
            addChild(thumbContentSprite);
            thumbMask = new Sprite();
            tMsk_X = Rsw / 2 - 800 / 2;
            tMsk_Y = Rsh - 98;
            tMsk_W = 800;
            tMsk_H = 70;
            addChild(thumbMask);
            thumbMask_border = new maskBorder();
            tMskBorder_X = Rsw / 2 - 800 / 2;
            tMskBorder_Y = Rsh - 68;
            tMskBorder_W = 800;
            tMskBorder_H = 70;
            addChild(thumbMask_border);
            thumbContentSprite.mask = thumbMask;
            TPS = new thumbPanelScroll();
            TPS.x = Rsw / 2 - 800 / 2;
            TPS.y = Rsh - 98;
            thumbContentSprite.addChild(TPS);
            createTCS();
            createMask();
            preloadCircle.y = 30;
            preloadCircle.x = 35;
            preloadCircle.name = "preloadCircle";
            TPS.addChild(preloadCircle);
            i = 0;
            j = 0;
            k = 1;
            return;
        }// end function

        public function letsStartMoving(param1:Event) : void
        {
            var _loc_2:*;
            _loc_2 = thumbMask_border.getBounds(this);
            if (mouseY < _loc_2.top || mouseY > _loc_2.bottom || mouseX > _loc_2.right || mouseX < _loc_2.left)
            {
                thumbContentSprite.removeEventListener(Event.ENTER_FRAME, letsStartMoving);
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_OVER, tcsOver);
                thumbContentSprite.removeEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            }// end if
            if (tMsk_W > TPS.width)
            {
            }
            else
            {
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            }// end else if
            return;
        }// end function

        public function getFirstImage() : void
        {
            var _loc_1:URLRequest;
            imageUrl = imagelist.ImageUrl.text()[0];
            _loc_1 = new URLRequest(imageUrl);
            imageLoader = new Loader();
            imageLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, bigPreloader, false, 0, true);
            imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, createFullSize);
            imageLoader.load(_loc_1);
            return;
        }// end function

        public function tcsOver(param1:MouseEvent) : void
        {
            thumbContentSprite.addEventListener(Event.ENTER_FRAME, letsStartMoving);
            mouseStartingX = mouseX;
            return;
        }// end function

        public function pageLoadAnimation() : void
        {
            pcc.alpha = 0.2;
            pcXtween = new Tween(pcc, "x", Bounce.easeOut, Rsw / 2, Rsw / 2 - 150, 1, true);
            pcYtween = new Tween(pcc, "y", Bounce.easeOut, Rsh / 2, Rsh / 2 - 150, 1, true);
            pcWtween = new Tween(pcc, "width", Bounce.easeOut, 0, 300, 1, true);
            pcHtween = new Tween(pcc, "height", Bounce.easeOut, 0, 300, 1, true);
            pcHtween.addEventListener(TweenEvent.MOTION_FINISH, pageLoadAnimationDone, false, 0, true);
            return;
        }// end function

        public function fetchXML() : void
        {
            loader = new URLLoader();
            loader.load(new URLRequest(xmlPath));
            loader.addEventListener(Event.COMPLETE, xmlLoaded, false, 0, true);
            return;
        }// end function

        public function xmlLoaded(param1:Event) : void
        {
            loader.removeEventListener(Event.COMPLETE, xmlLoaded);
            loader = null;
            xml = new XML(param1.target.data);
            imagelist = xml.gallery.image;
            numberOfImages = imagelist.length();
            tit = imagelist.title.text()[0];
            getFirstImage();
            createThumbnail();
            return;
        }// end function

        public function pageLoadAnimationDone(param1:TweenEvent) : void
        {
            var _loc_2:Tween;
            pcHtween.removeEventListener(TweenEvent.MOTION_FINISH, pageLoadAnimationDone);
            bgCircle.x = Rsw / 2;
            bgCircle.y = Rsh / 2;
            bgCircle.name = "bgCircle";
            addChild(bgCircle);
            _loc_2 = new Tween(bgCircle, "alpha", Regular.easeOut, 0, 1, 0.5, true);
            fetchXML();
            return;
        }// end function

        public function inBetween(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.data;
            loadClickedImage(_loc_2);
            return;
        }// end function

        public function createTCS() : void
        {
            tcs_X = Rsw / 2 - 800 / 2;
            tcs_Y = Rsh - 98;
            thumbContentSprite.graphics.clear();
            thumbContentSprite.graphics.beginFill(16777215, 0);
            thumbContentSprite.graphics.drawRect(tcs_X, tcs_Y, tcs_W, tcs_H);
            thumbContentSprite.graphics.endFill();
            return;
        }// end function

        public function createThumbnail() : void
        {
            var _loc_1:URLRequest;
            var _loc_2:Loader;
            if (i < numberOfImages)
            {
                thumbUrl = imagelist.ThumbUrl.text()[i];
                imageUrl = imagelist.ImageUrl.text()[j];
                _loc_1 = new URLRequest(thumbUrl);
                _loc_2 = new Loader();
                _loc_2.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, preloader, false, 0, true);
                _loc_2.contentLoaderInfo.addEventListener(Event.COMPLETE, createThumb);
                _loc_2.load(_loc_1);
            }
            else
            {
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_OVER, tcsOver);
                TPS.removeChild(preloadCircle);
            }// end else if
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

        public function loadClickedImage(param1) : void
        {
            var _loc_2:Tween;
            var _loc_3:URLRequest;
            if (tweenComplete)
            {
                tweenComplete = false;
                bgCircle.x = Rsw / 2;
                bgCircle.y = imageContainer.y + imageContainer.height / 2;
                eXternalImage.bitmapData.dispose();
                imageContainer.graphics.clear();
                bgCircle.name = "bgCircle";
                addChild(bgCircle);
                _loc_2 = new Tween(bgCircle, "alpha", Regular.easeOut, 0, 1, 0.5, true);
                _loc_3 = new URLRequest(param1);
                imageL = new Loader();
                imageL.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, bigPreloader, false, 0, true);
                imageL.contentLoaderInfo.addEventListener(Event.COMPLETE, createFullSize);
                imageL.load(_loc_3);
            }
            else
            {
                return;
            }// end else if
            return;
        }// end function

        public function thumbOut(param1:Event) : void
        {
            thumbTWEEN = new Tween(param1.target, "alpha", Strong.easeOut, 0, 1, 1, true);
            return;
        }// end function

        public function tcsMOVE(param1:Event) : void
        {
            var _loc_2:Tween;
            var _loc_3:Tween;
            var _loc_4:Tween;
            var _loc_5:Tween;
            if (mouseX > mouseStartingX)
            {
                if (thumbContentSprite.x > tMsk_W - TPS.width - 80)
                {
                    _loc_2 = new Tween(thumbContentSprite, "x", Regular.easeOut, thumbContentSprite.x, thumbContentSprite.x - 60, 1, true);
                }// end if
            }// end if
            if (mouseX < mouseStartingX)
            {
                if (thumbContentSprite.x < 0)
                {
                    _loc_3 = new Tween(thumbContentSprite, "x", Regular.easeOut, thumbContentSprite.x, thumbContentSprite.x + 60, 1, true);
                }// end if
            }// end if
            if (mouseX > tcs_X + 720)
            {
                _loc_4 = new Tween(thumbContentSprite, "x", Regular.easeOut, thumbContentSprite.x, tMsk_W - TPS.width - 30, 1, true);
            }// end if
            if (mouseX < tcs_X + 80)
            {
                _loc_5 = new Tween(thumbContentSprite, "x", Regular.easeOut, thumbContentSprite.x, 0, 1, true);
            }// end if
            mouseStartingX = mouseX;
            return;
        }// end function

        public function retryLoad(param1) : void
        {
            if (k <= 1)
            {
                loadClickedImage(param1);
            }
            else
            {
                loadClickedImage(param1);
            }// end else if
            k++;
            return;
        }// end function

        public function thumbOver(param1:Event) : void
        {
            thumbTWEEN = new Tween(param1.target, "alpha", Strong.easeOut, 1, 0, 1, true);
            return;
        }// end function

        public function fullSizeImageLoaded(param1:TweenEvent) : void
        {
            var _loc_2:Matrix;
            var _loc_3:Number;
            var _loc_4:Number;
            var _loc_5:Number;
            var _loc_6:Number;
            tweenPreloaderIn.removeEventListener(TweenEvent.MOTION_FINISH, fullSizeImageLoaded);
            removeChild(getChildByName("bgCircle"));
            rawWidth = eXternalImage.bitmapData.width;
            rawHeight = eXternalImage.bitmapData.height;
            maximumWidth = Rsw - 100;
            maximumHeight = Rsh - 235;
            if (maximumWidth > rawWidth)
            {
                maximumWidth = rawWidth;
            }// end if
            if (maximumHeight > rawHeight)
            {
                maximumHeight = rawHeight;
                getNuY = true;
            }// end if
            _loc_2 = new Matrix();
            _loc_3 = 1;
            _loc_4 = 1;
            nx = maximumWidth / rawWidth;
            ny = maximumHeight / rawHeight;
            scale = Math.min(nx, ny);
            nuWidth = rawWidth * scale;
            nuHeight = rawHeight * scale;
            _loc_2.scale(scale, scale);
            scaledImage = new BitmapData(nuWidth, nuHeight);
            scaledImage.draw(eXternalImage.bitmapData, _loc_2);
            fullImageY = 114;
            if (getNuY == false)
            {
                fullImageY = 114;
                fullImagePCC_Y = 104;
            }// end if
            if (getNuY)
            {
                _loc_5 = (Rsh - 235 - rawHeight) / 2 + 114;
                _loc_6 = (Rsh - 235 - rawHeight) / 2 + 104;
                fullImageY = _loc_5;
                fullImagePCC_Y = _loc_6;
                getNuY = false;
            }// end if
            nuPCC_X = (Rsw - nuWidth) / 2 - 10;
            pcYtween = new Tween(pcc, "y", Bounce.easeOut, pcc.y, fullImagePCC_Y, 1, true);
            pcXtween = new Tween(pcc, "x", Bounce.easeOut, pcc.x, nuPCC_X, 1, true);
            pcWtween = new Tween(pcc, "width", Bounce.easeOut, pcc.width, nuWidth + 20, 1, true);
            pcHtween = new Tween(pcc, "height", Bounce.easeOut, pcc.height, nuHeight + 20, 1, true);
            pcHtween.addEventListener(TweenEvent.MOTION_FINISH, drawImage, false, 0, true);
            return;
        }// end function

        public function resizeHandler(param1:Event) : void
        {
            var _loc_2:Matrix;
            var _loc_3:Number;
            var _loc_4:Number;
            var _loc_5:Number;
            var _loc_6:Number;
            Rsw = stage.stageWidth;
            Rsh = stage.stageHeight;
            createTCS();
            createMask();
            rawWidth = eXternalImage.bitmapData.width;
            rawHeight = eXternalImage.bitmapData.height;
            maximumWidth = Rsw - 100;
            maximumHeight = Rsh - 235;
            if (maximumWidth > rawWidth)
            {
                maximumWidth = rawWidth;
            }// end if
            if (maximumHeight > rawHeight)
            {
                maximumHeight = rawHeight;
                getNuY = true;
            }// end if
            _loc_2 = new Matrix();
            _loc_3 = 1;
            _loc_4 = 1;
            nx = maximumWidth / rawWidth;
            ny = maximumHeight / rawHeight;
            scale = Math.min(nx, ny);
            nuWidth = rawWidth * scale;
            nuHeight = rawHeight * scale;
            _loc_2.scale(scale, scale);
            scaledImage = new BitmapData(nuWidth, nuHeight);
            scaledImage.draw(eXternalImage.bitmapData, _loc_2);
            fullImageY = 114;
            if (getNuY == false)
            {
                fullImageY = 114;
                fullImagePCC_Y = 104;
            }// end if
            if (getNuY)
            {
                _loc_5 = (Rsh - 235 - rawHeight) / 2 + 114;
                _loc_6 = (Rsh - 235 - rawHeight) / 2 + 104;
                fullImageY = _loc_5;
                fullImagePCC_Y = _loc_6;
                getNuY = false;
            }// end if
            pcc.x = (Rsw - nuWidth) / 2 - 10;
            pcc.y = fullImagePCC_Y;
            pcc.width = nuWidth + 20;
            pcc.height = nuHeight + 20;
            imageContainer.graphics.clear();
            imageContainer.graphics.beginBitmapFill(scaledImage);
            imageContainer.graphics.drawRect(0, 0, nuWidth, nuHeight);
            imageContainer.graphics.endFill();
            imageContainer.x = (Rsw - nuWidth) / 2;
            imageContainer.y = fullImageY;
            return;
        }// end function

    }
}
