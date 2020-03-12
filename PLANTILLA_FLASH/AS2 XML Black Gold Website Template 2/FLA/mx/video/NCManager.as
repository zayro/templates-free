class mx.video.NCManager implements mx.video.INCManager
{
    var _timeoutIntervalId, _tryNCIntervalId, _timeout, _nc, _ncConnected, _isRTMP, _serverName, _wrappedURL, _portNumber, _appName, _contentPath, _streamName, _streamLength, _streamWidth, _streamHeight, _streams, _autoSenseBW, fpadZone, _payload, _connTypeCounter, _bitrate, _owner, _protocol, _smilMgr, mc, _ncUri, _fpadMgr, fallbackServerName, _tryNC;
    function NCManager()
    {
        this.initNCInfo();
        this.initOtherInfo();
        _timeoutIntervalId = 0;
        _tryNCIntervalId = 0;
        _timeout = DEFAULT_TIMEOUT;
        _nc = undefined;
        _ncConnected = false;
    } // End of the function
    function initNCInfo()
    {
        _isRTMP = undefined;
        _serverName = undefined;
        _wrappedURL = undefined;
        _portNumber = undefined;
        _appName = undefined;
    } // End of the function
    function initOtherInfo()
    {
        _contentPath = undefined;
        _streamName = undefined;
        _streamLength = undefined;
        _streamWidth = undefined;
        _streamHeight = undefined;
        _streams = undefined;
        _autoSenseBW = false;
        fpadZone = undefined;
        _payload = 0;
        _connTypeCounter = 0;
        this.cleanConns();
    } // End of the function
    function getTimeout()
    {
        return (_timeout);
    } // End of the function
    function setTimeout(t)
    {
        _timeout = t;
        if (_timeoutIntervalId != 0)
        {
            clearInterval(_timeoutIntervalId);
            _timeoutIntervalId = setInterval(this, "_onFCSConnectTimeOut", _timeout);
        } // end if
    } // End of the function
    function getBitrate()
    {
        return (_bitrate);
    } // End of the function
    function setBitrate(b)
    {
        if (_isRTMP == undefined || !_isRTMP)
        {
            _bitrate = b;
        } // end if
    } // End of the function
    function getVideoPlayer()
    {
        return (_owner);
    } // End of the function
    function setVideoPlayer(v)
    {
        _owner = v;
    } // End of the function
    function getNetConnection()
    {
        return (_nc);
    } // End of the function
    function getStreamName()
    {
        return (_streamName);
    } // End of the function
    function isRTMP()
    {
        return (_isRTMP);
    } // End of the function
    function getStreamLength()
    {
        return (_streamLength);
    } // End of the function
    function getStreamWidth()
    {
        return (_streamWidth);
    } // End of the function
    function getStreamHeight()
    {
        return (_streamHeight);
    } // End of the function
    function connectToURL(url)
    {
        this.initOtherInfo();
        _contentPath = url;
        if (_contentPath == null || _contentPath == undefined || _contentPath == "")
        {
            throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH);
        } // end if
        var _loc2 = this.parseURL(_contentPath);
        if (_loc2.streamName == undefined || _loc2.streamName == "")
        {
            throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH, url);
        } // end if
        if (_loc2.isRTMP)
        {
            var _loc3 = this.canReuseOldConnection(_loc2);
            _isRTMP = true;
            _protocol = _loc2.protocol;
            _streamName = _loc2.streamName;
            _serverName = _loc2.serverName;
            _wrappedURL = _loc2.wrappedURL;
            _portNumber = _loc2.portNumber;
            _appName = _loc2.appName;
            if (_appName == undefined || _appName == "" || _streamName == undefined || _streamName == "")
            {
                throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH, url);
            } // end if
            _autoSenseBW = _streamName.indexOf(",") >= 0;
            return (_loc3 || this.connectRTMP());
        }
        else
        {
            if (_loc2.streamName.indexOf("?") < 0 && _loc2.streamName.slice(-4).toLowerCase() == ".flv")
            {
                _loc3 = this.canReuseOldConnection(_loc2);
                _isRTMP = false;
                _streamName = _loc2.streamName;
                return (_loc3 || this.connectHTTP());
            } // end if
            if (_loc2.streamName.indexOf("/fms/fpad") >= 0)
            {
                try
                {
                    return (this.connectFPAD(_loc2.streamName));
                } // End of try
                catch ()
                {
                } // End of catch
            } // end if
            _smilMgr = new mx.video.SMILManager(this);
            return (_smilMgr.connectXML(_loc2.streamName));
        } // end else if
    } // End of the function
    function connectAgain()
    {
        var _loc2 = _appName.indexOf("/");
        if (_loc2 < 0)
        {
            _loc2 = _streamName.indexOf("/");
            if (_loc2 >= 0)
            {
                _appName = _appName + "/";
                _appName = _appName + _streamName.slice(0, _loc2);
                _streamName = _streamName.slice(_loc2 + 1);
            } // end if
            return (false);
        } // end if
        var _loc3 = _appName.slice(_loc2 + 1);
        _loc3 = _loc3 + "/";
        _loc3 = _loc3 + _streamName;
        _streamName = _loc3;
        _appName = _appName.slice(0, _loc2);
        this.close();
        _payload = 0;
        _connTypeCounter = 0;
        this.cleanConns();
        this.connectRTMP();
        return (true);
    } // End of the function
    function reconnect()
    {
        if (!_isRTMP)
        {
            throw new Error("Cannot call reconnect on an http connection");
        } // end if
        _nc.onStatus = function (info)
        {
            mc.reconnectOnStatus(this, info);
        };
        _nc.onBWDone = function ()
        {
            mc.onReconnected();
        };
        _nc.connect(_ncUri, false);
    } // End of the function
    function onReconnected()
    {
        delete _nc.onStatus;
        delete _nc.onBWDone;
        _ncConnected = true;
        _owner.ncReconnected();
    } // End of the function
    function close()
    {
        if (_nc)
        {
            _nc.close();
            _ncConnected = false;
        } // end if
    } // End of the function
    function helperDone(helper, success)
    {
        if (!success)
        {
            _nc = undefined;
            _ncConnected = false;
            _owner.ncConnected();
            _smilMgr = undefined;
            _fpadMgr = undefined;
            return;
        } // end if
        var _loc2;
        var _loc4;
        if (helper == _fpadMgr)
        {
            _loc4 = _fpadMgr.rtmpURL;
            _fpadMgr = undefined;
            _loc2 = this.parseURL(_loc4);
            _isRTMP = _loc2.isRTMP;
            _protocol = _loc2.protocol;
            _serverName = _loc2.serverName;
            _portNumber = _loc2.portNumber;
            _wrappedURL = _loc2.wrappedURL;
            _appName = _loc2.appName;
            _streamName = _loc2.streamName;
            var _loc5 = fpadZone;
            fpadZone = -1;
            this.connectRTMP();
            fpadZone = _loc5;
            return;
        } // end if
        if (helper != _smilMgr)
        {
            return;
        } // end if
        _streamWidth = _smilMgr.width;
        _streamHeight = _smilMgr.height;
        _loc4 = _smilMgr.baseURLAttr[0];
        if (_loc4 != undefined && _loc4 != "")
        {
            if (_loc4.charAt(_loc4.length - 1) != "/")
            {
                _loc4 = _loc4 + "/";
            } // end if
            _loc2 = this.parseURL(_loc4);
            _isRTMP = _loc2.isRTMP;
            _streamName = _loc2.streamName;
            if (_isRTMP)
            {
                _protocol = _loc2.protocol;
                _serverName = _loc2.serverName;
                _portNumber = _loc2.portNumber;
                _wrappedURL = _loc2.wrappedURL;
                _appName = _loc2.appName;
                if (_appName == undefined || _appName == "")
                {
                    _smilMgr = undefined;
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "Base RTMP URL must include application name: " + _loc4);
                } // end if
                if (_smilMgr.baseURLAttr.length > 1)
                {
                    _loc2 = this.parseURL(_smilMgr.baseURLAttr[1]);
                    if (_loc2.serverName != undefined)
                    {
                        fallbackServerName = _loc2.serverName;
                    } // end if
                } // end if
            } // end if
        } // end if
        _streams = _smilMgr.videoTags;
        _smilMgr = undefined;
        for (var _loc3 = 0; _loc3 < _streams.length; ++_loc3)
        {
            _loc4 = _streams[_loc3].src;
            _loc2 = this.parseURL(_loc4);
            if (_isRTMP == undefined)
            {
                _isRTMP = _loc2.isRTMP;
                if (_isRTMP)
                {
                    _protocol = _loc2.protocol;
                    if (_streams.length > 1)
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "Cannot switch between multiple absolute RTMP URLs, must use meta tag base attribute.");
                    } // end if
                    _serverName = _loc2.serverName;
                    _portNumber = _loc2.portNumber;
                    _wrappedURL = _loc2.wrappedURL;
                    _appName = _loc2.appName;
                    if (_appName == undefined || _appName == "")
                    {
                        throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "Base RTMP URL must include application name: " + _loc4);
                    } // end if
                }
                else if (_loc2.streamName.indexOf("/fms/fpad") >= 0 && _streams.length > 1)
                {
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "Cannot switch between multiple absolute fpad URLs, must use meta tag base attribute.");
                } // end else if
            }
            else if (_streamName != undefined && _streamName != "" && !_loc2.isRelative && _streams.length > 1)
            {
                throw new mx.video.VideoError(mx.video.VideoError.INVALID_XML, "When using meta tag base attribute, cannot use absolute URLs for video or ref tag src attributes.");
            } // end else if
            _streams[_loc3].parseResults = _loc2;
        } // end of for
        _autoSenseBW = _streams.length > 1;
        if (!_autoSenseBW)
        {
            if (_streamName != undefined)
            {
                _streamName = _streamName + _streams[0].parseResults.streamName;
            }
            else
            {
                _streamName = _streams[0].parseResults.streamName;
            } // end else if
            _streamLength = _streams[0].dur;
        } // end if
        if (_isRTMP)
        {
            this.connectRTMP();
        }
        else if (_streamName != undefined && _streamName.indexOf("/fms/fpad") >= 0)
        {
            this.connectFPAD(_streamName);
        }
        else
        {
            if (_autoSenseBW)
            {
                this.bitrateMatch();
            } // end if
            this.connectHTTP();
            _owner.ncConnected();
        } // end else if
    } // End of the function
    function bitrateMatch()
    {
        var _loc3;
        var _loc4 = _bitrate;
        if (isNaN(_loc4))
        {
            _loc4 = 0;
        } // end if
        for (var _loc2 = 0; _loc2 < _streams.length; ++_loc2)
        {
            if (isNaN(_streams[_loc2].bitrate) || _loc4 >= _streams[_loc2].bitrate)
            {
                _loc3 = _loc2;
                break;
            } // end if
        } // end of for
        if (isNaN(_loc3))
        {
            throw new mx.video.VideoError(mx.video.VideoError.NO_BITRATE_MATCH);
        } // end if
        if (_streamName != undefined)
        {
            _streamName = _streamName + _streams[_loc3].src;
        }
        else
        {
            _streamName = _streams[_loc3].src;
        } // end else if
        _streamLength = _streams[_loc3].dur;
    } // End of the function
    function parseURL(url)
    {
        var _loc2 = new Object();
        var _loc3 = 0;
        var _loc4 = url.indexOf(":/", _loc3);
        if (_loc4 >= 0)
        {
            _loc4 = _loc4 + 2;
            _loc2.protocol = url.slice(_loc3, _loc4);
            _loc2.isRelative = false;
        }
        else
        {
            _loc2.isRelative = true;
        } // end else if
        if (_loc2.protocol != undefined && (_loc2.protocol == "rtmp:/" || _loc2.protocol == "rtmpt:/" || _loc2.protocol == "rtmps:/"))
        {
            _loc2.isRTMP = true;
            _loc3 = _loc4;
            if (url.charAt(_loc3) == "/")
            {
                ++_loc3;
                var _loc7 = url.indexOf(":", _loc3);
                var _loc8 = url.indexOf("/", _loc3);
                if (_loc8 < 0)
                {
                    if (_loc7 < 0)
                    {
                        _loc2.serverName = url.slice(_loc3);
                    }
                    else
                    {
                        _loc4 = _loc7;
                        _loc2.portNumber = url.slice(_loc3, _loc4);
                        _loc3 = _loc4 + 1;
                        _loc2.serverName = url.slice(_loc3);
                    } // end else if
                    return (_loc2);
                } // end if
                if (_loc7 >= 0 && _loc7 < _loc8)
                {
                    _loc4 = _loc7;
                    _loc2.serverName = url.slice(_loc3, _loc4);
                    _loc3 = _loc4 + 1;
                    _loc4 = _loc8;
                    _loc2.portNumber = url.slice(_loc3, _loc4);
                }
                else
                {
                    _loc4 = _loc8;
                    _loc2.serverName = url.slice(_loc3, _loc4);
                } // end else if
                _loc3 = _loc4 + 1;
            } // end if
            if (url.charAt(_loc3) == "?")
            {
                var _loc9 = url.slice(_loc3 + 1);
                var _loc6 = this.parseURL(_loc9);
                if (_loc6.protocol == undefined || !_loc6.isRTMP)
                {
                    throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH, url);
                } // end if
                _loc2.wrappedURL = "?";
                _loc2.wrappedURL = _loc2.wrappedURL + _loc6.protocol;
                if (_loc6.serverName != undefined)
                {
                    _loc2.wrappedURL = _loc2.wrappedURL + "/";
                    _loc2.wrappedURL = _loc2.wrappedURL + _loc6.serverName;
                } // end if
                if (_loc6.wrappedURL != undefined)
                {
                    _loc2.wrappedURL = _loc2.wrappedURL + "/?";
                    _loc2.wrappedURL = _loc2.wrappedURL + _loc6.wrappedURL;
                } // end if
                _loc2.appName = _loc6.appName;
                _loc2.streamName = _loc6.streamName;
                return (_loc2);
            } // end if
            _loc4 = url.indexOf("/", _loc3);
            if (_loc4 < 0)
            {
                _loc2.appName = url.slice(_loc3);
                return (_loc2);
            } // end if
            _loc2.appName = url.slice(_loc3, _loc4);
            _loc3 = _loc4 + 1;
            _loc4 = url.indexOf("/", _loc3);
            if (_loc4 < 0)
            {
                _loc2.streamName = url.slice(_loc3);
                if (_loc2.streamName.slice(-4).toLowerCase() == ".flv")
                {
                    _loc2.streamName = _loc2.streamName.slice(0, -4);
                } // end if
                return (_loc2);
            } // end if
            _loc2.appName = _loc2.appName + "/";
            _loc2.appName = _loc2.appName + url.slice(_loc3, _loc4);
            _loc3 = _loc4 + 1;
            _loc2.streamName = url.slice(_loc3);
            if (_loc2.streamName.slice(-4).toLowerCase() == ".flv")
            {
                _loc2.streamName = _loc2.streamName.slice(0, -4);
            } // end if
        }
        else
        {
            _loc2.isRTMP = false;
            _loc2.streamName = url;
        } // end else if
        return (_loc2);
    } // End of the function
    function canReuseOldConnection(parseResults)
    {
        if (_nc == undefined || _nc == null || !_ncConnected)
        {
            return (false);
        } // end if
        if (!parseResults.isRTMP)
        {
            if (!_isRTMP)
            {
                return (true);
            } // end if
            _owner.close();
            _nc = undefined;
            _ncConnected = false;
            this.initNCInfo();
            return (false);
        } // end if
        if (_isRTMP)
        {
            if (parseResults.serverName == _serverName && parseResults.appName == _appName && parseResults.protocol == _protocol && parseResults.portNumber == _portNumber && parseResults.wrappedURL == _wrappedURL)
            {
                return (true);
            } // end if
            _owner.close();
            _nc = undefined;
            _ncConnected = false;
        } // end if
        this.initNCInfo();
        return (false);
    } // End of the function
    function connectHTTP()
    {
        _nc = new NetConnection();
        _nc.connect(null);
        _ncConnected = true;
        return (true);
    } // End of the function
    function connectRTMP()
    {
        clearInterval(_timeoutIntervalId);
        _timeoutIntervalId = setInterval(this, "_onFCSConnectTimeOut", _timeout);
        _tryNC = new Array();
        for (var _loc2 = 0; _loc2 < mx.video.NCManager.RTMP_CONN.length; ++_loc2)
        {
            _tryNC[_loc2] = new NetConnection();
            if (fpadZone != undefined && fpadZone != null)
            {
                _tryNC[_loc2].fpadZone = fpadZone;
            } // end if
            _tryNC[_loc2].mc = this;
            _tryNC[_loc2].pending = false;
            _tryNC[_loc2].connIndex = _loc2;
            _tryNC[_loc2].onBWDone = function (p_bw)
            {
                mc.onConnected(this, p_bw);
            };
            _tryNC[_loc2].onBWCheck = function ()
            {
                return (++mc._payload);
            };
            _tryNC[_loc2].onStatus = function (info)
            {
                mc.connectOnStatus(this, info);
            };
        } // end of for
        this.nextConnect();
        return (false);
    } // End of the function
    function connectFPAD(url)
    {
        var _loc7;
        var _loc5;
        var _loc6;
        for (var _loc2 = url.indexOf("?"); _loc2 >= 0; _loc2 = _loc4)
        {
            ++_loc2;
            var _loc4 = url.indexOf("&", _loc2);
            if (url.substr(_loc2, 4).toLowerCase() == "uri=")
            {
                _loc7 = url.slice(0, _loc2);
                _loc2 = _loc2 + 4;
                if (_loc4 >= 0)
                {
                    _loc5 = url.slice(_loc2, _loc4);
                    _loc6 = url.slice(_loc4);
                }
                else
                {
                    _loc5 = url.slice(_loc2);
                    _loc6 = "";
                } // end else if
                break;
                continue;
            } // end if
        } // end of for
        if (_loc2 < 0)
        {
            throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH, "fpad url must include uri parameter: " + url);
        } // end if
        var _loc8 = this.parseURL(_loc5);
        if (!_loc8.isRTMP)
        {
            throw new mx.video.VideoError(mx.video.VideoError.INVALID_CONTENT_PATH, "fpad url uri parameter must be rtmp url: " + url);
        } // end if
        _fpadMgr = new mx.video.FPADManager(this);
        return (_fpadMgr.connectXML(_loc7, _loc5, _loc6, _loc8));
    } // End of the function
    function nextConnect()
    {
        clearInterval(_tryNCIntervalId);
        _tryNCIntervalId = 0;
        var _loc4;
        var _loc3;
        if (_connTypeCounter == 0)
        {
            _loc4 = _protocol;
            if (_portNumber != undefined)
            {
                _loc3 = _portNumber;
            }
            else
            {
                for (var _loc2 = 0; _loc2 < mx.video.NCManager.RTMP_CONN.length; ++_loc2)
                {
                    if (_loc4 == mx.video.NCManager.RTMP_CONN[_loc2].protocol)
                    {
                        _loc3 = mx.video.NCManager.RTMP_CONN[_loc2].port;
                        break;
                    } // end if
                } // end of for
            } // end else if
        }
        else
        {
            _loc4 = mx.video.NCManager.RTMP_CONN[_connTypeCounter].protocol;
            _loc3 = mx.video.NCManager.RTMP_CONN[_connTypeCounter].port;
        } // end else if
        var _loc5 = _loc4 + (_serverName == undefined ? ("") : ("/" + _serverName + ":" + _loc3 + "/")) + (_wrappedURL == undefined ? ("") : (_wrappedURL + "/")) + _appName;
        _tryNC[_connTypeCounter].pending = true;
        _tryNC[_connTypeCounter].connect(_loc5, _autoSenseBW);
        if (_connTypeCounter < mx.video.NCManager.RTMP_CONN.length - 1)
        {
            ++_connTypeCounter;
            _tryNCIntervalId = setInterval(this, "nextConnect", 1500);
        } // end if
    } // End of the function
    function cleanConns()
    {
        clearInterval(_tryNCIntervalId);
        _tryNCIntervalId = 0;
        if (_tryNC != undefined)
        {
            for (var _loc2 = 0; _loc2 < _tryNC.length; ++_loc2)
            {
                if (_tryNC[_loc2] != undefined)
                {
                    delete _tryNC[_loc2].onStatus;
                    if (_tryNC[_loc2].pending)
                    {
                        _tryNC[_loc2].onStatus = function (info)
                        {
                            mc.disconnectOnStatus(this, info);
                        };
                    }
                    else
                    {
                        delete _tryNC[_loc2].onStatus;
                        _tryNC[_loc2].close();
                    } // end if
                } // end else if
                delete _tryNC[_loc2];
            } // end of for
            delete this._tryNC;
        } // end if
    } // End of the function
    function tryFallBack()
    {
        if (_serverName == fallbackServerName || fallbackServerName == undefined || fallbackServerName == null)
        {
            delete this._nc;
            _nc = undefined;
            _ncConnected = false;
            _owner.ncConnected();
        }
        else
        {
            _connTypeCounter = 0;
            this.cleanConns();
            _serverName = fallbackServerName;
            this.connectRTMP();
        } // end else if
    } // End of the function
    function onConnected(p_nc, p_bw)
    {
        clearInterval(_timeoutIntervalId);
        _timeoutIntervalId = 0;
        delete p_nc.onBWDone;
        delete p_nc.onBWCheck;
        delete p_nc.onStatus;
        _nc = p_nc;
        _ncUri = _nc.uri;
        _ncConnected = true;
        if (_autoSenseBW)
        {
            _bitrate = p_bw * 1024;
            if (_streams != undefined)
            {
                this.bitrateMatch();
            }
            else
            {
                var _loc3 = _streamName.split(",");
                for (var _loc2 = 0; _loc2 < _loc3.length; _loc2 = _loc2 + 2)
                {
                    var _loc4 = mx.video.NCManager.stripFrontAndBackWhiteSpace(_loc3[_loc2]);
                    if (_loc2 + 1 < _loc3.length)
                    {
                        if (p_bw <= Number(_loc3[_loc2 + 1]))
                        {
                            _streamName = _loc4;
                            break;
                        } // end if
                        continue;
                    } // end if
                    _streamName = _loc4;
                    break;
                } // end of for
                if (_streamName.slice(-4).toLowerCase() == ".flv")
                {
                    _streamName = _streamName.slice(0, -4);
                } // end if
            } // end if
        } // end else if
        if (!_owner.__get__isLive() && _streamLength == undefined)
        {
            var _loc6 = new Object();
            _loc6.mc = this;
            _loc6.onResult = function (length)
            {
                mc.getStreamLengthResult(length);
            };
            _nc.call("getStreamLength", _loc6, _streamName);
        }
        else
        {
            _owner.ncConnected();
        } // end else if
    } // End of the function
    function connectOnStatus(target, info)
    {
        target.pending = false;
        if (info.code == "NetConnection.Connect.Success")
        {
            _nc = _tryNC[target.connIndex];
            _tryNC[target.connIndex] = undefined;
            this.cleanConns();
        }
        else if ((info.code == "NetConnection.Connect.Failed" || info.code == "NetConnection.Connect.Rejected") && target.connIndex == mx.video.NCManager.RTMP_CONN.length - 1)
        {
            if (!this.connectAgain())
            {
                this.tryFallBack();
            } // end if
            
        } // end else if
    } // End of the function
    function reconnectOnStatus(target, info)
    {
        if (info.code == "NetConnection.Connect.Failed" || info.code == "NetConnection.Connect.Rejected")
        {
            delete this._nc;
            _nc = undefined;
            _ncConnected = false;
            _owner.ncReconnected();
        } // end if
    } // End of the function
    function disconnectOnStatus(target, info)
    {
        if (info.code == "NetConnection.Connect.Success")
        {
            delete target.onStatus;
            target.close();
        } // end if
    } // End of the function
    function getStreamLengthResult(length)
    {
        if (length > 0)
        {
            _streamLength = length;
        } // end if
        _owner.ncConnected();
    } // End of the function
    function _onFCSConnectTimeOut()
    {
        this.cleanConns();
        _nc = undefined;
        _ncConnected = false;
        if (!this.connectAgain())
        {
            _owner.ncConnected();
        } // end if
    } // End of the function
    static function stripFrontAndBackWhiteSpace(p_str)
    {
        var _loc1;
        var _loc2 = p_str.length;
        var _loc4 = 0;
        var _loc5 = _loc2;
        for (var _loc1 = 0; _loc1 < _loc2; ++_loc1)
        {
            switch (p_str.charCodeAt(_loc1))
            {
                case 9:
                case 10:
                case 13:
                case 32:
                {
                    break;
                } 
                default:
                {
                    _loc4 = _loc1;
                    break;
                } 
            } // End of switch
        } // end of for
        for (var _loc1 = _loc2; _loc1 >= 0; --_loc1)
        {
            switch (p_str.charCodeAt(_loc1))
            {
                case 9:
                case 10:
                case 13:
                case 32:
                {
                    break;
                } 
                default:
                {
                    _loc5 = _loc1 + 1;
                    break;
                } 
            } // End of switch
        } // end of for
        if (_loc5 <= _loc4)
        {
            return ("");
        } // end if
        return (p_str.slice(_loc4, _loc5));
    } // End of the function
    static var version = "1.0.1.10";
    static var shortVersion = "1.0.1";
    var DEFAULT_TIMEOUT = 60000;
    static var RTMP_CONN = [{protocol: "rtmp:/", port: "1935"}, {protocol: "rtmp:/", port: "443"}, {protocol: "rtmpt:/", port: "80"}, {protocol: "rtmps:/", port: "443"}];
} // End of Class
