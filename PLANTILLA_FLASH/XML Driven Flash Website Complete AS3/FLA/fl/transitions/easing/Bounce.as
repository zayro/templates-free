﻿package fl.transitions.easing
{

    public class Bounce extends Object
    {

        public function Bounce()
        {
            return;
        }// end function

        public static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 / param4;
            param1 = param1 / param4;
            if (_loc_5 < 1 / 2.75)
            {
                return param3 * (7.5625 * param1 * param1) + param2;
            }// end if
            if (param1 < 2 / 2.75)
            {
                var _loc_5:* = param1 - 1.5 / 2.75;
                param1 = param1 - 1.5 / 2.75;
                return param3 * (7.5625 * _loc_5 * param1 + 0.75) + param2;
            }// end if
            if (param1 < 2.5 / 2.75)
            {
                var _loc_5:* = param1 - 2.25 / 2.75;
                param1 = param1 - 2.25 / 2.75;
                return param3 * (7.5625 * _loc_5 * param1 + 0.9375) + param2;
            }// end if
            var _loc_5:* = param1 - 2.625 / 2.75;
            param1 = param1 - 2.625 / 2.75;
            return param3 * (7.5625 * _loc_5 * param1 + 0.984375) + param2;
        }// end function

        public static function easeIn(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            return param3 - easeOut(param4 - param1, 0, param3, param4) + param2;
        }// end function

        public static function easeInOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            if (param1 < param4 / 2)
            {
                return easeIn(param1 * 2, 0, param3, param4) * 0.5 + param2;
            }// end if
            return easeOut(param1 * 2 - param4, 0, param3, param4) * 0.5 + param3 * 0.5 + param2;
        }// end function

    }
}
