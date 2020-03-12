dynamic class gs.dataTransfer.XMLParser
{
    static var CLASS_REF = gs.dataTransfer.XMLParser;
    var _onComplete_func;
    var _results_obj;
    var _url_str;
    var _xml;
    var parse;

    function XMLParser()
    {
        this.parse = this.initLoad;
        if (gs.dataTransfer.XMLParser._parsers_array == undefined) 
        {
            gs.dataTransfer.XMLParser._parsers_array = [];
        }
        gs.dataTransfer.XMLParser._parsers_array.push(this);
    }

    static function load(url_str, onComplete_func, results_obj)
    {
        var __reg1 = new gs.dataTransfer.XMLParser();
        __reg1.initLoad(url_str, onComplete_func, results_obj);
        return __reg1;
    }

    static function sendAndLoad(toSend_obj, url_str, onComplete_func, results_obj)
    {
        var __reg1 = new gs.dataTransfer.XMLParser();
        __reg1.initSendAndLoad(toSend_obj, url_str, onComplete_func, results_obj);
        return __reg1;
    }

    function initLoad(url_str, onComplete_func, results_obj)
    {
        if (results_obj == undefined) 
        {
            results_obj = {};
        }
        this._results_obj = results_obj;
        this._url_str = url_str;
        this._onComplete_func = onComplete_func;
        this._xml = new XML();
        this._xml.ignoreWhite = true;
        this._xml.onLoad = mx.utils.Delegate.create(this, this.parseLoadedXML);
        this._xml.load(this._url_str);
    }

    function initSendAndLoad(toSend_obj, url_str, onComplete_func, results_obj)
    {
        if (results_obj == undefined) 
        {
            results_obj = {};
        }
        this._results_obj = results_obj;
        this._url_str = url_str;
        this._onComplete_func = onComplete_func;
        if (toSend_obj instanceof XML) 
        {
            __reg2 = toSend_obj;
        }
        else 
        {
            var __reg2 = gs.dataTransfer.XMLParser.objectToXML(toSend_obj);
        }
        this._xml = new XML();
        this._xml.ignoreWhite = true;
        this._xml.onLoad = mx.utils.Delegate.create(this, this.parseLoadedXML);
        __reg2.sendAndLoad(this._url_str, this._xml);
    }

    function searchAndReplace(holder, searchfor, replacement)
    {
        var __reg1 = holder.split(searchfor);
        holder = __reg1.join(replacement);
        return holder;
    }

    function parseLoadedXML(success_boolean)
    {
        if (success_boolean == false) 
        {
            trace("XML FAILED TO LOAD! (" + this._url_str + ")");
            this._onComplete_func(false);
            return undefined;
        }
        var __reg8 = this._xml;
        var __reg2 = __reg8.firstChild.firstChild;
        var __reg7 = __reg8.firstChild.lastChild;
        __reg8.firstChild.obj = this._results_obj;
        while (__reg2 != undefined) 
        {
            if (__reg2.nodeName == null && __reg2.nodeType == 3) 
            {
                __reg2.parentNode.obj.value = this.searchAndReplace(__reg2.nodeValue, "\r\n", "");
            }
            else 
            {
                var __reg4 = {};
                for (var __reg6 in __reg2.attributes) 
                {
                    __reg4[__reg6] = __reg2.attributes[__reg6];
                }
                var __reg5 = __reg2.parentNode.obj;
                if (__reg5[__reg2.nodeName] == undefined) 
                {
                    __reg5[__reg2.nodeName] = [];
                }
                __reg2.obj = __reg4;
                __reg5[__reg2.nodeName].push(__reg4);
            }
            if (__reg2.childNodes.length > 0) 
            {
                __reg2 = __reg2.childNodes[0];
            }
            else 
            {
                var __reg3 = __reg2;
                while (__reg3.nextSibling == undefined && __reg3.parentNode != undefined) 
                {
                    __reg3 = __reg3.parentNode;
                }
                __reg2 = __reg3.nextSibling;
                if (__reg3 == __reg7) 
                {
                    __reg2 = undefined;
                }
            }
        }
        this._onComplete_func(true, this._results_obj, __reg8);
    }

    static function objectToXML(o, rootNodeName_str)
    {
        if (rootNodeName_str == undefined) 
        {
            rootNodeName_str = "XML";
        }
        var __reg7 = new XML();
        var __reg4 = __reg7.createElement(rootNodeName_str);
        var __reg5 = [];
        var __reg1 = undefined;
        for (var __reg3 in o) 
        {
            __reg5.push(__reg3);
        }
        __reg33 = __reg5.length - 1;
        while (__reg33 >= 0) 
        {
            __reg1 = __reg5[__reg33];
            if (typeof o[__reg1] == "object" && o[__reg1].length > 0) 
            {
                gs.dataTransfer.XMLParser.arrayToNodes(o[__reg1], __reg4, __reg7, __reg1);
            }
            else 
            {
                if (__reg1 == "value") 
                {
                    var __reg6 = __reg7.createTextNode(o.value);
                    __reg4.appendChild(__reg6);
                }
                else 
                {
                    __reg4.attributes[__reg1] = o[__reg1];
                }
            }
            --__reg33;
        }
        __reg7.appendChild(__reg4);
        return __reg7;
    }

    static function arrayToNodes(ar, parentNode, xml, nodeName_str)
    {
        var __reg9 = [];
        var __reg5 = undefined;
        var __reg1 = undefined;
        var __reg4 = undefined;
        var __reg2 = undefined;
        var __reg8 = ar.length - 1;
        while (__reg8 >= 0) 
        {
            __reg4 = xml.createElement(nodeName_str);
            __reg2 = ar[__reg8];
            __reg5 = [];
            for (var __reg3 in __reg2) 
            {
                __reg5.push(__reg3);
            }
            __reg33 = __reg5.length - 1;
            while (__reg33 >= 0) 
            {
                __reg1 = __reg5[__reg33];
                if (typeof __reg2[__reg1] == "object" && __reg2[__reg1].length > 0) 
                {
                    gs.dataTransfer.XMLParser.arrayToNodes(__reg2[__reg1], __reg4, xml, __reg1);
                }
                else 
                {
                    if (__reg1 == "value") 
                    {
                        var __reg6 = xml.createTextNode(__reg2.value);
                        __reg4.appendChild(__reg6);
                    }
                    else 
                    {
                        __reg4.attributes[__reg1] = __reg2[__reg1];
                    }
                }
                --__reg33;
            }
            __reg9.push(__reg4);
            --__reg8;
        }
        __reg8 = __reg9.length - 1;
        for (;;) 
        {
            if (__reg8 < 0) 
            {
                return;
            }
            parentNode.appendChild(__reg9[__reg8]);
            --__reg8;
        }
    }

    function destroy()
    {
        delete this._xml;
        var __reg2 = 0;
        while (__reg2 < gs.dataTransfer.XMLParser._parsers_array.length) 
        {
            if (this == gs.dataTransfer.XMLParser._parsers_array[__reg2]) 
            {
                gs.dataTransfer.XMLParser._parsers_array.splice(__reg2, 1);
            }
            ++__reg2;
        }
        gs.dataTransfer.XMLParser.destroyInstance(this);
    }

    static function destroyInstance(i)
    {
        false;
    }

    static function get active_boolean()
    {
        if (gs.dataTransfer.XMLParser._parsers_array.length > 0) 
        {
            return true;
            return;
        }
        return false;
    }

}
