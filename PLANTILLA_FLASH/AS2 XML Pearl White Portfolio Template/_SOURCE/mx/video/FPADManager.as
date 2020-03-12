class mx.video.FPADManager
{
    var _owner, _uriParam, _parseResults, _url, xml, xmlOnLoad, rtmpURL;
    function FPADManager(owner)
    {
        _owner = owner;
    } // End of the function
    function connectXML(urlPrefix, uriParam, urlSuffix, uriParamParseResults)
    {
        _uriParam = uriParam;
        _parseResults = uriParamParseResults;
        _url = urlPrefix + "uri=" + _parseResults.protocol;
        if (_parseResults.serverName != undefined)
        {
            _url = _url + ("/" + _parseResults.serverName);
        } // end if
        if (_parseResults.portNumber != undefined)
        {
            _url = _url + (":" + _parseResults.portNumber);
        } // end if
        if (_parseResults.wrappedURL != undefined)
        {
            _url = _url + ("/?" + _parseResults.wrappedURL);
        } // end if
        _url = _url + ("/" + _parseResults.appName);
        _url = _url + urlSuffix;
        xml = new XML();
        xml.onLoad = mx.utils.Delegate.create(this, xmlOnLoad);
        xml.load(_url);
        return (false);
    } // End of the function
    null[] = (Error)() == null ? (null, throw , function (success)
    {
        try
        {
            if (!success)
            {
                _owner.helperDone(this, false);
            }
            else
            {
                var _loc5 = xml.firstChild;
                var _loc8 = false;
                while (_loc5 != null)
                {
                    if (_loc5.nodeType == mx.video.FPADManager.ELEMENT_NODE)
                    {
                        _loc8 = true;
                        if (_loc5.nodeName.toLowerCase() == "fpad")
                        {
                            break;
                        } // end if
                    } // end if
                    _loc5 = _loc5.nextSibling;
                } // end while
                if (!_loc8)
                {
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "URL: \"" + _url + "\" No root node found; if url is for an flv it must have .flv extension and take no parameters");
                }
                else if (_loc5 == null)
                {
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "URL: \"" + _url + "\" Root node not fpad");
                } // end else if
                var _loc7;
                for (var _loc6 = 0; _loc6 < _loc5.childNodes.length; ++_loc6)
                {
                    var _loc3 = _loc5.childNodes[_loc6];
                    if (_loc3.nodeType != mx.video.FPADManager.ELEMENT_NODE)
                    {
                        continue;
                    } // end if
                    if (_loc3.nodeName.toLowerCase() == "proxy")
                    {
                        for (var _loc2 = 0; _loc2 < _loc3.childNodes.length; ++_loc2)
                        {
                            var _loc4 = _loc3.childNodes[_loc2];
                            if (_loc4.nodeType == mx.video.FPADManager.TEXT_NODE)
                            {
                                _loc7 = this.trim(_loc4.nodeValue);
                                break;
                            } // end if
                        } // end of for
                        break;
                    } // end if
                } // end of for
                if (_loc7 == undefined || _loc7 == "")
                {
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "URL: \"" + _url + "\" fpad xml requires proxy tag.");
                } // end if
                rtmpURL = _parseResults.protocol + "/" + _loc7 + "/?" + _uriParam;
                _owner.helperDone(this, true);
            } // end else if
        } // End of try
        catch ()
        {
        } // End of catch
    }) : (var err = (Error)(), _owner.helperDone(this, false), throw err, "xmlOnLoad");
    function trim(str)
    {
        for (var _loc2 = 0; _loc2 < str.length; ++_loc2)
        {
            var _loc1 = str.charAt(_loc2);
            if (_loc1 != " " && _loc1 != "\t" && _loc1 != "\r" && _loc1 != "\n")
            {
                break;
            } // end if
        } // end of for
        if (_loc2 >= str.length)
        {
            return ("");
        } // end if
        for (var _loc4 = str.length - 1; _loc4 > _loc2; --_loc4)
        {
            _loc1 = str.charAt(_loc4);
            if (_loc1 != " " && _loc1 != "\t" && _loc1 != "\r" && _loc1 != "\n")
            {
                break;
            } // end if
        } // end of for
        return (str.slice(_loc2, _loc4 + 1));
    } // End of the function
    static var version = "1.0.1.10";
    static var shortVersion = "1.0.1";
    static var ELEMENT_NODE = 1;
    static var TEXT_NODE = 3;
} // End of Class
