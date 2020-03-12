
//Created by Action Script Viewer - http://www.buraks.com/asv
    class oxylus.afsmg.main extends MovieClip
    {
        var menu, settings, contentTitle, content, menuu, menuBg, menuHolder, holder, lst, mask, theXml, node, line, _alpha, currentButton, _x, _y;
        function main () {
            super();
            var _local3 = new ContextMenu();
            _local3.hideBuiltInItems();
            menu = _local3;
            caurina.transitions.properties.FilterShortcuts.init();
            settings = new Object();
            contentTitle = content.title;
            contentTitle.txt.autoSize = true;
            contentTitle.txt.selectable = false;
            contentTitle.txt._x = -3;
            menuu = content.menu;
            menuBg = menuu.createEmptyMovieClip("menuBg", menuu.getNextHighestDepth());
            menuBg.createEmptyMovieClip("a", menuBg.getNextHighestDepth());
            drawOval(menuBg.a, 10, 10, 0, 0, 0);
            menuBg.createEmptyMovieClip("b", menuBg.getNextHighestDepth());
            menuHolder = menuu.createEmptyMovieClip("menuHolder", menuu.getNextHighestDepth());
            holder = content.holder;
            lst = holder.lst;
            mask = holder.mask;
            lst.setMask(mask);
            loadMyXml();
        }
        function loadMyXml() {
            var _local2 = new XML();
            theXml = _local2;
            _local2.ignoreWhite = true;
            _local2.onLoad = ascb.util.Proxy.create(this, continueAfterXmlLoaded);
            _local2.load(((_level0.xml == undefined) ? "data.xml" : (_level0.xml)));
        }
        function continueAfterXmlLoaded() {
            node = theXml.firstChild.firstChild;
            settings.distanceBetweenMenuButtons = Number(node.attributes.distanceBetweenMenuButtons);
            settings.thumbWidth = Number(node.attributes.thumbWidth);
            settings.thumbHeight = Number(node.attributes.thumbHeight);
            settings.horizontalThumbSpace = Number(node.attributes.horizontalThumbSpace);
            settings.verticalThumbSpace = Number(node.attributes.verticalThumbSpace);
            settings.maskWidth = Number(node.attributes.maskWidth);
            settings.maskHeight = (mask._height = Number(node.attributes.maskHeight));
            mask._width = settings.maskWidth + 80;
            node = node.nextSibling.firstChild;
            var _local4 = 0;
            var _local3 = 0;
            while (node != null) {
                var _local2 = menuHolder.attachMovie("IDbuttong", "button" + _local3, menuHolder.getNextHighestDepth());
                _local2.addEventListener("buttonPressed", ascb.util.Proxy.create(this, buttonPressed));
                _local2._x = (_local2.posX = _local4);
                _local2.setNode(node);
                _local4 = _local4 + Math.round(_local2.totalWidth + settings.distanceBetweenMenuButtons);
                _local3++;
                node = node.nextSibling;
            }
            totals = _local3;
            menuBg.a._height = _local2._height + 6;
            menuBg._y = -4;
            menuu._x = Math.round((settings.maskWidth + 10) - menuu._width);
            menuu._y = 10;
            menuHolder.button0.onRelease();
            line._width = (settings.maskWidth + 32) + 10;
            loadStageResize();
            _alpha = 100;
        }
        function buttonPressed(_arg2) {
            if (_arg2.mc != currentButton) {
                currentButton.off();
                currentButton = _arg2.mc;
                currentButton.onn();
                caurina.transitions.Tweener.removeTweens(menuBg.a);
                caurina.transitions.Tweener.removeTweens(menuBg);
                caurina.transitions.Tweener.addTween(menuBg.a, {_width:_arg2.mc.totalWidth, time:0.5, transition:"easeOutQuart", onUpdate:ascb.util.Proxy.create(this, drawTheMovingBg)});
                caurina.transitions.Tweener.addTween(menuBg, {_x:_arg2.mc.posX, time:0.5, transition:"easeOutQuart"});
                caurina.transitions.Tweener.addTween(contentTitle, {_Blur_blurX:40, _Blur_blurY:40, _alpha:0, time:0.3, transition:"linear", onComplete:ascb.util.Proxy.create(this, showText, _arg2.mc.node)});
                caurina.transitions.Tweener.addTween(lst["item" + lstIdx], {_x:(-mask._width) - 60, _Blur_blurX:blurXAmount, _Blur_blurY:blurYAmount, _Blur_quality:1, time:animationTime, transition:animationType, onComplete:ascb.util.Proxy.create(this, removeItem, lst["item" + lstIdx])});
                lstIdx++;
                var _local3 = lst.attachMovie("IDitem", "item" + lstIdx, lst.getNextHighestDepth());
                _local3._x = mask._width;
                _local3.setNode(_arg2.mc.node, settings);
                caurina.transitions.Tweener.addTween(lst["item" + lstIdx], {_x:0, _Blur_blurX:0, _Blur_blurY:0, _Blur_quality:1, time:animationTime, transition:animationType});
            }
        }
        function removeItem(_arg1) {
            _arg1.removeMovieClip();
        }
        function showText(_arg7) {
            contentTitle.txt.text = _arg7.attributes.title;
            caurina.transitions.Tweener.addTween(contentTitle, {_Blur_blurX:0, _Blur_blurY:0, _alpha:100, time:0.3, transition:"linear"});
        }
        function drawTheMovingBg() {
            drawOval(menuBg.b, menuBg.a._width, menuBg.a._height, 4, 0, 30, 1);
        }
        function resize(w, h) {
            _x = (_global.refX = Math.round((Stage.width / 2) - ((settings.maskWidth + 10) / 2)));
            _y = (_global.refY = Math.round((Stage.height / 2) - ((settings.maskHeight + 60) / 2)));
        }
        function onResize() {
            resize(Stage.width, Stage.height);
        }
        function loadStageResize() {
            Stage.addListener(this);
            this.onResize();
        }
        function drawOval(_arg1, _arg3, _arg4, _arg2, _arg6, _arg5, _arg7) {
            _arg1.clear();
            _arg1.beginFill(_arg6, _arg5);
            if (_arg7 == 1) {
                _arg1.lineStyle(1, 5131854, _arg5, true);
            }
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
        var lstIdx = 0;
        var animationTime = 0.5;
        var animationType = "easeOutQuart";
        var blurXAmount = 60;
        var blurYAmount = 0;
        var totals = 0;
    }
