class mx.transitions.Blinds extends mx.transitions.Transition
{
    var _dimension, _mask, _content, getNextHighestDepthMC, __get__direction, _innerMask, drawBox, _innerBounds;
    function Blinds(content, transParams, manager)
    {
        super();
        this.init(content, transParams, manager);
    } // End of the function
    function init(content, transParams, manager)
    {
        super.init(content, transParams, manager);
        _dimension = transParams.dimension ? (1) : (0);
        if (transParams.numStrips)
        {
            _numStrips = transParams.numStrips;
        } // end if
        this._initMask();
    } // End of the function
    function start()
    {
        _content.setMask(_mask);
        super.start();
    } // End of the function
    function cleanUp()
    {
        _mask.removeMovieClip();
        super.cleanUp();
    } // End of the function
    function _initMask()
    {
        var _loc5 = _content;
        var _loc6 = this.getNextHighestDepthMC(_loc5);
        var _loc4 = _mask = _loc5.createEmptyMovieClip("__mask_Blinds_" + this.__get__direction(), _loc6);
        _loc4._visible = false;
        var _loc2 = _innerMask = _mask.createEmptyMovieClip("innerMask", 0);
        _loc2._x = _loc2._y = 50;
        if (_dimension)
        {
            _loc2._rotation = -90;
        } // end if
        _loc2.beginFill(16711680);
        this.drawBox(_loc2, 0, 0, 100, 100);
        _loc2.endFill();
        var _loc3 = _innerBounds;
        _loc4._x = _loc3.xMin;
        _loc4._y = _loc3.yMin;
        _loc4._width = _loc3.xMax - _loc3.xMin;
        _loc4._height = _loc3.yMax - _loc3.yMin;
    } // End of the function
    function _render(p)
    {
        var _loc4 = 100 / _numStrips;
        var _loc5 = p * _loc4;
        var _loc3 = _innerMask;
        _loc3.clear();
        var _loc2 = _numStrips;
        _loc3.beginFill(16711680);
        while (_loc2--)
        {
            this.drawBox(_loc3, -50, _loc2 * _loc4 - 50, 100, _loc5);
        } // end while
        _loc3.endFill();
    } // End of the function
    static var version = "1.1.0.52";
    var type = mx.transitions.Blinds;
    var className = "Blinds";
    var _numStrips = 10;
} // End of Class
