
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.transitions.Wipe extends mx.transitions.Transition
    {
        var _content, _mask, getNextHighestDepthMC, __get__direction, _innerMask, drawBox, _cornerMode, _innerBounds;
        function Wipe (_arg3, _arg4, _arg5) {
            super();
            init(_arg3, _arg4, _arg5);
        }
        function init(_arg4, _arg3, _arg5) {
            super.init(_arg4, _arg3, _arg5);
            if (_arg3.startPoint) {
                _startPoint = _arg3.startPoint;
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
            var _local5 = _content;
            var _local6 = getNextHighestDepthMC(_local5);
            var _local4 = (_mask = _local5.createEmptyMovieClip("__mask_Wipe_" + __get__direction(), _local6));
            var _local2 = (_innerMask = _mask.createEmptyMovieClip("innerMask", 0));
            _local2._x = (_local2._y = 50);
            _local4._visible = false;
            _local2.beginFill(16711680);
            drawBox(_local2, -50, -50, 100, 100);
            _local2.endFill();
            switch (_startPoint) {
                case 3 : 
                case 2 : 
                    _local2._rotation = 90;
                    break;
                case 1 : 
                case 4 : 
                    _local2._rotation = 0;
                    break;
                case 9 : 
                case 6 : 
                    _local2._rotation = 180;
                    break;
                case 7 : 
                case 8 : 
                    _local2._rotation = -90;
                    break;
                default : 
                    break;
            }
            if (_startPoint % 2) {
                _cornerMode = true;
            }
            var _local3 = _innerBounds;
            _local4._x = _local3.xMin;
            _local4._y = _local3.yMin;
            _local4._width = _local3.xMax - _local3.xMin;
            _local4._height = _local3.yMax - _local3.yMin;
        }
        function _render(_arg2) {
            _innerMask.clear();
            _innerMask.beginFill(16711680);
            if (_cornerMode) {
                _drawSlant(_innerMask, _arg2);
            } else {
                drawBox(_innerMask, -50, -50, _arg2 * 100, 100);
            }
            _innerMask.endFill();
        }
        function _drawSlant(_arg1, _arg2) {
            _arg1.moveTo(-50, -50);
            if (_arg2 <= 0.5) {
                _arg1.lineTo(200 * (_arg2 - 0.25), -50);
                _arg1.lineTo(-50, 200 * (_arg2 - 0.25));
            } else {
                _arg1.lineTo(50, -50);
                _arg1.lineTo(50, 200 * (_arg2 - 0.75));
                _arg1.lineTo(200 * (_arg2 - 0.75), 50);
                _arg1.lineTo(-50, 50);
            }
            _arg1.lineTo(-50, -50);
        }
        static var version = "1.1.0.52";
        var type = mx.transitions.Wipe;
        var className = "Wipe";
        var _startPoint = 4;
    }
