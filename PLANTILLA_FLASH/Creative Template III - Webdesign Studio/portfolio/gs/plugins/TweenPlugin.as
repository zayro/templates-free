class gs.plugins.TweenPlugin
{
    var _tweens, _changeFactor, propName, round, __get__changeFactor, overwriteProps, __set__changeFactor;
    function TweenPlugin()
    {
        _tweens = [];
        _changeFactor = 0;
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        this.addTween($target, propName, $target[propName], $value, propName);
        return (true);
    } // End of the function
    function addTween($object, $propName, $start, $end, $overwriteProp)
    {
        if ($end != undefined)
        {
            var _loc3 = typeof($end) == "number" ? ($end - $start) : (Number($end));
            if (_loc3 != 0)
            {
                _tweens[_tweens.length] = new gs.utils.tween.TweenInfo($object, $propName, $start, _loc3, $overwriteProp || $propName);
            } // end if
        } // end if
    } // End of the function
    function updateTweens($changeFactor)
    {
        var _loc3;
        var _loc2;
        if (round)
        {
            for (var _loc3 = _tweens.length - 1; _loc3 > -1; --_loc3)
            {
                _loc2 = _tweens[_loc3];
                _loc2.target[_loc2.property] = Math.round(_loc2.start + _loc2.change * $changeFactor);
            } // end of for
        }
        else
        {
            for (var _loc3 = _tweens.length - 1; _loc3 > -1; --_loc3)
            {
                _loc2 = _tweens[_loc3];
                _loc2.target[_loc2.property] = _loc2.start + _loc2.change * $changeFactor;
            } // end of for
        } // end else if
    } // End of the function
    function set changeFactor($n)
    {
        this.updateTweens($n);
        _changeFactor = $n;
        //return (this.changeFactor());
        null;
    } // End of the function
    function get changeFactor()
    {
        return (_changeFactor);
    } // End of the function
    function killProps($lookup)
    {
        var _loc2;
        for (var _loc2 = overwriteProps.length - 1; _loc2 > -1; --_loc2)
        {
            if ($lookup[overwriteProps[_loc2]] != undefined)
            {
                overwriteProps.splice(_loc2, 1);
            } // end if
        } // end of for
        for (var _loc2 = _tweens.length - 1; _loc2 > -1; --_loc2)
        {
            if ($lookup[_tweens[_loc2].name] != undefined)
            {
                _tweens.splice(_loc2, 1);
            } // end if
        } // end of for
    } // End of the function
    static function activate($plugins)
    {
        var _loc1;
        var _loc3;
        for (var _loc1 = $plugins.length - 1; _loc1 > -1; --_loc1)
        {
            _loc3 = new $plugins[_loc1]();
            gs.TweenLite.plugins[_loc3.propName] = $plugins[_loc1];
        } // end of for
        return (true);
    } // End of the function
    static var VERSION = 1.040000E+000;
    static var API = 1;
} // End of Class
