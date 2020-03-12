
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.transitions.Iris extends mx.transitions.Transition
    {
        var _maxDimension, _width, _height, _minDimension, _cornerMode, _content, _mask, getNextHighestDepthMC, __get__direction, _innerBounds, drawCircle, drawBox;
        function Iris (_arg3, _arg4, _arg5) {
            super();
            init(_arg3, _arg4, _arg5);
        }
        function init(_arg4, _arg3, _arg5) {
            super.init(_arg4, _arg3, _arg5);
            if (_arg3.startPoint) {
                _startPoint = _arg3.startPoint;
            }
            if (_arg3.shape != undefined) {
                _shape = _arg3.shape;
            }
            _maxDimension = Math.max(_width, _height);
            _minDimension = Math.min(_width, _height);
            if (_startPoint % 2) {
                _cornerMode = true;
            }
            if (_shape == "SQUARE") {
                if (_cornerMode) {
                    _render = _renderSquareCorner;
                } else {
                    _render = _renderSquareEdge;
                }
            } else if (_shape == "CIRCLE") {
                _render = _renderCircle;
            }
            _initMask();
        }
        function start() {
            _content.setMask(_mask);
            super.start();
        }
        function cleanUp() {
            _mask.removeMovieClip();
            super.cleanUp();
        }
        function _initMask() {
            var _local4 = _content;
            var _local5 = getNextHighestDepthMC(_local4);
            var _local2 = (_mask = _local4.createEmptyMovieClip("__mask_Iris_" + __get__direction(), _local5));
            _local2._visible = false;
            var _local3 = _innerBounds;
            switch (_startPoint) {
                case 1 : 
                    _local2._x = _local3.xMin;
                    _local2._y = _local3.yMin;
                    break;
                case 4 : 
                    _local2._x = _local3.xMin;
                    _local2._y = (_local3.yMin + _local3.yMax) * 0.5;
                    break;
                case 3 : 
                    _local2._rotation = 90;
                    _local2._x = _local3.xMax;
                    _local2._y = _local3.yMin;
                    break;
                case 2 : 
                    _local2._rotation = 90;
                    _local2._x = (_local3.xMin + _local3.xMax) * 0.5;
                    _local2._y = _local3.yMin;
                    break;
                case 9 : 
                    _local2._rotation = 180;
                    _local2._x = _local3.xMax;
                    _local2._y = _local3.yMax;
                    break;
                case 6 : 
                    _local2._rotation = 180;
                    _local2._x = _local3.xMax;
                    _local2._y = (_local3.yMin + _local3.yMax) * 0.5;
                    break;
                case 7 : 
                    _local2._rotation = -90;
                    _local2._x = _local3.xMin;
                    _local2._y = _local3.yMax;
                    break;
                case 8 : 
                    _local2._rotation = -90;
                    _local2._x = (_local3.xMin + _local3.xMax) * 0.5;
                    _local2._y = _local3.yMax;
                    break;
                case 5 : 
                    _local2._x = (_local3.xMin + _local3.xMax) * 0.5;
                    _local2._y = (_local3.yMin + _local3.yMax) * 0.5;
                    break;
                default : 
                    break;
            }
        }
        function _render(p) {
        }
        function _renderCircle(_arg3) {
            var _local2 = _mask;
            _local2.clear();
            _local2.beginFill(16711680);
            if (_startPoint == 5) {
                var _local4 = 0.5 * Math.sqrt((_width * _width) + (_height * _height));
                drawCircle(_local2, 0, 0, _arg3 * _local4);
            } else if (_cornerMode) {
                var _local4 = Math.sqrt((_width * _width) + (_height * _height));
                _drawQuarterCircle(_local2, _arg3 * _local4);
            } else {
                if ((_startPoint == 4) || (_startPoint == 6)) {
                    var _local4 = Math.sqrt((_width * _width) + ((0.25 * _height) * _height));
                } else if ((_startPoint == 2) || (_startPoint == 8)) {
                    var _local4 = Math.sqrt(((0.25 * _width) * _width) + (_height * _height));
                }
                _drawHalfCircle(_local2, _arg3 * _local4);
            }
            _local2.endFill();
        }
        function _drawQuarterCircle(_arg4, _arg1) {
            var _local3 = 0;
            var _local2 = 0;
            _arg4.lineTo(_arg1, 0);
            _arg4.curveTo(_arg1 + _local3, (0.414213562373095 * _arg1) + _local2, (0.707106781186547 * _arg1) + _local3, (0.707106781186547 * _arg1) + _local2);
            _arg4.curveTo((0.414213562373095 * _arg1) + _local3, _arg1 + _local2, _local3, _arg1 + _local2);
        }
        function _drawHalfCircle(_arg4, _arg1) {
            var _local3 = 0;
            var _local2 = 0;
            _arg4.lineTo(0, -_arg1);
            _arg4.curveTo((0.414213562373095 * _arg1) + _local3, (-_arg1) + _local2, (0.707106781186547 * _arg1) + _local3, (-0.707106781186547 * _arg1) + _local2);
            _arg4.curveTo(_arg1 + _local3, (-0.414213562373095 * _arg1) + _local2, _arg1 + _local3, _local2);
            _arg4.curveTo(_arg1 + _local3, (0.414213562373095 * _arg1) + _local2, (0.707106781186547 * _arg1) + _local3, (0.707106781186547 * _arg1) + _local2);
            _arg4.curveTo((0.414213562373095 * _arg1) + _local3, _arg1 + _local2, _local3, _arg1 + _local2);
            _arg4.lineTo(0, 0);
        }
        function _renderSquareEdge(_arg7) {
            var _local2 = _mask;
            _local2.clear();
            _local2.beginFill(16711680);
            var _local5 = _startPoint;
            var _local6 = _arg7 * _width;
            var _local4 = _arg7 * _height;
            var _local3 = _arg7 * _maxDimension;
            if ((_local5 == 4) || (_local5 == 6)) {
                drawBox(_local2, 0, -0.5 * _local4, _local6, _local4);
            } else if (_height < _width) {
                drawBox(_local2, 0, -0.5 * _local3, _local4, _local6);
            } else {
                drawBox(_local2, 0, -0.5 * _local3, _local3, _local3);
            }
            _local2.endFill();
        }
        function _renderSquareCorner(_arg6) {
            var _local2 = _mask;
            _local2.clear();
            _local2.beginFill(16711680);
            var _local5 = _startPoint;
            var _local4 = _arg6 * _width;
            var _local3 = _arg6 * _height;
            if (_local5 == 5) {
                drawBox(_local2, -0.5 * _local4, -0.5 * _local3, _local4, _local3);
            } else if ((_local5 == 3) || (_local5 == 7)) {
                drawBox(_local2, 0, 0, _local3, _local4);
            } else {
                drawBox(_local2, 0, 0, _local4, _local3);
            }
            _local2.endFill();
        }
        static var version = "1.1.0.52";
        static var SQUARE = "SQUARE";
        static var CIRCLE = "CIRCLE";
        var type = mx.transitions.Iris;
        var className = "Iris";
        var _startPoint = 5;
        var _shape = "SQUARE";
    }
