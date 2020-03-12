class mx.controls.listclasses.SelectableRow extends mx.core.UIComponent
{
	var __height, cell, owner, rowIndex, icon_mc, createObject, __width, backGround, highlight, highlightColor, createLabel, createClassObject, listOwner, tabEnabled, item, createEmptyMovieClip, drawRect, isChangedToSelected, bGTween, grandOwner;
	function SelectableRow () {
		super();
	}
	function setValue(itmObj, state) {
		var _local7 = __height;
		var _local2 = cell;
		var _local5 = owner;
		var _local8 = itemToString(itmObj);
		if (_local2.getValue() != _local8) {
			_local2.setValue(_local8, itmObj, state);
		}
		var _local4 = _local5.getPropertiesAt(rowIndex + _local5.__vPosition).icon;
		if (_local4 == undefined) {
			_local4 = _local5.__iconFunction(itmObj);
			if (_local4 == undefined) {
				_local4 = itmObj[_local5.__iconField];
				if (_local4 == undefined) {
					_local4 = _local5.getStyle("defaultIcon");
				}
			}
		}
		var _local3 = icon_mc;
		if ((_local4 != undefined) && (itmObj != undefined)) {
			_local3 = createObject(_local4, "icon_mc", 20);
			_local3._x = 2;
			_local3._y = (_local7 - _local3._height) / 2;
			_local2._x = 4 + _local3._width;
		} else {
			_local3.removeMovieClip();
			_local2._x = 2;
		}
		var _local9 = ((_local3 == undefined) ? 0 : (_local3._width));
		_local2.setSize(__width - _local9, Math.min(_local7, _local2.getPreferredHeight()));
		_local2._y = (_local7 - _local2._height) / 2;
	}
	function size(Void) {
		var _local3 = backGround;
		var _local2 = cell;
		var _local4 = __height;
		var _local5 = __width;
		var _local6 = ((icon_mc == undefined) ? 0 : (icon_mc._width));
		_local2.setSize(_local5 - _local6, Math.min(_local4, _local2.getPreferredHeight()));
		_local2._y = (_local4 - _local2._height) / 2;
		icon_mc._y = (_local4 - icon_mc._height) / 2;
		_local3._x = 0;
		_local3._width = _local5;
		_local3._height = _local4;
		drawRowFill(_local3, normalColor);
		drawRowFill(highlight, highlightColor);
	}
	function setCellRenderer(forceSizing) {
		var _local3 = owner.__cellRenderer;
		var _local4;
		if (cell != undefined) {
			_local4 = cell._x;
			cell.removeMovieClip();
			cell.removeTextField();
		}
		var _local2;
		if (_local3 == undefined) {
			_local2 = (cell = createLabel("cll", 0, {styleName:this}));
			_local2.styleName = owner;
			_local2.selectable = false;
			_local2.tabEnabled = false;
			_local2.background = false;
			_local2.border = false;
		} else if (typeof(_local3) == "string") {
			_local2 = (cell = createObject(_local3, "cll", 0, {styleName:this}));
		} else {
			_local2 = (cell = createClassObject(_local3, "cll", 0, {styleName:this}));
		}
		_local2.owner = this;
		_local2.listOwner = owner;
		_local2.getCellIndex = getCellIndex;
		_local2.getDataLabel = getDataLabel;
		if (_local4 != undefined) {
			_local2._x = _local4;
		}
		if (forceSizing) {
			this.size();
		}
	}
	function getCellIndex(Void) {
		return({columnIndex:0, itemIndex:owner.rowIndex + listOwner.__vPosition});
	}
	function getDataLabel() {
		return(listOwner.labelField);
	}
	function init(Void) {
		super.init();
		tabEnabled = false;
	}
	function createChildren(Void) {
		setCellRenderer(false);
		setupBG();
		setState(state, false);
	}
	function drawRow(itmObj, state, transition) {
		item = itmObj;
		setState(state, transition);
		setValue(itmObj, state, transition);
	}
	function itemToString(itmObj) {
		if (itmObj == undefined) {
			return(" ");
		}
		var _local2 = owner.__labelFunction(itmObj);
		if (_local2 == undefined) {
			_local2 = ((itmObj instanceof XMLNode) ? (itmObj.attributes[owner.__labelField]) : (itmObj[owner.__labelField]));
			if (_local2 == undefined) {
				_local2 = " ";
				if (typeof(itmObj) == "object") {
					for (var _local4 in itmObj) {
						if (_local4 != "__ID__") {
							_local2 = (itmObj[_local4] + ", ") + _local2;
						}
					}
					_local2 = _local2.substring(0, _local2.length - 2);
				} else {
					_local2 = itmObj;
				}
			}
		}
		return(_local2);
	}
	function setupBG(Void) {
		var _local2 = (backGround = this.createEmptyMovieClip("bG_mc", LOWEST_DEPTH));
		drawRowFill(_local2, normalColor);
		highlight = this.createEmptyMovieClip("tran_mc", LOWEST_DEPTH + 10);
		_local2.owner = this;
		_local2.grandOwner = owner;
		_local2.onPress = bGOnPress;
		_local2.onRelease = bGOnRelease;
		_local2.onRollOver = bGOnRollOver;
		_local2.onRollOut = bGOnRollOut;
		_local2.onDragOver = bGOnDragOver;
		_local2.onDragOut = bGOnDragOut;
		_local2.useHandCursor = false;
		_local2.trackAsMenu = true;
		_local2.drawRect = drawRect;
		highlight.drawRect = drawRect;
	}
	function drawRowFill(mc, newClr) {
		mc.clear();
		mc.beginFill(newClr);
		mc.drawRect(1, 0, __width, __height);
		mc.endFill();
		mc._width = __width;
		mc._height = __height;
	}
	function setState(newState, transition) {
		var _local2 = highlight;
		var _local8 = backGround;
		var _local4 = __height;
		var _local3 = owner;
		if (!_local3.enabled) {
			if ((newState == "selected") || (state == "selected")) {
				highlightColor = _local3.getStyle("selectionDisabledColor");
				drawRowFill(_local2, highlightColor);
				_local2._visible = true;
				_local2._y = 0;
				_local2._height = _local4;
			} else {
				_local2._visible = false;
				normalColor = _local3.getStyle("backgroundDisabledColor");
				drawRowFill(_local8, normalColor);
			}
			cell.__enabled = false;
			cell.setColor(_local3.getStyle("disabledColor"));
		} else {
			cell.__enabled = true;
			if (transition && ((newState == state) || ((newState == "highlighted") && (state == "selected")))) {
				isChangedToSelected = true;
				return(undefined);
			}
			var _local6 = _local3.getStyle("selectionDuration");
			var _local7 = 0;
			if (isChangedToSelected && (newState == "selected")) {
				transition = false;
			}
			var _local10 = transition && (_local6 != 0);
			if (newState == "normal") {
				_local7 = _local3.getStyle("color");
				normalColor = getNormalColor();
				drawRowFill(_local8, normalColor);
				if (_local10) {
					_local6 = _local6 / 2;
					_local2._height = _local4;
					_local2._width = __width;
					_local2._y = 0;
					bGTween = new mx.effects.Tween(this, _local4 + 2, _local4 * 0.2, _local6, 5);
				} else {
					_local2._visible = false;
				}
				delete isChangedToSelected;
			} else {
				highlightColor = _local3.getStyle(((newState == "highlighted") ? "rollOverColor" : "selectionColor"));
				drawRowFill(_local2, highlightColor);
				_local2._visible = true;
				_local7 = _local3.getStyle(((newState == "highlighted") ? "textRollOverColor" : "textSelectedColor"));
				if (_local10) {
					_local2._height = _local4 * 0.5;
					_local2._y = (_local4 - _local2._height) / 2;
					bGTween = new mx.effects.Tween(this, _local2._height, _local4 + 2, _local6, 5);
					var _local9 = _local3.getStyle("selectionEasing");
					if (_local9 != undefined) {
						bGTween.easingEquation = _local9;
					}
				} else {
					_local2._y = 0;
					_local2._height = _local4;
				}
			}
			cell.setColor(_local7);
		}
		state = newState;
	}
	function onTweenUpdate(val) {
		highlight._height = val;
		highlight._y = (__height - val) / 2;
	}
	function onTweenEnd(val) {
		onTweenUpdate(val);
		highlight._visible = state != "normal";
	}
	function getNormalColor(Void) {
		var _local3;
		var _local2 = owner;
		if (!owner.enabled) {
			_local3 = _local2.getStyle("backgroundDisabledColor");
		} else {
			var _local5 = rowIndex + _local2.__vPosition;
			if (rowIndex == undefined) {
				_local3 = _local2.getPropertiesOf(item).backgroundColor;
			} else {
				_local3 = _local2.getPropertiesAt(_local5).backgroundColor;
			}
			if (_local3 == undefined) {
				var _local4 = _local2.getStyle("alternatingRowColors");
				if (_local4 == undefined) {
					_local3 = _local2.getStyle("backgroundColor");
				} else {
					_local3 = _local4[_local5 % _local4.length];
				}
			}
		}
		return(_local3);
	}
	function invalidateStyle(propName) {
		cell.invalidateStyle(propName);
		super.invalidateStyle(propName);
	}
	function bGOnPress(Void) {
		grandOwner.pressFocus();
		grandOwner.onRowPress(owner.rowIndex);
	}
	function bGOnRelease(Void) {
		grandOwner.releaseFocus();
		grandOwner.onRowRelease(owner.rowIndex);
	}
	function bGOnRollOver(Void) {
		grandOwner.onRowRollOver(owner.rowIndex);
	}
	function bGOnRollOut(Void) {
		grandOwner.onRowRollOut(owner.rowIndex);
	}
	function bGOnDragOver(Void) {
		grandOwner.onRowDragOver(owner.rowIndex);
	}
	function bGOnDragOut(Void) {
		grandOwner.onRowDragOut(owner.rowIndex);
	}
	static var LOWEST_DEPTH = -16384;
	var state = "normal";
	var disabledColor = 15263976;
	var normalColor = 16777215;
}
