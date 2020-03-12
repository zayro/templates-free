class caurina.transitions.Equations
{
    function Equations()
    {
        trace ("Equations is a static class and should not be instantiated.");
    } // End of the function
    static function init()
    {
        caurina.transitions.Tweener.registerTransition("easenone", caurina.transitions.Equations.easeNone);
        caurina.transitions.Tweener.registerTransition("linear", caurina.transitions.Equations.easeNone);
        caurina.transitions.Tweener.registerTransition("easeinquad", caurina.transitions.Equations.easeInQuad);
        caurina.transitions.Tweener.registerTransition("easeoutquad", caurina.transitions.Equations.easeOutQuad);
        caurina.transitions.Tweener.registerTransition("easeinoutquad", caurina.transitions.Equations.easeInOutQuad);
        caurina.transitions.Tweener.registerTransition("easeoutinquad", caurina.transitions.Equations.easeOutInQuad);
        caurina.transitions.Tweener.registerTransition("easeincubic", caurina.transitions.Equations.easeInCubic);
        caurina.transitions.Tweener.registerTransition("easeoutcubic", caurina.transitions.Equations.easeOutCubic);
        caurina.transitions.Tweener.registerTransition("easeinoutcubic", caurina.transitions.Equations.easeInOutCubic);
        caurina.transitions.Tweener.registerTransition("easeoutincubic", caurina.transitions.Equations.easeOutInCubic);
        caurina.transitions.Tweener.registerTransition("easeinquart", caurina.transitions.Equations.easeInQuart);
        caurina.transitions.Tweener.registerTransition("easeoutquart", caurina.transitions.Equations.easeOutQuart);
        caurina.transitions.Tweener.registerTransition("easeinoutquart", caurina.transitions.Equations.easeInOutQuart);
        caurina.transitions.Tweener.registerTransition("easeoutinquart", caurina.transitions.Equations.easeOutInQuart);
        caurina.transitions.Tweener.registerTransition("easeinquint", caurina.transitions.Equations.easeInQuint);
        caurina.transitions.Tweener.registerTransition("easeoutquint", caurina.transitions.Equations.easeOutQuint);
        caurina.transitions.Tweener.registerTransition("easeinoutquint", caurina.transitions.Equations.easeInOutQuint);
        caurina.transitions.Tweener.registerTransition("easeoutinquint", caurina.transitions.Equations.easeOutInQuint);
        caurina.transitions.Tweener.registerTransition("easeinsine", caurina.transitions.Equations.easeInSine);
        caurina.transitions.Tweener.registerTransition("easeoutsine", caurina.transitions.Equations.easeOutSine);
        caurina.transitions.Tweener.registerTransition("easeinoutsine", caurina.transitions.Equations.easeInOutSine);
        caurina.transitions.Tweener.registerTransition("easeoutinsine", caurina.transitions.Equations.easeOutInSine);
        caurina.transitions.Tweener.registerTransition("easeincirc", caurina.transitions.Equations.easeInCirc);
        caurina.transitions.Tweener.registerTransition("easeoutcirc", caurina.transitions.Equations.easeOutCirc);
        caurina.transitions.Tweener.registerTransition("easeinoutcirc", caurina.transitions.Equations.easeInOutCirc);
        caurina.transitions.Tweener.registerTransition("easeoutincirc", caurina.transitions.Equations.easeOutInCirc);
        caurina.transitions.Tweener.registerTransition("easeinexpo", caurina.transitions.Equations.easeInExpo);
        caurina.transitions.Tweener.registerTransition("easeoutexpo", caurina.transitions.Equations.easeOutExpo);
        caurina.transitions.Tweener.registerTransition("easeinoutexpo", caurina.transitions.Equations.easeInOutExpo);
        caurina.transitions.Tweener.registerTransition("easeoutinexpo", caurina.transitions.Equations.easeOutInExpo);
        caurina.transitions.Tweener.registerTransition("easeinelastic", caurina.transitions.Equations.easeInElastic);
        caurina.transitions.Tweener.registerTransition("easeoutelastic", caurina.transitions.Equations.easeOutElastic);
        caurina.transitions.Tweener.registerTransition("easeinoutelastic", caurina.transitions.Equations.easeInOutElastic);
        caurina.transitions.Tweener.registerTransition("easeoutinelastic", caurina.transitions.Equations.easeOutInElastic);
        caurina.transitions.Tweener.registerTransition("easeinback", caurina.transitions.Equations.easeInBack);
        caurina.transitions.Tweener.registerTransition("easeoutback", caurina.transitions.Equations.easeOutBack);
        caurina.transitions.Tweener.registerTransition("easeinoutback", caurina.transitions.Equations.easeInOutBack);
        caurina.transitions.Tweener.registerTransition("easeoutinback", caurina.transitions.Equations.easeOutInBack);
        caurina.transitions.Tweener.registerTransition("easeinbounce", caurina.transitions.Equations.easeInBounce);
        caurina.transitions.Tweener.registerTransition("easeoutbounce", caurina.transitions.Equations.easeOutBounce);
        caurina.transitions.Tweener.registerTransition("easeinoutbounce", caurina.transitions.Equations.easeInOutBounce);
        caurina.transitions.Tweener.registerTransition("easeoutinbounce", caurina.transitions.Equations.easeOutInBounce);
    } // End of the function
    static function easeNone(t, b, c, d, p_params)
    {
        return (c * t / d + b);
    } // End of the function
    static function easeInQuad(t, b, c, d, p_params)
    {
        t = t / d;
        return (c * (t) * t + b);
    } // End of the function
    static function easeOutQuad(t, b, c, d, p_params)
    {
        t = t / d;
        return (-c * (t) * (t - 2) + b);
    } // End of the function
    static function easeInOutQuad(t, b, c, d, p_params)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * t * t + b);
        } // end if
        return (-c / 2 * (--t * (t - 2) - 1) + b);
    } // End of the function
    static function easeOutInQuad(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutQuad(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInQuad(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInCubic(t, b, c, d, p_params)
    {
        t = t / d;
        return (c * (t) * t * t + b);
    } // End of the function
    static function easeOutCubic(t, b, c, d, p_params)
    {
        t = t / d - 1;
        return (c * ((t) * t * t + 1) + b);
    } // End of the function
    static function easeInOutCubic(t, b, c, d, p_params)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * t * t * t + b);
        } // end if
        t = t - 2;
        return (c / 2 * ((t) * t * t + 2) + b);
    } // End of the function
    static function easeOutInCubic(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutCubic(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInCubic(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInQuart(t, b, c, d, p_params)
    {
        t = t / d;
        return (c * (t) * t * t * t + b);
    } // End of the function
    static function easeOutQuart(t, b, c, d, p_params)
    {
        t = t / d - 1;
        return (-c * ((t) * t * t * t - 1) + b);
    } // End of the function
    static function easeInOutQuart(t, b, c, d, p_params)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * t * t * t * t + b);
        } // end if
        t = t - 2;
        return (-c / 2 * ((t) * t * t * t - 2) + b);
    } // End of the function
    static function easeOutInQuart(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutQuart(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInQuart(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInQuint(t, b, c, d, p_params)
    {
        t = t / d;
        return (c * (t) * t * t * t * t + b);
    } // End of the function
    static function easeOutQuint(t, b, c, d, p_params)
    {
        t = t / d - 1;
        return (c * ((t) * t * t * t * t + 1) + b);
    } // End of the function
    static function easeInOutQuint(t, b, c, d, p_params)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * t * t * t * t * t + b);
        } // end if
        t = t - 2;
        return (c / 2 * ((t) * t * t * t * t + 2) + b);
    } // End of the function
    static function easeOutInQuint(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutQuint(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInQuint(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInSine(t, b, c, d, p_params)
    {
        return (-c * Math.cos(t / d * 1.570796E+000) + c + b);
    } // End of the function
    static function easeOutSine(t, b, c, d, p_params)
    {
        return (c * Math.sin(t / d * 1.570796E+000) + b);
    } // End of the function
    static function easeInOutSine(t, b, c, d, p_params)
    {
        return (-c / 2 * (Math.cos(3.141593E+000 * t / d) - 1) + b);
    } // End of the function
    static function easeOutInSine(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutSine(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInSine(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInExpo(t, b, c, d, p_params)
    {
        return (t == 0 ? (b) : (c * Math.pow(2, 10 * (t / d - 1)) + b - c * 1.000000E-003));
    } // End of the function
    static function easeOutExpo(t, b, c, d, p_params)
    {
        return (t == d ? (b + c) : (c * 1.001000E+000 * (-Math.pow(2, -10 * t / d) + 1) + b));
    } // End of the function
    static function easeInOutExpo(t, b, c, d, p_params)
    {
        if (t == 0)
        {
            return (b);
        } // end if
        if (t == d)
        {
            return (b + c);
        } // end if
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * Math.pow(2, 10 * (t - 1)) + b - c * 5.000000E-004);
        } // end if
        return (c / 2 * 1.000500E+000 * (-Math.pow(2, -10 * --t) + 2) + b);
    } // End of the function
    static function easeOutInExpo(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutExpo(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInExpo(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInCirc(t, b, c, d, p_params)
    {
        t = t / d;
        return (-c * (Math.sqrt(1 - t * t) - 1) + b);
    } // End of the function
    static function easeOutCirc(t, b, c, d, p_params)
    {
        t = t / d - 1;
        return (c * Math.sqrt(1 - (t) * t) + b);
    } // End of the function
    static function easeInOutCirc(t, b, c, d, p_params)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (-c / 2 * (Math.sqrt(1 - t * t) - 1) + b);
        } // end if
        t = t - 2;
        return (c / 2 * (Math.sqrt(1 - (t) * t) + 1) + b);
    } // End of the function
    static function easeOutInCirc(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutCirc(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInCirc(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInElastic(t, b, c, d, p_params)
    {
        if (t == 0)
        {
            return (b);
        } // end if
        t = t / d;
        if (t == 1)
        {
            return (b + c);
        } // end if
        var _loc2 = p_params.period == undefined ? (d * 3.000000E-001) : (p_params.period);
        var _loc5;
        var _loc1 = p_params.amplitude;
        if (!_loc1 || _loc1 < Math.abs(c))
        {
            _loc1 = c;
            _loc5 = _loc2 / 4;
        }
        else
        {
            _loc5 = _loc2 / 6.283185E+000 * Math.asin(c / _loc1);
        } // end else if
        t = t - 1;
        return (-_loc1 * Math.pow(2, 10 * (t)) * Math.sin((t * d - _loc5) * 6.283185E+000 / _loc2) + b);
    } // End of the function
    static function easeOutElastic(t, b, c, d, p_params)
    {
        if (t == 0)
        {
            return (b);
        } // end if
        t = t / d;
        if (t == 1)
        {
            return (b + c);
        } // end if
        var _loc3 = p_params.period == undefined ? (d * 3.000000E-001) : (p_params.period);
        var _loc5;
        var _loc1 = p_params.amplitude;
        if (!_loc1 || _loc1 < Math.abs(c))
        {
            _loc1 = c;
            _loc5 = _loc3 / 4;
        }
        else
        {
            _loc5 = _loc3 / 6.283185E+000 * Math.asin(c / _loc1);
        } // end else if
        return (_loc1 * Math.pow(2, -10 * t) * Math.sin((t * d - _loc5) * 6.283185E+000 / _loc3) + c + b);
    } // End of the function
    static function easeInOutElastic(t, b, c, d, p_params)
    {
        if (t == 0)
        {
            return (b);
        } // end if
        t = t / (d / 2);
        if (t == 2)
        {
            return (b + c);
        } // end if
        var _loc3 = p_params.period == undefined ? (d * 4.500000E-001) : (p_params.period);
        var _loc5;
        var _loc1 = p_params.amplitude;
        if (!_loc1 || _loc1 < Math.abs(c))
        {
            _loc1 = c;
            _loc5 = _loc3 / 4;
        }
        else
        {
            _loc5 = _loc3 / 6.283185E+000 * Math.asin(c / _loc1);
        } // end else if
        if (t < 1)
        {
            t = t - 1;
            return (-5.000000E-001 * (_loc1 * Math.pow(2, 10 * (t)) * Math.sin((t * d - _loc5) * 6.283185E+000 / _loc3)) + b);
        } // end if
        t = t - 1;
        return (_loc1 * Math.pow(2, -10 * (t)) * Math.sin((t * d - _loc5) * 6.283185E+000 / _loc3) * 5.000000E-001 + c + b);
    } // End of the function
    static function easeOutInElastic(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutElastic(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInElastic(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInBack(t, b, c, d, p_params)
    {
        var _loc1 = p_params.overshoot == undefined ? (1.701580E+000) : (p_params.overshoot);
        t = t / d;
        return (c * (t) * t * ((_loc1 + 1) * t - _loc1) + b);
    } // End of the function
    static function easeOutBack(t, b, c, d, p_params)
    {
        var _loc2 = p_params.overshoot == undefined ? (1.701580E+000) : (p_params.overshoot);
        t = t / d - 1;
        return (c * ((t) * t * ((_loc2 + 1) * t + _loc2) + 1) + b);
    } // End of the function
    static function easeInOutBack(t, b, c, d, p_params)
    {
        var _loc2 = p_params.overshoot == undefined ? (1.701580E+000) : (p_params.overshoot);
        t = t / (d / 2);
        if (t < 1)
        {
            _loc2 = _loc2 * 1.525000E+000;
            return (c / 2 * (t * t * ((_loc2 + 1) * t - _loc2)) + b);
        } // end if
        t = t - 2;
        _loc2 = _loc2 * 1.525000E+000;
        return (c / 2 * ((t) * t * ((_loc2 + 1) * t + _loc2) + 2) + b);
    } // End of the function
    static function easeOutInBack(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutBack(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInBack(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
    static function easeInBounce(t, b, c, d, p_params)
    {
        return (c - caurina.transitions.Equations.easeOutBounce(d - t, 0, c, d) + b);
    } // End of the function
    static function easeOutBounce(t, b, c, d, p_params)
    {
        t = t / d;
        if (t < 3.636364E-001)
        {
            return (c * (7.562500E+000 * t * t) + b);
        }
        else if (t < 7.272727E-001)
        {
            t = t - 5.454545E-001;
            return (c * (7.562500E+000 * (t) * t + 7.500000E-001) + b);
        }
        else if (t < 9.090909E-001)
        {
            t = t - 8.181818E-001;
            return (c * (7.562500E+000 * (t) * t + 9.375000E-001) + b);
        }
        else
        {
            t = t - 9.545455E-001;
            return (c * (7.562500E+000 * (t) * t + 9.843750E-001) + b);
        } // end else if
    } // End of the function
    static function easeInOutBounce(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeInBounce(t * 2, 0, c, d) * 5.000000E-001 + b);
        }
        else
        {
            return (caurina.transitions.Equations.easeOutBounce(t * 2 - d, 0, c, d) * 5.000000E-001 + c * 5.000000E-001 + b);
        } // end else if
    } // End of the function
    static function easeOutInBounce(t, b, c, d, p_params)
    {
        if (t < d / 2)
        {
            return (caurina.transitions.Equations.easeOutBounce(t * 2, b, c / 2, d, p_params));
        } // end if
        return (caurina.transitions.Equations.easeInBounce(t * 2 - d, b + c / 2, c / 2, d, p_params));
    } // End of the function
} // End of Class
