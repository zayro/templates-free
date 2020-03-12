package fl.transitions
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class Tween extends EventDispatcher
    {
        private var _position:Number = 1.#QNAN;
        public var prevTime:Number = 1.#QNAN;
        public var prevPos:Number = 1.#QNAN;
        public var isPlaying:Boolean = false;
        public var begin:Number = 1.#QNAN;
        private var _fps:Number = 1.#QNAN;
        private var _time:Number = 1.#QNAN;
        public var change:Number = 1.#QNAN;
        private var _finish:Number = 1.#QNAN;
        public var looping:Boolean = false;
        private var _intervalID:uint = 0;
        public var func:Function;
        private var _timer:Timer = null;
        private var _startTime:Number = 1.#QNAN;
        public var prop:String = "";
        private var _duration:Number = 1.#QNAN;
        public var obj:Object = null;
        public var useSeconds:Boolean = false;
        static var _mc:MovieClip = new MovieClip();

        public function Tween(param1:Object, param2:String, param3:Function, param4:Number, param5:Number, param6:Number, param7:Boolean = false)
        {
            isPlaying = false;
            obj = null;
            prop = "";
            func = 
function (param1:Number, param2:Number, param3:Number, param4:Number) : Number
{
    return param3 * param1 / param4 + param2;
}// end function
;
            begin = NaN;
            change = NaN;
            useSeconds = false;
            prevTime = NaN;
            prevPos = NaN;
            looping = false;
            _duration = NaN;
            _time = NaN;
            _fps = NaN;
            _position = NaN;
            _startTime = NaN;
            _intervalID = 0;
            _finish = NaN;
            _timer = null;
            if (!_loc_8.length)
            {
                return;
            }// end if
            this.obj = param1;
            this.prop = param2;
            this.begin = param4;
            this.position = param4;
            this.duration = param6;
            this.useSeconds = param7;
            if (param3 is Function)
            {
                this.func = param3;
            }// end if
            this.finish = param5;
            this._timer = new Timer(100);
            this.start();
            return;
        }// end function

        public function continueTo(param1:Number, param2:Number) : void
        {
            this.begin = this.position;
            this.finish = param1;
            if (!isNaN(param2))
            {
                this.duration = param2;
            }// end if
            this.start();
            return;
        }// end function

        public function stop() : void
        {
            this.stopEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_STOP, this._time, this._position));
            return;
        }// end function

        private function fixTime() : void
        {
            if (this.useSeconds)
            {
                this._startTime = getTimer() - this._time * 1000;
            }// end if
            return;
        }// end function

        public function set FPS(param1:Number) : void
        {
            var _loc_2:Boolean;
            _loc_2 = this.isPlaying;
            this.stopEnterFrame();
            this._fps = param1;
            if (_loc_2)
            {
                this.startEnterFrame();
            }// end if
            return;
        }// end function

        public function get finish() : Number
        {
            return this.begin + this.change;
        }// end function

        public function get duration() : Number
        {
            return this._duration;
        }// end function

        protected function startEnterFrame() : void
        {
            var _loc_1:Number;
            if (isNaN(this._fps))
            {
                _mc.addEventListener(Event.ENTER_FRAME, this.onEnterFrame, false, 0, true);
            }
            else
            {
                _loc_1 = 1000 / this._fps;
                this._timer.delay = _loc_1;
                this._timer.addEventListener(TimerEvent.TIMER, this.timerHandler, false, 0, true);
                this._timer.start();
            }// end else if
            this.isPlaying = true;
            return;
        }// end function

        public function set time(param1:Number) : void
        {
            this.prevTime = this._time;
            if (param1 > this.duration)
            {
                if (this.looping)
                {
                    this.rewind(param1 - this._duration);
                    this.update();
                    this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_LOOP, this._time, this._position));
                }
                else
                {
                    if (this.useSeconds)
                    {
                        this._time = this._duration;
                        this.update();
                    }// end if
                    this.stop();
                    this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_FINISH, this._time, this._position));
                }// end else if
            }
            else if (param1 < 0)
            {
                this.rewind();
                this.update();
            }
            else
            {
                this._time = param1;
                this.update();
            }// end else if
            return;
        }// end function

        protected function stopEnterFrame() : void
        {
            if (isNaN(this._fps))
            {
                _mc.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            }
            else
            {
                this._timer.stop();
            }// end else if
            this.isPlaying = false;
            return;
        }// end function

        public function getPosition(param1:Number = 1.#QNAN) : Number
        {
            if (isNaN(param1))
            {
                param1 = this._time;
            }// end if
            return this.func(param1, this.begin, this.change, this._duration);
        }// end function

        public function set finish(param1:Number) : void
        {
            this.change = param1 - this.begin;
            return;
        }// end function

        public function set duration(param1:Number) : void
        {
            this._duration = param1 <= 0 ? (Infinity) : (param1);
            return;
        }// end function

        public function setPosition(param1:Number) : void
        {
            this.prevPos = this._position;
            if (this.prop.length)
            {
                var _loc_2:* = param1;
                this._position = param1;
                this.obj[this.prop] = _loc_2;
            }// end if
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_CHANGE, this._time, this._position));
            return;
        }// end function

        public function resume() : void
        {
            this.fixTime();
            this.startEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_RESUME, this._time, this._position));
            return;
        }// end function

        public function fforward() : void
        {
            this.time = this._duration;
            this.fixTime();
            return;
        }// end function

        protected function onEnterFrame(param1:Event) : void
        {
            this.nextFrame();
            return;
        }// end function

        public function get position() : Number
        {
            return this.getPosition(this._time);
        }// end function

        public function yoyo() : void
        {
            this.continueTo(this.begin, this.time);
            return;
        }// end function

        public function nextFrame() : void
        {
            if (this.useSeconds)
            {
                this.time = (getTimer() - this._startTime) / 1000;
            }
            else
            {
                this.time = this._time + 1;
            }// end else if
            return;
        }// end function

        protected function timerHandler(param1:TimerEvent) : void
        {
            this.nextFrame();
            param1.updateAfterEvent();
            return;
        }// end function

        public function get FPS() : Number
        {
            return this._fps;
        }// end function

        public function rewind(param1:Number = 0) : void
        {
            this._time = param1;
            this.fixTime();
            this.update();
            return;
        }// end function

        public function set position(param1:Number) : void
        {
            this.setPosition(param1);
            return;
        }// end function

        public function get time() : Number
        {
            return this._time;
        }// end function

        private function update() : void
        {
            this.setPosition(this.getPosition(this._time));
            return;
        }// end function

        public function start() : void
        {
            this.rewind();
            this.startEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_START, this._time, this._position));
            return;
        }// end function

        public function prevFrame() : void
        {
            if (!this.useSeconds)
            {
                this.time = this._time--;
            }// end if
            return;
        }// end function

    }
}
