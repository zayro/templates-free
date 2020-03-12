class kliment.math.Calc
{
	function Calc () {
	}
	static function getPercent(part, total) {
		return((part / total) * 100);
	}
	static function getFromPercent(percent, total) {
		return((total * 0.01) * percent);
	}
	static function randomRange(min, max) {
		return(Math.floor(Math.random() * ((max - min) + 1)) + min);
	}
	static function sqr(value) {
		return(value * value);
	}
	static function exponentiation(value, exponent) {
		value = Math.abs(value);
		return(Math.exp(Math.log(value) * exponent));
	}
	static function roundDec(value, dec) {
		var _local1 = Math.pow(10, dec || 0);
		return(Math.round((value || 0) * _local1) / _local1);
	}
	static function inInterval(min, max, value) {
		return(Math.max(min, Math.min(value, max)));
	}
	static function inIntervalRound(min, max, value) {
		if (value > max) {
			return(min);
		}
		if (value < min) {
			return(max);
		}
		return(value);
	}
	static function even(value) {
		return(!odd(value));
	}
	static function odd(value) {
		return(Boolean(value % 2));
	}
}
