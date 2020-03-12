class kliment.utils.RandomRun
{
	var _interval, _elements, _isRaned, _randomList, _interval_id;
	function RandomRun (parent_mc, interval, autostart) {
		_interval = interval;
		_elements = new Array();
		_isRaned = new Array();
		for (var _local4 in parent_mc) {
			var _local2 = parent_mc[_local4];
			if (_local2 instanceof MovieClip) {
				_elements.push(_local2);
				_local2.stop();
			}
		}
		_randomList = new kliment.utils.RandomList(0, _elements.length - 1);
		if (autostart) {
			run();
		}
	}
	function run() {
		_next();
	}
	function _next() {
		clearInterval(_interval_id);
		var _local2 = _elements[_randomList.__get__nextIndex()];
		_local2.play();
		_isRaned.push(_local2);
		if (_randomList.__get__remain() > 0) {
			_interval_id = setInterval(this, "_next", _interval);
		}
	}
	function play() {
		var _local2 = _isRaned.length;
		while (_local2--) {
			_isRaned[_local2].play();
		}
		_next();
	}
	function stop() {
		clearInterval(_interval_id);
		var _local2 = _isRaned.length;
		while (_local2--) {
			_isRaned[_local2].stop();
		}
	}
}
