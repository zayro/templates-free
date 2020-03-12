class gs.plugins.BezierPlugin extends gs.plugins.TweenPlugin
{
    var propName, overwriteProps, _target, _orientData, _orient, _beziers, round, __set__changeFactor, __get__changeFactor;
    function BezierPlugin()
    {
        super();
        propName = "bezier";
        overwriteProps = [];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        if (!($value instanceof Array))
        {
            return (false);
        } // end if
        var _loc2 = $value;
        this.init($tween, _loc2, false);
        return (true);
    } // End of the function
    function init($tween, $beziers, $through)
    {
        _target = $tween.target;
        var _loc5 = {};
        var _loc3;
        var _loc2;
        if ($tween.vars.orientToBezier == true)
        {
            _orientData = [["_x", "_y", "_rotation", 0]];
            overwriteProps[overwriteProps.length] = "_rotation";
            _orient = true;
        }
        else if ($tween.vars.orientToBezier instanceof Array)
        {
            _orientData = $tween.vars.orientToBezier;
            for (var _loc3 = _orientData.length - 1; _loc3 > -1; --_loc3)
            {
                overwriteProps[overwriteProps.length] = _orientData[_loc3][2];
            } // end of for
            overwriteProps[overwriteProps.length] = _loc2;
            _orient = true;
        } // end else if
        for (var _loc3 = 0; _loc3 < $beziers.length; ++_loc3)
        {
            for (var _loc2 in $beziers[_loc3])
            {
                if (_loc5[_loc2] == undefined)
                {
                    _loc5[_loc2] = [$tween.target[_loc2]];
                } // end if
                if (typeof($beziers[_loc3][_loc2]) == "number")
                {
                    _loc5[_loc2].push($beziers[_loc3][_loc2]);
                    continue;
                } // end if
                _loc5[_loc2].push($tween.target[_loc2] + Number($beziers[_loc3][_loc2]));
            } // end of for...in
        } // end of for
        for (var _loc2 in _loc5)
        {
            overwriteProps[overwriteProps.length] = _loc2;
            if ($tween.vars[_loc2] != undefined)
            {
                if (typeof($tween.vars[_loc2]) == "number")
                {
                    _loc5[_loc2].push($tween.vars[_loc2]);
                }
                else
                {
                    _loc5[_loc2].push($tween.target[_loc2] + Number($tween.vars[_loc2]));
                } // end else if
                delete $tween.vars[_loc2];
                for (var _loc3 = $tween.tweens.length - 1; _loc3 > -1; --_loc3)
                {
                    if ($tween.tweens[_loc3].name == _loc2)
                    {
                        $tween.tweens.splice(_loc3, 1);
                    } // end if
                } // end of for
            } // end if
        } // end of for...in
        _beziers = gs.plugins.BezierPlugin.parseBeziers(_loc5, $through);
    } // End of the function
    static function parseBeziers($props, $through)
    {
        var _loc2;
        var _loc1;
        var _loc3;
        var _loc4;
        var _loc6 = {};
        if ($through == true)
        {
            for (var _loc4 in $props)
            {
                _loc1 = $props[_loc4];
                _loc3 = [];
                _loc6[_loc4] = [];
                if (_loc1.length > 2)
                {
                    _loc3[_loc3.length] = [_loc1[0], _loc1[1] - (_loc1[2] - _loc1[0]) / 4, _loc1[1]];
                    for (var _loc2 = 1; _loc2 < _loc1.length - 1; ++_loc2)
                    {
                        _loc3[_loc3.length] = [_loc1[_loc2], _loc1[_loc2] + (_loc1[_loc2] - _loc3[_loc2 - 1][1]), _loc1[_loc2 + 1]];
                    } // end of for
                    continue;
                } // end if
                _loc3[_loc3.length] = [_loc1[0], (_loc1[0] + _loc1[1]) / 2, _loc1[1]];
            } // end of for...in
        }
        else
        {
            for (var _loc4 in $props)
            {
                _loc1 = $props[_loc4];
                _loc3 = [];
                _loc6[_loc4] = [];
                if (_loc1.length > 3)
                {
                    _loc3[_loc3.length] = [_loc1[0], _loc1[1], (_loc1[1] + _loc1[2]) / 2];
                    for (var _loc2 = 2; _loc2 < _loc1.length - 2; ++_loc2)
                    {
                        _loc3[_loc3.length] = [_loc3[_loc2 - 2][2], _loc1[_loc2], (_loc1[_loc2] + _loc1[_loc2 + 1]) / 2];
                    } // end of for
                    _loc3[_loc3.length] = [_loc3[_loc3.length - 1][2], _loc1[_loc1.length - 2], _loc1[_loc1.length - 1]];
                    continue;
                } // end if
                if (_loc1.length == 3)
                {
                    _loc3[_loc3.length] = [_loc1[0], _loc1[1], _loc1[2]];
                    continue;
                } // end if
                if (_loc1.length == 2)
                {
                    _loc3[_loc3.length] = [_loc1[0], (_loc1[0] + _loc1[1]) / 2, _loc1[1]];
                } // end if
            } // end of for...in
        } // end else if
        return (_loc6);
    } // End of the function
    function killProps($lookup)
    {
        for (var _loc5 in _beziers)
        {
            if ($lookup[_loc5] != undefined)
            {
                delete _beziers[_loc5];
            } // end if
        } // end of for...in
        if (_orient)
        {
            for (var _loc3 = _orientData.length - 1; _loc3 > -1; --_loc3)
            {
                if ($lookup[_orientData[_loc3][2]] != undefined)
                {
                    _orientData.splice(_loc3, 1);
                } // end if
            } // end of for
        } // end if
        super.killProps($lookup);
    } // End of the function
    function set changeFactor($n)
    {
        var _loc3;
        var _loc4;
        var _loc2;
        var _loc5;
        var _loc7;
        if ($n == 1)
        {
            for (var _loc4 in _beziers)
            {
                _loc3 = _beziers[_loc4].length - 1;
                _target[_loc4] = _beziers[_loc4][_loc3][2];
            } // end of for...in
        }
        else
        {
            for (var _loc4 in _beziers)
            {
                _loc7 = _beziers[_loc4].length;
                if ($n < 0)
                {
                    _loc3 = 0;
                }
                else if ($n >= 1)
                {
                    _loc3 = _loc7 - 1;
                }
                else
                {
                    _loc3 = _loc7 * $n >> 0;
                } // end else if
                _loc5 = ($n - _loc3 * (1 / _loc7)) * _loc7;
                _loc2 = _beziers[_loc4][_loc3];
                if (round)
                {
                    _target[_loc4] = Math.round(_loc2[0] + _loc5 * (2 * (1 - _loc5) * (_loc2[1] - _loc2[0]) + _loc5 * (_loc2[2] - _loc2[0])));
                    continue;
                } // end if
                _target[_loc4] = _loc2[0] + _loc5 * (2 * (1 - _loc5) * (_loc2[1] - _loc2[0]) + _loc5 * (_loc2[2] - _loc2[0]));
            } // end of for...in
        } // end else if
        if (_orient)
        {
            var _loc12 = _target;
            var _loc13 = round;
            _target = _future;
            round = false;
            _orient = false;
            this.__set__changeFactor($n + 1.000000E-002);
            _target = _loc12;
            round = _loc13;
            _orient = true;
            var _loc10;
            var _loc9;
            var _loc6;
            var _loc11;
            for (var _loc3 = 0; _loc3 < _orientData.length; ++_loc3)
            {
                _loc6 = _orientData[_loc3];
                _loc11 = _loc6[3] || 0;
                _loc10 = _future[_loc6[0]] - _target[_loc6[0]];
                _loc9 = _future[_loc6[1]] - _target[_loc6[1]];
                _target[_loc6[2]] = Math.atan2(_loc9, _loc10) * gs.plugins.BezierPlugin._RAD2DEG + _loc11;
            } // end of for
        } // end if
        //return (this.changeFactor());
        null;
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
    static var _RAD2DEG = 5.729578E+001;
    var _future = {};
} // End of Class
