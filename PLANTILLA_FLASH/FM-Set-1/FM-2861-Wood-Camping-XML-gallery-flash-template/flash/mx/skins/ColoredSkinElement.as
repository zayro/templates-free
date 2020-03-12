﻿class mx.skins.ColoredSkinElement
{
	var getStyle, _color, onEnterFrame;
	function ColoredSkinElement () {
	}
	function setColor(c) {
		if (c != undefined) {
			var _local2 = new Color(this);
			_local2.setRGB(c);
		}
	}
	function draw(Void) {
		setColor(getStyle(_color));
		onEnterFrame = undefined;
	}
	function invalidateStyle(Void) {
		onEnterFrame = draw;
	}
	static function setColorStyle(p, colorStyle) {
		if (p._color == undefined) {
			p._color = colorStyle;
		}
		p.setColor = mixins.setColor;
		p.invalidateStyle = mixins.invalidateStyle;
		p.draw = mixins.draw;
		p.setColor(p.getStyle(colorStyle));
	}
	static var mixins = new mx.skins.ColoredSkinElement();
}
