﻿package caurina.transitions
{

    public class SpecialPropertySplitter extends Object
    {
        public var parameters:Array;
        public var splitValues:Function;

        public function SpecialPropertySplitter(param1:Function, param2:Array)
        {
            splitValues = param1;
            parameters = param2;
            return;
        }// end function

        public function toString() : String
        {
            var _loc_1:String;
            _loc_1 = "";
            _loc_1 = _loc_1 + "[SpecialPropertySplitter ";
            _loc_1 = _loc_1 + ("splitValues:" + String(splitValues));
            _loc_1 = _loc_1 + ", ";
            _loc_1 = _loc_1 + ("parameters:" + String(parameters));
            _loc_1 = _loc_1 + "]";
            return _loc_1;
        }// end function

    }
}
