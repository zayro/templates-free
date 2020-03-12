    class oxylus.afsmg.buttong extends MovieClip
    {
        var pressed, over, normal, node, bg, totalWidth, dispatchEvent;
        function buttong () {
            super();
            mx.events.EventDispatcher.initialize(this);
            over._alpha = (pressed._alpha = 0);
            normal.txt.autoSize = (over.txt.autoSize = (pressed.txt.autoSize = true));
        }
        function setNode(_arg3) {
            node = _arg3;
            normal.txt.text = (over.txt.text = (pressed.txt.text = node.attributes.title));
            var _local2 = new TextFormat();
            _local2.bold = true;
            normal.txt.setTextFormat(_local2);
            over.txt.setTextFormat(_local2);
            pressed.txt.setTextFormat(_local2);
            drawOval(bg, normal._width + 6, normal._height, 0, 0, 0);
            normal._x = (over._x = (pressed._x = 6));
            totalWidth = bg._width;
        }
        function onRollOver() {
            if (activated == 0) {
                caurina.transitions.Tweener.addTween(normal, {_alpha:0, time:0.2, transition:"linear"});
                caurina.transitions.Tweener.addTween(over, {_alpha:100, time:0.2, transition:"linear"});
            }
        }
        function onRollOut() {
            if (activated == 0) {
                caurina.transitions.Tweener.addTween(normal, {_alpha:100, time:0.2, transition:"linear"});
                caurina.transitions.Tweener.addTween(over, {_alpha:0, time:0.2, transition:"linear"});
            }
        }
        function onRelease() {
            dispatchEvent({target:this, type:"buttonPressed", mc:this});
        }
        function onReleaseOutside() {
            this.onRollOut();
        }
        function onn() {
            activated = 1;
            caurina.transitions.Tweener.addTween(normal, {_alpha:0, time:0.2, transition:"linear"});
            caurina.transitions.Tweener.addTween(over, {_alpha:0, time:0.2, transition:"linear"});
            caurina.transitions.Tweener.addTween(pressed, {_alpha:100, time:0.2, transition:"linear"});
        }
        function off() {
            activated = 0;
            caurina.transitions.Tweener.addTween(normal, {_alpha:100, time:0.2, transition:"linear"});
            caurina.transitions.Tweener.addTween(over, {_alpha:0, time:0.2, transition:"linear"});
            caurina.transitions.Tweener.addTween(pressed, {_alpha:0, time:0.2, transition:"linear"});
        }
        function drawOval(_arg1, _arg3, _arg4, _arg2, _arg5, _arg6) {
            _arg1.clear();
            _arg1.beginFill(_arg5, _arg6);
            _arg1.moveTo(_arg2, 0);
            _arg1.lineTo(_arg3 - _arg2, 0);
            _arg1.curveTo(_arg3, 0, _arg3, _arg2);
            _arg1.lineTo(_arg3, _arg4 - _arg2);
            _arg1.curveTo(_arg3, _arg4, _arg3 - _arg2, _arg4);
            _arg1.lineTo(_arg2, _arg4);
            _arg1.curveTo(0, _arg4, 0, _arg4 - _arg2);
            _arg1.lineTo(0, _arg2);
            _arg1.curveTo(0, 0, _arg2, 0);
            _arg1.endFill();
        }
        var activated = 0;
    }
