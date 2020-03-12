class mx.transitions.Fade extends mx.transitions.Transition
{
    var __get__manager, _alphaFinal, _content;
    function Fade(content, transParams, manager)
    {
        super();
        this.init(content, transParams, manager);
    } // End of the function
    function init(content, transParams, manager)
    {
        super.init(content, transParams, manager);
        _alphaFinal = this.__get__manager().__get__contentAppearance()._alpha;
    } // End of the function
    function _render(p)
    {
        _content._alpha = _alphaFinal * p;
    } // End of the function
    static var version = "1.1.0.52";
    var type = mx.transitions.Fade;
    var className = "Fade";
} // End of Class
