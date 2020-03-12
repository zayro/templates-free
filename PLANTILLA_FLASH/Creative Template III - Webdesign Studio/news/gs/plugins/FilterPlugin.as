class gs.plugins.FilterPlugin extends gs.plugins.TweenPlugin
{
    var _target, _index, _type, _filter, _remove, onComplete, _tweens, propName, addTween, __get__changeFactor, __set__changeFactor;
    function FilterPlugin()
    {
        super();
    } // End of the function
    function initFilter($props, $default)
    {
        var _loc5 = _target.filters;
        var _loc2;
        var _loc4;
        var _loc6;
        _index = -1;
        if ($props.index != undefined)
        {
            _index = $props.index;
        }
        else
        {
            for (var _loc4 = _loc5.length - 1; _loc4 > -1; --_loc4)
            {
                if (_loc5[_loc4] instanceof _type)
                {
                    _index = _loc4;
                    break;
                } // end if
            } // end of for
        } // end else if
        if (_index == -1 || _loc5[_index] == undefined || $props.addFilter == true)
        {
            _index = $props.index != undefined ? ($props.index) : (_loc5.length);
            _loc5[_index] = $default;
            _target.filters = _loc5;
        } // end if
        _filter = _loc5[_index];
        _remove = Boolean($props.remove == true);
        if (_remove)
        {
            onComplete = onCompleteTween;
        } // end if
        var _loc3 = $props.isTV == true ? ($props.exposedVars) : ($props);
        for (var _loc2 in _loc3)
        {
            if (_filter[_loc2] == undefined || _filter[_loc2] == _loc3[_loc2] || _loc2 == "remove" || _loc2 == "index" || _loc2 == "addFilter")
            {
                continue;
            } // end if
            if (_loc2 == "color" || _loc2 == "highlightColor" || _loc2 == "shadowColor")
            {
                _loc6 = new gs.plugins.HexColorsPlugin();
                _loc6.initColor(_filter, _loc2, _filter[_loc2], _loc3[_loc2]);
                _tweens[_tweens.length] = new gs.utils.tween.TweenInfo(_loc6, "changeFactor", 0, 1, propName);
                continue;
            } // end if
            if (_loc2 == "quality" || _loc2 == "inner" || _loc2 == "knockout" || _loc2 == "hideObject")
            {
                _filter[_loc2] = _loc3[_loc2];
                continue;
            } // end if
            this.addTween(_filter, _loc2, _filter[_loc2], _loc3[_loc2], propName);
        } // end of for...in
    } // End of the function
    function onCompleteTween()
    {
        if (_remove)
        {
            var _loc2;
            var _loc3 = _target.filters;
            if (!(_loc3[_index] instanceof _type))
            {
                for (var _loc2 = _loc3.length - 1; _loc2 > -1; --_loc2)
                {
                    if (_loc3[_loc2] instanceof _type)
                    {
                        _loc3.splice(_loc2, 1);
                        break;
                    } // end if
                } // end of for
            }
            else
            {
                _loc3.splice(_index, 1);
            } // end else if
            _target.filters = _loc3;
        } // end if
    } // End of the function
    function set changeFactor($n)
    {
        var _loc2;
        var _loc3;
        var _loc4 = _target.filters;
        for (var _loc2 = _tweens.length - 1; _loc2 > -1; --_loc2)
        {
            _loc3 = _tweens[_loc2];
            _loc3.target[_loc3.property] = _loc3.start + _loc3.change * $n;
        } // end of for
        if (!(_loc4[_index] instanceof _type))
        {
            _index = _loc4.length - 1;
            for (var _loc2 = _loc4.length - 1; _loc2 > -1; --_loc2)
            {
                if (_loc4[_loc2] instanceof _type)
                {
                    _index = _loc2;
                    break;
                } // end if
            } // end of for
        } // end if
        _loc4[_index] = _filter;
        _target.filters = _loc4;
        //return (this.changeFactor());
        null;
    } // End of the function
    static var VERSION = 1.030000E+000;
    static var API = 1;
} // End of Class
