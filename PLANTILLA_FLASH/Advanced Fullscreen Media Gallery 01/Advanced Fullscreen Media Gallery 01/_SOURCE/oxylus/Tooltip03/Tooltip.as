
//Created by Action Script Viewer - http://www.buraks.com/asv
    class oxylus.Tooltip03.Tooltip extends MovieClip
    {
        var _alpha, _x, _y, Text, createEmptyMovieClip, getNextHighestDepth, stroke, bg, obj, myInt, actualBgWidth, refMc, _height, actualBgHeight, currentPos, maxTextWidth, filters, mcl, ImageHolder, myImageBg, myImage;
        function Tooltip () {
            super();
            _alpha = 0;
            _x = Stage.width;
            _y = Stage.height;
            Text = this.createEmptyMovieClip("Text", getNextHighestDepth());
            stroke = stroke;
            bg = bg;
            defaultValues();
        }
        function defaultValues() {
            obj = new Object();
            obj.strokeColor = 0;
            obj.strokeAlpha = 100;
            obj.strokeWidth = 0;
            obj.backgroundColor = new Array();
            obj.backgroundAlpha = 100;
            obj.backgroundRadius = 0;
            obj.backgroundWidth = 0;
            obj.backgroundHeight = 0;
            obj.tipOrientation = "bottom";
            obj.tipWidth = 0;
            obj.tipHeight = 0;
            obj.tipInclination = 0;
            obj.tipX = 0;
            obj.tipAutoMove = "false";
            obj.myTexts = new Array();
            obj.myTexts[0] = "Text unavailable, please execute setCustomVars({ }) !";
            obj.myFonts = new Array();
            obj.myFonts[0] = "my_font1";
            obj.myColors = new Array();
            obj.mySizes = new Array();
            obj.myUnderlines = new Array();
            obj.myLengths = new Array();
            obj.myVerticalSpaces = new Array();
            obj.textXPos = 0;
            obj.image = "";
            obj.imageWidth = (obj.imageHeight = 30);
            obj.imageBackgroundColor = 16777215 /* 0xFFFFFF */;
            obj.imageBackgroundAlpha = 100;
            obj.imageBackgroundWidth = 0;
            obj.imageX = 0;
            obj.imageY = 0;
            obj.farX = 4;
            obj.delay = 0.1;
            obj.animationTime = 0.5;
            obj.animationType = "linear";
            obj.stay = 0;
            obj.XDistanceFromCursor = 0;
            obj.YDistanceFromCursor = 0;
            obj.alignHoriz = "center";
            obj.alignVerti = "top";
            obj.stageToleranceX = 0;
            obj.stageToleranceY = 0;
            obj.addShadow = "false";
            obj.shadowDistance = 1;
            obj.shadowAngleInDegrees = 45;
            obj.shadowColor = 0;
            obj.shadowAlpha = 0.25;
            obj.shadowBlurX = 1.5;
            obj.shadowBlurY = 1.5;
            obj.shadowStrength = 1;
            obj.shadowQuality = 3;
            obj.shadowInner = false;
            obj.shadowKnockout = false;
            obj.shadowHideObject = false;
        }
        function show(_arg7) {
            clearInterval(myInt);
            caurina.transitions.Tweener.removeTweens(this);
            shortParse(_arg7);
            caurina.transitions.Tweener.addTween(this, {_alpha:100, delay:obj.delay, time:obj.animationTime, transition:obj.animationType, onStart:ascb.util.Proxy.create(this, startInterval)});
        }
        function startInterval() {
            move(1);
            if (obj.stay != 0) {
                caurina.transitions.Tweener.addTween(this, {_alpha:0, delay:obj.stay, time:obj.animationTime, transition:obj.animationType, onStart:ascb.util.Proxy.create(this, endInterval)});
            }
            clearInterval(myInt);
            myInt = setInterval(this, "move", 10);
        }
        function move(_arg3) {
            switch (obj.alignHoriz) {
                case "center" : 
                    if ((((refMc._xmouse + (actualBgWidth / 2)) + obj.stageToleranceX) < Stage.width) && ((refMc._xmouse - (actualBgWidth / 2)) > obj.stageToleranceX)) {
                        _x = Math.round(refMc._xmouse - (actualBgWidth / 2));
                        if (obj.tipAutoMove == "true") {
                            obj.tipX = (actualBgWidth / 2) + (obj.tipWidth / 2);
                            buildBackground();
                        }
                    } else if (((refMc._xmouse - (actualBgWidth / 2)) - obj.stageToleranceX) < 0) {
                        _x = obj.stageToleranceX;
                        if ((_arg3 == 1) && (obj.tipAutoMove == "true")) {
                            obj.tipX = obj.tipWidth + obj.backgroundRadius;
                            buildBackground();
                        }
                        if ((obj.tipAutoMove == "true") && (((refMc._xmouse - obj.stageToleranceX) - obj.backgroundRadius) > (obj.tipWidth / 2))) {
                            obj.tipX = (refMc._xmouse - obj.stageToleranceX) + (obj.tipWidth / 2);
                            buildBackground();
                        }
                    } else {
                        if (_arg3 == 1) {
                            if (obj.tipAutoMove == "true") {
                                _x = Math.round((Stage.width - actualBgWidth) - obj.stageToleranceX);
                                obj.tipX = (actualBgWidth - obj.strokeWidth) - obj.backgroundRadius;
                                buildBackground();
                            } else {
                                _x = Math.round((Stage.width - actualBgWidth) - obj.stageToleranceX);
                            }
                        }
                        if ((obj.tipAutoMove == "true") && (((((refMc._xmouse - Math.round((Stage.width - actualBgWidth) - obj.stageToleranceX)) + obj.strokeWidth) + obj.tipWidth) + obj.backgroundRadius) < actualBgWidth)) {
                            obj.tipX = refMc._xmouse - Math.round((((Stage.width - actualBgWidth) - obj.stageToleranceX) - obj.tipWidth) - obj.strokeWidth);
                            buildBackground();
                        }
                    }
                    break;
                case "left" : 
                    if (((((refMc._xmouse + (obj.tipWidth / 2)) + obj.backgroundRadius) + obj.stageToleranceX) < Stage.width) && ((((refMc._xmouse - actualBgWidth) + obj.tipWidth) + obj.backgroundRadius) > obj.stageToleranceX)) {
                        _x = Math.round((((refMc._xmouse - actualBgWidth) + obj.tipWidth) + obj.backgroundRadius) + obj.XDistanceFromCursor);
                        obj.tipX = (actualBgWidth - obj.strokeWidth) - obj.backgroundRadius;
                        buildBackground();
                    } else if (((refMc._xmouse - actualBgWidth) - obj.stageToleranceX) < 0) {
                        if (_x != obj.stageToleranceX) {
                            _x = obj.stageToleranceX;
                        }
                        if ((_arg3 == 1) && (obj.tipAutoMove == "true")) {
                            _x = obj.stageToleranceX;
                            obj.tipX = (obj.tipWidth + obj.strokeWidth) + obj.backgroundRadius;
                            buildBackground();
                        }
                        if ((obj.tipAutoMove == "true") && (((((refMc._xmouse - obj.stageToleranceX) + (obj.tipWidth / 2)) - obj.strokeWidth) - obj.backgroundRadius) > obj.tipWidth)) {
                            obj.tipX = ((refMc._xmouse - obj.stageToleranceX) + (obj.tipWidth / 2)) - obj.strokeWidth;
                            buildBackground();
                        }
                    } else if ((_arg3 == 1) && (obj.tipAutoMove == "true")) {
                        _x = Math.round(((refMc._xmouse - actualBgWidth) + (obj.tipWidth / 2)) - obj.stageToleranceX);
                        obj.tipX = (actualBgWidth - obj.strokeWidth) - obj.backgroundRadius;
                        buildBackground();
                    }
                    break;
                case "right" : 
                    if ((((refMc._xmouse + actualBgWidth) + obj.stageToleranceX) < Stage.width) && ((refMc._xmouse - obj.stageToleranceX) > 0)) {
                        _x = Math.round((refMc._xmouse - obj.tipWidth) + obj.XDistanceFromCursor);
                        obj.tipX = obj.tipWidth + obj.tipWidth;
                        buildBackground();
                    } else if (((((refMc._xmouse + actualBgWidth) + obj.stageToleranceX) + (obj.tipWidth / 2)) - obj.backgroundRadius) > Stage.width) {
                        _x = Math.round((Stage.width - obj.stageToleranceX) - actualBgWidth);
                        if ((_arg3 == 1) && (obj.tipAutoMove == "true")) {
                            obj.tipX = (actualBgWidth - obj.strokeWidth) - obj.backgroundRadius;
                            buildBackground();
                        }
                        if ((obj.tipAutoMove == "true") && ((((refMc._xmouse - _x) + (obj.tipWidth / 2)) + obj.backgroundRadius) < actualBgWidth)) {
                            obj.tipX = (refMc._xmouse - _x) + (obj.tipWidth / 2);
                            buildBackground();
                        }
                    }
                    break;
            }
            switch (obj.alignVerti) {
                case "top" : 
                    var _local2 = Math.round((refMc._ymouse - _height) + obj.YDistanceFromCursor);
                    if (_local2 > obj.stageToleranceY) {
                        _y = _local2;
                    } else {
                        _y = obj.stageToleranceY;
                    }
                    break;
                case "middle" : 
                    _local2 = Math.round((refMc._ymouse - (_height / 2)) + obj.YDistanceFromCursor);
                    if (_local2 > obj.stageToleranceY) {
                        if ((_local2 + actualBgHeight) > (Stage.height - obj.stageToleranceY)) {
                            _local2 = (Stage.height - actualBgHeight) - obj.stageToleranceY;
                        }
                        _y = _local2;
                    } else {
                        _local2 = obj.stageToleranceY;
                        _y = _local2;
                    }
                    break;
                case "bottom" : 
                    _local2 = Math.round(refMc._ymouse + obj.YDistanceFromCursor);
                    if (_local2 > 0) {
                        if ((_local2 + actualBgHeight) > (Stage.height - obj.stageToleranceY)) {
                            _local2 = (Stage.height - actualBgHeight) - obj.stageToleranceY;
                        }
                        _y = _local2;
                    }
                    break;
            }
            updateAfterEvent();
        }
        function hide(_arg5) {
            caurina.transitions.Tweener.removeTweens(this);
            shortParse(_arg5);
            caurina.transitions.Tweener.addTween(this, {_alpha:0, time:obj.animationTime, transition:obj.animationType});
        }
        function endInterval() {
        }
        function onLoadInit(_arg2) {
            var _local3 = new flash.display.BitmapData(_arg2._width, _arg2._height);
            _local3.draw(_arg2);
            _arg2.attachBitmap(_local3, _arg2.getNextHighestDepth(), "always", true);
            _arg2._width = obj.imageWidth;
            _arg2._height = obj.imageHeight;
        }
        function formatMyText(_arg2, _arg3) {
            _arg2.text = obj.myTexts[_arg3];
            _arg2.autoSize = true;
            _arg2.wordWrap = true;
            _arg2.selectable = false;
            _arg2.antiAliasType = "advanced";
            _arg2.embedFonts = true;
            var _local4 = new TextFormat();
            _local4.font = obj.myFonts[_arg3];
            _local4.size = Number(obj.mySizes[_arg3]);
            _local4["color"] = obj.myColors[_arg3];
            if (obj.myUnderlines[_arg3] == "true") {
                _local4.underline = true;
            }
            _arg2.setTextFormat(_local4);
            if (obj.myLengths[_arg3] > 0) {
                _arg2.wordWrap = true;
                _arg2._width = obj.myLengths[_arg3];
            }
            if (obj.myLengths[_arg3] == 0) {
                _arg2.wordWrap = false;
            }
            currentPos = currentPos + Math.round(obj.myVerticalSpaces[_arg3]);
            _arg2._y = currentPos;
            currentPos = currentPos + Math.round(_arg2._height);
            if (maxTextWidth < _arg2._width) {
                maxTextWidth = Math.round(_arg2._width);
            }
        }
        function buildBackground() {
            var _local2 = new Array();
            var _local3 = new Array();
            var _local4 = new Array();
            _local2 = [obj.backgroundAlpha, obj.backgroundAlpha, obj.backgroundAlpha];
            _local3 = [obj.backgroundColor[0], obj.backgroundColor[1], obj.backgroundColor[2]];
            _local4 = [0, 127.5, 255];
            if (obj.image.length != 0) {
                drawGradient(bg, (obj.backgroundWidth + obj.imageX) + obj.imageWidth, obj.backgroundHeight, obj.backgroundRadius, _local3, _local2, _local4, 90);
            } else {
                drawGradient(bg, obj.backgroundWidth, obj.backgroundHeight, obj.backgroundRadius, _local3, _local2, _local4, 90);
            }
            if (obj.addShadow == "true") {
                addShadow();
            }
        }
        static function attach(_arg2) {
            var _local1 = _arg2.attachMovie("IDTooltip", String("myTooltip_" + random(50000)), _arg2.getNextHighestDepth());
            return(_local1);
        }
        function addShadow() {
            var _local3 = new flash.filters.DropShadowFilter(obj.shadowDistance, obj.shadowAngleInDegrees, obj.shadowColor, obj.shadowAlpha, obj.shadowBlurX, obj.shadowBlurY, obj.shadowStrength, obj.shadowQuality, obj.shadowInner, obj.shadowKnockout, obj.shadowHideObject);
            var _local2 = new Array();
            _local2.push(_local3);
            filters = _local2;
        }
        function shortParse(myObj) {
            with (this) {
                for (var i in myObj) {
                    switch (i) {
                        case "delay" : 
                            obj.delay = Number(myObj[i]);
                            break;
                        case "animationTime" : 
                            obj.animationTime = Number(myObj[i]);
                            break;
                        case "animationType" : 
                            obj.animationType = String(myObj[i]);
                            break;
                        case "stay" : 
                            obj.stay = String(myObj[i]);
                            break;
                    }
                }
            }
        }
        function setCustomVars(_arg6, _arg5) {
            refMc = _arg5;
            parseObject(_arg6);
            if (obj.myTexts.length != obj.myFonts.length) {
                var _local3;
                var _local4 = obj.myFonts.length - 1;
                _local3 = obj.myFonts.length;
                while (_local3 <= obj.myTexts.length) {
                    obj.myFonts[_local3] = obj.myFonts[_local4];
                    _local3++;
                }
            }
            if (obj.myTexts.length != obj.myColors.length) {
                if (obj.myColors.length == 0) {
                    var _local3 = 0;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myColors[_local3] = 0;
                        _local3++;
                    }
                } else {
                    var _local4 = obj.myColors.length - 1;
                    var _local3 = obj.myColors.length;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myColors[_local3] = obj.myColors[_local4];
                        _local3++;
                    }
                }
            }
            if (obj.myTexts.length != obj.mySizes.length) {
                if (obj.mySizes.length == 0) {
                    var _local3 = 0;
                    while (_local3 <= obj.myTexts.length) {
                        obj.mySizes[_local3] = 12;
                        _local3++;
                    }
                } else {
                    var _local4 = obj.mySizes.length - 1;
                    var _local3 = obj.mySizes.length;
                    while (_local3 <= obj.myTexts.length) {
                        obj.mySizes[_local3] = obj.mySizes[_local4];
                        _local3++;
                    }
                }
            }
            if (obj.myTexts.length != obj.myUnderlines.length) {
                if (obj.myUnderlines.length == 0) {
                    var _local3 = 0;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myUnderlines[_local3] = "false";
                        _local3++;
                    }
                } else {
                    var _local4 = obj.myUnderlines.length - 1;
                    var _local3 = obj.myUnderlines.length;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myUnderlines[_local3] = obj.myUnderlines[_local4];
                        _local3++;
                    }
                }
            }
            if (obj.myTexts.length != obj.myLengths.length) {
                if (obj.myLengths.length == 0) {
                    var _local3 = 0;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myLengths[_local3] = 0;
                        _local3++;
                    }
                } else {
                    var _local4 = obj.myLengths.length - 1;
                    var _local3 = obj.myLengths.length;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myLengths[_local3] = obj.myLengths[_local4];
                        _local3++;
                    }
                }
            }
            if (obj.myTexts.length != obj.myVerticalSpaces.length) {
                if (obj.myVerticalSpaces.length == 0) {
                    var _local3 = 0;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myVerticalSpaces[_local3] = 0;
                        _local3++;
                    }
                } else {
                    var _local4 = obj.myVerticalSpaces.length - 1;
                    var _local3 = obj.myVerticalSpaces.length;
                    while (_local3 <= obj.myTexts.length) {
                        obj.myVerticalSpaces[_local3] = obj.myVerticalSpaces[_local4];
                        _local3++;
                    }
                }
            }
            if (obj.backgroundColor.length < 3) {
                if (obj.backgroundColor.length == 1) {
                    obj.backgroundColor[1] = (obj.backgroundColor[2] = obj.backgroundColor[0]);
                } else if (obj.backgroundColor.length == 2) {
                    obj.backgroundColor[2] = obj.backgroundColor[1];
                } else if (obj.backgroundColor.length == 0) {
                    obj.backgroundColor[0] = (obj.backgroundColor[1] = (obj.backgroundColor[2] = 16777215));
                }
            }
            maxTextWidth = 0;
            if (obj.myTexts.length >= 1) {
                var _local2 = 0;
                currentPos = 0;
                Text.createTextField("txt" + _local2, Text.getNextHighestDepth(), 0, 0, 0, 25);
                formatMyText(Text["txt" + _local2], _local2);
                Text.txt._y = Math.round(obj.myVerticalSpaces[_local2]);
                _local2 = 1;
                while (_local2 < obj.myTexts.length) {
                    Text.createTextField("txt" + _local2, Text.getNextHighestDepth(), 0, 0, 0, 25);
                    formatMyText(Text["txt" + _local2], _local2);
                    _local2++;
                }
            }
            obj.backgroundWidth = obj.backgroundWidth + maxTextWidth;
            obj.backgroundHeight = obj.backgroundHeight + currentPos;
            if (obj.image.length != 0) {
                if (obj.textXPos != 0) {
                    Text._x = Math.round(((obj.textXPos + obj.imageX) + obj.imageWidth) + obj.imageBackgroundWidth);
                    obj.backgroundWidth = obj.backgroundWidth + (obj.textXPos + obj.farX);
                } else {
                    Text._x = Math.round((((obj.backgroundWidth / 2) - (Text._width / 2)) + obj.imageWidth) + obj.imageBackgroundWidth);
                }
            } else if (obj.textXPos != 0) {
                Text._x = obj.textXPos;
                obj.backgroundWidth = obj.backgroundWidth + (obj.textXPos + obj.farX);
            } else {
                Text._x = Math.round((obj.backgroundWidth / 2) - (Text._width / 2));
            }
            if (obj.image.length != 0) {
                mcl = new MovieClipLoader();
                mcl.addListener(this);
                ImageHolder = this.createEmptyMovieClip("imageHolder", getNextHighestDepth());
                myImageBg = ImageHolder.createEmptyMovieClip("myImageBg", ImageHolder.getNextHighestDepth());
                myImage = ImageHolder.createEmptyMovieClip("myImage", ImageHolder.getNextHighestDepth());
                if (obj.imageBackgroundWidth != 0) {
                    drawOval(myImageBg, obj.imageWidth + obj.imageBackgroundWidth, obj.imageHeight + obj.imageBackgroundWidth, 0, obj.imageBackgroundColor, obj.imageBackgroundAlpha);
                    myImage._x = (myImage._y = obj.imageBackgroundWidth / 2);
                }
                ImageHolder._x = obj.imageX;
                ImageHolder._y = obj.imageY;
                mcl.loadClip(obj.image, myImage);
            }
            buildBackground();
            actualBgWidth = bg._width;
            actualBgHeight = bg._height;
        }
        function parseObject(myObj) {
            with (this) {
                for (var i in myObj) {
                    switch (i) {
                        case "myTexts" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("<new_line>");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myTexts[idx] = fontArr[idx];
                                idx++;
                            }
                            break;
                        case "myFonts" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myFonts[idx] = String(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "myColors" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myColors[idx] = Number(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "mySizes" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.mySizes[idx] = Number(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "myLengths" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myLengths[idx] = String(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "myUnderlines" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myUnderlines[idx] = String(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "myVerticalSpaces" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < fontArr.length) {
                                obj.myVerticalSpaces[idx] = Number(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "strokeColor" : 
                            obj.strokeColor = Number(myObj[i]);
                            break;
                        case "strokeAlpha" : 
                            obj.strokeAlpha = Number(myObj[i]);
                            break;
                        case "strokeWidth" : 
                            obj.strokeWidth = Number(myObj[i]);
                            break;
                        case "backgroundColor" : 
                            var fontStr = myObj[i];
                            var fontArr = fontStr.split("|");
                            var idx;
                            idx = 0;
                            while (idx < 3) {
                                obj.backgroundColor[idx] = Number(fontArr[idx]);
                                idx++;
                            }
                            break;
                        case "backgroundAlpha" : 
                            obj.backgroundAlpha = Number(myObj[i]);
                            break;
                        case "backgroundRadius" : 
                            obj.backgroundRadius = Number(myObj[i]);
                            break;
                        case "backgroundWidth" : 
                            obj.backgroundWidth = Number(myObj[i]);
                            break;
                        case "backgroundHeight" : 
                            obj.backgroundHeight = Number(myObj[i]);
                            break;
                        case "tipWidth" : 
                            obj.tipWidth = Number(myObj[i]);
                            break;
                        case "tipHeight" : 
                            obj.tipHeight = Number(myObj[i]);
                            break;
                        case "tipInclination" : 
                            obj.tipInclination = Number(myObj[i]);
                            break;
                        case "tipX" : 
                            obj.tipX = Number(myObj[i]);
                            break;
                        case "tipOrientation" : 
                            obj.tipOrientation = String(myObj[i]);
                            break;
                        case "tipAutoMove" : 
                            obj.tipAutoMove = String(myObj[i]);
                            break;
                        case "image" : 
                            obj.image = String(myObj[i]);
                            break;
                        case "imageWidth" : 
                            obj.imageWidth = Number(myObj[i]);
                            break;
                        case "imageHeight" : 
                            obj.imageHeight = Number(myObj[i]);
                            break;
                        case "imageBackgroundColor" : 
                            obj.imageBackgroundColor = Number(myObj[i]);
                            break;
                        case "imageBackgroundAlpha" : 
                            obj.imageBackgroundAlpha = Number(myObj[i]);
                            break;
                        case "imageBackgroundWidth" : 
                            obj.imageBackgroundWidth = Number(myObj[i]);
                            break;
                        case "imageX" : 
                            obj.imageX = Number(myObj[i]);
                            break;
                        case "imageY" : 
                            obj.imageY = Number(myObj[i]);
                            break;
                        case "delay" : 
                            obj.delay = Number(myObj[i]);
                            break;
                        case "animationTime" : 
                            obj.animationTime = Number(myObj[i]);
                            break;
                        case "animationType" : 
                            obj.animationType = String(myObj[i]);
                            break;
                        case "stay" : 
                            obj.stay = String(myObj[i]);
                            break;
                        case "XDistanceFromCursor" : 
                            obj.XDistanceFromCursor = Number(myObj[i]);
                            break;
                        case "YDistanceFromCursor" : 
                            obj.YDistanceFromCursor = Number(myObj[i]);
                            break;
                        case "alignHoriz" : 
                            obj.alignHoriz = String(myObj[i]);
                            break;
                        case "alignVerti" : 
                            obj.alignVerti = String(myObj[i]);
                            break;
                        case "stageToleranceX" : 
                            obj.stageToleranceX = Number(myObj[i]);
                            break;
                        case "stageToleranceY" : 
                            obj.stageToleranceY = Number(myObj[i]);
                            break;
                        case "addShadow" : 
                            obj.addShadow = String(myObj[i]);
                            break;
                        case "shadowDistance" : 
                            obj.shadowDistance = Number(myObj[i]);
                            break;
                        case "shadowColor" : 
                            obj.shadowColor = Number(myObj[i]);
                            break;
                        case "shadowAlpha" : 
                            obj.shadowAlpha = Number(myObj[i]);
                            break;
                        case "shadowBlurX" : 
                            obj.shadowBlurX = Number(myObj[i]);
                            break;
                        case "shadowBlurY" : 
                            obj.shadowBlurY = Number(myObj[i]);
                            break;
                        case "shadowStrength" : 
                            obj.shadowStrength = Number(myObj[i]);
                            break;
                        case "shadowQuality" : 
                            obj.shadowQuality = Number(myObj[i]);
                            break;
                        case "shadowInner" : 
                            if (String(myObj[i]) == "true") {
                                obj.shadowInner = true;
                            }
                            break;
                        case "shadowKnockout" : 
                            if (String(myObj[i]) == "true") {
                                obj.shadowKnockout = true;
                            }
                            break;
                        case "shadowHideObject" : 
                            if (String(myObj[i]) == "true") {
                                obj.shadowHideObject = true;
                            }
                            break;
                        case "shadowAngleInDegrees" : 
                            obj.shadowAngleInDegrees = Number(myObj[i]);
                            break;
                        case "textXPos" : 
                            obj.textXPos = Number(myObj[i]);
                            break;
                        case "farX" : 
                            obj.farX = Number(myObj[i]);
                            break;
                    }
                }
            }
            if ((obj.tipAutoMove == "true") && (obj.tipOrientation == "bottom")) {
                obj.tipInclination = (-obj.tipWidth) / 2;
            }
            if ((obj.tipAutoMove == "true") && (obj.tipOrientation == "top")) {
                obj.tipInclination = (-obj.tipWidth) / 2;
            }
        }
        function drawGradient(_arg2, _arg5, _arg4, _arg3, _arg13, _arg12, _arg15, _arg14) {
            var _local6 = {matrixType:"box", x:0, y:0, w:_arg5, h:_arg4, r:(_arg14 * Math.PI) / 180};
            _arg2.clear();
            _arg2.beginGradientFill("linear", _arg13, _arg12, _arg15, _local6);
            if (obj.strokeWidth != 0) {
                _arg2.lineStyle(obj.strokeWidth, obj.strokeColor, obj.strokeAlpha, true);
            }
            _arg2.moveTo(_arg3, 0);
            if ((obj.tipWidth != 0) && (obj.tipOrientation == "top")) {
                _arg2.lineTo(obj.tipX - obj.tipWidth, 0);
                _arg2.lineTo((obj.tipX - obj.tipWidth) - obj.tipInclination, -obj.tipHeight);
                _arg2.lineTo(obj.tipX, 0);
            }
            _arg2.lineTo(_arg5 - _arg3, 0);
            _arg2.curveTo(_arg5, 0, _arg5, _arg3);
            _arg2.lineTo(_arg5, _arg4 - _arg3);
            _arg2.curveTo(_arg5, _arg4, _arg5 - _arg3, _arg4);
            if ((obj.tipWidth != 0) && (obj.tipOrientation == "bottom")) {
                _arg2.lineTo(obj.tipX, _arg4);
                _arg2.lineTo(obj.tipX + obj.tipInclination, _arg4 + obj.tipHeight);
                _arg2.lineTo(obj.tipX - obj.tipWidth, _arg4);
            }
            _arg2.lineTo(_arg3, _arg4);
            _arg2.curveTo(0, _arg4, 0, _arg4 - _arg3);
            _arg2.lineTo(0, _arg3);
            _arg2.curveTo(0, 0, _arg3, 0);
            _arg2.endFill();
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
    }
