﻿
//Created by Action Script Viewer - http://www.buraks.com/asv
    class caurina.transitions.AuxFunctions
    {
        function AuxFunctions () {
        }
        static function numberToR(_arg1) {
            return((_arg1 & 16711680) >> 16);
        }
        static function numberToG(_arg1) {
            return((_arg1 & 65280) >> 8);
        }
        static function numberToB(_arg1) {
            return(_arg1 & 255);
        }
        static function isInArray(_arg4, _arg3) {
            var _local2 = _arg3.length;
            var _local1 = 0;
            while (_local1 < _local2) {
                if (_arg3[_local1] == _arg4) {
                    return(true);
                }
                _local1++;
            }
            return(false);
        }
        static function getObjectLength(_arg3) {
            var _local1 = 0;
            for (var _local2 in _arg3) {
                _local1++;
            }
            return(_local1);
        }
        static function concatObjects() {
            var _local4 = {};
            var _local2;
            var _local3 = 0;
            while (_local3 < arguments.length) {
                _local2 = arguments[_local3];
                for (var _local5 in _local2) {
                    if (_local2[_local5] == null) {
                        delete _local4[_local5];
                    } else {
                        _local4[_local5] = _local2[_local5];
                    }
                }
                _local3++;
            }
            return(_local4);
        }
    }
