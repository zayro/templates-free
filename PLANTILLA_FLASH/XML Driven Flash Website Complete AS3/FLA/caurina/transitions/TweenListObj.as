﻿package caurina.transitions
{

    public class TweenListObj extends Object
    {
        public var onUpdate:Function;
        public var useFrames:Boolean;
        public var hasStarted:Boolean;
        public var onOverwriteParams:Array;
        public var timeStart:Number;
        public var count:Number;
        public var timeComplete:Number;
        public var onStartParams:Array;
        public var onUpdateScope:Object;
        public var rounded:Boolean;
        public var onUpdateParams:Array;
        public var properties:Object;
        public var onComplete:Function;
        public var transitionParams:Object;
        public var updatesSkipped:Number;
        public var onStart:Function;
        public var onOverwriteScope:Object;
        public var skipUpdates:Number;
        public var onStartScope:Object;
        public var scope:Object;
        public var transition:Function;
        public var timePaused:Number;
        public var onCompleteParams:Array;
        public var timesCalled:Number;
        public var isCaller:Boolean;
        public var onError:Function;
        public var onErrorScope:Object;
        public var onOverwrite:Function;
        public var isPaused:Boolean;
        public var waitFrames:Boolean;
        public var onCompleteScope:Object;

        public function TweenListObj(param1:Object, param2:Number, param3:Number, param4:Boolean, param5:Function, param6:Object)
        {
            scope = param1;
            timeStart = param2;
            timeComplete = param3;
            useFrames = param4;
            transition = param5;
            transitionParams = param6;
            properties = new Object();
            isPaused = false;
            timePaused = undefined;
            isCaller = false;
            updatesSkipped = 0;
            timesCalled = 0;
            skipUpdates = 0;
            hasStarted = false;
            return;
        }// end function

        public function clone(param1:Boolean) : TweenListObj
        {
            var _loc_2:TweenListObj;
            var _loc_3:String;
            _loc_2 = new TweenListObj(scope, timeStart, timeComplete, useFrames, transition, transitionParams);
            _loc_2.properties = new Array();
            for (_loc_3 in properties)
            {
                // label
                _loc_2.properties[_loc_3] = properties[_loc_3].clone();
            }// end of for ... in
            _loc_2.skipUpdates = skipUpdates;
            _loc_2.updatesSkipped = updatesSkipped;
            if (!param1)
            {
                _loc_2.onStart = onStart;
                _loc_2.onUpdate = onUpdate;
                _loc_2.onComplete = onComplete;
                _loc_2.onOverwrite = onOverwrite;
                _loc_2.onError = onError;
                _loc_2.onStartParams = onStartParams;
                _loc_2.onUpdateParams = onUpdateParams;
                _loc_2.onCompleteParams = onCompleteParams;
                _loc_2.onOverwriteParams = onOverwriteParams;
                _loc_2.onStartScope = onStartScope;
                _loc_2.onUpdateScope = onUpdateScope;
                _loc_2.onCompleteScope = onCompleteScope;
                _loc_2.onOverwriteScope = onOverwriteScope;
                _loc_2.onErrorScope = onErrorScope;
            }// end if
            _loc_2.rounded = rounded;
            _loc_2.isPaused = isPaused;
            _loc_2.timePaused = timePaused;
            _loc_2.isCaller = isCaller;
            _loc_2.count = count;
            _loc_2.timesCalled = timesCalled;
            _loc_2.waitFrames = waitFrames;
            _loc_2.hasStarted = hasStarted;
            return _loc_2;
        }// end function

        public function toString() : String
        {
            var _loc_1:String;
            var _loc_2:Boolean;
            var _loc_3:String;
            _loc_1 = "\n[TweenListObj ";
            _loc_1 = _loc_1 + ("scope:" + String(scope));
            _loc_1 = _loc_1 + ", properties:";
            _loc_2 = true;
            for (_loc_3 in properties)
            {
                // label
                if (true)
                {
                    _loc_1 = _loc_1 + ",";
                }// end if
                _loc_1 = _loc_1 + ("[name:" + properties[_loc_3].name);
                _loc_1 = _loc_1 + (",valueStart:" + properties[_loc_3].valueStart);
                _loc_1 = _loc_1 + (",valueComplete:" + properties[_loc_3].valueComplete);
                _loc_1 = _loc_1 + "]";
                _loc_2 = false;
            }// end of for ... in
            _loc_1 = _loc_1 + (", timeStart:" + String(timeStart));
            _loc_1 = _loc_1 + (", timeComplete:" + String(timeComplete));
            _loc_1 = _loc_1 + (", useFrames:" + String(useFrames));
            _loc_1 = _loc_1 + (", transition:" + String(transition));
            _loc_1 = _loc_1 + (", transitionParams:" + String(transitionParams));
            if (skipUpdates)
            {
                _loc_1 = _loc_1 + (", skipUpdates:" + String(skipUpdates));
            }// end if
            if (updatesSkipped)
            {
                _loc_1 = _loc_1 + (", updatesSkipped:" + String(updatesSkipped));
            }// end if
            if (Boolean(onStart))
            {
                _loc_1 = _loc_1 + (", onStart:" + String(onStart));
            }// end if
            if (Boolean(onUpdate))
            {
                _loc_1 = _loc_1 + (", onUpdate:" + String(onUpdate));
            }// end if
            if (Boolean(onComplete))
            {
                _loc_1 = _loc_1 + (", onComplete:" + String(onComplete));
            }// end if
            if (Boolean(onOverwrite))
            {
                _loc_1 = _loc_1 + (", onOverwrite:" + String(onOverwrite));
            }// end if
            if (Boolean(onError))
            {
                _loc_1 = _loc_1 + (", onError:" + String(onError));
            }// end if
            if (onStartParams)
            {
                _loc_1 = _loc_1 + (", onStartParams:" + String(onStartParams));
            }// end if
            if (onUpdateParams)
            {
                _loc_1 = _loc_1 + (", onUpdateParams:" + String(onUpdateParams));
            }// end if
            if (onCompleteParams)
            {
                _loc_1 = _loc_1 + (", onCompleteParams:" + String(onCompleteParams));
            }// end if
            if (onOverwriteParams)
            {
                _loc_1 = _loc_1 + (", onOverwriteParams:" + String(onOverwriteParams));
            }// end if
            if (onStartScope)
            {
                _loc_1 = _loc_1 + (", onStartScope:" + String(onStartScope));
            }// end if
            if (onUpdateScope)
            {
                _loc_1 = _loc_1 + (", onUpdateScope:" + String(onUpdateScope));
            }// end if
            if (onCompleteScope)
            {
                _loc_1 = _loc_1 + (", onCompleteScope:" + String(onCompleteScope));
            }// end if
            if (onOverwriteScope)
            {
                _loc_1 = _loc_1 + (", onOverwriteScope:" + String(onOverwriteScope));
            }// end if
            if (onErrorScope)
            {
                _loc_1 = _loc_1 + (", onErrorScope:" + String(onErrorScope));
            }// end if
            if (rounded)
            {
                _loc_1 = _loc_1 + (", rounded:" + String(rounded));
            }// end if
            if (isPaused)
            {
                _loc_1 = _loc_1 + (", isPaused:" + String(isPaused));
            }// end if
            if (timePaused)
            {
                _loc_1 = _loc_1 + (", timePaused:" + String(timePaused));
            }// end if
            if (isCaller)
            {
                _loc_1 = _loc_1 + (", isCaller:" + String(isCaller));
            }// end if
            if (count)
            {
                _loc_1 = _loc_1 + (", count:" + String(count));
            }// end if
            if (timesCalled)
            {
                _loc_1 = _loc_1 + (", timesCalled:" + String(timesCalled));
            }// end if
            if (waitFrames)
            {
                _loc_1 = _loc_1 + (", waitFrames:" + String(waitFrames));
            }// end if
            if (hasStarted)
            {
                _loc_1 = _loc_1 + (", hasStarted:" + String(hasStarted));
            }// end if
            _loc_1 = _loc_1 + "]\n";
            return _loc_1;
        }// end function

        public static function makePropertiesChain(param1:Object) : Object
        {
            var _loc_2:Object;
            var _loc_3:Object;
            var _loc_4:Object;
            var _loc_5:Object;
            var _loc_6:Number;
            var _loc_7:Number;
            var _loc_8:Number;
            _loc_2 = param1.base;
            if (_loc_2)
            {
                _loc_3 = {};
                if (_loc_2 is Array)
                {
                    _loc_4 = [];
                    _loc_8 = 0;
                    while (_loc_8++ < _loc_2.length)
                    {
                        // label
                        _loc_4.push(_loc_2[_loc_8]);
                    }// end while
                }
                else
                {
                    _loc_4 = [_loc_2];
                }// end else if
                _loc_4.push(param1);
                _loc_6 = _loc_4.length;
                _loc_7 = 0;
                while (_loc_7++ < _loc_6)
                {
                    // label
                    if (_loc_4[_loc_7]["base"])
                    {
                        _loc_5 = AuxFunctions.concatObjects(makePropertiesChain(_loc_4[_loc_7]["base"]), _loc_4[_loc_7]);
                    }
                    else
                    {
                        _loc_5 = _loc_4[_loc_7];
                    }// end else if
                    _loc_3 = AuxFunctions.concatObjects(_loc_3, _loc_5);
                }// end while
                if (_loc_3["base"])
                {
                    delete _loc_3["base"];
                }// end if
                return _loc_3;
            }
            else
            {
                return param1;
            }// end else if
        }// end function

    }
}
