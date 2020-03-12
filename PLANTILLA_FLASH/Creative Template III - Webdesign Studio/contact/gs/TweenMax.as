class gs.TweenMax extends gs.TweenLite
{
    var _tweenID, _thisReverseEase, _repeatCount, combinedTimeScale, target, _timeScale, delay, initTime, startTime, vars, tweens, _hasPlugins, duration, ease, _hasUpdate, pauseTime, __set__enabled, started, activate, active, __get__progress, initted, __set__progress, killVars, __get__paused, __get__reversed, __get__timeScale, __get__enabled, __set__paused, __set__reversed, __set__timeScale;
    static var __get__globalTimeScale, __set__globalTimeScale;
    function TweenMax($target, $duration, $vars)
    {
        super($target, $duration, $vars);
        if (gs.TweenLite.version < 1.009000E+001)
        {
            trace ("TweenMax error! Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
        } // end if
        _idCount = ++gs.TweenMax._idCount;
        _tweenID = "t" + gs.TweenMax._idCount;
        _thisReverseEase = mx.utils.Delegate.create(this, reverseEase);
        _repeatCount = 0;
        if (combinedTimeScale != 1 && target instanceof gs.TweenMax)
        {
            _timeScale = 1;
            combinedTimeScale = gs.TweenMax._globalTimeScale;
        }
        else
        {
            _timeScale = combinedTimeScale;
            combinedTimeScale = combinedTimeScale * gs.TweenMax._globalTimeScale;
        } // end else if
        if (combinedTimeScale != 1 && delay != 0)
        {
            startTime = initTime + delay * (1000 / combinedTimeScale);
        } // end if
        if (!isNaN(vars.yoyo) || !isNaN(vars.loop))
        {
            vars.persist = true;
        } // end if
        if (delay == 0 && vars.startAt != undefined)
        {
            vars.startAt.overwrite = 0;
            new gs.TweenMax(target, 0, vars.startAt);
        } // end if
    } // End of the function
    function initTweenVals()
    {
        if (vars.startAt != undefined && delay != 0)
        {
            vars.startAt.overwrite = 0;
            new gs.TweenMax(target, 0, vars.startAt);
        } // end if
        super.initTweenVals();
        if (vars.roundProps instanceof Array && gs.TweenLite.plugins.roundProps != undefined)
        {
            var _loc8;
            var _loc4;
            var _loc5;
            var _loc7;
            var _loc9 = vars.roundProps;
            var _loc6;
            var _loc3;
            for (var _loc8 = _loc9.length - 1; _loc8 > -1; --_loc8)
            {
                _loc5 = _loc9[_loc8];
                for (var _loc4 = tweens.length - 1; _loc4 > -1; --_loc4)
                {
                    _loc3 = tweens[_loc4];
                    if (_loc3.name == _loc5)
                    {
                        if (_loc3.isPlugin)
                        {
                            _loc3.target.round = true;
                        }
                        else if (_loc6 == null)
                        {
                            _loc6 = new gs.TweenLite.plugins.roundProps();
                            _loc6.add(_loc3.target, _loc5, _loc3.start, _loc3.change);
                            _hasPlugins = true;
                            tweens[_loc4] = new gs.utils.tween.TweenInfo(_loc6, "changeFactor", 0, 1, _loc5, true);
                        }
                        else
                        {
                            _loc6.add(_loc3.target, _loc5, _loc3.start, _loc3.change);
                            tweens.splice(_loc4, 1);
                        } // end else if
                        continue;
                    } // end if
                    if (_loc3.isPlugin && _loc3.name == "_MULTIPLE_" && !_loc3.target.round)
                    {
                        _loc7 = " " + _loc3.target.overwriteProps.join(" ") + " ";
                        if (_loc7.indexOf(" " + _loc5 + " ") != -1)
                        {
                            _loc3.target.round = true;
                        } // end if
                    } // end if
                } // end of for
            } // end of for
        } // end if
    } // End of the function
    function render($t)
    {
        var _loc5 = ($t - startTime) * 1.000000E-003 * combinedTimeScale;
        var _loc4;
        var _loc2;
        var _loc3;
        if (_loc5 >= duration)
        {
            _loc5 = duration;
            _loc4 = ease == vars.ease || duration == 1.000000E-003 ? (1) : (0);
        }
        else
        {
            _loc4 = this.ease(_loc5, 0, 1, duration);
        } // end else if
        for (var _loc3 = tweens.length - 1; _loc3 > -1; --_loc3)
        {
            _loc2 = tweens[_loc3];
            _loc2.target[_loc2.property] = _loc2.start + _loc4 * _loc2.change;
        } // end of for
        if (_hasUpdate)
        {
            vars.onUpdate.apply(vars.onUpdateScope, vars.onUpdateParams);
        } // end if
        if (_loc5 == duration)
        {
            this.complete(true);
        } // end if
    } // End of the function
    function pause()
    {
        if (isNaN(pauseTime))
        {
            pauseTime = gs.TweenLite.currentTime;
            startTime = 1.000000E+015;
            this.__set__enabled(false);
            gs.TweenMax._pausedTweens[_tweenID] = this;
        } // end if
    } // End of the function
    function resume()
    {
        this.__set__enabled(true);
        if (!isNaN(pauseTime))
        {
            initTime = initTime + (gs.TweenLite.currentTime - pauseTime);
            startTime = initTime + delay * (1000 / combinedTimeScale);
            pauseTime = NaN;
            if (!started && gs.TweenLite.currentTime >= startTime)
            {
                this.activate();
            }
            else
            {
                active = started;
            } // end else if
            delete gs.TweenMax._pausedTweens[_tweenID];
        } // end if
    } // End of the function
    function restart($includeDelay)
    {
        if ($includeDelay == true)
        {
            initTime = gs.TweenLite.currentTime;
            startTime = gs.TweenLite.currentTime + delay * (1000 / combinedTimeScale);
        }
        else
        {
            startTime = gs.TweenLite.currentTime;
            initTime = gs.TweenLite.currentTime - delay * (1000 / combinedTimeScale);
        } // end else if
        _repeatCount = 0;
        if (target != vars.onComplete)
        {
            this.render(startTime);
        } // end if
        pauseTime = NaN;
        delete gs.TweenMax._pausedTweens[_tweenID];
        this.__set__enabled(true);
    } // End of the function
    function reverse($adjustDuration, $forcePlay)
    {
        ease = vars.ease == ease ? (_thisReverseEase) : (vars.ease);
        var _loc2 = this.__get__progress();
        if ($adjustDuration != false && _loc2 > 0)
        {
            startTime = gs.TweenLite.currentTime - (1 - _loc2) * duration * 1000 / combinedTimeScale;
            initTime = startTime - delay * (1000 / combinedTimeScale);
        } // end if
        if ($forcePlay != false)
        {
            if (_loc2 < 1)
            {
                this.resume();
            }
            else
            {
                this.restart();
            } // end if
        } // end else if
    } // End of the function
    function reverseEase($t, $b, $c, $d)
    {
        return (vars.ease($d - $t, $b, $c, $d));
    } // End of the function
    function invalidate($adjustStartValues)
    {
        if (initted)
        {
            var _loc2 = this.__get__progress();
            if ($adjustStartValues != true && _loc2 != 0)
            {
                this.__set__progress(0);
            } // end if
            tweens = [];
            this.initTweenVals();
            _timeScale = vars.timeScale || 1;
            combinedTimeScale = _timeScale * gs.TweenMax._globalTimeScale;
            delay = vars.delay || 0;
            if (isNaN(pauseTime))
            {
                startTime = initTime + delay * 1000 / combinedTimeScale;
            } // end if
            if (_loc2 != 0)
            {
                if ($adjustStartValues)
                {
                    this.adjustStartValues();
                }
                else
                {
                    this.__set__progress(_loc2);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function setDestination($property, $value, $adjustStartValues)
    {
        var _loc7 = this.__get__progress();
        var _loc3;
        var _loc2;
        if (initted)
        {
            if ($adjustStartValues == false)
            {
                for (var _loc3 = tweens.length - 1; _loc3 > -1; --_loc3)
                {
                    _loc2 = tweens[_loc3];
                    if (_loc2.name == $property)
                    {
                        _loc2.target[_loc2.property] = _loc2.start;
                    } // end if
                } // end of for
            } // end if
            var _loc6 = vars;
            var _loc9 = tweens;
            var _loc8 = _hasPlugins;
            tweens = [];
            vars = {};
            vars[$property] = $value;
            this.initTweenVals();
            if (ease != _thisReverseEase && typeof(_loc6.ease) == "function")
            {
                ease = _loc6.ease;
            } // end if
            if ($adjustStartValues != false && _loc7 != 0)
            {
                this.adjustStartValues();
            } // end if
            var _loc10 = tweens;
            vars = _loc6;
            tweens = _loc9;
            var _loc5 = {};
            _loc5[$property] = true;
            for (var _loc3 = tweens.length - 1; _loc3 > -1; --_loc3)
            {
                _loc2 = tweens[_loc3];
                if (_loc2.name == $property)
                {
                    tweens.splice(_loc3, 1);
                    continue;
                } // end if
                if (_loc2.isPlugin && _loc2.name == "_MULTIPLE_")
                {
                    _loc2.target.killProps(_loc5);
                    if (_loc2.target.overwriteProps.length == 0)
                    {
                        tweens.splice(_loc3, 1);
                    } // end if
                } // end if
            } // end of for
            tweens = tweens.concat(_loc10);
            _hasPlugins = Boolean(_loc8 || _hasPlugins);
        } // end if
        vars[$property] = $value;
    } // End of the function
    function adjustStartValues()
    {
        var _loc7 = this.__get__progress();
        if (_loc7 != 0)
        {
            var _loc6 = this.ease(_loc7, 0, 1, 1);
            var _loc5 = 1 / (1 - _loc6);
            var _loc3;
            var _loc2;
            var _loc4;
            for (var _loc4 = tweens.length - 1; _loc4 > -1; --_loc4)
            {
                _loc2 = tweens[_loc4];
                _loc3 = _loc2.start + _loc2.change;
                if (_loc2.isPlugin)
                {
                    _loc2.change = (_loc3 - _loc6) * _loc5;
                }
                else
                {
                    _loc2.change = (_loc3 - _loc2.target[_loc2.property]) * _loc5;
                } // end else if
                _loc2.start = _loc3 - _loc2.change;
            } // end of for
        } // end if
    } // End of the function
    function killProperties($names)
    {
        var _loc4 = {};
        var _loc2;
        for (var _loc2 = $names.length - 1; _loc2 > -1; --_loc2)
        {
            _loc4[$names[_loc2]] = true;
        } // end of for
        this.killVars(_loc4);
    } // End of the function
    function complete($skipRender)
    {
        if (!isNaN(vars.yoyo) && (_repeatCount < vars.yoyo || vars.yoyo == 0) || !isNaN(vars.loop) && (_repeatCount < vars.loop || vars.loop == 0))
        {
            ++_repeatCount;
            if (!isNaN(vars.yoyo))
            {
                ease = vars.ease == ease ? (reverseEase) : (vars.ease);
            } // end if
            startTime = $skipRender ? (startTime + duration * (1000 / combinedTimeScale)) : (gs.TweenLite.currentTime);
            initTime = startTime - delay * (1000 / combinedTimeScale);
        }
        else if (vars.persist == true)
        {
            this.pause();
        } // end else if
        super.complete($skipRender);
    } // End of the function
    static function to($target, $duration, $vars)
    {
        return (new gs.TweenMax($target, $duration, $vars));
    } // End of the function
    static function from($target, $duration, $vars)
    {
        $vars.runBackwards = true;
        return (new gs.TweenMax($target, $duration, $vars));
    } // End of the function
    static function delayedCall($delay, $onComplete, $onCompleteParams, $onCompleteScope, $persist)
    {
        return (new gs.TweenMax($onComplete, 0, {delay: $delay, onComplete: $onComplete, onCompleteParams: $onCompleteParams, onCompleteScope: $onCompleteScope, persist: $persist, overwrite: 0}));
    } // End of the function
    static function getTweensOf($target)
    {
        var _loc3 = gs.TweenLite.masterList[gs.TweenLite.getID($target, true)].tweens;
        var _loc2 = [];
        if (_loc3 != undefined)
        {
            for (var _loc1 = _loc3.length - 1; _loc1 > -1; --_loc1)
            {
                if (!_loc3[_loc1].gc)
                {
                    _loc2[_loc2.length] = _loc3[_loc1];
                } // end if
            } // end of for
        } // end if
        for (var _loc5 in gs.TweenMax._pausedTweens)
        {
            if (gs.TweenMax._pausedTweens[_loc5].target == $target)
            {
                _loc2[_loc2.length] = gs.TweenMax._pausedTweens[_loc5];
            } // end if
        } // end of for...in
        return (_loc2);
    } // End of the function
    static function setGlobalTimeScale($scale)
    {
        if ($scale < 1.000000E-005)
        {
            $scale = 1.000000E-005;
        } // end if
        var _loc3 = gs.TweenLite.masterList;
        var _loc4;
        var _loc1;
        var _loc2;
        _globalTimeScale = $scale;
        for (var _loc4 in _loc3)
        {
            _loc2 = _loc3[_loc4].tweens;
            for (var _loc1 = _loc2.length - 1; _loc1 > -1; --_loc1)
            {
                if (_loc2[_loc1] instanceof gs.TweenMax)
                {
                    _loc2[_loc1].timeScale = _loc2[_loc1].timeScale * 1;
                } // end if
            } // end of for
        } // end of for...in
    } // End of the function
    static function isTweening($target)
    {
        var _loc2 = gs.TweenMax.getTweensOf($target);
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if ((_loc2[_loc1].active || _loc2[_loc1].startTime == gs.TweenLite.currentTime) && !_loc2[_loc1].gc)
            {
                return (true);
            } // end if
        } // end of for
        return (false);
    } // End of the function
    static function getAllTweens()
    {
        var _loc5 = gs.TweenLite.masterList;
        var _loc3 = [];
        var _loc2;
        var _loc4;
        var _loc1;
        for (var _loc4 in _loc5)
        {
            _loc2 = _loc5[_loc4].tweens;
            for (var _loc1 = _loc2.length - 1; _loc1 > -1; --_loc1)
            {
                if (!_loc2[_loc1].gc)
                {
                    _loc3[_loc3.length] = _loc2[_loc1];
                } // end if
            } // end of for
        } // end of for...in
        for (var _loc4 in gs.TweenMax._pausedTweens)
        {
            _loc3[_loc3.length] = gs.TweenMax._pausedTweens[_loc4];
        } // end of for...in
        return (_loc3);
    } // End of the function
    static function killAllTweens($complete)
    {
        gs.TweenMax.killAll($complete, true, false);
    } // End of the function
    static function killAllDelayedCalls($complete)
    {
        gs.TweenMax.killAll($complete, false, true);
    } // End of the function
    static function killAll($complete, $tweens, $delayedCalls)
    {
        if ($tweens == undefined)
        {
            $tweens = true;
        } // end if
        if ($delayedCalls == undefined)
        {
            $delayedCalls = false;
        } // end if
        var _loc2 = gs.TweenMax.getAllTweens();
        var _loc3;
        for (var _loc1 = _loc2.length - 1; _loc1 > -1; --_loc1)
        {
            _loc3 = _loc2[_loc1].target == _loc2[_loc1].vars.onComplete;
            if (_loc3 == $delayedCalls || _loc3 != $tweens)
            {
                if ($complete)
                {
                    _loc2[_loc1].complete(false);
                    _loc2[_loc1].clear();
                    continue;
                } // end if
                gs.TweenLite.removeTween(_loc2[_loc1], true);
            } // end if
        } // end of for
    } // End of the function
    static function pauseAll($tweens, $delayedCalls)
    {
        gs.TweenMax.changePause(true, $tweens, $delayedCalls);
    } // End of the function
    static function resumeAll($tweens, $delayedCalls)
    {
        gs.TweenMax.changePause(false, $tweens, $delayedCalls);
    } // End of the function
    static function changePause($pause, $tweens, $delayedCalls)
    {
        if ($pause == undefined)
        {
            $pause = true;
        } // end if
        if ($tweens == undefined)
        {
            $tweens = true;
        } // end if
        if ($delayedCalls == undefined)
        {
            $delayedCalls = false;
        } // end if
        var _loc2 = gs.TweenMax.getAllTweens();
        var _loc3;
        for (var _loc1 = _loc2.length - 1; _loc1 > -1; --_loc1)
        {
            _loc3 = _loc2[_loc1].target == _loc2[_loc1].vars.onComplete;
            if (_loc2[_loc1] instanceof gs.TweenMax && (_loc3 == $delayedCalls || _loc3 != $tweens))
            {
                _loc2[_loc1].paused = $pause;
            } // end if
        } // end of for
    } // End of the function
    function get paused()
    {
        return (!isNaN(pauseTime));
    } // End of the function
    function set paused($b)
    {
        if ($b)
        {
            this.pause();
        }
        else
        {
            this.resume();
        } // end else if
        //return (this.paused());
        null;
    } // End of the function
    function get reversed()
    {
        return (ease == _thisReverseEase);
    } // End of the function
    function set reversed($b)
    {
        if (this.__get__reversed() != $b)
        {
            this.reverse();
        } // end if
        //return (this.reversed());
        null;
    } // End of the function
    function get timeScale()
    {
        return (_timeScale);
    } // End of the function
    function set timeScale($n)
    {
        if ($n < 1.000000E-005)
        {
            $n = _timeScale = 1.000000E-005;
        }
        else
        {
            _timeScale = $n;
            $n = $n * gs.TweenMax._globalTimeScale;
        } // end else if
        initTime = gs.TweenLite.currentTime - (gs.TweenLite.currentTime - initTime - delay * (1000 / combinedTimeScale)) * combinedTimeScale * (1 / $n) - delay * (1000 / $n);
        if (startTime != 1.000000E+015)
        {
            startTime = initTime + delay * (1000 / $n);
        } // end if
        combinedTimeScale = $n;
        //return (this.timeScale());
        null;
    } // End of the function
    function set enabled($b)
    {
        if (!$b)
        {
            delete gs.TweenMax._pausedTweens[_tweenID];
        } // end if
        super.__set__enabled($b);
        if ($b)
        {
            combinedTimeScale = _timeScale * gs.TweenMax._globalTimeScale;
        } // end if
        //return (this.enabled());
        null;
    } // End of the function
    static function set globalTimeScale($n)
    {
        gs.TweenMax.setGlobalTimeScale($n);
        //return (gs.TweenMax.globalTimeScale());
        null;
    } // End of the function
    static function get globalTimeScale()
    {
        return (gs.TweenMax._globalTimeScale);
    } // End of the function
    function get progress()
    {
        var _loc3 = !isNaN(pauseTime) ? (pauseTime) : (gs.TweenLite.currentTime);
        var _loc2 = ((_loc3 - initTime) * 1.000000E-003 - delay / combinedTimeScale) / duration * combinedTimeScale;
        if (_loc2 > 1)
        {
            return (1);
        }
        else if (_loc2 < 0)
        {
            return (0);
        }
        else
        {
            return (_loc2);
        } // end else if
    } // End of the function
    function set progress($n)
    {
        startTime = gs.TweenLite.currentTime - duration * $n * 1000;
        initTime = startTime - delay * (1000 / combinedTimeScale);
        if (!started)
        {
            this.activate();
        } // end if
        this.render(gs.TweenLite.currentTime);
        if (!isNaN(pauseTime))
        {
            pauseTime = gs.TweenLite.currentTime;
            startTime = 1.000000E+015;
            active = false;
        } // end if
        //return (this.progress());
        null;
    } // End of the function
    static var version = 1.011000E+001;
    static var _activatedPlugins = gs.plugins.TweenPlugin.activate([gs.plugins.TintPlugin, gs.plugins.RemoveTintPlugin, gs.plugins.FramePlugin, gs.plugins.AutoAlphaPlugin, gs.plugins.VisiblePlugin, gs.plugins.VolumePlugin, gs.plugins.EndArrayPlugin, gs.plugins.HexColorsPlugin, gs.plugins.BlurFilterPlugin, gs.plugins.ColorMatrixFilterPlugin, gs.plugins.BevelFilterPlugin, gs.plugins.DropShadowFilterPlugin, gs.plugins.GlowFilterPlugin, gs.plugins.RoundPropsPlugin, gs.plugins.BezierPlugin, gs.plugins.BezierThroughPlugin, gs.plugins.ShortRotationPlugin]);
    static var killTweensOf = gs.TweenLite.killTweensOf;
    static var killDelayedCallsTo = gs.TweenLite.killTweensOf;
    static var removeTween = gs.TweenLite.removeTween;
    static var _idCount = -16000;
    static var _overwriteMode = gs.OverwriteManager.enabled ? (gs.OverwriteManager.mode) : (gs.OverwriteManager.init());
    static var _pausedTweens = {};
    static var _globalTimeScale = 1;
} // End of Class
