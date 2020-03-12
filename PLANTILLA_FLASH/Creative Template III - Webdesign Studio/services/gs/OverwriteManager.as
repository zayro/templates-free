class gs.OverwriteManager
{
    static var mode, enabled;
    function OverwriteManager()
    {
    } // End of the function
    static function init($mode)
    {
        if (gs.TweenLite.version < 1.009000E+001)
        {
            trace ("TweenLite warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
        } // end if
        gs.TweenLite.overwriteManager = gs.OverwriteManager;
        mode = $mode == undefined ? (2) : ($mode);
        enabled = true;
        return (gs.OverwriteManager.mode);
    } // End of the function
    static function manageOverwrites($tween, $targetTweens)
    {
        var _loc13 = $tween.vars;
        var _loc14 = _loc13.overwrite == undefined ? (gs.OverwriteManager.mode) : (Number(_loc13.overwrite));
        if (_loc14 < 2 || $targetTweens == undefined)
        {
            return;
        } // end if
        var _loc10 = $tween.startTime;
        var _loc3 = [];
        var _loc1;
        var _loc15;
        var _loc5;
        var _loc9 = -1;
        for (var _loc1 = $targetTweens.length - 1; _loc1 > -1; --_loc1)
        {
            _loc5 = $targetTweens[_loc1];
            if (_loc5 == $tween)
            {
                _loc9 = _loc1;
                continue;
            } // end if
            if (_loc1 < _loc9 && _loc5.startTime <= _loc10 && _loc5.startTime + _loc5.duration * 1000 / _loc5.combinedTimeScale > _loc10)
            {
                _loc3[_loc3.length] = _loc5;
            } // end if
        } // end of for
        if (_loc3.length == 0 || $tween.tweens.length == 0)
        {
            return;
        } // end if
        if (_loc14 == gs.OverwriteManager.AUTO)
        {
            var _loc8 = $tween.tweens;
            var _loc6 = {};
            var _loc2;
            var _loc4;
            var _loc7;
            for (var _loc1 = _loc8.length - 1; _loc1 > -1; --_loc1)
            {
                _loc4 = _loc8[_loc1];
                if (_loc4.isPlugin)
                {
                    if (_loc4.name == "_MULTIPLE_")
                    {
                        _loc7 = _loc4.target.overwriteProps;
                        for (var _loc2 = _loc7.length - 1; _loc2 > -1; --_loc2)
                        {
                            _loc6[_loc7[_loc2]] = true;
                        } // end of for
                    }
                    else
                    {
                        _loc6[_loc4.name] = true;
                    } // end else if
                    _loc6[_loc4.target.propName] = true;
                    continue;
                } // end if
                _loc6[_loc4.name] = true;
            } // end of for
            for (var _loc1 = _loc3.length - 1; _loc1 > -1; --_loc1)
            {
                gs.OverwriteManager.killVars(_loc6, _loc3[_loc1].vars, _loc3[_loc1].tweens);
            } // end of for
        }
        else
        {
            for (var _loc1 = _loc3.length - 1; _loc1 > -1; --_loc1)
            {
                _loc3[_loc1].enabled = false;
            } // end of for
        } // end else if
    } // End of the function
    static function killVars($killVars, $vars, $tweens, $subTweens, $filters)
    {
        var _loc2;
        var _loc5;
        var _loc1;
        for (var _loc2 = $tweens.length - 1; _loc2 > -1; --_loc2)
        {
            _loc1 = $tweens[_loc2];
            if ($killVars[_loc1.name] != undefined)
            {
                $tweens.splice(_loc2, 1);
                continue;
            } // end if
            if (_loc1.isPlugin && _loc1.name == "_MULTIPLE_")
            {
                _loc1.target.killProps($killVars);
                if (_loc1.target.overwriteProps.length == 0)
                {
                    $tweens.splice(_loc2, 1);
                } // end if
            } // end if
        } // end of for
        for (var _loc5 in $killVars)
        {
            delete $vars[_loc5];
        } // end of for...in
    } // End of the function
    static var version = 3.120000E+000;
    static var NONE = 0;
    static var ALL = 1;
    static var AUTO = 2;
    static var CONCURRENT = 3;
} // End of Class
