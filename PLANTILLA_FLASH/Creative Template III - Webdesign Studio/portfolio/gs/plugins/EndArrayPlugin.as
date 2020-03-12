class gs.plugins.EndArrayPlugin extends gs.plugins.TweenPlugin
{
    var propName, overwriteProps, _info, _a, round, __get__changeFactor, __set__changeFactor;
    function EndArrayPlugin()
    {
        super();
        propName = "endArray";
        overwriteProps = ["endArray"];
        _info = [];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        if (!($target instanceof Array) || !($value instanceof Array))
        {
            return (false);
        } // end if
        var _loc3 = $target;
        var _loc2 = $value;
        this.init(_loc3, _loc2);
        return (true);
    } // End of the function
    function init($start, $end)
    {
        _a = $start;
        for (var _loc2 = $end.length - 1; _loc2 > -1; --_loc2)
        {
            if ($start[_loc2] != $end[_loc2] && $start[_loc2] != undefined)
            {
                _info[_info.length] = new gs.utils.tween.ArrayTweenInfo(_loc2, _a[_loc2], $end[_loc2] - _a[_loc2]);
            } // end if
        } // end of for
    } // End of the function
    function set changeFactor($n)
    {
        var _loc3;
        var _loc2;
        if (round)
        {
            for (var _loc3 = _info.length - 1; _loc3 > -1; --_loc3)
            {
                _loc2 = _info[_loc3];
                _a[_loc2.index] = Math.round(_loc2.start + _loc2.change * $n);
            } // end of for
        }
        else
        {
            for (var _loc3 = _info.length - 1; _loc3 > -1; --_loc3)
            {
                _loc2 = _info[_loc3];
                _a[_loc2.index] = _loc2.start + _loc2.change * $n;
            } // end of for
        } // end else if
        //return (this.changeFactor());
        null;
    } // End of the function
    static var VERSION = 1.020000E+000;
    static var API = 1;
} // End of Class
