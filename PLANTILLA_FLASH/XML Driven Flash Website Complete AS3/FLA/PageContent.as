package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class PageContent extends MovieClip
    {
        public var tMsk_W:Number;
        public var tMsk_X:Number;
        public var tMsk_Y:Number;
        public var xml:XML;
        public var imageUrl:String;
        public var thumbTWEEN:Tween;
        public var MemberIndex:Number;
        public var thumbContentSprite:Sprite;
        public var i:uint;
        public var cp:ContentPanel;
        public var eXternalImage:Bitmap;
        public var firstBigImageLoad:Boolean;
        public var tcs_H:Number;
        public var tcs_X:Number;
        public var tcs_Y:Number;
        public var tcs_W:Number;
        public var PageTitle:XMLList;
        public var mouseStartingX:Number;
        public var nuGroup:Boolean;
        public var tweenPreloaderOut:Tween;
        public var thumbMask_border:maskBorder;
        public var tr1H:Tween;
        public var tr1W:Tween;
        public var tr1X:Tween;
        public var tr1Y:Tween;
        public var imageLoader:Loader;
        public var triMask:Sprite;
        public var tr2H:Tween;
        public var TPS:thumbPanelScroll;
        public var thumbx:Number;
        public var tr2W:Tween;
        public var tr2X:Tween;
        public var tr2Y:Tween;
        public var thumby:Number;
        public var imageContainer:Sprite;
        public var memberTransitionInProgress:Boolean;
        public var bgCircle:bigCircle;
        public var cpH:Tween;
        public var bmp:Bitmap;
        public var cpW:Tween;
        public var cpX:Tween;
        public var cpY:Tween;
        public var transitionInProgress:Boolean;
        public var tri:triangles;
        public var GroupIndex:Number;
        public var thumbUrl:String;
        public var thumbMask:Sprite;
        public var Groups:XMLList;
        public var tMsk_H:Number;

        public function PageContent()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function createMask() : void
        {
            thumbMask.graphics.clear();
            thumbMask.graphics.beginFill(0, 1);
            thumbMask.graphics.drawRect(tMsk_X, tMsk_Y, tMsk_W, tMsk_H);
            thumbMask.graphics.endFill();
            createThumbnail();
            return;
        }// end function

        public function createThumb(param1:Event) : void
        {
            var _loc_2:thumbHolder2;
            param1.target.removeEventListener(Event.COMPLETE, createThumb);
            bmp = new Bitmap();
            bmp.bitmapData = Bitmap(param1.target.content).bitmapData;
            bmp.y = thumby;
            _loc_2 = new thumbHolder2();
            bmp.x = thumbx;
            bmp.alpha = 1;
            bmp.cacheAsBitmap = true;
            _loc_2.x = thumbx;
            _loc_2.alpha = 1;
            _loc_2.y = thumby;
            _loc_2.data = i;
            _loc_2.buttonMode = true;
            _loc_2.mouseChildren = true;
            _loc_2.addEventListener(MouseEvent.CLICK, getMember, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OVER, thumbOver, false, 0, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_OUT, thumbOut, false, 0, true);
            TPS.addChild(bmp);
            TPS.addChild(_loc_2);
            thumbx = thumbx + 86;
            i++;
            MemberIndex++;
            createThumbnail();
            return;
        }// end function

        public function createFullSize(param1:Event) : void
        {
            imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, createFullSize);
            if (firstBigImageLoad)
            {
                createthumbContentSprite();
                createMask();
                firstBigImageLoad = false;
            }// end if
            eXternalImage.bitmapData = Bitmap(param1.target.content).bitmapData;
            fullSizeImageLoaded(null);
            return;
        }// end function

        public function createthumbContentSprite() : void
        {
            thumbContentSprite.graphics.clear();
            thumbContentSprite.graphics.beginFill(16777215, 0);
            thumbContentSprite.graphics.drawRect(tcs_X, tcs_Y, tcs_W, tcs_H);
            thumbContentSprite.graphics.endFill();
            return;
        }// end function

        function frame1()
        {
            GroupIndex = 0;
            MemberIndex = 0;
            thumbx = 0;
            thumby = 0;
            i = 0;
            tMsk_X = 185;
            tMsk_Y = 382;
            tMsk_W = 477;
            tMsk_H = 75;
            tcs_X = 185;
            tcs_Y = 382;
            tcs_W = 477;
            tcs_H = 75;
            firstBigImageLoad = true;
            transitionInProgress = true;
            memberTransitionInProgress = false;
            nuGroup = false;
            eXternalImage = new Bitmap();
            cp = new ContentPanel();
            tri = new triangles();
            bgCircle = new bigCircle();
            imageContainer = new Sprite();
            thumbContentSprite = new Sprite();
            addChild(thumbContentSprite);
            thumbMask = new Sprite();
            addChild(thumbMask);
            thumbMask_border = new maskBorder();
            thumbMask_border.x = 185;
            thumbMask_border.y = 382;
            thumbMask_border.width = 477;
            thumbMask_border.height = 75;
            addChild(thumbMask_border);
            thumbContentSprite.mask = thumbMask;
            TPS = new thumbPanelScroll();
            TPS.x = 185;
            TPS.y = 382;
            thumbContentSprite.addChild(TPS);
            triMask = new Sprite();
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

        public function nuPanel(param1) : void
        {
            var _loc_2:int;
            var _loc_3:MovieClip;
            if (transitionInProgress == true)
            {
                return;
            }// end if
            transitionInProgress = true;
            GroupIndex = param1;
            thumbContentSprite.removeEventListener(MouseEvent.MOUSE_OVER, tcsOver);
            thumbContentSprite.removeEventListener(Event.ENTER_FRAME, letsStartMoving);
            thumbContentSprite.removeEventListener(MouseEvent.MOUSE_MOVE, tcsMOVE);
            _loc_2 = TPS.numChildren;
            while (_loc_2--)
            {
                // label
                if (TPS.getChildAt(_loc_2) is MovieClip)
                {
                    _loc_3 = MovieClip(TPS.getChildAt(_loc_2));
                    _loc_3.removeEventListener(MouseEvent.CLICK, getMember);
                    _loc_3.removeEventListener(MouseEvent.MOUSE_OVER, thumbOver);
                    _loc_3.removeEventListener(MouseEvent.MOUSE_OUT, thumbOut);
                    TPS.removeChild(_loc_3);
                    _loc_3 = null;
                    continue;
                }// end if
                Bitmap(TPS.getChildAt(_loc_2)).bitmapData.dispose();
                TPS.removeChild(TPS.getChildAt(_loc_2));
            }// end while
            MemberIndex = 0;
            nuGroup = true;
            transition();
            return;
        }// end function

        public function transitionStep2(param1:TweenEvent) : void
        {
            eXternalImage.bitmapData.dispose();
            getLargeImage(null);
            tr1H = new Tween(tri, "y", Bounce.easeOut, -369, 0, 1, true);
            return;
        }// end function

        public function loadContent() : void
        {
            cp.y = 369 / 2;
            cp.x = 439;
            addChild(cp);
            cpW = new Tween(cp, "width", Strong.easeOut, 1, 879, 1, true);
            cpX = new Tween(cp, "x", Strong.easeOut, 439, 0, 1, true);
            cpX.addEventListener(TweenEvent.MOTION_FINISH, finishTweeningCP);
            return;
        }// end function

        public function getLargeImage(param1:Event) : void
        {
            var _loc_2:URLRequest;
            tri.triline.visible = true;
            imageUrl = Groups[GroupIndex].member[MemberIndex].fullIMAGE.text();
            tri.memberName.text = Groups[GroupIndex].member[MemberIndex].name.text() + " - " + Groups[GroupIndex].member[MemberIndex].title.text();
            tri.bigMemberName.text = Groups[GroupIndex].member[MemberIndex].name.text();
            tri.memberBio.text = Groups[GroupIndex].member[MemberIndex].bio.text();
            tri.memberContact.text = "Contact " + Groups[GroupIndex].member[MemberIndex].name.text();
            tri.memberPhone.text = Groups[GroupIndex].member[MemberIndex].phone.text();
            tri.memberCell.text = Groups[GroupIndex].member[MemberIndex].cell.text();
            tri.memberEmail.text = Groups[GroupIndex].member[MemberIndex].email.text();
            tri.memberWeb.text = Groups[GroupIndex].member[MemberIndex].web.text();
            _loc_2 = new URLRequest(imageUrl);
            imageLoader = new Loader();
            imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, createFullSize);
            imageLoader.load(_loc_2);
            return;
        }// end function

        public function tcsOver(param1:MouseEvent) : void
        {
            thumbContentSprite.addEventListener(Event.ENTER_FRAME, letsStartMoving);
            mouseStartingX = mouseX;
            return;
        }// end function

        public function menuItemOut(param1:Event) : void
        {
            param1.target.menuLabel2.text = "";
            param1.target.menuLabel.text = Groups.name.text()[param1.target.data];
            return;
        }// end function

        public function menuItemOver(param1:Event) : void
        {
            param1.target.menuLabel.text = "";
            param1.target.menuLabel2.text = Groups.name.text()[param1.target.data];
            return;
        }// end function

        public function finishTweeningCP(param1:TweenEvent) : void
        {
            cpX.removeEventListener(TweenEvent.MOTION_FINISH, finishTweeningCP);
            cpH = new Tween(cp, "height", Strong.easeOut, 1, 369, 0.5, true);
            cpY = new Tween(cp, "y", Strong.easeOut, cp.y, 0, 0.5, true);
            cpH.addEventListener(TweenEvent.MOTION_FINISH, getTrianlges);
            return;
        }// end function

        public function createThumbnail() : void
        {
            var _loc_1:Number;
            var _loc_2:String;
            var _loc_3:URLRequest;
            var _loc_4:Loader;
            thumbContentSprite.x = 0;
            _loc_1 = Groups[GroupIndex].member.length();
            if (i < _loc_1)
            {
                _loc_2 = Groups[GroupIndex].member[MemberIndex].thumbURL.text();
                _loc_3 = new URLRequest(_loc_2);
                _loc_4 = new Loader();
                _loc_4.contentLoaderInfo.addEventListener(Event.COMPLETE, createThumb);
                _loc_4.load(_loc_3);
            }
            else
            {
                thumbContentSprite.addEventListener(MouseEvent.MOUSE_OVER, tcsOver);
                i = 0;
                thumbx = 0;
                transitionInProgress = false;
            }// end else if
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            PageTitle = xml.title;
            Groups = xml.teamGroup;
            loadContent();
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

        public function transition() : void
        {
            tri.memberName.text = "";
            tr1H = new Tween(tri, "y", Regular.easeOut, tri.y, 369, 0.5, true);
            tr1H.addEventListener(TweenEvent.MOTION_FINISH, transitionStep2);
            return;
        }// end function

        public function getMember(param1:Event) : void
        {
            if (memberTransitionInProgress)
            {
                return;
            }// end if
            memberTransitionInProgress = true;
            MemberIndex = param1.target.data;
            transition();
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
                if (thumbContentSprite.x > tMsk_W - TPS.width)
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
            if (mouseX > tcs_X + 376)
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

        public function thumbOver(param1:Event) : void
        {
            thumbTWEEN = new Tween(param1.target, "alpha", Strong.easeOut, 1, 0, 1, true);
            return;
        }// end function

        public function getTrianlges(param1:TweenEvent) : void
        {
            cpH.removeEventListener(TweenEvent.MOTION_FINISH, getTrianlges);
            tri.x = 0;
            tri.y = 0;
            triMask.graphics.clear();
            triMask.graphics.beginFill(16777215, 1);
            triMask.graphics.drawRect(0, 0, 879, 369);
            triMask.graphics.endFill();
            tri.mask = triMask;
            addChild(tri);
            addChild(triMask);
            tri.triline.visible = false;
            preloaderFirst();
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

        public function preloaderFirst() : void
        {
            getLargeImage(null);
            return;
        }// end function

        public function fullSizeImageLoaded(param1:TweenEvent) : void
        {
            imageContainer.graphics.beginBitmapFill(eXternalImage.bitmapData);
            imageContainer.graphics.drawRect(0, 0, eXternalImage.width, eXternalImage.height);
            imageContainer.graphics.endFill();
            imageContainer.x = 461;
            imageContainer.y = 56;
            tri.addChild(imageContainer);
            if (nuGroup)
            {
                createThumbnail();
                nuGroup = false;
            }// end if
            memberTransitionInProgress = false;
            return;
        }// end function

    }
}
