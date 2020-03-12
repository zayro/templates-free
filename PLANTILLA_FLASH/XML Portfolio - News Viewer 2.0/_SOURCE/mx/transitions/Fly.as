
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.transitions.Fly extends mx.transitions.Transition
    {
        var _xFinal, __get__manager, _yFinal, _stagePoints, _content, _innerBounds, _xInitial, _yInitial;
        function Fly (_arg3, _arg4, _arg5) {
            super();
            init(_arg3, _arg4, _arg5);
        }
        function init(_arg10, _arg7, _arg11) {
            super.init(_arg10, _arg7, _arg11);
            if (_arg7.startPoint) {
                _startPoint = _arg7.startPoint;
            }
            _xFinal = __get__manager().__get__contentAppearance()._x;
            _yFinal = __get__manager().__get__contentAppearance()._y;
            var _local6 = Stage.scaleMode;
            Stage.scaleMode = "showAll";
            var _local3 = (_stagePoints = {});
            _local3[1] = {x:0, y:0};
            _local3[2] = {x:0, y:0};
            _local3[3] = {x:Stage.width, y:0};
            _local3[4] = {x:0, y:0};
            _local3[5] = {x:Stage.width / 2, y:Stage.height / 2};
            _local3[6] = {x:Stage.width, y:0};
            _local3[7] = {x:0, y:Stage.height};
            _local3[8] = {x:0, y:Stage.height};
            _local3[9] = {x:Stage.width, y:Stage.height};
            for (var _local5 in _local3) {
                _content._parent.globalToLocal(_local3[_local5]);
            }
            var _local4 = _innerBounds;
            _local3[1].x = _local3[1].x - _local4.xMax;
            _local3[1].y = _local3[1].y - _local4.yMax;
            _local3[2].x = __get__manager().__get__contentAppearance()._x;
            _local3[2].y = _local3[2].y - _local4.yMax;
            _local3[3].x = _local3[3].x - _local4.xMin;
            _local3[3].y = _local3[3].y - _local4.yMax;
            _local3[4].x = _local3[4].x - _local4.xMax;
            _local3[4].y = __get__manager().__get__contentAppearance()._y;
            _local3[5].x = _local3[5].x - ((_local4.xMax + _local4.xMin) / 2);
            _local3[5].y = _local3[5].y - ((_local4.yMax + _local4.yMin) / 2);
            _local3[6].x = _local3[6].x - _local4.xMin;
            _local3[6].y = __get__manager().__get__contentAppearance()._y;
            _local3[7].x = _local3[7].x - _local4.xMax;
            _local3[7].y = _local3[7].y - _local4.yMin;
            _local3[8].x = __get__manager().__get__contentAppearance()._x;
            _local3[8].y = _local3[8].y - _local4.yMin;
            _local3[9].x = _local3[9].x - _local4.xMin;
            _local3[9].y = _local3[9].y - _local4.yMin;
            _xInitial = _stagePoints[_startPoint].x;
            _yInitial = _stagePoints[_startPoint].y;
            Stage.scaleMode = _local6;
        }
        function _render(_arg2) {
            _content._x = _xFinal + ((_xInitial - _xFinal) * (1 - _arg2));
            _content._y = _yFinal + ((_yInitial - _yFinal) * (1 - _arg2));
        }
        static var version = "1.1.0.52";
        var type = mx.transitions.Fly;
        var className = "Fly";
        var _startPoint = 4;
    }
