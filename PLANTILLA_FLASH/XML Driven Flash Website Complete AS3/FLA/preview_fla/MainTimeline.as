package preview_fla
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import flash.ui.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var extraHeaderButtons:extraHeaderBtns;
        public var tweenPlaya:Tween;
        public var tweenOutPage:Tween;
        public var loader:Object;
        public var xml:XML;
        public var footerY:Number;
        public var navButton:navBtn;
        public var subBtnIndex:int;
        public var elementLoader:Loader;
        public var numberOfBgImages:int;
        public var bg:String;
        public var xmlConfig:XML;
        public var initialLoad:Boolean;
        public var dimWallPaper:Sprite;
        public var btn:DisplayObject;
        public var k:int;
        public var oldSubNavLoaded:int;
        public var vizTween:Tween;
        public var page:XMLList;
        public var header:String;
        public var closePlaya:closeVideo;
        public var volumeLevel:Number;
        public var subNavLoaded:Boolean;
        public var subNavTweenIn:Tween;
        public var tiledFooter:Sprite;
        public var pageUtilityType:String;
        public var bgLoader:Loader;
        public var subNav:String;
        public var tweenBlog:Tween;
        public var dimTween:Tween;
        public var totalSubPages:int;
        public var totalImages:int;
        public var totalPages:int;
        public var elementBMP:Bitmap;
        public var lastSubClicked:Number;
        public var headerLoader:Loader;
        public var tweenSubSprite:Tween;
        public var oldPageLoaded:String;
        public var oldPageIndex:Number;
        public var introAssets:String;
        public var element:String;
        public var bgImages:XMLList;
        public var externalAssets:String;
        public var tweenBlogMask:Tween;
        public var playaHeight:int;
        public var playlistOpen:Boolean;
        public var tweenInProgress:Boolean;
        public var tiledBackground:Sprite;
        public var pageXmlPath:String;
        public var subPages:XMLList;
        public var footerButtons:footerBtns;
        public var vizONoff:Boolean;
        public var url:URLRequest;
        public var btnsToTweenOut:int;
        public var backgroundBMP:Bitmap;
        public var stillRemovingLastPage:Boolean;
        public var pageIndex:int;
        public var randomBackgroundImage:int;
        public var footerLoader:Loader;
        public var StageWidth:Number;
        public var target:DisplayObject;
        public var footer:String;
        public var currentSubNav:int;
        public var buttonHolder:MovieClip;
        public var subNavSprite:Sprite;
        public var StageHeight:Number;
        public var logoLoader:Loader;
        public var logo:String;
        public var tiledHeader:Sprite;
        public var playa:player;
        public var currentPageLoaded:String;
        public var navigationStructure:String;
        public var headerBMP:Bitmap;
        public var subNavButton:subNavBtn;
        public var logoBMP:Bitmap;
        public var elementDesign:Sprite;
        public var subBtnX:Number;
        public var footerBMP:Bitmap;
        public var configLoader:Object;

        public function MainTimeline()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function closePlaylist(param1:MouseEvent) : void
        {
            playlistOpen = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, closeBtnFollowMouse);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToHide);
            removeChild(getChildByName("closePlaya"));
            Mouse.show();
            tweenPlaya = new Tween(playa, "y", Regular.easeOut, playa.y, -900, 0.8, true);
            dimTween = new Tween(dimWallPaper, "alpha", Strong.easeOut, 0.9, 0, 2, true);
            dimTween.addEventListener(TweenEvent.MOTION_FINISH, swapDim, false, 0, true);
            return;
        }// end function

        public function swapDim(param1:TweenEvent) : void
        {
            setChildIndex(dimWallPaper, 2);
            return;
        }// end function

        public function elementLoaded(param1:Event) : void
        {
            elementLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, elementLoaded);
            elementLoader = null;
            elementBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            elementDesign.graphics.clear();
            elementDesign.graphics.beginBitmapFill(elementBMP.bitmapData);
            elementDesign.graphics.drawRect(0, 0, elementBMP.width, elementBMP.height);
            elementDesign.graphics.endFill();
            elementDesign.x = StageWidth - elementBMP.width;
            return;
        }// end function

        public function loadFooter() : void
        {
            url = new URLRequest(footer);
            footerLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, footerLoaded, false, 0, true);
            footerLoader.load(url);
            return;
        }// end function

        public function whenToHide(param1:Event) : void
        {
            var _loc_2:Rectangle;
            _loc_2 = playa.playaBorder.getBounds(this);
            if (mouseX > _loc_2.left && mouseX < _loc_2.right && mouseY > _loc_2.top && mouseY < _loc_2.bottom)
            {
                closePlaya.buttonMode = false;
                closePlaya.visible = false;
                Mouse.show();
                stage.addEventListener(MouseEvent.MOUSE_MOVE, whenToShow);
            }// end if
            return;
        }// end function

        public function removeBtns() : void
        {
            var _loc_1:int;
            btnsToTweenOut = page[oldSubNavLoaded].subPage.length();
            _loc_1 = 0;
            while (_loc_1 < btnsToTweenOut)
            {
                // label
                btn = getChildByName(oldPageLoaded + _loc_1.toString());
                removeChild(btn);
                btn = null;
                _loc_1++;
            }// end while
            return;
        }// end function

        public function loadContact()
        {
            var _loc_1:*;
            _loc_1 = new contactPage();
            _loc_1.name = "contact";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function loadTeam()
        {
            var _loc_1:meetTHEcrew;
            _loc_1 = new meetTHEcrew();
            _loc_1.name = "team";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function getMainNavButtons() : void
        {
            configLoader.load(new URLRequest(navigationStructure));
            configLoader.addEventListener(Event.COMPLETE, configLoaded, false, 0, true);
            return;
        }// end function

        public function updateFooterVolumeSlider(param1) : void
        {
            var _loc_2:int;
            var _loc_3:String;
            volumeLevel = param1;
            _loc_2 = volumeLevel * 100;
            _loc_3 = _loc_2.toString() + "%";
            footerButtons.volScrub.x = footerButtons.volBase.x + volumeLevel * 60;
            footerButtons.volScrub.tool.dynText.text = _loc_3;
            footerButtons.volGlow.width = volumeLevel * 60;
            return;
        }// end function

        function frame1()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            externalAssets = "./site_configuration/bgImages.xml";
            navigationStructure = "./site_configuration/config.xml";
            introAssets = "./site_configuration/intro.xml";
            backgroundBMP = new Bitmap();
            headerBMP = new Bitmap();
            footerBMP = new Bitmap();
            logoBMP = new Bitmap();
            extraHeaderButtons = new extraHeaderBtns();
            footerButtons = new footerBtns();
            buttonHolder = new MovieClip();
            vizONoff = false;
            lastSubClicked = 0;
            tweenInProgress = false;
            initialLoad = true;
            subNavLoaded = false;
            playlistOpen = false;
            footerY = Math.round(StageHeight - 33);
            pageIndex = 0;
            k = 0;
            loader = new URLLoader();
            configLoader = new URLLoader();
            footerLoader = new Loader();
            headerLoader = new Loader();
            logoLoader = new Loader();
            elementBMP = new Bitmap();
            tiledBackground = new Sprite();
            tiledBackground.x = 0;
            tiledBackground.y = 0;
            addChild(tiledBackground);
            dimWallPaper = new Sprite();
            dimWallPaper.alpha = 0;
            addChild(dimWallPaper);
            playa = new player();
            playa.alpha = 1;
            playa.y = -900;
            playa.x = StageWidth / 2 - playa.width / 2;
            playa.name = "playa";
            addChild(playa);
            subNavSprite = new Sprite();
            subNavSprite.graphics.beginFill(11250603, 0);
            subNavSprite.graphics.drawRect(0, 0, StageWidth, 25);
            subNavSprite.graphics.endFill();
            subNavSprite.alpha = 0;
            subNavSprite.y = 0;
            addChild(subNavSprite);
            tiledHeader = new Sprite();
            tiledHeader.x = 0;
            tiledHeader.y = 0;
            addChild(tiledHeader);
            elementDesign = new Sprite();
            addChild(elementDesign);
            tiledFooter = new Sprite();
            tiledFooter.y = footerY;
            tiledFooter.name = "tiledFooter";
            addChild(tiledFooter);
            target = getChildByName("tiledFooter");
            closePlaya = new closeVideo();
            closePlaya.name = "closePlaya";
            closePlaya.selectable = false;
            closePlaya.buttonMode = true;
            closePlaya.mouseChildren = false;
            closePlaya.addEventListener(MouseEvent.CLICK, closePlaylist);
            loader.load(new URLRequest(externalAssets));
            loader.addEventListener(Event.COMPLETE, xmlLoaded, false, 0, true);
            footerButtons.playlist.addEventListener(MouseEvent.CLICK, playlist);
            extraHeaderButtons.bg1.addEventListener(MouseEvent.CLICK, loadNewBg);
            extraHeaderButtons.bg2.addEventListener(MouseEvent.CLICK, loadNewBg);
            extraHeaderButtons.bg3.addEventListener(MouseEvent.CLICK, loadNewBg);
            extraHeaderButtons.fs.addEventListener(MouseEvent.CLICK, fullScreen);
            var _loc_1:Boolean;
            extraHeaderButtons.fs.buttonMode = true;
            var _loc_1:* = _loc_1;
            extraHeaderButtons.bg3.buttonMode = _loc_1;
            var _loc_1:* = _loc_1;
            extraHeaderButtons.bg2.buttonMode = _loc_1;
            extraHeaderButtons.bg1.buttonMode = _loc_1;
            var _loc_1:Boolean;
            extraHeaderButtons.fs.mouseChildren = false;
            var _loc_1:* = _loc_1;
            extraHeaderButtons.bg3.mouseChildren = _loc_1;
            var _loc_1:* = _loc_1;
            extraHeaderButtons.bg2.mouseChildren = _loc_1;
            extraHeaderButtons.bg1.mouseChildren = _loc_1;
            extraHeaderButtons.bg1.data = 4;
            extraHeaderButtons.bg2.data = 5;
            extraHeaderButtons.bg3.data = 6;
            stillRemovingLastPage = false;
            return;
        }// end function

        public function bgLoaded(param1:Event) : void
        {
            bgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bgLoaded);
            bgLoader = null;
            backgroundBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            tiledBackground.graphics.clear();
            tiledBackground.graphics.beginBitmapFill(backgroundBMP.bitmapData);
            tiledBackground.graphics.drawRect(0, 0, StageWidth, StageHeight);
            tiledBackground.graphics.endFill();
            if (initialLoad)
            {
                dimWallPaper.graphics.clear();
                dimWallPaper.graphics.beginFill(0, 1);
                dimWallPaper.graphics.drawRect(0, 0, StageWidth, StageHeight);
                dimWallPaper.graphics.endFill();
                loadHeader();
            }// end if
            return;
        }// end function

        public function loadNewBg(param1:Event) : void
        {
            bg = bgImages[param1.target.data].url;
            loadBg();
            return;
        }// end function

        public function headerLoaded(param1:Event) : void
        {
            headerLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, headerLoaded);
            headerLoader = null;
            headerBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            tiledHeader.graphics.clear();
            tiledHeader.graphics.beginBitmapFill(headerBMP.bitmapData);
            tiledHeader.graphics.drawRect(0, 0, StageWidth, headerBMP.height);
            tiledHeader.graphics.endFill();
            loadLogo();
            loadElement();
            return;
        }// end function

        public function swapDepthsFooter() : void
        {
            setChildIndex(footerButtons, numChildren--);
            return;
        }// end function

        public function loadPhotos()
        {
            var _loc_1:imageGallery;
            _loc_1 = new imageGallery();
            _loc_1.name = "photos";
            addChild(_loc_1);
            _loc_1.xmlPath = pageXmlPath;
            return;
        }// end function

        public function loadHome()
        {
            var _loc_1:*;
            _loc_1 = new homePage();
            _loc_1.name = "home";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function init() : void
        {
            stage.addEventListener(Event.RESIZE, resizeListener);
            extraHeaderButtons.x = StageWidth - 170;
            extraHeaderButtons.y = StageHeight - 29;
            addChild(extraHeaderButtons);
            footerButtons.x = 10;
            footerButtons.y = StageHeight - 26;
            addChild(footerButtons);
            resizeListener(null);
            getMainNavButtons();
            loadIntro();
            return;
        }// end function

        public function loadIntro()
        {
            var _loc_1:*;
            _loc_1 = new introVid();
            _loc_1.name = "intro";
            addChild(_loc_1);
            _loc_1.xmlURL = "site_configuration/intro.xml";
            currentPageLoaded = "intro";
            return;
        }// end function

        public function loadHeader() : void
        {
            url = new URLRequest(header);
            headerLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, headerLoaded, false, 0, true);
            headerLoader.load(url);
            return;
        }// end function

        public function getNextSubNavBtn(param1:TweenEvent)
        {
            var _loc_2:String;
            if (k == 0)
            {
                subNavButton.gotoAndStop(2);
                _loc_2 = subNavButton.btnText.text;
                subNavButton.btnText.text = "";
                subNavButton.btnTextOver.text = _loc_2;
                subNavButton.removeEventListener(MouseEvent.MOUSE_OVER, subNavBtnOverHandler);
                subNavButton.removeEventListener(MouseEvent.MOUSE_OUT, subNavBtnOutHandler);
            }// end if
            subBtnX = subBtnX + 131;
            k++;
            loadNewSubNavBtns(null);
            return;
        }// end function

        public function removePage(param1:TweenEvent) : void
        {
            tweenOutPage.removeEventListener(TweenEvent.MOTION_FINISH, removePage);
            removeChild(getChildByName(oldPageLoaded));
            stillRemovingLastPage = false;
            return;
        }// end function

        public function xmlLoaded(param1:Event) : void
        {
            loader.removeEventListener(Event.COMPLETE, xmlLoaded);
            loader = null;
            xml = new XML(param1.target.data);
            bgImages = xml.image;
            totalImages = xml.image.length();
            numberOfBgImages = totalImages - 4;
            randomBackgroundImage = Math.floor(Math.random() * numberOfBgImages + 4);
            bg = bgImages[randomBackgroundImage].url;
            header = bgImages[0].url;
            footer = bgImages[1].url;
            logo = bgImages[2].url;
            element = bgImages[3].url;
            loadBg();
            return;
        }// end function

        public function loadElement() : void
        {
            url = new URLRequest(element);
            elementLoader = new Loader();
            elementLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, elementLoaded, false, 0, true);
            elementLoader.load(url);
            return;
        }// end function

        public function muteAudio() : void
        {
            playa.volumeLevel = 0;
            playa.CHNL.soundTransform = new SoundTransform(playa.volumeLevel);
            footerButtons.volScrub.x = footerButtons.volBase.x;
            footerButtons.volScrub.tool.dynText.text = "0%";
            footerButtons.volGlow.width = 0;
            playa.slider.x = playa.volumeSlider.x;
            playa.volGLOW.width = 0;
            return;
        }// end function

        public function loadFeatures()
        {
            var _loc_1:*;
            _loc_1 = new featuresPage();
            _loc_1.name = "features";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function navBtnOutHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnTextOver.text;
            if (_loc_2 == "")
            {
                _loc_2 = param1.target.btnText.text;
            }// end if
            param1.target.btnTextOver.text = "";
            param1.target.btnText.text = _loc_2;
            param1.target.gotoAndPlay(18);
            return;
        }// end function

        public function navBtnClickHandler(param1:Event) : void
        {
            var _loc_2:int;
            var _loc_3:MovieClip;
            var _loc_4:String;
            _loc_2 = param1.target.data;
            pageUtilityType = page[_loc_2].utilityType;
            if (tweenInProgress == true || stillRemovingLastPage == true)
            {
                return;
            }// end if
            oldPageIndex = pageIndex;
            pageIndex = _loc_2;
            lastSubClicked = 0;
            _loc_3 = MovieClip(buttonHolder.getChildByName("nav" + oldPageIndex.toString()));
            _loc_3.gotoAndStop(1);
            _loc_3.addEventListener(MouseEvent.MOUSE_OVER, navBtnOverHandler);
            _loc_3.addEventListener(MouseEvent.MOUSE_OUT, navBtnOutHandler);
            _loc_4 = _loc_3.btnTextClicked.text;
            _loc_3.btnTextClicked.text = "";
            _loc_3.btnText.text = _loc_4;
            param1.target.gotoAndStop(35);
            param1.target.removeEventListener(MouseEvent.MOUSE_OVER, navBtnOverHandler);
            param1.target.removeEventListener(MouseEvent.MOUSE_OUT, navBtnOutHandler);
            _loc_4 = param1.target.btnTextOver.text;
            if (_loc_4 == "")
            {
                _loc_4 = param1.target.btnText.text;
            }// end if
            param1.target.btnTextOver.text = "";
            param1.target.btnTextClicked.text = _loc_4;
            oldPageLoaded = currentPageLoaded;
            tweenOutMc();
            oldSubNavLoaded = currentSubNav;
            if (subNavLoaded)
            {
                tweenSubSprite = new Tween(subNavSprite, "y", Regular.easeOut, 66, 0, 1, true);
                removeBtns();
            }// end if
            pageXmlPath = page[pageIndex].xmlPath;
            if (pageXmlPath == "")
            {
                pageXmlPath = page[pageIndex].subPage[0].xmlPath;
            }// end if
            subBtnIndex = 0;
            switch(pageUtilityType)
            {
                case "home":
                {
                    loadHome();
                    currentPageLoaded = "home";
                    break;
                }// end case
                case "intro":
                {
                    loadIntro();
                    currentPageLoaded = "intro";
                    break;
                }// end case
                case "team":
                {
                    loadTeam();
                    currentPageLoaded = "team";
                    break;
                }// end case
                case "photos":
                {
                    loadPhotos();
                    currentPageLoaded = "photos";
                    break;
                }// end case
                case "videos":
                {
                    loadVideos();
                    currentPageLoaded = "videos";
                    break;
                }// end case
                case "blog":
                {
                    loadBlog();
                    currentPageLoaded = "blog";
                    break;
                }// end case
                case "contact":
                {
                    loadContact();
                    currentPageLoaded = "contact";
                    break;
                }// end case
                case "features":
                {
                    loadFeatures();
                    currentPageLoaded = "features";
                    break;
                }// end case
                default:
                {
                    break;
                }// end default
            }// end switch
            subNav = page[pageIndex].hasSubPages;
            if (subNav == "true")
            {
                subNavLoaded = true;
                currentSubNav = pageIndex;
                subPages = page[pageIndex].subPage;
                totalSubPages = subPages.length();
                subBtnX = 37;
                subNavSprite.alpha = 1;
                tweenSubSprite = new Tween(subNavSprite, "y", Regular.easeOut, 0, 66, 1, true);
                tweenSubSprite.addEventListener(TweenEvent.MOTION_FINISH, loadNewSubNavBtns, false, 0, true);
            }
            else
            {
                subNavLoaded = false;
            }// end else if
            return;
        }// end function

        public function subNavBtnOverHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnText.text;
            param1.target.btnText.text = "";
            param1.target.btnTextOver.text = _loc_2;
            param1.target.gotoAndStop(2);
            return;
        }// end function

        public function footerLoaded(param1:Event) : void
        {
            footerLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, footerLoaded);
            footerY = Math.round(StageHeight - 33);
            footerBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            tiledFooter.graphics.clear();
            tiledFooter.graphics.beginBitmapFill(footerBMP.bitmapData);
            tiledFooter.graphics.drawRect(0, 0, StageWidth, footerBMP.height);
            tiledFooter.graphics.endFill();
            if (initialLoad)
            {
                initialLoad = false;
                init();
            }// end if
            return;
        }// end function

        public function swapDepths(param1) : void
        {
            setChildIndex(param1, getChildIndex(target) - 3);
            return;
        }// end function

        public function logoLoaded(param1:Event) : void
        {
            logoLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, logoLoaded);
            logoLoader = null;
            logoBMP.bitmapData = Bitmap(param1.target.content).bitmapData;
            logoBMP.x = 7;
            logoBMP.y = 7;
            addChild(logoBMP);
            loadFooter();
            return;
        }// end function

        public function closeBtnFollowMouse(param1:Event) : void
        {
            closePlaya.x = mouseX - 8;
            closePlaya.y = mouseY - 2;
            return;
        }// end function

        public function subNavBtnOutHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnTextOver.text;
            param1.target.btnTextOver.text = "";
            param1.target.btnText.text = _loc_2;
            param1.target.gotoAndStop(1);
            return;
        }// end function

        public function loadBlog()
        {
            var _loc_1:newsPage;
            _loc_1 = new newsPage();
            _loc_1.name = "blog";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function loadLogo() : void
        {
            url = new URLRequest(logo);
            logoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, logoLoaded, false, 0, true);
            logoLoader.load(url);
            return;
        }// end function

        public function resizeListener(param1:Event) : void
        {
            StageWidth = stage.stageWidth;
            StageHeight = stage.stageHeight;
            footerY = Math.round(StageHeight - 33);
            tiledFooter.y = footerY;
            tiledBackground.graphics.clear();
            tiledBackground.graphics.beginBitmapFill(backgroundBMP.bitmapData);
            tiledBackground.graphics.drawRect(0, 0, StageWidth, StageHeight);
            tiledBackground.graphics.endFill();
            dimWallPaper.graphics.clear();
            dimWallPaper.graphics.beginFill(0, 1);
            dimWallPaper.graphics.drawRect(0, 0, StageWidth, StageHeight);
            dimWallPaper.graphics.endFill();
            subNavSprite.graphics.clear();
            subNavSprite.graphics.beginFill(11250603, 0);
            subNavSprite.graphics.drawRect(0, 0, StageWidth, 25);
            subNavSprite.graphics.endFill();
            tiledHeader.graphics.clear();
            tiledHeader.graphics.beginBitmapFill(headerBMP.bitmapData);
            tiledHeader.graphics.drawRect(0, 0, StageWidth, headerBMP.height);
            tiledHeader.graphics.endFill();
            tiledFooter.graphics.clear();
            tiledFooter.graphics.beginBitmapFill(footerBMP.bitmapData);
            tiledFooter.graphics.drawRect(0, 0, StageWidth, footerBMP.height);
            tiledFooter.graphics.endFill();
            if (StageWidth > 840)
            {
                buttonHolder.x = StageWidth - totalPages * 80;
            }
            else
            {
                buttonHolder.x = 300;
            }// end else if
            extraHeaderButtons.x = StageWidth - 170;
            extraHeaderButtons.y = StageHeight - 29;
            footerButtons.x = 10;
            footerButtons.y = StageHeight - 26;
            playa.x = StageWidth / 2 - 200;
            if (playlistOpen)
            {
                playa.y = StageHeight / 2 - playaHeight / 2;
            }
            else
            {
                playa.y = -900;
            }// end else if
            elementDesign.x = StageWidth - elementBMP.width;
            return;
        }// end function

        public function loadNewSubNavBtns(param1:TweenEvent)
        {
            if (k < totalSubPages)
            {
                tweenInProgress = true;
                subNavButton = new subNavBtn();
                subNavButton.btnText.text = page[pageIndex].subPage[k].name;
                subNavButton.x = 2000;
                subNavButton.y = 66;
                subNavButton.data = k;
                subNavButton.name = currentPageLoaded + k.toString();
                subNavButton.buttonMode = true;
                subNavButton.mouseChildren = false;
                subNavButton.addEventListener(MouseEvent.CLICK, subNavBtnClickHandler, false, 0, true);
                subNavButton.addEventListener(MouseEvent.MOUSE_OVER, subNavBtnOverHandler, false, 0, true);
                subNavButton.addEventListener(MouseEvent.MOUSE_OUT, subNavBtnOutHandler, false, 0, true);
                addChild(subNavButton);
                setChildIndex(subNavButton, numChildren - 2);
                subNavTweenIn = new Tween(subNavButton, "x", Regular.easeOut, 2000, subBtnX, 0.4, true);
                subNavTweenIn.addEventListener(TweenEvent.MOTION_FINISH, getNextSubNavBtn, false, 0, true);
            }
            else
            {
                k = 0;
                tweenInProgress = false;
            }// end else if
            return;
        }// end function

        public function loadNewBlog() : void
        {
            var blogVars:MovieClip;
            var removeBlog:Function;
            removeBlog = 
function () : void
{
    blogVars.stage.removeEventListener(Event.RESIZE, blogVars.resizeHandler);
    removeChild(getChildByName("blog"));
    var _loc_1:* = page[pageIndex].subPage[subBtnIndex].xmlPath;
    pageXmlPath = page[pageIndex].subPage[subBtnIndex].xmlPath;
    pageXmlPath = _loc_1;
    loadBlog();
    return;
}// end function
;
            blogVars = MovieClip(getChildByName("blog"));
            tweenBlog = new Tween(blogVars.pc, "x", Regular.easeOut, blogVars.pc.x, -blogVars.pc.width, 2, true);
            tweenBlog.addEventListener(TweenEvent.MOTION_FINISH, removeBlog);
            return;
        }// end function

        public function loadNewPhotoAlbum() : void
        {
            var galleryVars:MovieClip;
            var tweenContainer:Tween;
            var tweenImage:Tween;
            var tweenPanel:Tween;
            var dumpster:Function;
            dumpster = 
function () : void
{
    var _loc_1:uint;
    var _loc_2:DisplayObject;
    var _loc_3:DisplayObject;
    var _loc_4:MovieClip;
    galleryVars.TPS.removeEventListener(MouseEvent.MOUSE_OVER, galleryVars.tcsOver);
    _loc_1 = 0;
    while (_loc_1++ < galleryVars.TPS.numChildren)
    {
        // label
        if (galleryVars.TPS.getChildAt(_loc_1).bitmapData)
        {
            galleryVars.TPS.getChildAt(_loc_1).bitmapData.dispose();
            galleryVars.TPS.getChildAt(_loc_1).bitmapData = null;
            _loc_3 = galleryVars.TPS.getChildAt(_loc_1);
            galleryVars.TPS.removeChild(_loc_3);
            _loc_3 = null;
            continue;
        }// end if
        _loc_4 = galleryVars.TPS.getChildAt(_loc_1);
        _loc_4.removeEventListener(MouseEvent.CLICK, galleryVars.loadClickedImage);
        galleryVars.TPS.removeChild(_loc_4);
        _loc_4 = null;
    }// end while
    _loc_1 = 0;
    while (_loc_1++ < galleryVars.numChildren)
    {
        // label
        _loc_2 = galleryVars.getChildAt(_loc_1);
        galleryVars.removeChild(_loc_2);
        _loc_2 = null;
    }// end while
    galleryVars.stage.removeEventListener(Event.RESIZE, galleryVars.resizeHandler);
    removeChild(getChildByName("photos"));
    pageXmlPath = page[pageIndex].subPage[subBtnIndex].xmlPath;
    loadPhotos();
    return;
}// end function
;
            galleryVars = MovieClip(getChildByName("photos"));
            swapDepths(galleryVars);
            tweenContainer = new Tween(galleryVars.pcc, "y", Regular.easeIn, galleryVars.pcc.y, -3000, 1, true);
            tweenImage = new Tween(galleryVars.imageContainer, "y", Regular.easeIn, galleryVars.imageContainer.y, -3000, 1, true);
            tweenPanel = new Tween(galleryVars.thumbContentSprite, "x", Regular.easeIn, galleryVars.thumbContentSprite.x, 3000, 1, true);
            tweenPanel.addEventListener(TweenEvent.MOTION_FINISH, dumpster);
            return;
        }// end function

        public function playlist(param1:MouseEvent) : void
        {
            var _loc_2:Number;
            playlistOpen = true;
            if (dimWallPaper.alpha == 0)
            {
                dimWallPaper.alpha = 1;
                dimTween = new Tween(dimWallPaper, "alpha", Strong.easeOut, 0, 0.9, 1, true);
            }// end if
            playaHeight = 200;
            _loc_2 = StageHeight / 2 - playaHeight / 2;
            setChildIndex(dimWallPaper, numChildren--);
            setChildIndex(playa, numChildren--);
            tweenPlaya = new Tween(playa, "y", Regular.easeOut, playa.y, _loc_2, 1, true);
            Mouse.hide();
            closePlaya.x = mouseX - 8;
            closePlaya.y = mouseY - 2;
            addChild(closePlaya);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, closeBtnFollowMouse);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, whenToHide);
            return;
        }// end function

        public function fullScreen(param1:MouseEvent) : void
        {
            if (stage.displayState == StageDisplayState.NORMAL)
            {
                stage.displayState = StageDisplayState.FULL_SCREEN;
            }
            else
            {
                stage.displayState = StageDisplayState.NORMAL;
            }// end else if
            return;
        }// end function

        public function navBtnOverHandler(param1:Event) : void
        {
            var _loc_2:String;
            _loc_2 = param1.target.btnText.text;
            if (_loc_2 == "")
            {
                _loc_2 = param1.target.btnTextOver.text;
            }// end if
            param1.target.btnText.text = "";
            param1.target.btnTextOver.text = _loc_2;
            param1.target.gotoAndPlay(2);
            return;
        }// end function

        public function loadVideos()
        {
            var _loc_1:videoGALLERY;
            _loc_1 = new videoGALLERY();
            _loc_1.name = "videos";
            addChild(_loc_1);
            _loc_1.xmlURL = pageXmlPath;
            return;
        }// end function

        public function tweenOutMc() : void
        {
            var _loc_1:MovieClip;
            stillRemovingLastPage = true;
            _loc_1 = MovieClip(getChildByName(oldPageLoaded));
            _loc_1.stage.removeEventListener(Event.RESIZE, _loc_1.resizeHandler);
            swapDepths(_loc_1);
            tweenOutPage = new Tween(_loc_1, "y", Strong.easeOut, _loc_1.y, 1500, 1.5, true);
            tweenOutPage.addEventListener(TweenEvent.MOTION_FINISH, removePage, false, 0, true);
            if (oldPageLoaded == "intro")
            {
                if (_loc_1.videoPlaying == true)
                {
                    _loc_1.netSTREAM.close();
                    restoreAudio(_loc_1.restoreVolumeLevel);
                }// end if
            }// end if
            if (oldPageLoaded == "videos")
            {
                if (_loc_1.videoContent.videoPlaying == true)
                {
                    _loc_1.videoContent.stage.removeEventListener(Event.ENTER_FRAME, _loc_1.videoContent.enterFrame);
                    _loc_1.videoContent.netSTREAM.close();
                    restoreAudio(_loc_1.videoContent.restoreVolumeLevel);
                }// end if
            }// end if
            if (oldPageLoaded == "home")
            {
                if (_loc_1.pc.video1Playing || _loc_1.pc.video2Playing)
                {
                    _loc_1.pc.netSTREAM.close();
                    _loc_1.pc.netSTREAM2.close();
                    restoreAudio(_loc_1.pc.restoreVolumeLevel);
                }// end if
            }// end if
            return;
        }// end function

        public function subNavBtnClickHandler(param1:Event) : void
        {
            var _loc_2:MovieClip;
            var _loc_3:String;
            var _loc_4:MovieClip;
            var _loc_5:MovieClip;
            if (param1.target.data == subBtnIndex)
            {
                return;
            }// end if
            _loc_2 = MovieClip(getChildByName(currentPageLoaded + lastSubClicked.toString()));
            _loc_2.gotoAndStop(1);
            _loc_2.addEventListener(MouseEvent.MOUSE_OVER, subNavBtnOverHandler);
            _loc_2.addEventListener(MouseEvent.MOUSE_OUT, subNavBtnOutHandler);
            _loc_3 = _loc_2.btnTextOver.text;
            _loc_2.btnTextOver.text = "";
            _loc_2.btnText.text = _loc_3;
            lastSubClicked = param1.target.data;
            param1.target.gotoAndStop(2);
            param1.target.removeEventListener(MouseEvent.MOUSE_OVER, subNavBtnOverHandler);
            param1.target.removeEventListener(MouseEvent.MOUSE_OUT, subNavBtnOutHandler);
            subBtnIndex = param1.target.data;
            switch(currentPageLoaded)
            {
                case "videos":
                {
                    _loc_4 = MovieClip(getChildByName("videos"));
                    _loc_4.videoContent.nuPanel(subBtnIndex);
                    break;
                }// end case
                case "team":
                {
                    _loc_5 = MovieClip(getChildByName("team"));
                    _loc_5.pageC.nuPanel(subBtnIndex);
                    break;
                }// end case
                case "photos":
                {
                    loadNewPhotoAlbum();
                    break;
                }// end case
                case "blog":
                {
                    loadNewBlog();
                    break;
                }// end case
                default:
                {
                    break;
                }// end default
            }// end switch
            return;
        }// end function

        public function configLoaded(param1:Event) : void
        {
            var _loc_2:Number;
            var _loc_3:int;
            var _loc_4:String;
            configLoader.removeEventListener(Event.COMPLETE, configLoaded);
            configLoader = null;
            xmlConfig = new XML(param1.target.data);
            page = xmlConfig.page;
            totalPages = xmlConfig.page.length();
            if (StageWidth > 840)
            {
                buttonHolder.x = StageWidth - totalPages * 80;
            }
            else
            {
                buttonHolder.x = 300;
            }// end else if
            buttonHolder.y = 18;
            addChild(buttonHolder);
            _loc_2 = 0;
            _loc_3 = 0;
            while (_loc_3 < totalPages)
            {
                // label
                navButton = new navBtn();
                navButton.btnText.text = page[_loc_3].name;
                navButton.x = _loc_2;
                navButton.y = 0;
                navButton.data = _loc_3;
                navButton.name = "nav" + _loc_3.toString();
                navButton.buttonMode = true;
                navButton.mouseChildren = false;
                navButton.addEventListener(MouseEvent.CLICK, navBtnClickHandler);
                navButton.addEventListener(MouseEvent.MOUSE_OVER, navBtnOverHandler);
                navButton.addEventListener(MouseEvent.MOUSE_OUT, navBtnOutHandler);
                buttonHolder.addChild(navButton);
                _loc_2 = _loc_2 + 79;
                if (_loc_3 == 0)
                {
                    navButton.gotoAndStop(35);
                    navButton.removeEventListener(MouseEvent.MOUSE_OVER, navBtnOverHandler);
                    navButton.removeEventListener(MouseEvent.MOUSE_OUT, navBtnOutHandler);
                    _loc_4 = navButton.btnText.text;
                    navButton.btnText.text = "";
                    navButton.btnTextClicked.text = _loc_4;
                }// end if
                _loc_3++;
            }// end while
            return;
        }// end function

        public function restoreAudio(param1) : void
        {
            volumeLevel = param1;
            playa.volumeLevel = param1;
            playa.CHNL.soundTransform = new SoundTransform(playa.volumeLevel);
            updateFooterVolumeSlider(param1);
            playa.slider.x = playa.volumeSlider.x + volumeLevel * 50;
            playa.volGLOW.width = volumeLevel * 50;
            return;
        }// end function

        public function loadBg() : void
        {
            url = new URLRequest(bg);
            bgLoader = new Loader();
            bgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, bgLoaded, false, 0, true);
            bgLoader.load(url);
            return;
        }// end function

        public function whenToShow(param1:Event) : void
        {
            var _loc_2:Rectangle;
            _loc_2 = playa.playaBorder.getBounds(this);
            if (mouseX < _loc_2.left || mouseX > _loc_2.right || mouseY < _loc_2.top || mouseY > _loc_2.bottom)
            {
                Mouse.hide();
                closePlaya.visible = true;
                closePlaya.buttonMode = true;
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, whenToShow);
            }// end if
            return;
        }// end function

    }
}
