
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.transitions.Squeeze extends mx.transitions.Transition
    {
        var _scaleProp, _scaleFinal, __get__manager, _content;
        function Squeeze (_arg3, _arg4, _arg5) {
            super();
            init(_arg3, _arg4, _arg5);
        }
        function init(_arg4, _arg3, _arg5) {
            super.init(_arg4, _arg3, _arg5);
            if (_arg3.dimension) {
                _scaleProp = "_yscale";
                _scaleFinal = __get__manager().__get__contentAppearance()._yscale;
            } else {
                _scaleProp = "_xscale";
                _scaleFinal = __get__manager().__get__contentAppearance()._xscale;
            }
        }
        function _render(_arg2) {
            if (_arg2 <= 0) {
                _arg2 = 0;
                _content._visible = false;
            } else {
                _content._visible = true;
            }
            _content[_scaleProp] = _arg2 * _scaleFinal;
        }
        static var version = "1.1.0.52";
        var type = mx.transitions.Squeeze;
        var className = "Squeeze";
    }
