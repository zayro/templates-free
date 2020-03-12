class gs.plugins.DropShadowFilterPlugin extends gs.plugins.FilterPlugin
{
    var propName, overwriteProps, _target, _type, initFilter;
    function DropShadowFilterPlugin()
    {
        super();
        propName = "dropShadowFilter";
        overwriteProps = ["dropShadowFilter"];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        _target = $target;
        _type = flash.filters.DropShadowFilter;
        this.initFilter($value, new flash.filters.DropShadowFilter(0, 45, 0, 0, 0, 0, 1, $value.quality || 2, $value.inner, $value.knockout, $value.hideObject));
        return (true);
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
