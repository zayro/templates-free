class gs.plugins.BlurFilterPlugin extends gs.plugins.FilterPlugin
{
    var propName, overwriteProps, _target, _type, initFilter;
    function BlurFilterPlugin()
    {
        super();
        propName = "blurFilter";
        overwriteProps = ["blurFilter"];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        _target = $target;
        _type = flash.filters.BlurFilter;
        this.initFilter($value, new flash.filters.BlurFilter(0, 0, $value.quality || 2));
        return (true);
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
