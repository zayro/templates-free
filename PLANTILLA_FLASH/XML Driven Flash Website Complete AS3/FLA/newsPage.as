package 
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;

    dynamic public class newsPage extends MovieClip
    {
        public var pcsHtween:Tween;
        public var xml:XML;
        public var Rsh:Number;
        public var Rsw:Number;
        public var PageMask:Sprite;
        public var PageContentSprite:Sprite;
        public var hzScrub:horizScrolla;
        public var i:uint;
        public var pcAtween:Tween;
        public var pcsYtween:Tween;
        public var percentage:Number;
        public var pcs_H:Number;
        public var pcs_W:Number;
        public var pcs_X:Number;
        public var pcs_Y:Number;
        public var pageMask_border:maskBorder;
        public var tweenIT:Tween;
        public var article:XMLList;
        public var pMskBorder_H:Number;
        public var pMskBorder_Y:Number;
        public var pMskBorder_W:Number;
        public var pMskBorder_X:Number;
        public var pcsWtween:Tween;
        public var rectangle:Rectangle;
        public var pMsk_H:Number;
        public var pMsk_X:Number;
        public var pMsk_Y:Number;
        public var target:MovieClip;
        public var pMsk_W:Number;
        public var pageScrollBs:pageScrollBase;
        public var xmlURL:String;
        public var pc:newsContent;
        public var pcsXtween:Tween;

        public function newsPage()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function createMask() : void
        {
            pMsk_X = 0;
            pMsk_Y = Rsh / 2 - 370 / 2;
            pMsk_W = Rsw;
            pMsk_H = 400;
            pMskBorder_Y = Rsh / 2 - 370 / 2;
            pMskBorder_W = Rsw;
            pMskBorder_H = 400;
            pageMask_border.x = pMskBorder_X;
            pageMask_border.y = pMskBorder_Y;
            pageMask_border.width = pMskBorder_W;
            pageMask_border.height = pMskBorder_H;
            PageMask.graphics.clear();
            PageMask.graphics.beginFill(16777215, 1);
            PageMask.graphics.drawRect(pMsk_X, pMsk_Y, pMsk_W, pMsk_H);
            PageMask.graphics.endFill();
            return;
        }// end function

        public function getContent() : void
        {
            var _loc_1:*;
            var _loc_2:MovieClip;
            _loc_1 = new URLLoader();
            _loc_1.load(new URLRequest(xmlURL));
            _loc_1.addEventListener(Event.COMPLETE, xmlFinishedLoading);
            pc.x = 800;
            pc.y = Rsh / 2 - 370 / 2;
            pc.name = "pcname";
            PageContentSprite.addChild(pc);
            _loc_2 = MovieClip(PageContentSprite.getChildByName("pcname"));
            _loc_2.kickitoff(xmlURL);
            pc.mask = PageMask;
            addChild(pageScrollBs);
            addChild(hzScrub);
            return;
        }// end function

        public function createPCS() : void
        {
            PageContentSprite.graphics.clear();
            PageContentSprite.graphics.beginFill(0, 0);
            PageContentSprite.graphics.drawRect(pcs_X, pcs_Y, pcs_W, pcs_H);
            PageContentSprite.graphics.endFill();
            return;
        }// end function

        public function updatePCSdimensions() : void
        {
            pcs_Y = Rsh / 2 - 370 / 2;
            createPCS();
            return;
        }// end function

        function frame1()
        {
            Rsw = stage.stageWidth;
            Rsh = stage.stageHeight;
            PageContentSprite = new Sprite();
            addChild(PageContentSprite);
            PageMask = new Sprite();
            addChild(PageMask);
            pc = new newsContent();
            pageScrollBs = new pageScrollBase();
            pageScrollBs.x = Rsw / 2 - pageScrollBs.width / 2;
            pageScrollBs.y = Rsh - 63;
            hzScrub = new horizScrolla();
            hzScrub.x = pageScrollBs.x + 10;
            hzScrub.y = Rsh - 70;
            hzScrub.buttonMode = true;
            hzScrub.addEventListener(MouseEvent.MOUSE_DOWN, startMove, false, 0, true);
            pageMask_border = new maskBorder();
            addChild(pageMask_border);
            stage.addEventListener(Event.RESIZE, this.resizeHandler);
            pageLoadAnimation();
            rectangle = new Rectangle(pageScrollBs.x + 10, hzScrub.y, pageScrollBs.width - 87, 0);
            percentage = 0;
            return;
        }// end function

        public function pageLoadAnimation() : void
        {
            pcs_X = 0;
            pcs_Y = Rsh / 2 - 370 / 2;
            pcs_W = 4000;
            pcs_H = 400;
            PageContentSprite.graphics.beginFill(0, 0);
            PageContentSprite.graphics.drawRect(pcs_X, pcs_Y, pcs_W, pcs_H);
            PageContentSprite.graphics.endFill();
            getMask();
            return;
        }// end function

        public function scrollContent(param1:Event) : void
        {
            var _loc_2:Number;
            percentage = (hzScrub.x - rectangle.x) / rectangle.width;
            _loc_2 = pc.width - Rsw;
            tweenIT = new Tween(pc, "x", Regular.easeOut, pc.x, percentage * (-_loc_2) + 700, 1, true);
            return;
        }// end function

        public function stopMove(param1:Event) : void
        {
            target.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, scrollContent);
            stage.removeEventListener(MouseEvent.MOUSE_UP, stopMove);
            return;
        }// end function

        public function updatepcdimensions() : void
        {
            pc.y = Rsh / 2 - 370 / 2;
            return;
        }// end function

        public function xmlFinishedLoading(param1:Event) : void
        {
            xml = new XML(param1.target.data);
            article = xml.article;
            return;
        }// end function

        public function getMask() : void
        {
            createMask();
            getContent();
            return;
        }// end function

        public function startMove(param1:Event) : void
        {
            param1.target.startDrag(false, rectangle);
            target = MovieClip(param1.target);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, scrollContent);
            stage.addEventListener(MouseEvent.MOUSE_UP, stopMove);
            return;
        }// end function

        public function resizeHandler(param1:Event) : void
        {
            Rsw = stage.stageWidth;
            Rsh = stage.stageHeight;
            pageScrollBs.x = Rsw / 2 - pageScrollBs.width / 2;
            pageScrollBs.y = Rsh - 63;
            rectangle.x = pageScrollBs.x + 10;
            rectangle.y = Rsh - 70;
            hzScrub.x = rectangle.x + rectangle.width * percentage;
            hzScrub.y = Rsh - 70;
            updatePCSdimensions();
            updatepcdimensions();
            createMask();
            return;
        }// end function

    }
}
