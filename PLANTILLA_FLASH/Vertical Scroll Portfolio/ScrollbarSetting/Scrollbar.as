class ScrollbarSetting.Scrollbar extends MovieClip
{
    var _x, initX, _y, initY, Canvas, dragging, __get__ratio, ScrollButton, contentType, ContentMovie, contentInitY, containerType, Container, containerHeight, ContentText, topBoundary, bottomBoundary, useHandCursor, _parent, startDrag, stopDrag, contentHeight, hitTest, _ymouse, __set__ratio;
    function Scrollbar()
    {
        super();
        initX = _x;
        initY = _y;
    } // End of the function
    function onLoad()
    {
        if (parseFloat(System.capabilities.version.split(" ")[1]) >= 8)
        {
            _filters = true;
        }
        else
        {
            _filters = false;
        } // end else if
        Canvas.useHandCursor = false;
    } // End of the function
    function get ratio()
    {
        return (_ratio);
    } // End of the function
    function set ratio(pnValue)
    {
        if (dragging)
        {
            return;
        } // end if
        if (pnValue < 0)
        {
            pnValue = 0;
        }
        else if (pnValue > 1)
        {
            pnValue = 1;
        } // end else if
        _ratio = pnValue;
        this.moveButton();
        this.moveContent();
        //return (this.ratio());
        null;
    } // End of the function
    function initialize(psContentType, pMovieContent, pTextContent, pContainer)
    {
        _ratio = 0;
        ScrollButton._y = 0;
        initialized = true;
        contentType = psContentType;
        if (pMovieContent != null)
        {
            ContentMovie = pMovieContent;
            contentInitY = ContentMovie._y;
            if (_global.$ScrollbarClass_MouseListeners == undefined)
            {
                _global.$ScrollbarClass_MouseListeners = new Array();
            } // end if
            _global.$ScrollbarClass_MouseListeners.push(this);
            Mouse.addListener(this);
            if (pContainer != null)
            {
                if (contentType == "MovieClip")
                {
                    containerType = "Mask";
                    Container = pContainer;
                }
                else
                {
                    containerType = "ScrollRect";
                    Container = ContentMovie._parent;
                    Container.scrollRect = (flash.geom.Rectangle)(pContainer);
                } // end else if
            }
            else
            {
                containerType = "Stage";
                containerHeight = Stage.height;
                Stage.addListener(this);
            } // end else if
        }
        else if (pTextContent != null)
        {
            ContentText = pTextContent;
            contentType = "TextField";
            ContentText.addListener(this);
            this.attachToText();
            ContentText.onSetFocus = mx.utils.Delegate.create(this, onSetFocus);
            ContentText.onKillFocus = mx.utils.Delegate.create(this, onKillFocus);
        } // end else if
        this.getContentSize();
        topBoundary = ScrollButton._y;
        bottomBoundary = containerHeight - ScrollButton._height;
		
        useHandCursor = false;
        ScrollButton.onPress = function ()
        {
            this.startDrag(false, _x, _parent.topBoundary, _x, _parent.bottomBoundary);
            _parent.dragging = true;
        };
        ScrollButton.onRelease = ScrollButton.onReleaseOutside = function ()
        {
            this.stopDrag();
            _parent.dragging = false;
        };
        this.setButtonSize();
        this.stretchCanvas();
    } // End of the function
    function getContentSize()
    {
        if (contentType == "TextField")
        {
            containerHeight = ContentText._height;
            contentHeight = ContentText.textHeight;
        }
        else
        {
            if (containerType == "Mask")
            {
                containerHeight = Container._height;
            }
            else if (containerType == "ScrollRect")
            {
                containerHeight = Container.scrollRect.height;
            }
            else
            {
                containerHeight = Stage.height;
            } // end else if
            contentHeight = ContentMovie._height;
        } // end else if
    } // End of the function
    function attachToText()
    {
        _y = ContentText._y;
        _x = ContentText._x + ContentText._width;
        if (Canvas.resize)
        {
            Canvas.resize(Canvas._width, contentHeight);
        }
        else
        {
            Canvas._height = contentHeight;
        } // end else if
    } // End of the function
    function moveButton()
    {
        ScrollButton.ySlideTo(topBoundary + _ratio * bottomBoundary, 3.000000E-001, "easeOutCirc", 0, function ()
        {
        });
    } // End of the function
    function moveContent(pnHeight)
    {
        switch (contentType)
        {
            case "TextField":
            {
                var _loc2 = Math.ceil(ContentText.maxscroll * this.__get__ratio());
                ContentText.scrollTo(_loc2, TEXTFIELDCONTENT_ANIMATION_TIME, TEXTFIELDCONTENT_ANIMATION_TYPE);
                break;
            } 
            default:
            {
                var _loc3 = contentInitY - Math.max(0, contentHeight + CONTENT_BOTTOM_MARGIN - containerHeight) * this.__get__ratio();
                ContentMovie.ySlideTo(_loc3, MOVIECLIPCONTENT_ANIMATION_TIME, MOVIECLIPCONTENT_ANIMATION_TYPE);
                break;
            } 
        } // End of switch
    } // End of the function
    function setButtonSize()
    {
        var _loc2 = containerHeight * Math.min(1, containerHeight / contentHeight);
        if (ScrollButton.resize)
        {
            ScrollButton.resize(ScrollButton._width, _loc2);
        }
        else
        {
            ScrollButton.yScaleTo(_loc2 * (100 / ScrollButton._height), 1, "easeInOutCirc");
        } // end else if
        bottomBoundary = containerHeight - _loc2;
        this.moveButton();
    } // End of the function
    function stretchCanvas()
    {
        if (Canvas.resize)
        {
            Canvas.resize(Canvas._width, containerHeight);
            if (arguments.length == 0)
            {
                Canvas._yscale = Canvas._height / containerHeight * 100;
                Canvas.yScaleTo(100, 4, "easeOutQuad");
            } // end if
        }
        else
        {
            Canvas._height = containerHeight;
            _root.resizeMarcacao();
        } // end else if
    } // End of the function
    function onMouseDown()
    {
        if (this.hitTest(_level0._xmouse, _level0._ymouse) && !ScrollButton.hitTest(_level0._xmouse, _level0._ymouse))
        {
            if (_ymouse > ScrollButton._y + ScrollButton._height)
            {
                ratio = ratio + 1 / (contentHeight / containerHeight);
            }
            else
            {
                ratio = ratio - 1 / (contentHeight / containerHeight);
            } // end if
        } // end else if
    } // End of the function
    function onMouseMove()
    {
        if (dragging)
        {
            _ratio = ScrollButton._y / bottomBoundary;
            this.moveContent();
        } // end if
    } // End of the function
    function onMouseWheel(pnDelta)
    {
        pnDelta = pnDelta > 0 ? (1) : (-1);
        this.__set__ratio(_ratio - pnDelta * 3.000000E-001 / (contentHeight / containerHeight));
    } // End of the function
    function onScroller()
    {
        this.__set__ratio((ContentText.scroll - 1) / Math.max(1, ContentText.maxscroll - 1));
    } // End of the function
    function onChanged()
    {
        this.getContentSize();
        this.setButtonSize();
    } // End of the function
    function onSetFocus(pNewFocus)
    {
        for (var _loc2 = 0; _loc2 < _global.$ScrollbarClass_MouseListeners.length; ++_loc2)
        {
            Mouse.removeListener(_global.$ScrollbarClass_MouseListeners[_loc2]);
        } // end of for
    } // End of the function
    function onKillFocus(pOldFocus)
    {
        for (var _loc2 = 0; _loc2 < _global.$ScrollbarClass_MouseListeners.length; ++_loc2)
        {
            Mouse.addListener(_global.$ScrollbarClass_MouseListeners[_loc2]);
        } // end of for
    } // End of the function
    function onResize()
    {
        if (containerType == "Stage")
        {
            this.getContentSize();
            this.setButtonSize();
            this.stretchCanvas();
        } // end if
    } // End of the function
    var _ratio = 0;
    var _filters = true;
    var CONTENT_BOTTOM_MARGIN = 0;
    var MOVIECLIPCONTENT_ANIMATION_TYPE = "easeOutCirc";
    var TEXTFIELDCONTENT_ANIMATION_TYPE = "linear";
    var MOVIECLIPCONTENT_ANIMATION_TIME = 8.000000E-001;
    var TEXTFIELDCONTENT_ANIMATION_TIME = 0;
    var initialized = false;
} // End of Class
