﻿package fl.transitions.easing
{

    public class Strong extends Object
    {

        public function Strong()
        {
            return;
        }// end function

        public static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            return param3 * (--param1 / param4 * --param1 / param4 * _loc_1 * _loc_1 * _loc_1 + 1) + param2;
        }// end function

        public static function easeIn(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 / param4;
            param1 = param1 / param4;
            return param3 * _loc_5 * param1 * param1 * param1 * param1 + param2;
        }// end function

        public static function easeInOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 / (param4 / 2);
            param1 = param1 / (param4 / 2);
            if (_loc_5 < 1)
            {
                return param3 / 2 * param1 * param1 * param1 * param1 * param1 + param2;
            }// end if
            var _loc_5:* = param1 - 2;
            param1 = param1 - 2;
            return param3 / 2 * (_loc_5 * param1 * param1 * param1 * param1 + 2) + param2;
        }// end function

    }
}
