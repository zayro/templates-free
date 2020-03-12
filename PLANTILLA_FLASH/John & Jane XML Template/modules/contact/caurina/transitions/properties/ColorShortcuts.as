class caurina.transitions.properties.ColorShortcuts
{
    function ColorShortcuts()
    {
        trace ("This is an static class and should not be instantiated.");
    } // End of the function
    static function init()
    {
        caurina.transitions.Tweener.registerSpecialProperty("_color_ra", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["ra"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_rb", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["rb"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_ga", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["ga"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_gb", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["gb"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_ba", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["ba"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_bb", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["bb"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_aa", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["aa"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_ab", caurina.transitions.properties.ColorShortcuts._oldColor_property_get, caurina.transitions.properties.ColorShortcuts._oldColor_property_set, ["ab"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_redMultiplier", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["redMultiplier"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_redOffset", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["redOffset"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_greenMultiplier", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["greenMultiplier"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_greenOffset", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["greenOffset"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_blueMultiplier", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["blueMultiplier"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_blueOffset", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["blueOffset"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_alphaMultiplier", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["alphaMultiplier"]);
        caurina.transitions.Tweener.registerSpecialProperty("_color_alphaOffset", caurina.transitions.properties.ColorShortcuts._color_property_get, caurina.transitions.properties.ColorShortcuts._color_property_set, ["alphaOffset"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_color", caurina.transitions.properties.ColorShortcuts._color_splitter);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_colorTransform", caurina.transitions.properties.ColorShortcuts._colorTransform_splitter);
        caurina.transitions.Tweener.registerSpecialProperty("_brightness", caurina.transitions.properties.ColorShortcuts._brightness_get, caurina.transitions.properties.ColorShortcuts._brightness_set, [false]);
        caurina.transitions.Tweener.registerSpecialProperty("_tintBrightness", caurina.transitions.properties.ColorShortcuts._brightness_get, caurina.transitions.properties.ColorShortcuts._brightness_set, [true]);
        caurina.transitions.Tweener.registerSpecialProperty("_contrast", caurina.transitions.properties.ColorShortcuts._contrast_get, caurina.transitions.properties.ColorShortcuts._contrast_set);
        caurina.transitions.Tweener.registerSpecialProperty("_hue", caurina.transitions.properties.ColorShortcuts._hue_get, caurina.transitions.properties.ColorShortcuts._hue_set);
        caurina.transitions.Tweener.registerSpecialProperty("_saturation", caurina.transitions.properties.ColorShortcuts._saturation_get, caurina.transitions.properties.ColorShortcuts._saturation_set, [false]);
        caurina.transitions.Tweener.registerSpecialProperty("_dumbSaturation", caurina.transitions.properties.ColorShortcuts._saturation_get, caurina.transitions.properties.ColorShortcuts._saturation_set, [true]);
    } // End of the function
    static function _color_splitter(p_value, p_parameters)
    {
        var _loc1 = new Array();
        if (p_value == null)
        {
            _loc1.push({name: "_color_redMultiplier", value: 1});
            _loc1.push({name: "_color_redOffset", value: 0});
            _loc1.push({name: "_color_greenMultiplier", value: 1});
            _loc1.push({name: "_color_greenOffset", value: 0});
            _loc1.push({name: "_color_blueMultiplier", value: 1});
            _loc1.push({name: "_color_blueOffset", value: 0});
        }
        else
        {
            _loc1.push({name: "_color_redMultiplier", value: 0});
            _loc1.push({name: "_color_redOffset", value: caurina.transitions.AuxFunctions.numberToR(p_value)});
            _loc1.push({name: "_color_greenMultiplier", value: 0});
            _loc1.push({name: "_color_greenOffset", value: caurina.transitions.AuxFunctions.numberToG(p_value)});
            _loc1.push({name: "_color_blueMultiplier", value: 0});
            _loc1.push({name: "_color_blueOffset", value: caurina.transitions.AuxFunctions.numberToB(p_value)});
        } // end else if
        return (_loc1);
    } // End of the function
    static function _colorTransform_splitter(p_value, p_parameters)
    {
        var _loc2 = new Array();
        if (p_value == null)
        {
            _loc2.push({name: "_color_redMultiplier", value: 1});
            _loc2.push({name: "_color_redOffset", value: 0});
            _loc2.push({name: "_color_greenMultiplier", value: 1});
            _loc2.push({name: "_color_greenOffset", value: 0});
            _loc2.push({name: "_color_blueMultiplier", value: 1});
            _loc2.push({name: "_color_blueOffset", value: 0});
        }
        else
        {
            if (p_value.ra != undefined)
            {
                _loc2.push({name: "_color_ra", value: p_value.ra});
            } // end if
            if (p_value.rb != undefined)
            {
                _loc2.push({name: "_color_rb", value: p_value.rb});
            } // end if
            if (p_value.ga != undefined)
            {
                _loc2.push({name: "_color_ba", value: p_value.ba});
            } // end if
            if (p_value.gb != undefined)
            {
                _loc2.push({name: "_color_bb", value: p_value.bb});
            } // end if
            if (p_value.ba != undefined)
            {
                _loc2.push({name: "_color_ga", value: p_value.ga});
            } // end if
            if (p_value.bb != undefined)
            {
                _loc2.push({name: "_color_gb", value: p_value.gb});
            } // end if
            if (p_value.aa != undefined)
            {
                _loc2.push({name: "_color_aa", value: p_value.aa});
            } // end if
            if (p_value.ab != undefined)
            {
                _loc2.push({name: "_color_ab", value: p_value.ab});
            } // end if
            if (p_value.redMultiplier != undefined)
            {
                _loc2.push({name: "_color_redMultiplier", value: p_value.redMultiplier});
            } // end if
            if (p_value.redOffset != undefined)
            {
                _loc2.push({name: "_color_redOffset", value: p_value.redOffset});
            } // end if
            if (p_value.blueMultiplier != undefined)
            {
                _loc2.push({name: "_color_blueMultiplier", value: p_value.blueMultiplier});
            } // end if
            if (p_value.blueOffset != undefined)
            {
                _loc2.push({name: "_color_blueOffset", value: p_value.blueOffset});
            } // end if
            if (p_value.greenMultiplier != undefined)
            {
                _loc2.push({name: "_color_greenMultiplier", value: p_value.greenMultiplier});
            } // end if
            if (p_value.greenOffset != undefined)
            {
                _loc2.push({name: "_color_greenOffset", value: p_value.greenOffset});
            } // end if
            if (p_value.alphaMultiplier != undefined)
            {
                _loc2.push({name: "_color_alphaMultiplier", value: p_value.alphaMultiplier});
            } // end if
            if (p_value.alphaOffset != undefined)
            {
                _loc2.push({name: "_color_alphaOffset", value: p_value.alphaOffset});
            } // end if
        } // end else if
        return (_loc2);
    } // End of the function
    static function _oldColor_property_get(p_obj, p_parameters)
    {
        return (new Color(p_obj).getTransform()[p_parameters[0]]);
    } // End of the function
    static function _oldColor_property_set(p_obj, p_value, p_parameters)
    {
        var _loc1 = new Object();
        _loc1[p_parameters[0]] = p_value;
        new Color(p_obj).setTransform(_loc1);
    } // End of the function
    static function _color_property_get(p_obj, p_parameters)
    {
        return (p_obj.transform.colorTransform[p_parameters[0]]);
    } // End of the function
    static function _color_property_set(p_obj, p_value, p_parameters)
    {
        var _loc1 = p_obj.transform.colorTransform;
        _loc1[p_parameters[0]] = p_value;
        p_obj.transform.colorTransform = _loc1;
    } // End of the function
    static function _brightness_get(p_obj, p_parameters)
    {
        var _loc4 = p_parameters[0];
        var _loc1 = new Color(p_obj).getTransform();
        var _loc3 = 1 - (_loc1.ra + _loc1.ga + _loc1.ba) / 300;
        var _loc2 = (_loc1.rb + _loc1.gb + _loc1.bb) / 3;
        if (_loc4)
        {
            return (_loc2 > 0 ? (_loc2 / 255) : (-_loc3));
        }
        else
        {
            return (_loc2 / 100);
        } // end else if
    } // End of the function
    static function _brightness_set(p_obj, p_value, p_parameters)
    {
        var _loc5 = p_parameters[0];
        var _loc2;
        var _loc1;
        if (_loc5)
        {
            _loc2 = 1 - Math.abs(p_value);
            _loc1 = p_value > 0 ? (Math.round(p_value * 255)) : (0);
        }
        else
        {
            _loc2 = 1;
            _loc1 = Math.round(p_value * 100);
        } // end else if
        var _loc4 = {ra: _loc2 * 100, rb: _loc1, ga: _loc2 * 100, gb: _loc1, ba: _loc2 * 100, bb: _loc1};
        new Color(p_obj).setTransform(_loc4);
    } // End of the function
    static function _saturation_get(p_obj, p_parameters)
    {
        var _loc1 = caurina.transitions.properties.ColorShortcuts.getObjectMatrix(p_obj);
        var _loc5 = p_parameters[0];
        var _loc2 = _loc5 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_R);
        var _loc4 = _loc5 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_G);
        var _loc3 = _loc5 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_B);
        var _loc6 = ((_loc1[0] - _loc2) / (1 - _loc2) + (_loc1[6] - _loc4) / (1 - _loc4) + (_loc1[12] - _loc3) / (1 - _loc3)) / 3;
        var _loc7 = 1 - (_loc1[1] / _loc4 + _loc1[2] / _loc3 + _loc1[5] / _loc2 + _loc1[7] / _loc3 + _loc1[10] / _loc2 + _loc1[11] / _loc4) / 6;
        return ((_loc6 + _loc7) / 2);
    } // End of the function
    static function _saturation_set(p_obj, p_value, p_parameters)
    {
        var _loc3 = p_parameters[0];
        var _loc7 = _loc3 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_R);
        var _loc10 = _loc3 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_G);
        var _loc8 = _loc3 ? (3.333333E-001) : (caurina.transitions.properties.ColorShortcuts.LUMINANCE_B);
        var _loc1 = p_value;
        var _loc5 = 1 - _loc1;
        var _loc2 = _loc7 * _loc5;
        var _loc4 = _loc10 * _loc5;
        var _loc6 = _loc8 * _loc5;
        var _loc9 = [_loc2 + _loc1, _loc4, _loc6, 0, 0, _loc2, _loc4 + _loc1, _loc6, 0, 0, _loc2, _loc4, _loc6 + _loc1, 0, 0, 0, 0, 0, 1, 0];
        caurina.transitions.properties.ColorShortcuts.setObjectMatrix(p_obj, _loc9);
    } // End of the function
    static function _contrast_get(p_obj, p_parameters)
    {
        var _loc1 = new Color(p_obj).getTransform();
        var _loc3;
        var _loc2;
        _loc3 = (_loc1.ra + _loc1.ga + _loc1.ba) / 300 - 1;
        _loc2 = (_loc1.rb + _loc1.gb + _loc1.bb) / 3 / -128;
        return ((_loc3 + _loc2) / 2);
    } // End of the function
    static function _contrast_set(p_obj, p_value, p_parameters)
    {
        var _loc2;
        var _loc1;
        _loc2 = p_value + 1;
        _loc1 = Math.round(p_value * -128);
        var _loc3 = {ra: _loc2 * 100, rb: _loc1, ga: _loc2 * 100, gb: _loc1, ba: _loc2 * 100, bb: _loc1};
        new Color(p_obj).setTransform(_loc3);
    } // End of the function
    static function _hue_get(p_obj, p_parameters)
    {
        var _loc4 = caurina.transitions.properties.ColorShortcuts.getObjectMatrix(p_obj);
        var _loc1 = [];
        _loc1[0] = {angle: -1.799000E+002, matrix: caurina.transitions.properties.ColorShortcuts.getHueMatrix(-1.799000E+002)};
        _loc1[1] = {angle: 180, matrix: caurina.transitions.properties.ColorShortcuts.getHueMatrix(180)};
        for (var _loc3 = 0; _loc3 < _loc1.length; ++_loc3)
        {
            _loc1[_loc3].distance = caurina.transitions.properties.ColorShortcuts.getHueDistance(_loc4, _loc1[_loc3].matrix);
        } // end of for
        var _loc5 = 15;
        var _loc2;
        for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
        {
            if (_loc1[0].distance < _loc1[1].distance)
            {
                _loc2 = 1;
            }
            else
            {
                _loc2 = 0;
            } // end else if
            _loc1[_loc2].angle = (_loc1[0].angle + _loc1[1].angle) / 2;
            _loc1[_loc2].matrix = caurina.transitions.properties.ColorShortcuts.getHueMatrix(_loc1[_loc2].angle);
            _loc1[_loc2].distance = caurina.transitions.properties.ColorShortcuts.getHueDistance(_loc4, _loc1[_loc2].matrix);
        } // end of for
        return (_loc1[_loc2].angle);
    } // End of the function
    static function _hue_set(p_obj, p_value, p_parameters)
    {
        caurina.transitions.properties.ColorShortcuts.setObjectMatrix(p_obj, caurina.transitions.properties.ColorShortcuts.getHueMatrix(p_value));
    } // End of the function
    static function getHueDistance(mtx1, mtx2)
    {
        return (Math.abs(mtx1[0] - mtx2[0]) + Math.abs(mtx1[1] - mtx2[1]) + Math.abs(mtx1[2] - mtx2[2]));
    } // End of the function
    static function getHueMatrix(hue)
    {
        var _loc6 = hue * 3.141593E+000 / 180;
        var _loc3 = caurina.transitions.properties.ColorShortcuts.LUMINANCE_R;
        var _loc5 = caurina.transitions.properties.ColorShortcuts.LUMINANCE_G;
        var _loc4 = caurina.transitions.properties.ColorShortcuts.LUMINANCE_B;
        var _loc1 = Math.cos(_loc6);
        var _loc2 = Math.sin(_loc6);
        var _loc7 = [_loc3 + _loc1 * (1 - _loc3) + _loc2 * -_loc3, _loc5 + _loc1 * -_loc5 + _loc2 * -_loc5, _loc4 + _loc1 * -_loc4 + _loc2 * (1 - _loc4), 0, 0, _loc3 + _loc1 * -_loc3 + _loc2 * 1.430000E-001, _loc5 + _loc1 * (1 - _loc5) + _loc2 * 1.400000E-001, _loc4 + _loc1 * -_loc4 + _loc2 * -2.830000E-001, 0, 0, _loc3 + _loc1 * -_loc3 + _loc2 * -(1 - _loc3), _loc5 + _loc1 * -_loc5 + _loc2 * _loc5, _loc4 + _loc1 * (1 - _loc4) + _loc2 * _loc4, 0, 0, 0, 0, 0, 1, 0];
        return (_loc7);
    } // End of the function
    static function getObjectMatrix(p_obj)
    {
        for (var _loc1 = 0; _loc1 < p_obj.filters.length; ++_loc1)
        {
            if (p_obj.filters[_loc1] instanceof flash.filters.ColorMatrixFilter)
            {
                return (p_obj.filters[_loc1].matrix.concat());
            } // end if
        } // end of for
        return ([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);
    } // End of the function
    static function setObjectMatrix(p_obj, p_matrix)
    {
        var _loc2 = p_obj.filters.concat();
        var _loc3 = false;
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if (_loc2[_loc1] instanceof flash.filters.ColorMatrixFilter)
            {
                _loc2[_loc1].matrix = p_matrix.concat();
                _loc3 = true;
            } // end if
        } // end of for
        if (!_loc3)
        {
            var _loc5 = new flash.filters.ColorMatrixFilter(p_matrix);
            _loc2[_loc2.length] = _loc5;
        } // end if
        p_obj.filters = _loc2;
    } // End of the function
    static var LUMINANCE_R = 2.126710E-001;
    static var LUMINANCE_G = 7.151600E-001;
    static var LUMINANCE_B = 7.216900E-002;
} // End of Class
