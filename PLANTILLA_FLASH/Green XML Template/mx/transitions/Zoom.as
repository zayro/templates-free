class mx.transitions.Zoom extends mx.transitions.Transition
{
    var __get__manager, _xscaleFinal, _yscaleFinal, _content;
    function Zoom(content, transParams, manager)
    {
        super();
        this.init(content, transParams, manager);
    } // End of the function
    function init(content, transParams, manager)
    {
        super.init(content, transParams, manager);
        _xscaleFinal = this.__get__manager().__get__contentAppearance()._xscale;
        _yscaleFinal = this.__get__manager().__get__contentAppearance()._yscale;
    } // End of the function
    function _render(p)
    {
        if (p < 0)
        {
            p = 0;
        } // end if
        _content._xscale = p * _xscaleFinal;
        _content._yscale = p * _yscaleFinal;
    } // End of the function
    static var version = "1.1.0.52";
    var type = mx.transitions.Zoom;
    var className = "Zoom";
} // End of Class
