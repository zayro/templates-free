class mx.transitions.Iris extends mx.transitions.Transition
{
    var _height, _width, _maxDimension, _minDimension, _cornerMode, _mask, _content, getNextHighestDepthMC, __get__direction, _innerBounds, drawCircle, drawBox;
    function Iris(content, transParams, manager)
    {
        super();
        this.init(content, transParams, manager);
    } // End of the function
    function init(content, transParams, manager)
    {
        super.init(content, transParams, manager);
        if (transParams.startPoint)
        {
            _startPoint = transParams.startPoint;
        } // end if
        if (transParams.shape != undefined)
        {
            _shape = transParams.shape;
        } // end if
        _maxDimension = Math.max(_width, _height);
        _minDimension = Math.min(_width, _height);
        if (_startPoint % 2)
        {
            _cornerMode = true;
        } // end if
        if (_shape == "SQUARE")
        {
            if (_cornerMode)
            {
                _render = _renderSquareCorner;
            }
            else
            {
                _render = _renderSquareEdge;
            } // end else if
        }
        else if (_shape == "CIRCLE")
        {
            _render = _renderCircle;
        } // end else if
        this._initMask();
    } // End of the function
    function start()
    {
        _content.setMask(_mask);
        super.start();
    } // End of the function
    function cleanUp()
    {
        _mask.removeMovieClip();
        super.cleanUp();
    } // End of the function
    function _initMask()
    {
        var _loc4 = _content;
        var _loc5 = this.getNextHighestDepthMC(_loc4);
        var _loc2 = _mask = _loc4.createEmptyMovieClip("__mask_Iris_" + this.__get__direction(), _loc5);
        _loc2._visible = false;
        var _loc3 = _innerBounds;
        switch (_startPoint)
        {
            case 1:
            {
                _loc2._x = _loc3.xMin;
                _loc2._y = _loc3.yMin;
                break;
            } 
            case 4:
            {
                _loc2._x = _loc3.xMin;
                _loc2._y = (_loc3.yMin + _loc3.yMax) * 5.000000E-001;
                break;
            } 
            case 3:
            {
                _loc2._rotation = 90;
                _loc2._x = _loc3.xMax;
                _loc2._y = _loc3.yMin;
                break;
            } 
            case 2:
            {
                _loc2._rotation = 90;
                _loc2._x = (_loc3.xMin + _loc3.xMax) * 5.000000E-001;
                _loc2._y = _loc3.yMin;
                break;
            } 
            case 9:
            {
                _loc2._rotation = 180;
                _loc2._x = _loc3.xMax;
                _loc2._y = _loc3.yMax;
                break;
            } 
            case 6:
            {
                _loc2._rotation = 180;
                _loc2._x = _loc3.xMax;
                _loc2._y = (_loc3.yMin + _loc3.yMax) * 5.000000E-001;
                break;
            } 
            case 7:
            {
                _loc2._rotation = -90;
                _loc2._x = _loc3.xMin;
                _loc2._y = _loc3.yMax;
                break;
            } 
            case 8:
            {
                _loc2._rotation = -90;
                _loc2._x = (_loc3.xMin + _loc3.xMax) * 5.000000E-001;
                _loc2._y = _loc3.yMax;
                break;
            } 
            case 5:
            {
                _loc2._x = (_loc3.xMin + _loc3.xMax) * 5.000000E-001;
                _loc2._y = (_loc3.yMin + _loc3.yMax) * 5.000000E-001;
                break;
            } 
            default:
            {
                break;
            } 
        } // End of switch
    } // End of the function
    function _render(p)
    {
    } // End of the function
    function _renderCircle(p)
    {
        var _loc2 = _mask;
        _loc2.clear();
        _loc2.beginFill(16711680);
        if (_startPoint == 5)
        {
            var _loc4 = 5.000000E-001 * Math.sqrt(_width * _width + _height * _height);
            this.drawCircle(_loc2, 0, 0, p * _loc4);
        }
        else if (_cornerMode)
        {
            _loc4 = Math.sqrt(_width * _width + _height * _height);
            this._drawQuarterCircle(_loc2, p * _loc4);
        }
        else
        {
            if (_startPoint == 4 || _startPoint == 6)
            {
                _loc4 = Math.sqrt(_width * _width + 2.500000E-001 * _height * _height);
            }
            else if (_startPoint == 2 || _startPoint == 8)
            {
                _loc4 = Math.sqrt(2.500000E-001 * _width * _width + _height * _height);
            } // end else if
            this._drawHalfCircle(_loc2, p * _loc4);
        } // end else if
        _loc2.endFill();
    } // End of the function
    function _drawQuarterCircle(mc, r)
    {
        var _loc3 = 0;
        var _loc2 = 0;
        mc.lineTo(r, 0);
        mc.curveTo(r + _loc3, 4.142136E-001 * r + _loc2, 7.071068E-001 * r + _loc3, 7.071068E-001 * r + _loc2);
        mc.curveTo(4.142136E-001 * r + _loc3, r + _loc2, _loc3, r + _loc2);
    } // End of the function
    function _drawHalfCircle(mc, r)
    {
        var _loc3 = 0;
        var _loc2 = 0;
        mc.lineTo(0, -r);
        mc.curveTo(4.142136E-001 * r + _loc3, -r + _loc2, 7.071068E-001 * r + _loc3, -7.071068E-001 * r + _loc2);
        mc.curveTo(r + _loc3, -4.142136E-001 * r + _loc2, r + _loc3, _loc2);
        mc.curveTo(r + _loc3, 4.142136E-001 * r + _loc2, 7.071068E-001 * r + _loc3, 7.071068E-001 * r + _loc2);
        mc.curveTo(4.142136E-001 * r + _loc3, r + _loc2, _loc3, r + _loc2);
        mc.lineTo(0, 0);
    } // End of the function
    function _renderSquareEdge(p)
    {
        var _loc2 = _mask;
        _loc2.clear();
        _loc2.beginFill(16711680);
        var _loc5 = _startPoint;
        var _loc6 = p * _width;
        var _loc4 = p * _height;
        var _loc3 = p * _maxDimension;
        if (_loc5 == 4 || _loc5 == 6)
        {
            this.drawBox(_loc2, 0, -5.000000E-001 * _loc4, _loc6, _loc4);
        }
        else if (_height < _width)
        {
            this.drawBox(_loc2, 0, -5.000000E-001 * _loc3, _loc4, _loc6);
        }
        else
        {
            this.drawBox(_loc2, 0, -5.000000E-001 * _loc3, _loc3, _loc3);
        } // end else if
        _loc2.endFill();
    } // End of the function
    function _renderSquareCorner(p)
    {
        var _loc2 = _mask;
        _loc2.clear();
        _loc2.beginFill(16711680);
        var _loc5 = _startPoint;
        var _loc4 = p * _width;
        var _loc3 = p * _height;
        if (_loc5 == 5)
        {
            this.drawBox(_loc2, -5.000000E-001 * _loc4, -5.000000E-001 * _loc3, _loc4, _loc3);
        }
        else if (_loc5 == 3 || _loc5 == 7)
        {
            this.drawBox(_loc2, 0, 0, _loc3, _loc4);
        }
        else
        {
            this.drawBox(_loc2, 0, 0, _loc4, _loc3);
        } // end else if
        _loc2.endFill();
    } // End of the function
    static var version = "1.1.0.52";
    static var SQUARE = "SQUARE";
    static var CIRCLE = "CIRCLE";
    var type = mx.transitions.Iris;
    var className = "Iris";
    var _startPoint = 5;
    var _shape = "SQUARE";
} // End of Class
