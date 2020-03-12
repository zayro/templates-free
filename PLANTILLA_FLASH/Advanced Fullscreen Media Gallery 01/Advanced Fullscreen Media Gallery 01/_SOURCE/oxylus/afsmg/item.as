    class oxylus.afsmg.item extends MovieClip
    {
        var menu, bar, scroller, stick, lst, mask, node, nd, settings, _parent, popupHolder, thePopup, ScrollArea, ScrollButton, Content, ContentMask, HitZone, getNextHighestDepth, totalHeight, scrollable, viewHeight, ScrollHeight, onEnterFrame;
        function item () {
            super();
            var _local3 = new ContextMenu();
            _local3.hideBuiltInItems();
            menu = _local3;
            caurina.transitions.properties.FilterShortcuts.init();
            bar = scroller.bar;
            stick = scroller.stick;
            lst.setMask(mask);
        }
        function setNode(_arg4, _arg3) {
            node = _arg4.firstChild;
            nd = node;
            settings = _arg3;
            mask._width = settings.maskWidth;
            mask._height = settings.maskHeight;
            scroller._x = Math.round(mask._width + 2);
            stick._height = mask._height;
            loadStageResize();
            var _local2 = _parent._parent._parent._parent;
            if (_local2.popupHolder) {
                _local2.popupHolder.removeMovieClip();
            }
            popupHolder = _local2.createEmptyMovieClip("popupHolder", _local2.getNextHighestDepth());
            popupHolder._alpha = 0;
            popupHolder.createEmptyMovieClip("bg", popupHolder.getNextHighestDepth());
            popupHolder.bg.useHandCursor = false;
            popupHolder.bg.onPress = null;
            popupHolder._visible = false;
            loadNext();
            oxylus.Utils.setMcBlur(this, blurXAmount, blurYAmount, 1);
        }
        function thumbLoaded(obj) {
            loadNext();
            ScrollBox();
        }
        function loadNext() {
            if (node != null) {
                idx++;
                var _local2 = lst.attachMovie("IDthumb", "thumb" + idx, lst.getNextHighestDepth());
                _local2.addEventListener("thumbLoaded", ascb.util.Proxy.create(this, thumbLoaded));
                _local2.addEventListener("thumbReleased", ascb.util.Proxy.create(this, thumbReleased));
                _local2.idx = idx;
                _local2._x = Math.round(posX);
                _local2._y = Math.round(posY);
                var _local3 = settings.thumbWidth + 10;
                posX = posX + (_local3 + settings.horizontalThumbSpace);
                if (((posX + _local3) + settings.horizontalThumbSpace) > mask._width) {
                    posX = 0;
                    posY = posY + ((settings.thumbHeight + 10) + settings.verticalThumbSpace);
                }
                _local2.setNode(node, settings);
                node = node.nextSibling;
            } else {
                totals = idx;
                loading = 0;
                if (totals == 0) {
                    scroller._visible = false;
                }
            }
        }
        function thumbReleased(_arg2) {
            if (popupActive == 0) {
                popupMode = 1;
                popupId++;
                thePopup = popupHolder.attachMovie("IDpopupGallery", "popup" + popupId, popupHolder.getNextHighestDepth());
                thePopup.addEventListener("closePopup", ascb.util.Proxy.create(this, closePopup));
                thePopup.addEventListener("popupNext", ascb.util.Proxy.create(this, popupNext));
                thePopup.addEventListener("popupPrev", ascb.util.Proxy.create(this, popupPrev));
                thePopup.idx = _arg2.mc.idx;
                thePopup.setNode(_arg2.mc.node, popupMode, settings);
                showPopup();
                popupActive = 1;
                this.onResize();
            } else {
                popupId++;
                thePopup = popupHolder.attachMovie("IDpopupGallery", "popup" + popupId, popupHolder.getNextHighestDepth());
                thePopup.addEventListener("closePopup", ascb.util.Proxy.create(this, closePopup));
                thePopup.addEventListener("popupNext", ascb.util.Proxy.create(this, popupNext));
                thePopup.addEventListener("popupPrev", ascb.util.Proxy.create(this, popupPrev));
                thePopup.idx = _arg2.mc.idx;
                thePopup.setNode(_arg2.mc.node, popupMode, settings);
                this.onResize();
            }
        }
        function popupNext(_arg2) {
            if (lst["thumb" + (_arg2.mc.idx + 1)]) {
                thePopup.hidePrev();
                popupMode = 1;
                lst["thumb" + (_arg2.mc.idx + 1)].onRelease();
            }
        }
        function popupPrev(_arg2) {
            if (lst["thumb" + (_arg2.mc.idx - 1)]) {
                thePopup.hideNext();
                popupMode = 2;
                lst["thumb" + (_arg2.mc.idx - 1)].onRelease();
            }
        }
        function showPopup() {
            popupHolder._visible = true;
            caurina.transitions.Tweener.removeTweens(popupHolder);
            caurina.transitions.Tweener.addTween(popupHolder, {_alpha:100, time:0.2, transition:"linear"});
        }
        function closePopup(obj) {
            _global.popPresent = 0;
            caurina.transitions.Tweener.removeTweens(popupHolder);
            caurina.transitions.Tweener.addTween(popupHolder, {_alpha:0, time:0.2, transition:"linear", onComplete:ascb.util.Proxy.create(this, disablePopup)});
        }
        function disablePopup() {
            popupHolder._visible = false;
            popupActive = 0;
        }
        function resize(_arg4, _arg3) {
            drawOval(popupHolder.bg, _arg4, _arg3, 0, 0, 75);
            popupHolder._x = -_global.refX;
            popupHolder._y = -_global.refY;
        }
        function onResize() {
            resize(Stage.width, Stage.height);
        }
        function loadStageResize() {
            Stage.addListener(this);
            this.onResize();
        }
        function ScrollBox() {
            ScrollArea = scroller.stick;
            ScrollButton = scroller.bar;
            Content = lst;
            ContentMask = mask;
            HitZone = ContentMask.duplicateMovieClip("_hitzone_", getNextHighestDepth());
            HitZone._alpha = 0;
            HitZone._width = ContentMask._width;
            HitZone._height = ContentMask._height;
            Content.setMask(ContentMask);
            ScrollArea.onPress = ascb.util.Proxy.create(this, startScroll);
            ScrollArea.onRelease = (ScrollArea.onReleaseOutside = ascb.util.Proxy.create(this, stopScroll));
            totalHeight = Content._height;
            scrollable = false;
            updateScrollbar();
            Mouse.addListener(this);
            ScrollButton.onRollOver = ascb.util.Proxy.create(this, barOnRollOver);
            ScrollButton.onRollOut = ascb.util.Proxy.create(this, barOnRollOut);
            ScrollButton.onPress = ascb.util.Proxy.create(this, startScroll);
            ScrollButton.onRelease = (ScrollButton.onReleaseOutside = ascb.util.Proxy.create(this, stopScroll));
        }
        function updateScrollbar() {
            viewHeight = ContentMask._height;
            var _local2 = viewHeight / totalHeight;
            if (_local2 >= 1) {
                scrollable = false;
                scroller._alpha = 0;
                ScrollArea.enabled = false;
                ScrollButton._y = 0;
                Content._y = 0;
                scroller._visible = false;
            } else {
                scroller._visible = true;
                scrollable = true;
                ScrollButton._visible = true;
                ScrollArea.enabled = true;
                ScrollButton._y = 0;
                scroller._alpha = 100;
                ScrollHeight = ScrollArea._height - ScrollButton._height;
                if (ScrollButton._height > ScrollArea._height) {
                    scrollable = false;
                    scroller._alpha = 0;
                    ScrollArea.enabled = false;
                    ScrollButton._y = 0;
                    Content._y = 0;
                }
                scroller._alpha = 100;
            }
        }
        function startScroll() {
            var _local4 = !ScrollButton.hitTest(_level0._xmouse, _level0._ymouse, true);
            var _local3 = ScrollButton._x;
            if (_local4) {
                var _local2 = ScrollButton._parent._ymouse - (ScrollButton._height / 2);
                ((_local2 < 0) ? (_local2 = 0) : (((_local2 > ScrollHeight) ? (_local2 = ScrollHeight) : null)));
                ScrollButton._y = _local2;
            }
            ScrollButton.startDrag(false, _local3, 0, _local3, ScrollHeight);
            ScrollButton.onMouseMove = ascb.util.Proxy.create(this, updateContentPosition);
            updateContentPosition();
        }
        function stopScroll() {
            ScrollButton.stopDrag();
            delete ScrollButton.onMouseMove;
            barOnRollOut();
        }
        function updateContentPosition() {
            if (scrollable == true) {
                var contentPos = ((viewHeight - totalHeight) * (ScrollButton._y / ScrollHeight));
                onEnterFrame = function () {
                    if (Math.abs(this.Content._y - contentPos) < 1) {
                        this.Content._y = contentPos;
                        delete this.onEnterFRame;
                        return(undefined);
                    }
                    this.Content._y = this.Content._y + ((contentPos - this.Content._y) / 4);
                };
            } else {
                Content._y = 0;
                delete Content.onEnterFRame;
            }
        }
        function scrollDown() {
            var _local2 = ScrollButton._y + (ScrollButton._height / 4);
            if (_local2 > ScrollHeight) {
                _local2 = ScrollHeight;
            }
            ScrollButton._y = _local2;
            updateContentPosition();
        }
        function scrollUp() {
            var _local2 = ScrollButton._y - (ScrollButton._height / 4);
            if (_local2 < 0) {
                _local2 = 0;
            }
            ScrollButton._y = _local2;
            updateContentPosition();
        }
        function onMouseWheel(_arg3) {
            if (!HitZone.hitTest(_level0._xmouse, _level0._ymouse, true)) {
                return(undefined);
            }
            var _local2 = _arg3 / Math.abs(_arg3);
            if (_local2 < 0) {
                scrollDown();
            } else {
                scrollUp();
            }
        }
        function barOnRollOver() {
            caurina.transitions.Tweener.addTween(bar, {_alpha:60, time:0.15, transition:"linear"});
        }
        function barOnRollOut() {
            caurina.transitions.Tweener.addTween(bar, {_alpha:35, time:0.15, transition:"linear"});
        }
        function drawOval(_arg1, _arg3, _arg4, _arg2, _arg5, _arg6) {
            _arg1.clear();
            _arg1.beginFill(_arg5, _arg6);
            _arg1.moveTo(_arg2, 0);
            _arg1.lineTo(_arg3 - _arg2, 0);
            _arg1.curveTo(_arg3, 0, _arg3, _arg2);
            _arg1.lineTo(_arg3, _arg4 - _arg2);
            _arg1.curveTo(_arg3, _arg4, _arg3 - _arg2, _arg4);
            _arg1.lineTo(_arg2, _arg4);
            _arg1.curveTo(0, _arg4, 0, _arg4 - _arg2);
            _arg1.lineTo(0, _arg2);
            _arg1.curveTo(0, 0, _arg2, 0);
            _arg1.endFill();
        }
        var blurXAmount = 60;
        var blurYAmount = 0;
        var idx = 0;
        var posX = 0;
        var posY = 0;
        var popupId = -1;
        var popupActive = 0;
        var popupMode = 1;
        var totals = 0;
        var loading = 1;
        var treatingAddress = "";
    }
