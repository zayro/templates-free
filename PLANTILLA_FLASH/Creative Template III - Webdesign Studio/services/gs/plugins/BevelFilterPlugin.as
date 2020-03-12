class gs.plugins.BevelFilterPlugin extends gs.plugins.FilterPlugin
{
    var propName, overwriteProps, _target, _type, initFilter;
    function BevelFilterPlugin()
    {
        super();
        propName = "bevelFilter";
        overwriteProps = ["bevelFilter"];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        _target = $target;
        _type = flash.filters.BevelFilter;
        this.initFilter($value, new flash.filters.BevelFilter(0, 0, 16777215, 5.000000E-001, 0, 5.000000E-001, 2, 2, 0, $value.quality || 2));
        return (true);
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
