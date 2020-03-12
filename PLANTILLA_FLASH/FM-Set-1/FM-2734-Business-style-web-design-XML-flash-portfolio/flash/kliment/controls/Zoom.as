import flash.geom.Point;
import flash.geom.Rectangle;

import caurina.transitions.Tweener;

import kliment.utils.TransformCalc;
import kliment.transitions.caurinaEasing.Quart;

/**
 * ...
 * @author	Kliment
 * @version	1.0.0
 */
class kliment.controls.Zoom {
	private var _zoom:Number = 1;
	private var _target_mc:MovieClip;
	private var _newSize:Rectangle;
	private var _space:Rectangle;
	private var _max:Number;
	private var _min:Number;
	public var animationUpdate:Boolean = false;
	
	public function Zoom(target_mc:MovieClip, space:Rectangle, min:Number, max:Number) {
		_target_mc = target_mc;
		_space = space;	
		_min = min;
		_max = max;
	}
	
	public function zoomDo(value:Number, centerPint:Point):Void {
		var oldVall:Number = _zoom;
		value = _checkZoomValue(value);
		var centerX:Number = 0;
		var centerY:Number = 0;
		
		if (centerPint != null){
			centerX = centerPint.x + _space.x;
			centerY = centerPint.y + _space.y;
		} else {
			centerX = _space.width * .5 + _space.x;
			centerY = _space.height * .5 + _space.y;
		}
		
		var a:Number = centerX - _target_mc._x;
		var e:Number = centerY - _target_mc._y;
		
		var newSize:Rectangle = new Rectangle();
		newSize.x = _target_mc._x - (a * value - a);
		newSize.y = _target_mc._y - (e * value - e);
		newSize.width = _target_mc._width * value;
		newSize.height = _target_mc._height * value	;	
	
		var newPosition:Point = TransformCalc.fixInSpace(newSize, _space);
		newSize.x = newPosition.x; 
		newSize.y = newPosition.y; 
		
		if (animationUpdate) {
			Tweener.addTween(_target_mc, { _x:newSize.x, _y:newSize.y, _width:newSize.width, _height:newSize.height, time:.5, transition:Quart.easeOut } );
		} else {
			_target_mc._x = newSize.x;
			_target_mc._y = newSize.y;
			_target_mc._width = newSize.width;
			_target_mc._height = newSize.height;
		}
		_newSize = newSize;
	}
	
	public function center():Void {
		_target_mc._x = -_target_mc._width * .5 + _space.width * .5;
		_target_mc._y = -_target_mc._height * .5 + _space.height * .5;
	}
	
	private function _checkZoomValue(value:Number):Number{
		value = Math.max(_min, Math.min(value, _max));
		var forReturn:Number = value / _zoom;
		_zoom = value;
		return forReturn;
	}
	
	public function get space():Rectangle { return _space }
	public function set space(value:Rectangle):Void {
		_space = value;
		zoomDo(_zoom);
	}
	
	public function get zoomValue():Number { return _zoom;	}
	public function set zoomValue(value:Number):Void { zoomDo(value); }
	
	public function remove():Void {
		Tweener.removeTweens(_target_mc);
		delete this;
	}
}