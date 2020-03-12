
//Created by Action Script Viewer - http://www.buraks.com/asv
    class gs.easing.CustomEase
    {
        var _name, _segments, ease;
        function CustomEase (_arg2, _arg3) {
            _name = _arg2;
            _segments = _arg3;
            _all[_arg2] = this;
            ease = mx.utils.Delegate.create(this, easeProxy);
        }
        static function create(_arg3, _arg2) {
            var _local1 = new gs.easing.CustomEase(_arg3, _arg2);
            return(_local1.ease);
        }
        static function byName(_arg1) {
            return(_all[_arg1].ease);
        }
        function easeProxy(_arg8, _arg10, _arg9, _arg7) {
            var _local5 = _arg8 / _arg7;
            var _local4 = _segments.length;
            var _local3;
            var _local2;
            var _local6 = Math.floor(_local4 * _local5);
            _local3 = (_local5 - (_local6 * (1 / _local4))) * _local4;
            _local2 = _segments[_local6];
            return(_arg10 + (_arg9 * (_local2.s + (_local3 * (((2 * (1 - _local3)) * (_local2.cp - _local2.s)) + (_local3 * (_local2.e - _local2.s)))))));
        }
        function destroy() {
            _segments = null;
            delete _all[_name];
        }
        static var VERSION = 0.91;
        static var _all = {};
    }
