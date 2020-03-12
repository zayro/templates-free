class kliment.utils.RandomList
{
	var _list, _currentIndex;
	function RandomList (firstIndex, lastIndex) {
		_firstIndex = firstIndex;
		_lastIndex = lastIndex;
		if (_firstIndex != _lastIndex) {
			_init();
		}
	}
	function _init() {
		_list = new Array();
		var _local2 = _firstIndex;
		while (_local2 <= _lastIndex) {
			_list.push(_local2);
			_local2++;
		}
	}
	function get nextIndex() {
		if (_list.length < 1) {
			_init();
		}
		var _local3 = kliment["math"].Calc.randomRange(0, _list.length - 1);
		var _local2 = _list[_local3];
		_list.splice(_local3, 1);
		_currentIndex = _local2;
		return(_local2);
	}
	function get currentIndex() {
		return(_currentIndex);
	}
	function get remain() {
		return(_list.length);
	}
	var _firstIndex = 0;
	var _lastIndex = 0;
}
