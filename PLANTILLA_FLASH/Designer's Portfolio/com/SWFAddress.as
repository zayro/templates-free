/**
 * SWFAddress 2.0: Deep linking for Flash and Ajax - http://www.asual.com/swfaddress/
 * 
 * SWFAddress is (c) 2006-2007 Rostislav Hristov and is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */

_global.SWFAddress = function(){

    this._init = false;
    this._strict = true;
    this._value = '';
    this._current;
    this._availability = flash.external.ExternalInterface.available;

    this._check = function() {
        if (typeof SWFAddress.onInit == 'function' && !this._init) {
            if (SWFAddress.onInit) SWFAddress.onInit();
        }
        if (typeof SWFAddress.onChange == 'function') {
            clearInterval(this._interval);
            SWFAddress._setValue(this._getValue());
        }
    }
    
    this._strictCheck = function(value, force) {
        if (this._strict) {
            if (force) {
                if (value.substr(0, 1) != '/') value = '/' + value;
                var qi = value.indexOf('?');
                if (qi != -1) {
                    value = value.substr(qi - 1, 1) != '/' ? value.substr(0, qi) + '/' + value.substr(qi) : value;
                } else {
                    if (value.substr(value.length - 1) != '/') value += '/';
                }
            } else {
                if (value == '') value = '/';
            }
        }
        return value;
    }

    this._getValue = function() {
        var value, id = 'null';
        if (this._availability) {
            value = String(flash.external.ExternalInterface.call('SWFAddress.getValue'));
            id = String(flash.external.ExternalInterface.call('SWFAddress.getId'));
        }
        if (id == 'undefined' || id == 'null' || !this._availability) {
            value = SWFAddress._value;        
        } else {
            if (value == 'undefined' || value == 'null') value = '';
        }
        return SWFAddress._strictCheck(value, false);
    }
    
    this._setValue = function(value) {
        if (value == 'undefined' || value == 'null') value = '';
        if (SWFAddress._value == value && SWFAddress._init) return;
        SWFAddress._value = value;
        SWFAddress._init = true;
        if (SWFAddress.onChange) SWFAddress.onChange();
    }
    
    if (this._availability) {
        flash.external.ExternalInterface.addCallback('getSWFAddressValue', this, 
            function(){return SWFAddress.getValue();});
        flash.external.ExternalInterface.addCallback('setSWFAddressValue', this, 
            function(value){SWFAddress._setValue(value);});
    }
    
    if (typeof _level0.$swfaddress != 'undefined') SWFAddress.setValue(_level0.$swfaddress);

    this._interval = setInterval(this, '_check', 10);
}
_global.SWFAddress = new SWFAddress();

SWFAddress.toString = function() {
    return '[class SWFAddress]';
}

SWFAddress.back = function() {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.back');
}

SWFAddress.forward = function() {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.forward');
}

SWFAddress.go = function(delta) {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.go', delta);
}

SWFAddress.href = function(url, target) {
    if (this._availability) {
        flash.external.ExternalInterface.call('SWFAddress.href', url, target);
    } else {
        getURL(url, target);
    }
}

SWFAddress.popup = function(url, name, options, handler) {
    if (this._availability) {
        flash.external.ExternalInterface.call('SWFAddress.popup', url, name, options, handler);
    } else {
        getURL('javascript:window.open("' + url + '","' + name + '","' + options + '");');
    }
}

SWFAddress.getStrict = function() {
    return (this._availability) ? 
        flash.external.ExternalInterface.call('SWFAddress.getStrict') : this._strict;
}

SWFAddress.setStrict = function(strict) {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.setStrict', strict);
    SWFAddress._strict = strict;
}

SWFAddress.getHistory = function() {
    return (this._availability) ? 
        flash.external.ExternalInterface.call('SWFAddress.getHistory') : false;
}

SWFAddress.setHistory = function(history) {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.setHistory', history);
}

SWFAddress.getTracker = function() {
    return (this._availability) ? 
        flash.external.ExternalInterface.call('SWFAddress.getTracker') : '';
}

SWFAddress.setTracker = function(tracker) {
    if (this._availability)
        flash.external.ExternalInterface.call('SWFAddress.setTracker', tracker);
}
        
SWFAddress.getTitle = function() {
    var title = (this._availability) ? 
        String(flash.external.ExternalInterface.call('SWFAddress.getTitle')) : '';
    if (title == 'undefined' || title == 'null') title = '';
    return title;
}

SWFAddress.setTitle = function(title) {
    if (this._availability) flash.external.ExternalInterface.call('SWFAddress.setTitle', title);
}

SWFAddress.getStatus = function() {
    var status = (this._availability) ? 
        String(flash.external.ExternalInterface.call('SWFAddress.getStatus')) : '';
    if (status == 'undefined' || status == 'null') status = '';
    return status;
}

SWFAddress.setStatus = function(status) {
    if (this._availability) flash.external.ExternalInterface.call('SWFAddress.setStatus', status);
}

SWFAddress.resetStatus = function() {
    if (this._availability) flash.external.ExternalInterface.call('SWFAddress.resetStatus');
}

SWFAddress.getValue = function() {
    if (this._init)
        return SWFAddress._strictCheck(SWFAddress._value, false);
    else
        return SWFAddress._strictCheck(this._availability ? flash.external.ExternalInterface.call('SWFAddress.getValue') : '', false);
}

SWFAddress.setValue = function(value) {
    if (value == 'undefined' || value == 'null') value = '';
    value = SWFAddress._strictCheck(value, true);
    if (SWFAddress._value == value) return;
    SWFAddress._value = value;
    if (this._availability && SWFAddress._init) flash.external.ExternalInterface.call('SWFAddress.setValue', value);
    if (SWFAddress.onChange) SWFAddress.onChange();
}

SWFAddress.getPath = function() {
    var value = SWFAddress.getValue();
    if (value.indexOf('?') != -1) {
        return value.split('?')[0];
    } else {
        return value;   
    }
}

SWFAddress.getQueryString = function() {
    var value = SWFAddress.getValue();
    var index = value.indexOf('?');
    if (index != -1 && index < value.length) {
        return value.substr(index + 1);
    }
    return '';
}

SWFAddress.getParameter = function(param) {
    var value = SWFAddress.getValue();
    var index = value.indexOf('?');
    if (index != -1) {
        value = value.substr(index + 1);
        var params = value.split('&');
        var p, i = params.length;
        while(i--) {
            p = params[i].split('=');
            if (p[0] == param) {
                return p[1];
            }
        }
    }
    return '';
}

SWFAddress.getParameterNames = function() {
    var value = SWFAddress.getValue();
    var index = value.indexOf('?');
    var names = new Array();
    if (index != -1) {
        value = value.substr(index + 1);
        if (value != '' && value.indexOf('=') != -1) {            
            var params = value.split('&');
            var i = 0;
            while(i < params.length) {
                names.push(params[i].split('=')[0]);
                i++;
            }
        }
    }
    return names;
}