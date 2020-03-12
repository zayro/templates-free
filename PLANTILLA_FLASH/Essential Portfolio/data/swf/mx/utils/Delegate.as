
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.utils.Delegate extends Object
    {
        var func;
        function Delegate (_arg3) {
            super();
            func = _arg3;
        }
        static function create(_arg5, _arg3) {
            var _local2 = function () {
                var _local2 = arguments.callee.target;
                var _local3 = arguments.callee.func;
                return(_local3.apply(_local2, arguments));
            };
            _local2.target = _arg5;
            _local2.func = _arg3;
            return(_local2);
        }
        function createDelegate(_arg2) {
            return(create(_arg2, func));
        }
    }
