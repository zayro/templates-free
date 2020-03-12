
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.video.CuePointManager
    {
        var _owner, _id, _asCuePointTolerance, _linearSearchTolerance, _metadataLoaded, allCuePoints, asCuePoints, _disabledCuePoints, flvCuePoints, navCuePoints, eventCuePoints, _asCuePointIndex, __get__playheadUpdateInterval, _disabledCuePointsByNameOnly;
        function CuePointManager (_arg3, _arg2) {
            _owner = _arg3;
            _id = _arg2;
            reset();
            _asCuePointTolerance = _owner.getVideoPlayer(_id).__get__playheadUpdateInterval() / 2000;
            _linearSearchTolerance = DEFAULT_LINEAR_SEARCH_TOLERANCE;
        }
        function reset() {
            _metadataLoaded = false;
            allCuePoints = null;
            asCuePoints = null;
            _disabledCuePoints = null;
            flvCuePoints = null;
            navCuePoints = null;
            eventCuePoints = null;
            _asCuePointIndex = 0;
        }
        function get metadataLoaded() {
            return(_metadataLoaded);
        }
        function set playheadUpdateInterval(_arg2) {
            _asCuePointTolerance = _arg2 / 2000;
            //return(__get__playheadUpdateInterval());
        }
        function get id() {
            return(_id);
        }
        function addASCuePoint(_arg8, _arg9, _arg10) {
            var _local3;
            if (typeof(_arg8) == "object") {
                _local3 = deepCopyObject(_arg8);
            } else {
                _local3 = {time:_arg8, name:_arg9, parameters:deepCopyObject(_arg10)};
            }
            var _local7 = isNaN(_local3.time) || (_local3.time < 0);
            if (_local7) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
            }
            var _local6 = (_local3.name == undefined) || (_local3.name == null);
            if (_local6) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be undefined or null");
            }
            var _local2;
            _local3.type = "actionscript";
            if (((asCuePoints == null) || (asCuePoints == undefined)) || (asCuePoints.length < 1)) {
                _local2 = 0;
                asCuePoints = new Array();
                asCuePoints.push(_local3);
            } else {
                _local2 = getCuePointIndex(asCuePoints, true, _local3.time);
                _local2 = ((asCuePoints[_local2].time > _local3.time) ? 0 : (_local2 + 1));
                asCuePoints.splice(_local2, 0, _local3);
            }
            if (((allCuePoints == null) || (allCuePoints == undefined)) || (allCuePoints.length < 1)) {
                _local2 = 0;
                allCuePoints = new Array();
                allCuePoints.push(_local3);
            } else {
                _local2 = getCuePointIndex(allCuePoints, true, _local3.time);
                _local2 = ((allCuePoints[_local2].time > _local3.time) ? 0 : (_local2 + 1));
                allCuePoints.splice(_local2, 0, _local3);
            }
            var _local5 = _owner.getVideoPlayer(_id).__get__playheadTime();
            if (_local5 > 0) {
                if (_asCuePointIndex == _local2) {
                    if (_local5 > asCuePoints[_local2].time) {
                        _asCuePointIndex++;
                    }
                } else if (_asCuePointIndex > _local2) {
                    _asCuePointIndex++;
                }
            } else {
                _asCuePointIndex = 0;
            }
            var _local4 = deepCopyObject(asCuePoints[_local2]);
            _local4["array"] = asCuePoints;
            _local4.index = _local2;
            return(_local4);
        }
        function removeASCuePoint(_arg4) {
            if (((asCuePoints == null) || (asCuePoints == undefined)) || (asCuePoints.length < 1)) {
                return(null);
            }
            var _local3;
            switch (typeof(_arg4)) {
                case "string" : 
                    _local3 = {name:_arg4};
                    break;
                case "number" : 
                    _local3 = {time:_arg4};
                    break;
                case "object" : 
                    _local3 = _arg4;
                    break;
            }
            var _local2 = getCuePointIndex(asCuePoints, false, _local3.time, _local3.name);
            if (_local2 < 0) {
                return(null);
            }
            _local3 = asCuePoints[_local2];
            asCuePoints.splice(_local2, 1);
            _local2 = getCuePointIndex(allCuePoints, false, _local3.time, _local3.name);
            if (_local2 > 0) {
                allCuePoints.splice(_local2, 1);
            }
            if (_owner.getVideoPlayer(_id).__get__playheadTime() > 0) {
                if (_asCuePointIndex > _local2) {
                    _asCuePointIndex--;
                }
            } else {
                _asCuePointIndex = 0;
            }
            return(_local3);
        }
        function setFLVCuePointEnabled(_arg9, _arg10) {
            var _local4;
            switch (typeof(_arg10)) {
                case "string" : 
                    _local4 = {name:_arg10};
                    break;
                case "number" : 
                    _local4 = {time:_arg10};
                    break;
                case "object" : 
                    _local4 = _arg10;
                    break;
            }
            var _local12 = isNaN(_local4.time) || (_local4.time < 0);
            var _local11 = (_local4.name == undefined) || (_local4.name == null);
            if (_local12 && (_local11)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
            }
            var _local6 = 0;
            var _local2;
            var _local5;
            if (_local12) {
                if (!_metadataLoaded) {
                    if (_disabledCuePointsByNameOnly[_local4.name] == undefined) {
                        if (!_arg9) {
                            if (((_disabledCuePointsByNameOnly == null) || (_disabledCuePointsByNameOnly == undefined)) || (_disabledCuePointsByNameOnly.length < 0)) {
                                _disabledCuePointsByNameOnly = new Object();
                            }
                            _disabledCuePointsByNameOnly[_local4.name] = new Array();
                        }
                    } else {
                        if (_arg9) {
                            _disabledCuePointsByNameOnly[_local4.name] = undefined;
                        }
                        return(-1);
                    }
                    removeCuePoints(_disabledCuePoints, _local4);
                    return(-1);
                }
                if (_arg9) {
                    _local6 = removeCuePoints(_disabledCuePoints, _local4);
                } else {
                    var _local3;
                    _local2 = getCuePointIndex(flvCuePoints, true, -1, _local4.name);
                    while (_local2 >= 0) {
                        _local3 = flvCuePoints[_local2];
                        _local5 = getCuePointIndex(_disabledCuePoints, true, _local3.time);
                        if ((_local5 < 0) || (_disabledCuePoints[_local5].time != _local3.time)) {
                            _disabledCuePoints = insertCuePoint(_local5, _disabledCuePoints, {name:_local3.name, time:_local3.time});
                            _local6 = _local6 + 1;
                        }
                        _local2 = getNextCuePointIndexWithName(_local3.name, flvCuePoints, _local2);
                    }
                }
                return(_local6);
            }
            _local2 = getCuePointIndex(_disabledCuePoints, false, _local4.time, _local4.name);
            if (_local2 < 0) {
                if (_arg9) {
                    if (!_metadataLoaded) {
                        _local2 = getCuePointIndex(_disabledCuePoints, false, _local4.time);
                        if (_local2 < 0) {
                            _local5 = getCuePointIndex(_disabledCuePointsByNameOnly[_local4.name], true, _local4.time);
                            if (cuePointCompare(_local4.time, null, _disabledCuePointsByNameOnly[_local4.name]) != 0) {
                                _disabledCuePointsByNameOnly[_local4.name] = insertCuePoint(_local5, _disabledCuePointsByNameOnly[_local4.name], _local4);
                            }
                        } else {
                            _disabledCuePoints.splice(_local2, 1);
                        }
                    }
                    return((_metadataLoaded ? 0 : -1));
                }
            } else {
                if (_arg9) {
                    _disabledCuePoints.splice(_local2, 1);
                    _local6 = 1;
                } else {
                    _local6 = 0;
                }
                return((_metadataLoaded ? (_local6) : -1));
            }
            if (_metadataLoaded) {
                _local2 = getCuePointIndex(flvCuePoints, false, _local4.time, _local4.name);
                if (_local2 < 0) {
                    return(0);
                }
                if (_local11) {
                    _local4.name = flvCuePoints[_local2].name;
                }
            }
            _local5 = getCuePointIndex(_disabledCuePoints, true, _local4.time);
            _disabledCuePoints = insertCuePoint(_local5, _disabledCuePoints, _local4);
            _local6 = 1;
            return((_metadataLoaded ? 1 : -1));
        }
        function removeCuePoints(_arg3, _arg6) {
            var _local2;
            var _local4;
            var _local5 = 0;
            _local2 = getCuePointIndex(_arg3, true, -1, _arg6.name);
            while (_local2 >= 0) {
                _local4 = _arg3[_local2];
                _arg3.splice(_local2, 1);
                _local2--;
                _local5++;
                _local2 = getNextCuePointIndexWithName(_local4.name, _arg3, _local2);
            }
            return(_local5);
        }
        function insertCuePoint(_arg1, _arg2, _arg3) {
            if (_arg1 < 0) {
                _arg2 = new Array();
                _arg2.push(_arg3);
            } else {
                if (_arg2[_arg1].time > _arg3.time) {
                    _arg1 = 0;
                } else {
                    _arg1++;
                }
                _arg2.splice(_arg1, 0, _arg3);
            }
            return(_arg2);
        }
        function isFLVCuePointEnabled(_arg4) {
            if (!_metadataLoaded) {
                return(true);
            }
            var _local3;
            switch (typeof(_arg4)) {
                case "string" : 
                    _local3 = {name:_arg4};
                    break;
                case "number" : 
                    _local3 = {time:_arg4};
                    break;
                case "object" : 
                    _local3 = _arg4;
                    break;
            }
            var _local5 = isNaN(_local3.time) || (_local3.time < 0);
            var _local6 = (_local3.name == undefined) || (_local3.name == null);
            if (_local5 && (_local6)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
            }
            if (_local5) {
                var _local2 = getCuePointIndex(flvCuePoints, true, -1, _local3.name);
                if (_local2 < 0) {
                    return(true);
                }
                while (_local2 >= 0) {
                    if (getCuePointIndex(_disabledCuePoints, false, flvCuePoints[_local2].time, flvCuePoints[_local2].name) < 0) {
                        return(true);
                    }
                    _local2 = getNextCuePointIndexWithName(_local3.name, flvCuePoints, _local2);
                }
                return(false);
            }
            return(getCuePointIndex(_disabledCuePoints, false, _local3.time, _local3.name) < 0);
        }
        function dispatchASCuePoints() {
            var _local5 = _owner.getVideoPlayer(_id).__get__playheadTime();
            if ((_owner.getVideoPlayer(_id).__get__stateResponsive() && (asCuePoints != null)) && (asCuePoints != undefined)) {
                while ((_asCuePointIndex < asCuePoints.length) && (asCuePoints[_asCuePointIndex].time <= (_local5 + _asCuePointTolerance))) {
                    _owner.dispatchEvent({type:"cuePoint", info:deepCopyObject(asCuePoints[_asCuePointIndex++]), vp:_id});
                }
            }
        }
        function resetASCuePointIndex(_arg3) {
            if (((_arg3 <= 0) || (asCuePoints == null)) || (asCuePoints == undefined)) {
                _asCuePointIndex = 0;
                return(undefined);
            }
            var _local2 = getCuePointIndex(asCuePoints, true, _arg3);
            _asCuePointIndex = ((asCuePoints[_local2].time < _arg3) ? (_local2 + 1) : (_local2));
        }
        function processFLVCuePoints(_arg10) {
            _metadataLoaded = true;
            if (((_arg10 == undefined) || (_arg10 == null)) || (_arg10.length < 1)) {
                flvCuePoints = null;
                navCuePoints = null;
                eventCuePoints = null;
                return(undefined);
            }
            flvCuePoints = _arg10;
            navCuePoints = new Array();
            eventCuePoints = new Array();
            var _local5;
            var _local6 = -1;
            var _local2;
            var _local4 = _disabledCuePoints;
            var _local3 = 0;
            _disabledCuePoints = new Array();
            var _local9 = 0;
            while (_local2 = flvCuePoints[_local9++] , _local2 != undefined) {
                if ((_local6 > 0) && (_local6 >= _local2.time)) {
                    flvCuePoints = null;
                    navCuePoints = null;
                    eventCuePoints = null;
                    _disabledCuePoints = null;
                    _disabledCuePointsByNameOnly = null;
                    throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "Unsorted cuePoint found after time: " + _local6);
                }
                _local6 = _local2.time;
                while ((_local3 < _local4.length) && (cuePointCompare(_local4[_local3].time, null, _local2) < 0)) {
                    _local3++;
                }
                if ((_disabledCuePointsByNameOnly[_local2.name] != undefined) || ((_local3 < _local4.length) && (cuePointCompare(_local4[_local3].time, _local4[_local3].name, _local2) == 0))) {
                    _disabledCuePoints.push({time:_local2.time, name:_local2.name});
                }
                if (_local2.type == "navigation") {
                    navCuePoints.push(_local2);
                } else if (_local2.type == "event") {
                    eventCuePoints.push(_local2);
                }
                if (((allCuePoints == null) || (allCuePoints == undefined)) || (allCuePoints.length < 1)) {
                    allCuePoints = new Array();
                    allCuePoints.push(_local2);
                } else {
                    _local5 = getCuePointIndex(allCuePoints, true, _local2.time);
                    _local5 = ((allCuePoints[_local5].time > _local2.time) ? 0 : (_local5 + 1));
                    allCuePoints.splice(_local5, 0, _local2);
                }
            }
            delete _disabledCuePointsByNameOnly;
            _disabledCuePointsByNameOnly = null;
            delete _disabledCuePointsByNameOnly;
            _disabledCuePointsByNameOnly = null;
        }
        function processCuePointsProperty(_arg3) {
            if (((_arg3 == undefined) || (_arg3 == null)) || (_arg3.length == 0)) {
                return(undefined);
            }
            var _local4 = 0;
            var _local8;
            var _local6;
            var _local7;
            var _local5;
            var _local9;
            var _local2 = 0;
            while (_local2 < (_arg3.length - 1)) {
                switch (_local4) {
                    case 6 : 
                        addOrDisable(_local9, _local5);
                        _local4 = 0;
                    case 0 : 
                        if (_arg3[_local2++] != "t") {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                        }
                        if (isNaN(_arg3[_local2])) {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
                        }
                        _local5 = new Object();
                        _local5.time = _arg3[_local2] / 1000;
                        _local4++;
                        break;
                    case 1 : 
                        if (_arg3[_local2++] != "n") {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                        }
                        if ((_arg3[_local2] == undefined) || (_arg3[_local2] == null)) {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be null or undefined");
                        }
                        _local5.name = this.unescape(_arg3[_local2]);
                        _local4++;
                        break;
                    case 2 : 
                        if (_arg3[_local2++] != "t") {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                        }
                        if (isNaN(_arg3[_local2])) {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "type must be number");
                        }
                        switch (_arg3[_local2]) {
                            case 0 : 
                                _local5.type = "event";
                                break;
                            case 1 : 
                                _local5.type = "navigation";
                                break;
                            case 2 : 
                                _local5.type = "actionscript";
                                break;
                            default : 
                                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "type must be 0, 1 or 2");
                        }
                        _local4++;
                        break;
                    case 3 : 
                        if (_arg3[_local2++] != "d") {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                        }
                        if (isNaN(_arg3[_local2])) {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "disabled must be number");
                        }
                        _local9 = _arg3[_local2] != 0;
                        _local4++;
                        break;
                    case 4 : 
                        if (_arg3[_local2++] != "p") {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                        }
                        if (isNaN(_arg3[_local2])) {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "num params must be number");
                        }
                        _local8 = _arg3[_local2];
                        _local4++;
                        if (_local8 == 0) {
                            _local4++;
                        } else {
                            _local5.parameters = new Object();
                        }
                        break;
                    case 5 : 
                        _local6 = _arg3[_local2++];
                        _local7 = _arg3[_local2];
                        if (typeof(_local6) == "string") {
                            _local6 = this.unescape(_local6);
                        }
                        if (typeof(_local7) == "string") {
                            _local7 = this.unescape(_local7);
                        }
                        _local5.parameters[_local6] = _local7;
                        _local8--;
                        if (_local8 == 0) {
                            _local4++;
                        }
                        break;
                }
                _local2++;
            }
            if (_local4 == 6) {
                addOrDisable(_local9, _local5);
            } else {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected end of cuePoint param string");
            }
        }
        function addOrDisable(_arg3, _arg2) {
            if (_arg3) {
                if (_arg2.type == "actionscript") {
                    throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "Cannot disable actionscript cue points");
                }
                setFLVCuePointEnabled(false, _arg2);
            } else if (_arg2.type == "actionscript") {
                addASCuePoint(_arg2);
            }
        }
        function unescape(_arg4) {
            var _local3 = _arg4;
            var _local1 = 0;
            while (_local1 < cuePointsReplace.length) {
                var _local2 = _local3.split(cuePointsReplace[_local1++]);
                if (_local2.length > 1) {
                    _local3 = _local2.join(cuePointsReplace[_local1]);
                }
                _local1++;
            }
            return(_local3);
        }
        function getCuePointIndex(_arg4, _arg14, _arg10, _arg5, _arg7, _arg9) {
            if (((_arg4 == null) || (_arg4 == undefined)) || (_arg4.length < 1)) {
                return(-1);
            }
            var _local13 = isNaN(_arg10) || (_arg10 < 0);
            var _local16 = (_arg5 == undefined) || (_arg5 == null);
            if (_local13 && (_local16)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
            }
            if ((_arg7 == undefined) || (_arg7 == null)) {
                _arg7 = 0;
            }
            if ((_arg9 == undefined) || (_arg9 == null)) {
                _arg9 = _arg4.length;
            }
            if ((!_local16) && (_arg14 || (_local13))) {
                var _local8;
                var _local2;
                if (_local13) {
                    _local8 = _arg7;
                } else {
                    _local8 = getCuePointIndex(_arg4, _arg14, _arg10);
                }
                _local2 = _local8;
                while (_local2 >= _arg7) {
                    if (_arg4[_local2].name == _arg5) {
                        break;
                    }
                    _local2--;
                }
                if (_local2 >= _arg7) {
                    return(_local2);
                }
                _local2 = _local8 + 1;
                while (_local2 < _arg9) {
                    if (_arg4[_local2].name == _arg5) {
                        break;
                    }
                    _local2++;
                }
                if (_local2 < _arg9) {
                    return(_local2);
                }
                return(-1);
            }
            var _local6;
            if (_arg9 <= _linearSearchTolerance) {
                var _local11 = _arg7 + _arg9;
                var _local3 = _arg7;
                while (_local3 < _local11) {
                    _local6 = cuePointCompare(_arg10, _arg5, _arg4[_local3]);
                    if (_local6 == 0) {
                        return(_local3);
                    }
                    if (_local6 < 0) {
                        break;
                    }
                    _local3++;
                }
                if (_arg14) {
                    if (_local3 > 0) {
                        return(_local3 - 1);
                    }
                    return(0);
                }
                return(-1);
            }
            var _local12 = Math.floor(_arg9 / 2);
            var _local15 = _arg7 + _local12;
            _local6 = cuePointCompare(_arg10, _arg5, _arg4[_local15]);
            if (_local6 < 0) {
                return(getCuePointIndex(_arg4, _arg14, _arg10, _arg5, _arg7, _local12));
            }
            if (_local6 > 0) {
                return(getCuePointIndex(_arg4, _arg14, _arg10, _arg5, _local15 + 1, (_local12 - 1) + (_arg9 % 2)));
            }
            return(_local15);
        }
        function getNextCuePointIndexWithName(_arg4, _arg2, _arg3) {
            if ((_arg4 == undefined) || (_arg4 == null)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be undefined or null");
            }
            if ((_arg2 == null) || (_arg2 == undefined)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint.array undefined");
            }
            if ((isNaN(_arg3) || (_arg3 < -1)) || (_arg3 >= _arg2.length)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint.index must be number between -1 and cuePoint.array.length");
            }
            var _local1;
            _local1 = _arg3 + 1;
            while (_local1 < _arg2.length) {
                if (_arg2[_local1].name == _arg4) {
                    break;
                }
                _local1++;
            }
            if (_local1 < _arg2.length) {
                return(_local1);
            }
            return(-1);
        }
        static function cuePointCompare(_arg5, _arg1, _arg4) {
            var _local2 = Math.round(_arg5 * 1000);
            var _local3 = Math.round(_arg4.time * 1000);
            if (_local2 < _local3) {
                return(-1);
            }
            if (_local2 > _local3) {
                return(1);
            }
            if ((_arg1 != null) || (_arg1 != undefined)) {
                if (_arg1 == _arg4.name) {
                    return(0);
                }
                if (_arg1 < _arg4.name) {
                    return(-1);
                }
                return(1);
            }
            return(0);
        }
        function getCuePoint(_arg5, _arg8, _arg4) {
            var _local3;
            switch (typeof(_arg4)) {
                case "string" : 
                    _local3 = {name:_arg4};
                    break;
                case "number" : 
                    _local3 = {time:_arg4};
                    break;
                case "object" : 
                    _local3 = _arg4;
                    break;
            }
            var _local2 = getCuePointIndex(_arg5, _arg8, _local3.time, _local3.name);
            if (_local2 < 0) {
                return(null);
            }
            _local3 = deepCopyObject(_arg5[_local2]);
            _local3["array"] = _arg5;
            _local3.index = _local2;
            return(_local3);
        }
        function getNextCuePointWithName(_arg2) {
            if ((_arg2 == null) || (_arg2 == undefined)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint parameter undefined");
            }
            if (isNaN(_arg2.time) || (_arg2.time < 0)) {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
            }
            var _local3 = getNextCuePointIndexWithName(_arg2.name, _arg2["array"], _arg2.index);
            if (_local3 < 0) {
                return(null);
            }
            var _local4 = deepCopyObject(_arg2["array"][_local3]);
            _local4["array"] = _arg2["array"];
            _local4.index = _local3;
            return(_local4);
        }
        static function deepCopyObject(_arg1, _arg3) {
            if (((_arg1 == undefined) || (_arg1 == null)) || (typeof(_arg1) != "object")) {
                return(_arg1);
            }
            if (_arg3 == undefined) {
                _arg3 = 0;
            }
            var _local2 = new Object();
            for (var _local4 in _arg1) {
                if ((_arg3 == 0) && ((_local4 == "array") || (_local4 == "index"))) {
                } else if (typeof(_arg1[_local4]) == "object") {
                    _local2[_local4] = deepCopyObject(_arg1[_local4], _arg3 + 1);
                } else {
                    _local2[_local4] = _arg1[_local4];
                }
            }
            return(_local2);
        }
        static var DEFAULT_LINEAR_SEARCH_TOLERANCE = 50;
        static var cuePointsReplace = ["&quot;", "\"", "&#39;", "'", "&#44;", ",", "&amp;", "&"];
    }
