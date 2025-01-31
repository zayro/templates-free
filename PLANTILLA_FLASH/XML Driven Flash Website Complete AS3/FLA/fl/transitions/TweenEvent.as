﻿package fl.transitions
{
    import flash.events.*;

    public class TweenEvent extends Event
    {
        public var time:Number = 1.#QNAN;
        public var position:Number = 1.#QNAN;
        public static const MOTION_START:String = "motionStart";
        public static const MOTION_STOP:String = "motionStop";
        public static const MOTION_LOOP:String = "motionLoop";
        public static const MOTION_CHANGE:String = "motionChange";
        public static const MOTION_FINISH:String = "motionFinish";
        public static const MOTION_RESUME:String = "motionResume";

        public function TweenEvent(param1:String, param2:Number, param3:Number, param4:Boolean = false, param5:Boolean = false)
        {
            time = NaN;
            position = NaN;
            super(param1, param4, param5);
            this.time = param2;
            this.position = param3;
            return;
        }// end function

        override public function clone() : Event
        {
            return new TweenEvent(this.type, this.time, this.position, this.bubbles, this.cancelable);
        }// end function

    }
}
