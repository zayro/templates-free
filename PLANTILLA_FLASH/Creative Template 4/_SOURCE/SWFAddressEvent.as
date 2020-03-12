
//Created by Action Script Viewer - http://www.buraks.com/asv
    class SWFAddressEvent
    {
        var _type, _value, _path, _pathNames, _parameters, _parametersNames;
        function SWFAddressEvent (_arg2) {
            _type = _arg2;
        }
        function toString() {
            return("[class SWFAddressEvent]");
        }
        function get type() {
            return(_type);
        }
        function get target() {
            return(SWFAddress);
        }
        function get value() {
            if (typeof(_value) == "undefined") {
                _value = SWFAddress.getValue();
            }
            return(_value);
        }
        function get path() {
            if (typeof(_path) == "undefined") {
                _path = SWFAddress.getPath();
            }
            return(_path);
        }
        function get pathNames() {
            if (typeof(_pathNames) == "undefined") {
                _pathNames = SWFAddress.getPathNames();
            }
            return(_pathNames);
        }
        function get parameters() {
            if (typeof(_parameters) == "undefined") {
                _parameters = new Array();
                var _local2 = 0;
                while (_local2 < parametersNames.length) {
                    _parameters[parametersNames[_local2]] = SWFAddress.getParameter(parametersNames[_local2]);
                    _local2++;
                }
            }
            return(_parameters);
        }
        function get parametersNames() {
            if (typeof(_parametersNames) == "undefined") {
                _parametersNames = SWFAddress.getParameterNames();
            }
            return(_parametersNames);
        }
        static var INIT = "init";
        static var CHANGE = "change";
    }
