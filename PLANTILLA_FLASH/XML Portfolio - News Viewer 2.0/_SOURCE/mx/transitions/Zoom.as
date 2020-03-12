
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.transitions.Zoom extends mx.transitions.Transition
    {
        var _xscaleFinal, __get__manager, _yscaleFinal, _content;
        function Zoom (_arg3, _arg4, _arg5) {
            super();
            init(_arg3, _arg4, _arg5);
        }
        function init(_arg3, _arg4, _arg5) {
            super.init(_arg3, _arg4, _arg5);
            _xscaleFinal = __get__manager().__get__contentAppearance()._xscale;
            _yscaleFinal = __get__manager().__get__contentAppearance()._yscale;
        }
        function _render(_arg2) {
            if (_arg2 < 0) {
                _arg2 = 0;
            }
            _content._xscale = _arg2 * _xscaleFinal;
            _content._yscale = _arg2 * _yscaleFinal;
        }
        static var version = "1.1.0.52";
        var type = mx.transitions.Zoom;
        var className = "Zoom";
    }
