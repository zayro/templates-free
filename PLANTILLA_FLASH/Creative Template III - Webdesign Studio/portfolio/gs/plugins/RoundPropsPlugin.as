class gs.plugins.RoundPropsPlugin extends gs.plugins.TweenPlugin
{
    var propName, overwriteProps, round, addTween;
    function RoundPropsPlugin()
    {
        super();
        propName = "roundProps";
        overwriteProps = [];
        round = true;
    } // End of the function
    function add($object, $propName, $start, $change)
    {
        this.addTween($object, $propName, $start, $start + $change, $propName);
        overwriteProps[overwriteProps.length] = $propName;
    } // End of the function
    static var VERSION = 1;
    static var API = 1;
} // End of Class
