/**
 * ...
 * @author	Kliment
 * @version	1.0.0
 */
class kliment.transitions.caurinaEasing.EasingAbstract {
	static private var _easeIn:String;
	static private var _easeOut:String;
	static private var _easeInOut:String;
	static private var _easeOutIn:String;
	
	static public function get easeIn():String { return _easeIn }
	static public function get easeOut():String { return _easeOut }
	static public function get easeInOut():String { return _easeInOut }
	static public function get easeOutIn():String { return _easeOutIn }
}