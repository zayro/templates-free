
//Created by Action Script Viewer - http://www.buraks.com/asv
    class caurina.transitions.SpecialProperty
    {
        var getValue, setValue, parameters, preProcess;
        function SpecialProperty (_arg3, _arg2, _arg4, _arg5) {
            getValue = _arg3;
            setValue = _arg2;
            parameters = _arg4;
            preProcess = _arg5;
        }
        function toString() {
            var _local2 = "";
            _local2 = _local2 + "[SpecialProperty ";
            _local2 = _local2 + ("getValue:" + getValue.toString());
            _local2 = _local2 + ", ";
            _local2 = _local2 + ("setValue:" + setValue.toString());
            _local2 = _local2 + ", ";
            _local2 = _local2 + ("parameters:" + parameters.toString());
            _local2 = _local2 + ", ";
            _local2 = _local2 + ("preProcess:" + preProcess.toString());
            _local2 = _local2 + "]";
            return(_local2);
        }
    }
