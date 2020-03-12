class gs.plugins.ColorMatrixFilterPlugin extends gs.plugins.FilterPlugin
{
    var propName, overwriteProps, _target, _type, initFilter, _filter, _matrix, _matrixTween, __get__changeFactor, __set__changeFactor;
    function ColorMatrixFilterPlugin()
    {
        super();
        propName = "colorMatrixFilter";
        overwriteProps = ["colorMatrixFilter"];
    } // End of the function
    function onInitTween($target, $value, $tween)
    {
        _target = $target;
        _type = flash.filters.ColorMatrixFilter;
        var _loc3 = $value;
        this.initFilter({}, new flash.filters.ColorMatrixFilter(gs.plugins.ColorMatrixFilterPlugin._idMatrix.slice()));
        _matrix = (flash.filters.ColorMatrixFilter)(_filter).matrix;
        var _loc2 = [];
        if (_loc3.matrix != undefined && _loc3.matrix instanceof Array)
        {
            _loc2 = _loc3.matrix;
        }
        else
        {
            if (_loc3.relative == true)
            {
                _loc2 = _matrix.slice();
            }
            else
            {
                _loc2 = gs.plugins.ColorMatrixFilterPlugin._idMatrix.slice();
            } // end else if
            _loc2 = gs.plugins.ColorMatrixFilterPlugin.setBrightness(_loc2, _loc3.brightness);
            _loc2 = gs.plugins.ColorMatrixFilterPlugin.setContrast(_loc2, _loc3.contrast);
            _loc2 = gs.plugins.ColorMatrixFilterPlugin.setHue(_loc2, _loc3.hue);
            _loc2 = gs.plugins.ColorMatrixFilterPlugin.setSaturation(_loc2, _loc3.saturation);
            _loc2 = gs.plugins.ColorMatrixFilterPlugin.setThreshold(_loc2, _loc3.threshold);
            if (!isNaN(_loc3.colorize))
            {
                _loc2 = gs.plugins.ColorMatrixFilterPlugin.colorize(_loc2, _loc3.colorize, _loc3.amount);
            } // end if
        } // end else if
        _matrixTween = new gs.plugins.EndArrayPlugin();
        _matrixTween.init(_matrix, _loc2);
        return (true);
    } // End of the function
    function set changeFactor($n)
    {
        _matrixTween.__set__changeFactor($n);
        (flash.filters.ColorMatrixFilter)(_filter).matrix = _matrix;
        super.__set__changeFactor($n);
        //return (this.changeFactor());
        null;
    } // End of the function
    static function colorize($m, $color, $amount)
    {
        if (isNaN($color))
        {
            return ($m);
        }
        else if (isNaN($amount))
        {
            $amount = 1;
        } // end else if
        var _loc3 = ($color >> 16 & 255) / 255;
        var _loc5 = ($color >> 8 & 255) / 255;
        var _loc2 = ($color & 255) / 255;
        var _loc4 = 1 - $amount;
        var _loc7 = [_loc4 + $amount * _loc3 * gs.plugins.ColorMatrixFilterPlugin._lumR, $amount * _loc3 * gs.plugins.ColorMatrixFilterPlugin._lumG, $amount * _loc3 * gs.plugins.ColorMatrixFilterPlugin._lumB, 0, 0, $amount * _loc5 * gs.plugins.ColorMatrixFilterPlugin._lumR, _loc4 + $amount * _loc5 * gs.plugins.ColorMatrixFilterPlugin._lumG, $amount * _loc5 * gs.plugins.ColorMatrixFilterPlugin._lumB, 0, 0, $amount * _loc2 * gs.plugins.ColorMatrixFilterPlugin._lumR, $amount * _loc2 * gs.plugins.ColorMatrixFilterPlugin._lumG, _loc4 + $amount * _loc2 * gs.plugins.ColorMatrixFilterPlugin._lumB, 0, 0, 0, 0, 0, 1, 0];
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix(_loc7, $m));
    } // End of the function
    static function setThreshold($m, $n)
    {
        if (isNaN($n))
        {
            return ($m);
        } // end if
        var _loc2 = [gs.plugins.ColorMatrixFilterPlugin._lumR * 256, gs.plugins.ColorMatrixFilterPlugin._lumG * 256, gs.plugins.ColorMatrixFilterPlugin._lumB * 256, 0, -256 * $n, gs.plugins.ColorMatrixFilterPlugin._lumR * 256, gs.plugins.ColorMatrixFilterPlugin._lumG * 256, gs.plugins.ColorMatrixFilterPlugin._lumB * 256, 0, -256 * $n, gs.plugins.ColorMatrixFilterPlugin._lumR * 256, gs.plugins.ColorMatrixFilterPlugin._lumG * 256, gs.plugins.ColorMatrixFilterPlugin._lumB * 256, 0, -256 * $n, 0, 0, 0, 1, 0];
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix(_loc2, $m));
    } // End of the function
    static function setHue($m, $n)
    {
        if (isNaN($n))
        {
            return ($m);
        } // end if
        $n = $n * 1.745329E-002;
        var _loc1 = Math.cos($n);
        var _loc2 = Math.sin($n);
        var _loc4 = [gs.plugins.ColorMatrixFilterPlugin._lumR + _loc1 * (1 - gs.plugins.ColorMatrixFilterPlugin._lumR) + _loc2 * -gs.plugins.ColorMatrixFilterPlugin._lumR, gs.plugins.ColorMatrixFilterPlugin._lumG + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumG + _loc2 * -gs.plugins.ColorMatrixFilterPlugin._lumG, gs.plugins.ColorMatrixFilterPlugin._lumB + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumB + _loc2 * (1 - gs.plugins.ColorMatrixFilterPlugin._lumB), 0, 0, gs.plugins.ColorMatrixFilterPlugin._lumR + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumR + _loc2 * 1.430000E-001, gs.plugins.ColorMatrixFilterPlugin._lumG + _loc1 * (1 - gs.plugins.ColorMatrixFilterPlugin._lumG) + _loc2 * 1.400000E-001, gs.plugins.ColorMatrixFilterPlugin._lumB + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumB + _loc2 * -2.830000E-001, 0, 0, gs.plugins.ColorMatrixFilterPlugin._lumR + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumR + _loc2 * -(1 - gs.plugins.ColorMatrixFilterPlugin._lumR), gs.plugins.ColorMatrixFilterPlugin._lumG + _loc1 * -gs.plugins.ColorMatrixFilterPlugin._lumG + _loc2 * gs.plugins.ColorMatrixFilterPlugin._lumG, gs.plugins.ColorMatrixFilterPlugin._lumB + _loc1 * (1 - gs.plugins.ColorMatrixFilterPlugin._lumB) + _loc2 * gs.plugins.ColorMatrixFilterPlugin._lumB, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1];
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix(_loc4, $m));
    } // End of the function
    static function setBrightness($m, $n)
    {
        if (isNaN($n))
        {
            return ($m);
        } // end if
        $n = $n * 100 - 100;
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix([1, 0, 0, 0, $n, 0, 1, 0, 0, $n, 0, 0, 1, 0, $n, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], $m));
    } // End of the function
    static function setSaturation($m, $n)
    {
        if (isNaN($n))
        {
            return ($m);
        } // end if
        var _loc4 = 1 - $n;
        var _loc3 = _loc4 * gs.plugins.ColorMatrixFilterPlugin._lumR;
        var _loc5 = _loc4 * gs.plugins.ColorMatrixFilterPlugin._lumG;
        var _loc2 = _loc4 * gs.plugins.ColorMatrixFilterPlugin._lumB;
        var _loc6 = [_loc3 + $n, _loc5, _loc2, 0, 0, _loc3, _loc5 + $n, _loc2, 0, 0, _loc3, _loc5, _loc2 + $n, 0, 0, 0, 0, 0, 1, 0];
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix(_loc6, $m));
    } // End of the function
    static function setContrast($m, $n)
    {
        if (isNaN($n))
        {
            return ($m);
        } // end if
        $n = $n + 1.000000E-002;
        var _loc2 = [$n, 0, 0, 0, 128 * (1 - $n), 0, $n, 0, 0, 128 * (1 - $n), 0, 0, $n, 0, 128 * (1 - $n), 0, 0, 0, 1, 0];
        return (gs.plugins.ColorMatrixFilterPlugin.applyMatrix(_loc2, $m));
    } // End of the function
    static function applyMatrix($m, $m2)
    {
        if (!($m instanceof Array) || !($m2 instanceof Array))
        {
            return ($m2);
        } // end if
        var _loc7 = [];
        var _loc2 = 0;
        var _loc5 = 0;
        var _loc6;
        var _loc1;
        for (var _loc6 = 0; _loc6 < 4; ++_loc6)
        {
            for (var _loc1 = 0; _loc1 < 5; ++_loc1)
            {
                if (_loc1 == 4)
                {
                    _loc5 = $m[_loc2 + 4];
                }
                else
                {
                    _loc5 = 0;
                } // end else if
                _loc7[_loc2 + _loc1] = $m[_loc2] * $m2[_loc1] + $m[_loc2 + 1] * $m2[_loc1 + 5] + $m[_loc2 + 2] * $m2[_loc1 + 10] + $m[_loc2 + 3] * $m2[_loc1 + 15] + _loc5;
            } // end of for
            _loc2 = _loc2 + 5;
        } // end of for
        return (_loc7);
    } // End of the function
    static var VERSION = 1.010000E+000;
    static var API = 1;
    static var _idMatrix = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    static var _lumR = 2.126710E-001;
    static var _lumG = 7.151600E-001;
    static var _lumB = 7.216900E-002;
} // End of Class
