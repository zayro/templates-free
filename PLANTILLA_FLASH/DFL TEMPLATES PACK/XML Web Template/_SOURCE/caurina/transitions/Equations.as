
//Created by Action Script Viewer - http://www.buraks.com/asv
    class caurina.transitions.Equations
    {
        function Equations () {
            trace("Equations is a static class and should not be instantiated.");
        }
        static function init() {
            caurina.transitions.Tweener.registerTransition("easenone", easeNone);
            caurina.transitions.Tweener.registerTransition("linear", easeNone);
            caurina.transitions.Tweener.registerTransition("easeinquad", easeInQuad);
            caurina.transitions.Tweener.registerTransition("easeoutquad", easeOutQuad);
            caurina.transitions.Tweener.registerTransition("easeinoutquad", easeInOutQuad);
            caurina.transitions.Tweener.registerTransition("easeoutinquad", easeOutInQuad);
            caurina.transitions.Tweener.registerTransition("easeincubic", easeInCubic);
            caurina.transitions.Tweener.registerTransition("easeoutcubic", easeOutCubic);
            caurina.transitions.Tweener.registerTransition("easeinoutcubic", easeInOutCubic);
            caurina.transitions.Tweener.registerTransition("easeoutincubic", easeOutInCubic);
            caurina.transitions.Tweener.registerTransition("easeinquart", easeInQuart);
            caurina.transitions.Tweener.registerTransition("easeoutquart", easeOutQuart);
            caurina.transitions.Tweener.registerTransition("easeinoutquart", easeInOutQuart);
            caurina.transitions.Tweener.registerTransition("easeoutinquart", easeOutInQuart);
            caurina.transitions.Tweener.registerTransition("easeinquint", easeInQuint);
            caurina.transitions.Tweener.registerTransition("easeoutquint", easeOutQuint);
            caurina.transitions.Tweener.registerTransition("easeinoutquint", easeInOutQuint);
            caurina.transitions.Tweener.registerTransition("easeoutinquint", easeOutInQuint);
            caurina.transitions.Tweener.registerTransition("easeinsine", easeInSine);
            caurina.transitions.Tweener.registerTransition("easeoutsine", easeOutSine);
            caurina.transitions.Tweener.registerTransition("easeinoutsine", easeInOutSine);
            caurina.transitions.Tweener.registerTransition("easeoutinsine", easeOutInSine);
            caurina.transitions.Tweener.registerTransition("easeincirc", easeInCirc);
            caurina.transitions.Tweener.registerTransition("easeoutcirc", easeOutCirc);
            caurina.transitions.Tweener.registerTransition("easeinoutcirc", easeInOutCirc);
            caurina.transitions.Tweener.registerTransition("easeoutincirc", easeOutInCirc);
            caurina.transitions.Tweener.registerTransition("easeinexpo", easeInExpo);
            caurina.transitions.Tweener.registerTransition("easeoutexpo", easeOutExpo);
            caurina.transitions.Tweener.registerTransition("easeinoutexpo", easeInOutExpo);
            caurina.transitions.Tweener.registerTransition("easeoutinexpo", easeOutInExpo);
            caurina.transitions.Tweener.registerTransition("easeinelastic", easeInElastic);
            caurina.transitions.Tweener.registerTransition("easeoutelastic", easeOutElastic);
            caurina.transitions.Tweener.registerTransition("easeinoutelastic", easeInOutElastic);
            caurina.transitions.Tweener.registerTransition("easeoutinelastic", easeOutInElastic);
            caurina.transitions.Tweener.registerTransition("easeinback", easeInBack);
            caurina.transitions.Tweener.registerTransition("easeoutback", easeOutBack);
            caurina.transitions.Tweener.registerTransition("easeinoutback", easeInOutBack);
            caurina.transitions.Tweener.registerTransition("easeoutinback", easeOutInBack);
            caurina.transitions.Tweener.registerTransition("easeinbounce", easeInBounce);
            caurina.transitions.Tweener.registerTransition("easeoutbounce", easeOutBounce);
            caurina.transitions.Tweener.registerTransition("easeinoutbounce", easeInOutBounce);
            caurina.transitions.Tweener.registerTransition("easeoutinbounce", easeOutInBounce);
        }
        static function easeNone(_arg2, _arg4, _arg3, _arg1, p_params) {
            return(((_arg3 * _arg2) / _arg1) + _arg4);
        }
        static function easeInQuad(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return(((_arg3 * _arg1) * _arg1) + _arg4);
        }
        static function easeOutQuad(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return((((-_arg3) * _arg1) * (_arg1 - 2)) + _arg4);
        }
        static function easeInOutQuad(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return((((_arg2 / 2) * _arg1) * _arg1) + _arg3);
            }
            _arg1--;
            return((((-_arg2) / 2) * ((_arg1 * (_arg1 - 2)) - 1)) + _arg3);
        }
        static function easeOutInQuad(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutQuad(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInQuad((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInCubic(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return((((_arg3 * _arg1) * _arg1) * _arg1) + _arg4);
        }
        static function easeOutCubic(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = (_arg1 / _arg2) - 1;
            return((_arg3 * (((_arg1 * _arg1) * _arg1) + 1)) + _arg4);
        }
        static function easeInOutCubic(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return(((((_arg2 / 2) * _arg1) * _arg1) * _arg1) + _arg3);
            }
            _arg1 = _arg1 - 2;
            return(((_arg2 / 2) * (((_arg1 * _arg1) * _arg1) + 2)) + _arg3);
        }
        static function easeOutInCubic(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutCubic(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInCubic((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInQuart(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return(((((_arg3 * _arg1) * _arg1) * _arg1) * _arg1) + _arg4);
        }
        static function easeOutQuart(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = (_arg1 / _arg2) - 1;
            return(((-_arg3) * ((((_arg1 * _arg1) * _arg1) * _arg1) - 1)) + _arg4);
        }
        static function easeInOutQuart(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return((((((_arg2 / 2) * _arg1) * _arg1) * _arg1) * _arg1) + _arg3);
            }
            _arg1 = _arg1 - 2;
            return((((-_arg2) / 2) * ((((_arg1 * _arg1) * _arg1) * _arg1) - 2)) + _arg3);
        }
        static function easeOutInQuart(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutQuart(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInQuart((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInQuint(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return((((((_arg3 * _arg1) * _arg1) * _arg1) * _arg1) * _arg1) + _arg4);
        }
        static function easeOutQuint(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = (_arg1 / _arg2) - 1;
            return((_arg3 * (((((_arg1 * _arg1) * _arg1) * _arg1) * _arg1) + 1)) + _arg4);
        }
        static function easeInOutQuint(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return(((((((_arg2 / 2) * _arg1) * _arg1) * _arg1) * _arg1) * _arg1) + _arg3);
            }
            _arg1 = _arg1 - 2;
            return(((_arg2 / 2) * (((((_arg1 * _arg1) * _arg1) * _arg1) * _arg1) + 2)) + _arg3);
        }
        static function easeOutInQuint(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutQuint(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInQuint((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInSine(_arg3, _arg4, _arg1, _arg2, p_params) {
            return((((-_arg1) * Math.cos((_arg3 / _arg2) * (Math.PI/2))) + _arg1) + _arg4);
        }
        static function easeOutSine(_arg2, _arg4, _arg3, _arg1, p_params) {
            return((_arg3 * Math.sin((_arg2 / _arg1) * (Math.PI/2))) + _arg4);
        }
        static function easeInOutSine(_arg2, _arg4, _arg3, _arg1, p_params) {
            return((((-_arg3) / 2) * (Math.cos((Math.PI * _arg2) / _arg1) - 1)) + _arg4);
        }
        static function easeOutInSine(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutSine(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInSine((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInExpo(_arg1, _arg3, _arg2, _arg4, p_params) {
            return(((_arg1 == 0) ? (_arg3) : (((_arg2 * Math.pow(2, 10 * ((_arg1 / _arg4) - 1))) + _arg3) - (_arg2 * 0.001))));
        }
        static function easeOutExpo(_arg2, _arg4, _arg3, _arg1, p_params) {
            return(((_arg2 == _arg1) ? (_arg4 + _arg3) : (((_arg3 * 1.001) * ((-Math.pow(2, (-10 * _arg2) / _arg1)) + 1)) + _arg4)));
        }
        static function easeInOutExpo(_arg1, _arg3, _arg2, _arg4, p_params) {
            if (_arg1 == 0) {
                return(_arg3);
            }
            if (_arg1 == _arg4) {
                return(_arg3 + _arg2);
            }
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return((((_arg2 / 2) * Math.pow(2, 10 * (_arg1 - 1))) + _arg3) - (_arg2 * 0.0005));
            }
            _arg1--;
            return((((_arg2 / 2) * 1.0005) * ((-Math.pow(2, -10 * _arg1)) + 2)) + _arg3);
        }
        static function easeOutInExpo(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutExpo(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInExpo((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInCirc(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = _arg1 / _arg2;
            return(((-_arg3) * (Math.sqrt(1 - (_arg1 * _arg1)) - 1)) + _arg4);
        }
        static function easeOutCirc(_arg1, _arg4, _arg3, _arg2, p_params) {
            _arg1 = (_arg1 / _arg2) - 1;
            return((_arg3 * Math.sqrt(1 - (_arg1 * _arg1))) + _arg4);
        }
        static function easeInOutCirc(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / (_arg4 / 2);
            if (_arg1 < 1) {
                return((((-_arg2) / 2) * (Math.sqrt(1 - (_arg1 * _arg1)) - 1)) + _arg3);
            }
            _arg1 = _arg1 - 2;
            return(((_arg2 / 2) * (Math.sqrt(1 - (_arg1 * _arg1)) + 1)) + _arg3);
        }
        static function easeOutInCirc(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutCirc(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInCirc((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInElastic(_arg3, _arg7, _arg4, _arg6, _arg8) {
            if (_arg3 == 0) {
                return(_arg7);
            }
            _arg3 = _arg3 / _arg6;
            if (_arg3 == 1) {
                return(_arg7 + _arg4);
            }
            var _local2 = ((_arg8.period == undefined) ? (_arg6 * 0.3) : (_arg8.period));
            var _local5;
            var _local1 = _arg8.amplitude;
            if ((!_local1) || (_local1 < Math.abs(_arg4))) {
                _local1 = _arg4;
                _local5 = _local2 / 4;
            } else {
                _local5 = (_local2 / (Math.PI*2)) * Math.asin(_arg4 / _local1);
            }
            _arg3 = _arg3 - 1;
            return((-((_local1 * Math.pow(2, 10 * _arg3)) * Math.sin((((_arg3 * _arg6) - _local5) * (Math.PI*2)) / _local2))) + _arg7);
        }
        static function easeOutElastic(_arg4, _arg7, _arg2, _arg6, _arg8) {
            if (_arg4 == 0) {
                return(_arg7);
            }
            _arg4 = _arg4 / _arg6;
            if (_arg4 == 1) {
                return(_arg7 + _arg2);
            }
            var _local3 = ((_arg8.period == undefined) ? (_arg6 * 0.3) : (_arg8.period));
            var _local5;
            var _local1 = _arg8.amplitude;
            if ((!_local1) || (_local1 < Math.abs(_arg2))) {
                _local1 = _arg2;
                _local5 = _local3 / 4;
            } else {
                _local5 = (_local3 / (Math.PI*2)) * Math.asin(_arg2 / _local1);
            }
            return((((_local1 * Math.pow(2, -10 * _arg4)) * Math.sin((((_arg4 * _arg6) - _local5) * (Math.PI*2)) / _local3)) + _arg2) + _arg7);
        }
        static function easeInOutElastic(_arg2, _arg7, _arg4, _arg6, _arg8) {
            if (_arg2 == 0) {
                return(_arg7);
            }
            _arg2 = _arg2 / (_arg6 / 2);
            if (_arg2 == 2) {
                return(_arg7 + _arg4);
            }
            var _local3 = ((_arg8.period == undefined) ? (_arg6 * 0.45) : (_arg8.period));
            var _local5;
            var _local1 = _arg8.amplitude;
            if ((!_local1) || (_local1 < Math.abs(_arg4))) {
                _local1 = _arg4;
                _local5 = _local3 / 4;
            } else {
                _local5 = (_local3 / (Math.PI*2)) * Math.asin(_arg4 / _local1);
            }
            if (_arg2 < 1) {
                _arg2 = _arg2 - 1;
                return((-0.5 * ((_local1 * Math.pow(2, 10 * _arg2)) * Math.sin((((_arg2 * _arg6) - _local5) * (Math.PI*2)) / _local3))) + _arg7);
            }
            _arg2 = _arg2 - 1;
            return(((((_local1 * Math.pow(2, -10 * _arg2)) * Math.sin((((_arg2 * _arg6) - _local5) * (Math.PI*2)) / _local3)) * 0.5) + _arg4) + _arg7);
        }
        static function easeOutInElastic(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutElastic(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInElastic((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInBack(_arg2, _arg6, _arg5, _arg4, _arg3) {
            var _local1 = ((_arg3.overshoot == undefined) ? 1.70158 : (_arg3.overshoot));
            _arg2 = _arg2 / _arg4;
            return((((_arg5 * _arg2) * _arg2) * (((_local1 + 1) * _arg2) - _local1)) + _arg6);
        }
        static function easeOutBack(_arg1, _arg6, _arg5, _arg4, _arg3) {
            var _local2 = ((_arg3.overshoot == undefined) ? 1.70158 : (_arg3.overshoot));
            _arg1 = (_arg1 / _arg4) - 1;
            return((_arg5 * (((_arg1 * _arg1) * (((_local2 + 1) * _arg1) + _local2)) + 1)) + _arg6);
        }
        static function easeInOutBack(_arg1, _arg4, _arg3, _arg6, _arg5) {
            var _local2 = ((_arg5.overshoot == undefined) ? 1.70158 : (_arg5.overshoot));
            _arg1 = _arg1 / (_arg6 / 2);
            if (_arg1 < 1) {
                _local2 = _local2 * 1.525;
                return(((_arg3 / 2) * ((_arg1 * _arg1) * (((_local2 + 1) * _arg1) - _local2))) + _arg4);
            }
            _arg1 = _arg1 - 2;
            _local2 = _local2 * 1.525;
            return(((_arg3 / 2) * (((_arg1 * _arg1) * (((_local2 + 1) * _arg1) + _local2)) + 2)) + _arg4);
        }
        static function easeOutInBack(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutBack(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInBack((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
        static function easeInBounce(_arg3, _arg4, _arg2, _arg1, p_params) {
            return((_arg2 - easeOutBounce(_arg1 - _arg3, 0, _arg2, _arg1)) + _arg4);
        }
        static function easeOutBounce(_arg1, _arg3, _arg2, _arg4, p_params) {
            _arg1 = _arg1 / _arg4;
            if (_arg1 < 0.363636363636364) {
                return((_arg2 * ((7.5625 * _arg1) * _arg1)) + _arg3);
            } else if (_arg1 < 0.727272727272727) {
                _arg1 = _arg1 - 0.545454545454545;
                return((_arg2 * (((7.5625 * _arg1) * _arg1) + 0.75)) + _arg3);
            } else if (_arg1 < 0.909090909090909) {
                _arg1 = _arg1 - 0.818181818181818;
                return((_arg2 * (((7.5625 * _arg1) * _arg1) + 0.9375)) + _arg3);
            } else {
                _arg1 = _arg1 - 0.954545454545455;
                return((_arg2 * (((7.5625 * _arg1) * _arg1) + 0.984375)) + _arg3);
            }
        }
        static function easeInOutBounce(_arg2, _arg4, _arg3, _arg1, p_params) {
            if (_arg2 < (_arg1 / 2)) {
                return((easeInBounce(_arg2 * 2, 0, _arg3, _arg1) * 0.5) + _arg4);
            } else {
                return(((easeOutBounce((_arg2 * 2) - _arg1, 0, _arg3, _arg1) * 0.5) + (_arg3 * 0.5)) + _arg4);
            }
        }
        static function easeOutInBounce(_arg2, _arg4, _arg3, _arg1, _arg5) {
            if (_arg2 < (_arg1 / 2)) {
                return(easeOutBounce(_arg2 * 2, _arg4, _arg3 / 2, _arg1, _arg5));
            }
            return(easeInBounce((_arg2 * 2) - _arg1, _arg4 + (_arg3 / 2), _arg3 / 2, _arg1, _arg5));
        }
    }
