class gs.plugins.TintPlugin extends gs.plugins.TweenPlugin
{
    var propName, overwriteProps, _ignoreAlpha, _color, _ct, _tweens, __get__changeFactor, __set__changeFactor;
    function TintPlugin()
    {
        super();
        propName = "tint";
        overwriteProps = ["tint"];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        if (typeof($target) != "movieclip" && !($target instanceof TextField))
        {
            return (false);
        } // end if
        var _loc2 = $tween.vars._alpha != undefined ? ($tween.vars._alpha) : ($tween.vars.autoAlpha != undefined ? ($tween.vars.autoAlpha) : ($target._alpha));
        var _loc6 = $value == null || $tween.vars.removeTint == true ? ({rb: 0, gb: 0, bb: 0, ab: 0, ra: _loc2, ga: _loc2, ba: _loc2, aa: _loc2}) : ({rb: $value >> 16, gb: $value >> 8 & 255, bb: $value & 255, ra: 0, ga: 0, ba: 0, aa: _loc2});
        _ignoreAlpha = true;
        this.init($target, _loc6);
        return (true);
    } // End of the function
    function init($target, $end)
    {
        _color = new Color($target);
        _ct = _color.getTransform();
        var _loc5;
        var _loc2;
        for (var _loc2 in $end)
        {
            if (_ct[_loc2] != $end[_loc2])
            {
                _tweens[_tweens.length] = new gs.utils.tween.TweenInfo(_ct, _loc2, _ct[_loc2], $end[_loc2] - _ct[_loc2], "tint", false);
            } // end if
        } // end of for...in
    } // End of the function
    function set changeFactor($n)
    {
        var _loc3;
        var _loc2;
        for (var _loc3 = _tweens.length - 1; _loc3 > -1; --_loc3)
        {
            _loc2 = _tweens[_loc3];
            _loc2.target[_loc2.property] = _loc2.start + _loc2.change * $n;
        } // end of for
        if (_ignoreAlpha)
        {
            var _loc5 = _color.getTransform();
            _ct.aa = _loc5.aa;
            _ct.ab = _loc5.ab;
        } // end if
        _color.setTransform(_ct);
        //return (this.changeFactor());
        null;
    } // End of the function
    static var VERSION = 1.100000E+000;
    static var API = 1;
} // End of Class
