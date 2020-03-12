class mx.transitions.Rotate extends mx.transitions.Transition
{
    var _rotationFinal, __get__manager, __get__direction, _content;
    function Rotate(content, transParams, manager)
    {
        super();
        this.init(content, transParams, manager);
    } // End of the function
    function init(content, transParams, manager)
    {
        super.init(content, transParams, manager);
        if (_rotationFinal == undefined)
        {
            _rotationFinal = this.__get__manager().__get__contentAppearance()._rotation;
        } // end if
        if (transParams.degrees)
        {
            _degrees = transParams.degrees;
        } // end if
        if (transParams.ccw ^ this.__get__direction())
        {
            _degrees = _degrees * -1;
        } // end if
    } // End of the function
    function _render(p)
    {
        _content._rotation = _rotationFinal - _degrees * (1 - p);
    } // End of the function
    static var version = "1.1.0.52";
    var type = mx.transitions.Rotate;
    var className = "Rotate";
    var _degrees = 360;
} // End of Class
