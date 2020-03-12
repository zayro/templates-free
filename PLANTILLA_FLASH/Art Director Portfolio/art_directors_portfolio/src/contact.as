﻿import caurina.transitions.Tweener;var contact_php_file = "contact.php";var SELECTED_BORDER_ALPHA:Number = 30;var BORDER_ALPHA:Number = 14;var SELECTED_BG_ALPHA:Number = 80;var BG_ALPHA:Number = 52;var SELECTED_BG_COLOR:Number = 0x222222;var BG_COLOR:Number = 0x000000;var TIME_OUT:Number = 0.5;form_mc.field1_txt.defaultText = "Your Name";form_mc.field2_txt.defaultText = "Your Email";form_mc.field3_txt.defaultText = "Message";form_mc.field1_txt.tabIndex = 1;form_mc.field2_txt.tabIndex = 2;form_mc.field3_txt.tabIndex = 3;function setDefaultText():Void {	if(form_mc.field1_txt.text == "") {		form_mc.field1_txt.text = form_mc.field1_txt.defaultText;	}	if(form_mc.field2_txt.text == "") {		form_mc.field2_txt.text = form_mc.field2_txt.defaultText;	}	if(form_mc.field3_txt.text == "") {		form_mc.field3_txt.text = form_mc.field3_txt.defaultText;	}}function setDefaultBgAlpha():Void {	Tweener.addTween(form_mc.field1Bg_mc, {_alpha:BG_ALPHA, time:TIME_OUT});	Tweener.addTween(form_mc.field2Bg_mc, {_alpha:BG_ALPHA, time:TIME_OUT});	Tweener.addTween(form_mc.field3Bg_mc, {_alpha:BG_ALPHA, time:TIME_OUT});}function setDefaultBgColor():Void {	Tweener.addTween(form_mc.field1Bg_mc, {_color:BG_COLOR, time:TIME_OUT});	Tweener.addTween(form_mc.field2Bg_mc, {_color:BG_COLOR, time:TIME_OUT});	Tweener.addTween(form_mc.field3Bg_mc, {_color:BG_COLOR, time:TIME_OUT});}function setDefaultBorderAlpha():Void {	Tweener.addTween(form_mc.field1Border_mc, {_alpha:BORDER_ALPHA, time:TIME_OUT});	Tweener.addTween(form_mc.field2Border_mc, {_alpha:BORDER_ALPHA, time:TIME_OUT});	Tweener.addTween(form_mc.field3Border_mc, {_alpha:BORDER_ALPHA, time:TIME_OUT});}function initContact():Void {	setDefaultBgColor();	setDefaultBorderAlpha();		form_mc.field1_txt.text = form_mc.field1_txt.defaultText;	form_mc.field2_txt.text = form_mc.field2_txt.defaultText;	form_mc.field3_txt.text = form_mc.field3_txt.defaultText;	display_txt.textBox.text = "";	Tweener.addTween(display_txt.textBox, {_color:_parent.BASIC_TEXT_COLOR, time:0});}initContact();function focus(n:Number):Void {	setDefaultText();	setDefaultBgAlpha();	setDefaultBgColor();	setDefaultBorderAlpha();		var s = eval("form_mc.field" + n + "_txt");	if(s.text == s.defaultText) {		s.text = "";	}		var bg = eval("form_mc.field" + n + "Bg_mc");	var border = eval("form_mc.field" + n + "Border_mc");		Tweener.addTween(bg, {_alpha:SELECTED_BG_ALPHA, time:0.7});	Tweener.addTween(bg, {_color:SELECTED_BG_COLOR, time:0.7});	Tweener.addTween(border, {_alpha:SELECTED_BORDER_ALPHA, time:0.7});}form_mc.field1_txt.onSetFocus = function() {	focus(1);};form_mc.field2_txt.onSetFocus = function() {	focus(2);};form_mc.field3_txt.onSetFocus = function() {	focus(3);};send_btn.onRelease = function() {	checkForm();};function validateEmail(address):Boolean {	// Check address length	if(address.length >= 7) {		// Check for an @ sign		if(address.indexOf("@") > 0) {			// Check for at least 2 characters following the @			if((address.indexOf("@") + 2)<address.lastIndexOf(".")) {				// Check for a domain name of at least 2 characters				if (address.lastIndexOf(".") < (address.length - 2)) {					// If all the above tests pass, the email address is in valid format					return true; 				}			}		}	}	return false;}function checkForm():Void {	n = form_mc.field1_txt.text;	e = form_mc.field2_txt.text;	m = form_mc.field3_txt.text;	if(validateEmail(e)) {		sendEmail(n, e, m);	}	else {		Selection.setFocus(form_mc.field2_txt);		Tweener.addTween(display_txt.textBox, {_color:_parent.BASIC_TEXT_COLOR, time:0});		display_txt.textBox.text = "Please enter a valid email address";	}}function sendEmail(n, e, m):Void {	session = "?nocache=" + random(999999);	contact_lv = new LoadVars();	contact_lv.name = n;	contact_lv.email = e;	contact_lv.message = m;	contact_lv.key = "email";	trace(n + " - " + e + " - " + m);	contact_lv.sendAndLoad(contact_php_file + session, contact_lv, "POST");	contact_lv.onLoad = function(success) {		if(!success) {			display_txt.textBox.text = "Error sending message. Please try again later";		} else {			initContact();			Tweener.addTween(display_txt.textBox, {_color:_parent.BASIC_TEXT_COLOR, time:0});			display_txt.textBox.text = "Message sent. Thanks!";		}				}}