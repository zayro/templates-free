class ascb.util.Proxy
    {
        function Proxy () {
        }
        static function create(oTarget, fFunction) {
            var aParameters = new Array();
            var _local2 = 2;
            while (_local2 < arguments.length) {
                aParameters[_local2 - 2] = arguments[_local2];
                _local2++;
            }
            var _local4 = function () {
                var _local2 = arguments.concat(aParameters);
                fFunction.apply(oTarget, _local2);
            };
            return(_local4);
        }
    }
