class gs.plugins.TransformAroundCenterPlugin extends gs.plugins.TransformAroundPointPlugin
{
    var propName;
    function TransformAroundCenterPlugin()
    {
        super();
        propName = "transformAroundCenter";
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        var _loc2 = $target.getBounds($target._parent);
        $value.point = new flash.geom.Point((_loc2.xMin + _loc2.xMax) / 2, (_loc2.yMin + _loc2.yMax) / 2);
        return (super.onInitTween($target, $value, $tween));
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
