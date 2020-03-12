class gs.plugins.AutoAlphaPlugin extends gs.plugins.TweenPlugin
{
    var propName, overwriteProps, onComplete, _target, _tween, _visible, _tweenVisible, _alphaStart, _alphaChange, _tweenAlpha, __get__changeFactor, __set__changeFactor;
    function AutoAlphaPlugin()
    {
        super();
        propName = "autoAlpha";
        overwriteProps = ["_alpha", "_visible"];
        onComplete = onCompleteTween;
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        _target = $target;
        _tween = $tween;
        _visible = Boolean($value != 0);
        _tweenVisible = true;
        _alphaStart = _target._alpha;
        _alphaChange = typeof($value) == "number" ? ($value - _alphaStart) : (Number($value));
        _tweenAlpha = Boolean(_alphaChange != 0);
        return (true);
    } // End of the function
    function killProps($lookup)
    {
        super.killProps($lookup);
        _tweenVisible = Boolean($lookup._visible == undefined);
        _tweenAlpha = Boolean($lookup._alpha == undefined);
    } // End of the function
    function onCompleteTween()
    {
        if (_tweenVisible && _tween.vars.runBackwards != true && _tween.ease == _tween.vars.ease)
        {
            _target._visible = _visible;
        } // end if
    } // End of the function
    function set changeFactor($n)
    {
        if (_tweenAlpha)
        {
            _target._alpha = _alphaStart + _alphaChange * $n;
        } // end if
        if (_target._visible != true && _tweenVisible)
        {
            _target._visible = true;
        } // end if
        //return (this.changeFactor());
        null;
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
