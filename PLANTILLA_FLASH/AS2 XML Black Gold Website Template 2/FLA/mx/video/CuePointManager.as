class mx.video.CuePointManager
{
    var _owner, _id, _asCuePointTolerance, _linearSearchTolerance, _metadataLoaded, allCuePoints, asCuePoints, _disabledCuePoints, flvCuePoints, navCuePoints, eventCuePoints, _asCuePointIndex, __get__playheadUpdateInterval, _disabledCuePointsByNameOnly, __get__id, __get__metadataLoaded, __set__playheadUpdateInterval;
    function CuePointManager(owner, id)
    {
        _owner = owner;
        _id = id;
        this.reset();
        _asCuePointTolerance = _owner.getVideoPlayer(_id).__get__playheadUpdateInterval() / 2000;
        _linearSearchTolerance = mx.video.CuePointManager.DEFAULT_LINEAR_SEARCH_TOLERANCE;
    } // End of the function
    function reset()
    {
        _metadataLoaded = false;
        allCuePoints = null;
        asCuePoints = null;
        _disabledCuePoints = null;
        flvCuePoints = null;
        navCuePoints = null;
        eventCuePoints = null;
        _asCuePointIndex = 0;
    } // End of the function
    function get metadataLoaded()
    {
        return (_metadataLoaded);
    } // End of the function
    function set playheadUpdateInterval(aTime)
    {
        _asCuePointTolerance = aTime / 2000;
        //return (this.playheadUpdateInterval());
        null;
    } // End of the function
    function get id()
    {
        return (_id);
    } // End of the function
    function addASCuePoint(timeOrCuePoint, name, parameters)
    {
        var _loc3;
        if (typeof(timeOrCuePoint) == "object")
        {
            _loc3 = mx.video.CuePointManager.deepCopyObject(timeOrCuePoint);
        }
        else
        {
            _loc3 = {time: timeOrCuePoint, name: name, parameters: mx.video.CuePointManager.deepCopyObject(parameters)};
        } // end else if
        var _loc7 = isNaN(_loc3.time) || _loc3.time < 0;
        if (_loc7)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
        } // end if
        var _loc6 = _loc3.name == undefined || _loc3.name == null;
        if (_loc6)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be undefined or null");
        } // end if
        var _loc2;
        _loc3.type = "actionscript";
        if (asCuePoints == null || asCuePoints == undefined || asCuePoints.length < 1)
        {
            _loc2 = 0;
            asCuePoints = new Array();
            asCuePoints.push(_loc3);
        }
        else
        {
            _loc2 = this.getCuePointIndex(asCuePoints, true, _loc3.time);
            _loc2 = asCuePoints[_loc2].time > _loc3.time ? (0) : (_loc2 + 1);
            asCuePoints.splice(_loc2, 0, _loc3);
        } // end else if
        if (allCuePoints == null || allCuePoints == undefined || allCuePoints.length < 1)
        {
            _loc2 = 0;
            allCuePoints = new Array();
            allCuePoints.push(_loc3);
        }
        else
        {
            _loc2 = this.getCuePointIndex(allCuePoints, true, _loc3.time);
            _loc2 = allCuePoints[_loc2].time > _loc3.time ? (0) : (_loc2 + 1);
            allCuePoints.splice(_loc2, 0, _loc3);
        } // end else if
        var _loc5 = _owner.getVideoPlayer(_id).__get__playheadTime();
        if (_loc5 > 0)
        {
            if (_asCuePointIndex == _loc2)
            {
                if (_loc5 > asCuePoints[_loc2].time)
                {
                    ++_asCuePointIndex;
                } // end if
            }
            else if (_asCuePointIndex > _loc2)
            {
                ++_asCuePointIndex;
            } // end else if
        }
        else
        {
            _asCuePointIndex = 0;
        } // end else if
        var _loc4 = mx.video.CuePointManager.deepCopyObject(asCuePoints[_loc2]);
        _loc4.array = asCuePoints;
        _loc4.index = _loc2;
        return (_loc4);
    } // End of the function
    function removeASCuePoint(timeNameOrCuePoint)
    {
        if (asCuePoints == null || asCuePoints == undefined || asCuePoints.length < 1)
        {
            return (null);
        } // end if
        var _loc3;
        switch (typeof(timeNameOrCuePoint))
        {
            case "string":
            {
                _loc3 = {name: timeNameOrCuePoint};
                break;
            } 
            case "number":
            {
                _loc3 = {time: timeNameOrCuePoint};
                break;
            } 
            case "object":
            {
                _loc3 = timeNameOrCuePoint;
                break;
            } 
        } // End of switch
        var _loc2 = this.getCuePointIndex(asCuePoints, false, _loc3.time, _loc3.name);
        if (_loc2 < 0)
        {
            return (null);
        } // end if
        _loc3 = asCuePoints[_loc2];
        asCuePoints.splice(_loc2, 1);
        _loc2 = this.getCuePointIndex(allCuePoints, false, _loc3.time, _loc3.name);
        if (_loc2 > 0)
        {
            allCuePoints.splice(_loc2, 1);
        } // end if
        if (_owner.getVideoPlayer(_id).__get__playheadTime() > 0)
        {
            if (_asCuePointIndex > _loc2)
            {
                --_asCuePointIndex;
            } // end if
        }
        else
        {
            _asCuePointIndex = 0;
        } // end else if
        return (_loc3);
    } // End of the function
    function setFLVCuePointEnabled(enabled, timeNameOrCuePoint)
    {
        var _loc4;
        switch (typeof(timeNameOrCuePoint))
        {
            case "string":
            {
                _loc4 = {name: timeNameOrCuePoint};
                break;
            } 
            case "number":
            {
                _loc4 = {time: timeNameOrCuePoint};
                break;
            } 
            case "object":
            {
                _loc4 = timeNameOrCuePoint;
                break;
            } 
        } // End of switch
        var _loc12 = isNaN(_loc4.time) || _loc4.time < 0;
        var _loc11 = _loc4.name == undefined || _loc4.name == null;
        if (_loc12 && _loc11)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
        } // end if
        var _loc6 = 0;
        var _loc2;
        var _loc5;
        if (_loc12)
        {
            if (!_metadataLoaded)
            {
                if (_disabledCuePointsByNameOnly[_loc4.name] == undefined)
                {
                    if (!enabled)
                    {
                        if (_disabledCuePointsByNameOnly == null || _disabledCuePointsByNameOnly == undefined || _disabledCuePointsByNameOnly.length < 0)
                        {
                            _disabledCuePointsByNameOnly = new Object();
                        } // end if
                        _disabledCuePointsByNameOnly[_loc4.name] = new Array();
                    } // end if
                }
                else
                {
                    if (enabled)
                    {
                        _disabledCuePointsByNameOnly[_loc4.name] = undefined;
                    } // end if
                    return (-1);
                } // end else if
                this.removeCuePoints(_disabledCuePoints, _loc4);
                return (-1);
            } // end if
            if (enabled)
            {
                _loc6 = this.removeCuePoints(_disabledCuePoints, _loc4);
            }
            else
            {
                var _loc3;
                for (var _loc2 = this.getCuePointIndex(flvCuePoints, true, -1, _loc4.name); _loc2 >= 0; _loc2 = this.getNextCuePointIndexWithName(_loc3.name, flvCuePoints, _loc2))
                {
                    _loc3 = flvCuePoints[_loc2];
                    _loc5 = this.getCuePointIndex(_disabledCuePoints, true, _loc3.time);
                    if (_loc5 < 0 || _disabledCuePoints[_loc5].time != _loc3.time)
                    {
                        _disabledCuePoints = this.insertCuePoint(_loc5, _disabledCuePoints, {name: _loc3.name, time: _loc3.time});
                        _loc6 = _loc6 + 1;
                    } // end if
                } // end of for
            } // end else if
            return (_loc6);
        } // end if
        _loc2 = this.getCuePointIndex(_disabledCuePoints, false, _loc4.time, _loc4.name);
        if (_loc2 < 0)
        {
            if (enabled)
            {
                if (!_metadataLoaded)
                {
                    _loc2 = this.getCuePointIndex(_disabledCuePoints, false, _loc4.time);
                    if (_loc2 < 0)
                    {
                        _loc5 = this.getCuePointIndex(_disabledCuePointsByNameOnly[_loc4.name], true, _loc4.time);
                        if (mx.video.CuePointManager.cuePointCompare(_loc4.time, null, _disabledCuePointsByNameOnly[_loc4.name]) != 0)
                        {
                            _disabledCuePointsByNameOnly[_loc4.name] = this.insertCuePoint(_loc5, _disabledCuePointsByNameOnly[_loc4.name], _loc4);
                        } // end if
                    }
                    else
                    {
                        _disabledCuePoints.splice(_loc2, 1);
                    } // end if
                } // end else if
                return (_metadataLoaded ? (0) : (-1));
            } // end if
        }
        else
        {
            if (enabled)
            {
                _disabledCuePoints.splice(_loc2, 1);
                _loc6 = 1;
            }
            else
            {
                _loc6 = 0;
            } // end else if
            return (_metadataLoaded ? (_loc6) : (-1));
        } // end else if
        if (_metadataLoaded)
        {
            _loc2 = this.getCuePointIndex(flvCuePoints, false, _loc4.time, _loc4.name);
            if (_loc2 < 0)
            {
                return (0);
            } // end if
            if (_loc11)
            {
                _loc4.name = flvCuePoints[_loc2].name;
            } // end if
        } // end if
        _loc5 = this.getCuePointIndex(_disabledCuePoints, true, _loc4.time);
        _disabledCuePoints = this.insertCuePoint(_loc5, _disabledCuePoints, _loc4);
        _loc6 = 1;
        return (_metadataLoaded ? (1) : (-1));
    } // End of the function
    function removeCuePoints(cuePointArray, cuePoint)
    {
        var _loc2;
        var _loc4;
        var _loc5 = 0;
        for (var _loc2 = this.getCuePointIndex(cuePointArray, true, -1, cuePoint.name); _loc2 >= 0; _loc2 = this.getNextCuePointIndexWithName(_loc4.name, cuePointArray, _loc2))
        {
            _loc4 = cuePointArray[_loc2];
            cuePointArray.splice(_loc2, 1);
            --_loc2;
            ++_loc5;
        } // end of for
        return (_loc5);
    } // End of the function
    function insertCuePoint(insertIndex, cuePointArray, cuePoint)
    {
        if (insertIndex < 0)
        {
            cuePointArray = new Array();
            cuePointArray.push(cuePoint);
        }
        else
        {
            if (cuePointArray[insertIndex].time > cuePoint.time)
            {
                insertIndex = 0;
            }
            else
            {
                ++insertIndex;
            } // end else if
            cuePointArray.splice(insertIndex, 0, cuePoint);
        } // end else if
        return (cuePointArray);
    } // End of the function
    function isFLVCuePointEnabled(timeNameOrCuePoint)
    {
        if (!_metadataLoaded)
        {
            return (true);
        } // end if
        var _loc3;
        switch (typeof(timeNameOrCuePoint))
        {
            case "string":
            {
                _loc3 = {name: timeNameOrCuePoint};
                break;
            } 
            case "number":
            {
                _loc3 = {time: timeNameOrCuePoint};
                break;
            } 
            case "object":
            {
                _loc3 = timeNameOrCuePoint;
                break;
            } 
        } // End of switch
        var _loc5 = isNaN(_loc3.time) || _loc3.time < 0;
        var _loc6 = _loc3.name == undefined || _loc3.name == null;
        if (_loc5 && _loc6)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
        } // end if
        if (_loc5)
        {
            var _loc2 = this.getCuePointIndex(flvCuePoints, true, -1, _loc3.name);
            if (_loc2 < 0)
            {
                return (true);
            } // end if
            while (_loc2 >= 0)
            {
                if (this.getCuePointIndex(_disabledCuePoints, false, flvCuePoints[_loc2].time, flvCuePoints[_loc2].name) < 0)
                {
                    return (true);
                } // end if
                _loc2 = this.getNextCuePointIndexWithName(_loc3.name, flvCuePoints, _loc2);
            } // end while
            return (false);
        } // end if
        return (this.getCuePointIndex(_disabledCuePoints, false, _loc3.time, _loc3.name) < 0);
    } // End of the function
    function dispatchASCuePoints()
    {
        var _loc5 = _owner.getVideoPlayer(_id).__get__playheadTime();
        if (_owner.getVideoPlayer(_id).__get__stateResponsive() && asCuePoints != null && asCuePoints != undefined)
        {
            while (_asCuePointIndex < asCuePoints.length && asCuePoints[_asCuePointIndex].time <= _loc5 + _asCuePointTolerance)
            {
                _owner.dispatchEvent({type: "cuePoint", info: mx.video.CuePointManager.deepCopyObject(asCuePoints[_asCuePointIndex++]), vp: _id});
            } // end while
        } // end if
    } // End of the function
    function resetASCuePointIndex(time)
    {
        if (time <= 0 || asCuePoints == null || asCuePoints == undefined)
        {
            _asCuePointIndex = 0;
            return;
        } // end if
        var _loc2 = this.getCuePointIndex(asCuePoints, true, time);
        _asCuePointIndex = asCuePoints[_loc2].time < time ? (_loc2 + 1) : (_loc2);
    } // End of the function
    function processFLVCuePoints(metadataCuePoints)
    {
        _metadataLoaded = true;
        if (metadataCuePoints == undefined || metadataCuePoints == null || metadataCuePoints.length < 1)
        {
            flvCuePoints = null;
            navCuePoints = null;
            eventCuePoints = null;
            return;
        } // end if
        flvCuePoints = metadataCuePoints;
        navCuePoints = new Array();
        eventCuePoints = new Array();
        var _loc5;
        var _loc6 = -1;
        var _loc2;
        var _loc4 = _disabledCuePoints;
        var _loc3 = 0;
        _disabledCuePoints = new Array();
        var _loc9 = 0;
        while (_loc2 = flvCuePoints[_loc9++], flvCuePoints[_loc9++] != undefined)
        {
            if (_loc6 > 0 && _loc6 >= _loc2.time)
            {
                flvCuePoints = null;
                navCuePoints = null;
                eventCuePoints = null;
                _disabledCuePoints = null;
                _disabledCuePointsByNameOnly = null;
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "Unsorted cuePoint found after time: " + _loc6);
            } // end if
            _loc6 = _loc2.time;
            while (_loc3 < _loc4.length && mx.video.CuePointManager.cuePointCompare(_loc4[_loc3].time, null, _loc2) < 0)
            {
                ++_loc3;
            } // end while
            if (_disabledCuePointsByNameOnly[_loc2.name] != undefined || _loc3 < _loc4.length && mx.video.CuePointManager.cuePointCompare(_loc4[_loc3].time, _loc4[_loc3].name, _loc2) == 0)
            {
                _disabledCuePoints.push({time: _loc2.time, name: _loc2.name});
            } // end if
            if (_loc2.type == "navigation")
            {
                navCuePoints.push(_loc2);
            }
            else if (_loc2.type == "event")
            {
                eventCuePoints.push(_loc2);
            } // end else if
            if (allCuePoints == null || allCuePoints == undefined || allCuePoints.length < 1)
            {
                allCuePoints = new Array();
                allCuePoints.push(_loc2);
                continue;
            } // end if
            _loc5 = this.getCuePointIndex(allCuePoints, true, _loc2.time);
            _loc5 = allCuePoints[_loc5].time > _loc2.time ? (0) : (_loc5 + 1);
            allCuePoints.splice(_loc5, 0, _loc2);
        } // end while
        delete this._disabledCuePointsByNameOnly;
        _disabledCuePointsByNameOnly = null;
        delete this._disabledCuePointsByNameOnly;
        _disabledCuePointsByNameOnly = null;
    } // End of the function
    function processCuePointsProperty(cuePoints)
    {
        if (cuePoints == undefined || cuePoints == null || cuePoints.length == 0)
        {
            return;
        } // end if
        var _loc4 = 0;
        var _loc8;
        var _loc6;
        var _loc7;
        var _loc5;
        var _loc9;
        for (var _loc2 = 0; _loc2 < cuePoints.length - 1; ++_loc2)
        {
            switch (_loc4)
            {
                case 6:
                {
                    this.addOrDisable(_loc9, _loc5);
                    _loc4 = 0;
                } 
                case 0:
                {
                    if (cuePoints[_loc2++] != "t")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                    } // end if
                    if (isNaN(cuePoints[_loc2]))
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
                    } // end if
                    _loc5 = new Object();
                    _loc5.time = cuePoints[_loc2] / 1000;
                    ++_loc4;
                    break;
                } 
                case 1:
                {
                    if (cuePoints[_loc2++] != "n")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                    } // end if
                    if (cuePoints[_loc2] == undefined || cuePoints[_loc2] == null)
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be null or undefined");
                    } // end if
                    _loc5.name = this.unescape(cuePoints[_loc2]);
                    ++_loc4;
                    break;
                } 
                case 2:
                {
                    if (cuePoints[_loc2++] != "t")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                    } // end if
                    if (isNaN(cuePoints[_loc2]))
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "type must be number");
                    } // end if
                    switch (cuePoints[_loc2])
                    {
                        case 0:
                        {
                            _loc5.type = "event";
                            break;
                        } 
                        case 1:
                        {
                            _loc5.type = "navigation";
                            break;
                        } 
                        case 2:
                        {
                            _loc5.type = "actionscript";
                            break;
                        } 
                        default:
                        {
                            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "type must be 0, 1 or 2");
                        } 
                    } // End of switch
                    ++_loc4;
                    break;
                } 
                case 3:
                {
                    if (cuePoints[_loc2++] != "d")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                    } // end if
                    if (isNaN(cuePoints[_loc2]))
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "disabled must be number");
                    } // end if
                    _loc9 = cuePoints[_loc2] != 0;
                    ++_loc4;
                    break;
                } 
                case 4:
                {
                    if (cuePoints[_loc2++] != "p")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected cuePoint parameter format");
                    } // end if
                    if (isNaN(cuePoints[_loc2]))
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "num params must be number");
                    } // end if
                    _loc8 = cuePoints[_loc2];
                    ++_loc4;
                    if (_loc8 == 0)
                    {
                        ++_loc4;
                    }
                    else
                    {
                        _loc5.parameters = new Object();
                    } // end else if
                    break;
                } 
                case 5:
                {
                    _loc6 = cuePoints[_loc2++];
                    _loc7 = cuePoints[_loc2];
                    if (typeof(_loc6) == "string")
                    {
                        _loc6 = this.unescape(_loc6);
                    } // end if
                    if (typeof(_loc7) == "string")
                    {
                        _loc7 = this.unescape(_loc7);
                    } // end if
                    _loc5.parameters[_loc6] = _loc7;
                    --_loc8;
                    if (_loc8 == 0)
                    {
                        ++_loc4;
                    } // end if
                    break;
                } 
            } // End of switch
        } // end of for
        if (_loc4 == 6)
        {
            this.addOrDisable(_loc9, _loc5);
        }
        else
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "unexpected end of cuePoint param string");
        } // end else if
    } // End of the function
    function addOrDisable(disable, cuePoint)
    {
        if (disable)
        {
            if (cuePoint.type == "actionscript")
            {
                throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "Cannot disable actionscript cue points");
            } // end if
            this.setFLVCuePointEnabled(false, cuePoint);
        }
        else if (cuePoint.type == "actionscript")
        {
            this.addASCuePoint(cuePoint);
        } // end else if
    } // End of the function
    function unescape(origStr)
    {
        var _loc3 = origStr;
        for (var _loc1 = 0; _loc1 < mx.video.CuePointManager.cuePointsReplace.length; ++_loc1)
        {
            var _loc2 = _loc3.split(mx.video.CuePointManager.cuePointsReplace[_loc1++]);
            if (_loc2.length > 1)
            {
                _loc3 = _loc2.join(mx.video.CuePointManager.cuePointsReplace[_loc1]);
            } // end if
        } // end of for
        return (_loc3);
    } // End of the function
    function getCuePointIndex(cuePointArray, closeIsOK, time, name, start, len)
    {
        if (cuePointArray == null || cuePointArray == undefined || cuePointArray.length < 1)
        {
            return (-1);
        } // end if
        var _loc13 = isNaN(time) || time < 0;
        var _loc16 = name == undefined || name == null;
        if (_loc13 && _loc16)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number and/or name must not be undefined or null");
        } // end if
        if (start == undefined || start == null)
        {
            start = 0;
        } // end if
        if (len == undefined || len == null)
        {
            len = cuePointArray.length;
        } // end if
        if (!_loc16 && (closeIsOK || _loc13))
        {
            var _loc8;
            var _loc2;
            if (_loc13)
            {
                _loc8 = start;
            }
            else
            {
                _loc8 = this.getCuePointIndex(cuePointArray, closeIsOK, time);
            } // end else if
            for (var _loc2 = _loc8; _loc2 >= start; --_loc2)
            {
                if (cuePointArray[_loc2].name == name)
                {
                    break;
                } // end if
            } // end of for
            if (_loc2 >= start)
            {
                return (_loc2);
            } // end if
            for (var _loc2 = _loc8 + 1; _loc2 < len; ++_loc2)
            {
                if (cuePointArray[_loc2].name == name)
                {
                    break;
                } // end if
            } // end of for
            if (_loc2 < len)
            {
                return (_loc2);
            } // end if
            return (-1);
        } // end if
        var _loc6;
        if (len <= _linearSearchTolerance)
        {
            var _loc11 = start + len;
            for (var _loc3 = start; _loc3 < _loc11; ++_loc3)
            {
                _loc6 = mx.video.CuePointManager.cuePointCompare(time, name, cuePointArray[_loc3]);
                if (_loc6 == 0)
                {
                    return (_loc3);
                } // end if
                if (_loc6 < 0)
                {
                    break;
                } // end if
            } // end of for
            if (closeIsOK)
            {
                if (_loc3 > 0)
                {
                    return (_loc3 - 1);
                } // end if
                return (0);
            } // end if
            return (-1);
        } // end if
        var _loc12 = Math.floor(len / 2);
        var _loc15 = start + _loc12;
        _loc6 = mx.video.CuePointManager.cuePointCompare(time, name, cuePointArray[_loc15]);
        if (_loc6 < 0)
        {
            return (this.getCuePointIndex(cuePointArray, closeIsOK, time, name, start, _loc12));
        } // end if
        if (_loc6 > 0)
        {
            return (this.getCuePointIndex(cuePointArray, closeIsOK, time, name, _loc15 + 1, _loc12 - 1 + len % 2));
        } // end if
        return (_loc15);
    } // End of the function
    function getNextCuePointIndexWithName(name, array, index)
    {
        if (name == undefined || name == null)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "name cannot be undefined or null");
        } // end if
        if (array == null || array == undefined)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint.array undefined");
        } // end if
        if (isNaN(index) || index < -1 || index >= array.length)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint.index must be number between -1 and cuePoint.array.length");
        } // end if
        var _loc1;
        for (var _loc1 = index + 1; _loc1 < array.length; ++_loc1)
        {
            if (array[_loc1].name == name)
            {
                break;
            } // end if
        } // end of for
        if (_loc1 < array.length)
        {
            return (_loc1);
        } // end if
        return (-1);
    } // End of the function
    static function cuePointCompare(time, name, cuePoint)
    {
        var _loc2 = Math.round(time * 1000);
        var _loc3 = Math.round(cuePoint.time * 1000);
        if (_loc2 < _loc3)
        {
            return (-1);
        } // end if
        if (_loc2 > _loc3)
        {
            return (1);
        } // end if
        if (name != null || name != undefined)
        {
            if (name == cuePoint.name)
            {
                return (0);
            } // end if
            if (name < cuePoint.name)
            {
                return (-1);
            } // end if
            return (1);
        } // end if
        return (0);
    } // End of the function
    function getCuePoint(cuePointArray, closeIsOK, timeNameOrCuePoint)
    {
        var _loc3;
        switch (typeof(timeNameOrCuePoint))
        {
            case "string":
            {
                _loc3 = {name: timeNameOrCuePoint};
                break;
            } 
            case "number":
            {
                _loc3 = {time: timeNameOrCuePoint};
                break;
            } 
            case "object":
            {
                _loc3 = timeNameOrCuePoint;
                break;
            } 
        } // End of switch
        var _loc2 = this.getCuePointIndex(cuePointArray, closeIsOK, _loc3.time, _loc3.name);
        if (_loc2 < 0)
        {
            return (null);
        } // end if
        _loc3 = mx.video.CuePointManager.deepCopyObject(cuePointArray[_loc2]);
        _loc3.array = cuePointArray;
        _loc3.index = _loc2;
        return (_loc3);
    } // End of the function
    function getNextCuePointWithName(cuePoint)
    {
        if (cuePoint == null || cuePoint == undefined)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "cuePoint parameter undefined");
        } // end if
        if (isNaN(cuePoint.time) || cuePoint.time < 0)
        {
            throw new mx.video.VideoError(mx.video.VideoError.ILLEGAL_CUE_POINT, "time must be number");
        } // end if
        var _loc3 = this.getNextCuePointIndexWithName(cuePoint.name, cuePoint.array, cuePoint.index);
        if (_loc3 < 0)
        {
            return (null);
        } // end if
        var _loc4 = mx.video.CuePointManager.deepCopyObject(cuePoint.array[_loc3]);
        _loc4.array = cuePoint.array;
        _loc4.index = _loc3;
        return (_loc4);
    } // End of the function
    static function deepCopyObject(obj, recurseLevel)
    {
        if (obj == undefined || obj == null || typeof(obj) != "object")
        {
            return (obj);
        } // end if
        if (recurseLevel == undefined)
        {
            recurseLevel = 0;
        } // end if
        var _loc2 = new Object();
        for (var _loc4 in obj)
        {
            if (recurseLevel == 0 && (_loc4 == "array" || _loc4 == "index"))
            {
                continue;
            } // end if
            if (typeof(obj[_loc4]) == "object")
            {
                _loc2[_loc4] = mx.video.CuePointManager.deepCopyObject(obj[_loc4], recurseLevel + 1);
                continue;
            } // end if
            _loc2[_loc4] = obj[_loc4];
        } // end of for...in
        return (_loc2);
    } // End of the function
    static var DEFAULT_LINEAR_SEARCH_TOLERANCE = 50;
    static var cuePointsReplace = ["&quot;", "\"", "&#39;", "\'", "&#44;", ",", "&amp;", "&"];
} // End of Class
