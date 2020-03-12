class mx.video.UIManager
{
    var _vc, _skin, _skinAutoHide, _skinReady, __visible, _bufferingBarHides, _controlsEnabled, _lastScrubPos, _lastVolumePos, cachedSoundLevel, _isMuted, controls, customClips, skin_mc, skinLoader, layout_mc, border_mc, _seekBarIntervalID, _seekBarInterval, _seekBarScrubTolerance, _volumeBarIntervalID, _volumeBarInterval, _volumeBarScrubTolerance, _bufferingDelayIntervalID, _bufferingDelayInterval, _bufferingOn, _skinAutoHideIntervalID, _progressPercent, __get__bufferingBarHidesAndDisablesOthers, __get__controlsEnabled, __get__skin, __get__skinAutoHide, __get__seekBarInterval, __get__volumeBarInterval, __get__bufferingDelayInterval, __get__volumeBarScrubTolerance, __get__seekBarScrubTolerance, __get__visible, uiMgr, state, _focusrect, controlIndex, placeholderLeft, placeholderRight, placeholderTop, placeholderBottom, videoLeft, videoRight, videoTop, videoBottom, _playAfterScrub, __set__bufferingBarHidesAndDisablesOthers, __set__bufferingDelayInterval, __set__controlsEnabled, __set__seekBarInterval, __set__seekBarScrubTolerance, __set__skin, __set__skinAutoHide, __get__skinReady, __set__visible, __set__volumeBarInterval, __set__volumeBarScrubTolerance;
    function UIManager(vc)
    {
        _vc = vc;
        _skin = undefined;
        _skinAutoHide = false;
        _skinReady = true;
        __visible = true;
        _bufferingBarHides = false;
        _controlsEnabled = true;
        _lastScrubPos = 0;
        _lastVolumePos = 0;
        cachedSoundLevel = _vc.volume;
        _isMuted = false;
        controls = new Array();
        customClips = undefined;
        skin_mc = undefined;
        skinLoader = undefined;
        layout_mc = undefined;
        border_mc = undefined;
        _seekBarIntervalID = 0;
        _seekBarInterval = mx.video.UIManager.SEEK_BAR_INTERVAL_DEFAULT;
        _seekBarScrubTolerance = mx.video.UIManager.SEEK_BAR_SCRUB_TOLERANCE_DEFAULT;
        _volumeBarIntervalID = 0;
        _volumeBarInterval = mx.video.UIManager.VOLUME_BAR_INTERVAL_DEFAULT;
        _volumeBarScrubTolerance = mx.video.UIManager.VOLUME_BAR_SCRUB_TOLERANCE_DEFAULT;
        _bufferingDelayIntervalID = 0;
        _bufferingDelayInterval = mx.video.UIManager.BUFFERING_DELAY_INTERVAL_DEFAULT;
        _bufferingOn = false;
        _skinAutoHideIntervalID = 0;
        _vc.addEventListener("metadataReceived", this);
        _vc.addEventListener("playheadUpdate", this);
        _vc.addEventListener("progress", this);
        _vc.addEventListener("stateChange", this);
        _vc.addEventListener("ready", this);
        _vc.addEventListener("resize", this);
        _vc.addEventListener("volumeUpdate", this);
    } // End of the function
    function handleEvent(e)
    {
        if (e.vp != undefined && e.vp != _vc.__get__visibleVideoPlayerIndex())
        {
            return;
        } // end if
        var _loc9 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        if (e.type == "stateChange")
        {
            if (e.state == mx.video.FLVPlayback.BUFFERING)
            {
                if (!_bufferingOn)
                {
                    clearInterval(_bufferingDelayIntervalID);
                    _bufferingDelayIntervalID = setInterval(this, "doBufferingDelay", _bufferingDelayInterval);
                } // end if
            }
            else
            {
                clearInterval(_bufferingDelayIntervalID);
                _bufferingDelayIntervalID = 0;
                _bufferingOn = false;
            } // end else if
            if (e.state == mx.video.FLVPlayback.LOADING)
            {
                _progressPercent = _vc.getVideoPlayer(e.vp).__get__isRTMP() ? (100) : (0);
                for (var _loc2 = mx.video.UIManager.SEEK_BAR; _loc2 <= mx.video.UIManager.VOLUME_BAR; ++_loc2)
                {
                    var _loc4 = controls[_loc2];
                    if (_loc4.progress_mc != undefined)
                    {
                        this.positionBar(_loc4, "progress", _progressPercent);
                    } // end if
                } // end of for
            } // end if
            for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_CONTROLS; ++_loc2)
            {
                if (controls[_loc2] == undefined)
                {
                    continue;
                } // end if
                this.setEnabledAndVisibleForState(_loc2, e.state);
                if (_loc2 < mx.video.UIManager.NUM_BUTTONS)
                {
                    this.skinButtonControl(controls[_loc2]);
                } // end if
            } // end of for
        }
        else if (e.type == "ready" || e.type == "metadataReceived")
        {
            for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_CONTROLS; ++_loc2)
            {
                if (controls[_loc2] == undefined)
                {
                    continue;
                } // end if
                this.setEnabledAndVisibleForState(_loc2, _vc.__get__state());
                if (_loc2 < mx.video.UIManager.NUM_BUTTONS)
                {
                    this.skinButtonControl(controls[_loc2]);
                } // end if
            } // end of for
            if (_vc.getVideoPlayer(e.vp).__get__isRTMP())
            {
                _progressPercent = 100;
                for (var _loc2 = mx.video.UIManager.SEEK_BAR; _loc2 <= mx.video.UIManager.VOLUME_BAR; ++_loc2)
                {
                    _loc4 = controls[_loc2];
                    if (_loc4.progress_mc != undefined)
                    {
                        this.positionBar(_loc4, "progress", _progressPercent);
                    } // end if
                } // end of for
            } // end if
        }
        else if (e.type == "resize")
        {
            this.layoutSkin();
            this.setupSkinAutoHide();
        }
        else if (e.type == "volumeUpdate")
        {
            if (_isMuted && e.volume > 0)
            {
                _isMuted = false;
                this.setEnabledAndVisibleForState(mx.video.UIManager.MUTE_OFF_BUTTON, mx.video.FLVPlayback.PLAYING);
                this.skinButtonControl(controls[mx.video.UIManager.MUTE_OFF_BUTTON]);
                this.setEnabledAndVisibleForState(mx.video.UIManager.MUTE_ON_BUTTON, mx.video.FLVPlayback.PLAYING);
                this.skinButtonControl(controls[mx.video.UIManager.MUTE_ON_BUTTON]);
            } // end if
            var _loc5 = controls[mx.video.UIManager.VOLUME_BAR];
            _loc5.percentage = _isMuted ? (cachedSoundLevel) : (e.volume);
            if (_loc5.percentage < 0)
            {
                _loc5.percentage = 0;
            }
            else if (_loc5.percentage > 100)
            {
                _loc5.percentage = 100;
            } // end else if
            this.positionHandle(mx.video.UIManager.VOLUME_BAR);
        }
        else if (e.type == "playheadUpdate" && controls[mx.video.UIManager.SEEK_BAR] != undefined)
        {
            if (!_vc.__get__isLive() && _vc.__get__totalTime() > 0)
            {
                var _loc6 = e.playheadTime / _vc.__get__totalTime() * 100;
                if (_loc6 < 0)
                {
                    _loc6 = 0;
                }
                else if (_loc6 > 100)
                {
                    _loc6 = 100;
                } // end else if
                var _loc10 = controls[mx.video.UIManager.SEEK_BAR];
                _loc10.percentage = _loc6;
                this.positionHandle(mx.video.UIManager.SEEK_BAR);
            } // end if
        }
        else if (e.type == "progress")
        {
            _progressPercent = e.bytesTotal <= 0 ? (100) : (e.bytesLoaded / e.bytesTotal * 100);
            var _loc7 = _vc._vpState[e.vp].minProgressPercent;
            if (!isNaN(_loc7) && _loc7 > _progressPercent)
            {
                _progressPercent = _loc7;
            } // end if
            if (_vc.__get__totalTime() > 0)
            {
                var _loc8 = _vc.__get__playheadTime() / _vc.__get__totalTime() * 100;
                if (_loc8 > _progressPercent)
                {
                    _progressPercent = _loc8;
                    _vc._vpState[e.vp].minProgressPercent = _progressPercent;
                } // end if
            } // end if
            for (var _loc2 = mx.video.UIManager.SEEK_BAR; _loc2 <= mx.video.UIManager.VOLUME_BAR; ++_loc2)
            {
                _loc4 = controls[_loc2];
                if (_loc4.progress_mc != undefined)
                {
                    this.positionBar(_loc4, "progress", _progressPercent);
                } // end if
            } // end of for
        } // end else if
        _vc.__set__activeVideoPlayerIndex(_loc9);
    } // End of the function
    function get bufferingBarHidesAndDisablesOthers()
    {
        return (_bufferingBarHides);
    } // End of the function
    function set bufferingBarHidesAndDisablesOthers(b)
    {
        _bufferingBarHides = b;
        //return (this.bufferingBarHidesAndDisablesOthers());
        null;
    } // End of the function
    function get controlsEnabled()
    {
        return (_controlsEnabled);
    } // End of the function
    function set controlsEnabled(flag)
    {
        if (_controlsEnabled == flag)
        {
            return;
        } // end if
        _controlsEnabled = flag;
        for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_BUTTONS; ++_loc2)
        {
            if (controls[_loc2] == undefined)
            {
                continue;
            } // end if
            controls[_loc2].releaseCapture();
            controls[_loc2].enabled = _controlsEnabled && controls[_loc2].myEnabled;
            this.skinButtonControl(controls[_loc2]);
        } // end of for
        //return (this.controlsEnabled());
        null;
    } // End of the function
    function get skin()
    {
        return (_skin);
    } // End of the function
    function set skin(s)
    {
        if (s == _skin)
        {
            return;
        } // end if
        if (_skin != undefined)
        {
            this.removeSkin();
        } // end if
        _skin = s;
        _skinReady = _skin == undefined || _skin == null || _skin == "";
        if (!_skinReady)
        {
            this.downloadSkin();
        } // end if
        //return (this.skin());
        null;
    } // End of the function
    function get skinAutoHide()
    {
        return (_skinAutoHide);
    } // End of the function
    function set skinAutoHide(b)
    {
        if (b == _skinAutoHide)
        {
            return;
        } // end if
        _skinAutoHide = b;
        this.setupSkinAutoHide();
        //return (this.skinAutoHide());
        null;
    } // End of the function
    function get skinReady()
    {
        return (_skinReady);
    } // End of the function
    function get seekBarInterval()
    {
        return (_seekBarInterval);
    } // End of the function
    function set seekBarInterval(s)
    {
        if (_seekBarInterval == s)
        {
            return;
        } // end if
        _seekBarInterval = s;
        if (_seekBarIntervalID > 0)
        {
            clearInterval(_seekBarIntervalID);
            _seekBarIntervalID = setInterval(this, "seekBarListener", _seekBarInterval, false);
        } // end if
        //return (this.seekBarInterval());
        null;
    } // End of the function
    function get volumeBarInterval()
    {
        return (_volumeBarInterval);
    } // End of the function
    function set volumeBarInterval(s)
    {
        if (_volumeBarInterval == s)
        {
            return;
        } // end if
        _volumeBarInterval = s;
        if (_volumeBarIntervalID > 0)
        {
            clearInterval(_volumeBarIntervalID);
            _volumeBarIntervalID = setInterval(this, "volumeBarListener", _volumeBarInterval, false);
        } // end if
        //return (this.volumeBarInterval());
        null;
    } // End of the function
    function get bufferingDelayInterval()
    {
        return (_bufferingDelayInterval);
    } // End of the function
    function set bufferingDelayInterval(s)
    {
        if (_bufferingDelayInterval == s)
        {
            return;
        } // end if
        _bufferingDelayInterval = s;
        if (_bufferingDelayIntervalID > 0)
        {
            clearInterval(_bufferingDelayIntervalID);
            _bufferingDelayIntervalID = setInterval(this, "doBufferingDelay", _bufferingDelayIntervalID);
        } // end if
        //return (this.bufferingDelayInterval());
        null;
    } // End of the function
    function get volumeBarScrubTolerance()
    {
        return (_volumeBarScrubTolerance);
    } // End of the function
    function set volumeBarScrubTolerance(s)
    {
        _volumeBarScrubTolerance = s;
        //return (this.volumeBarScrubTolerance());
        null;
    } // End of the function
    function get seekBarScrubTolerance()
    {
        return (_seekBarScrubTolerance);
    } // End of the function
    function set seekBarScrubTolerance(s)
    {
        _seekBarScrubTolerance = s;
        //return (this.seekBarScrubTolerance());
        null;
    } // End of the function
    function get visible()
    {
        return (__visible);
    } // End of the function
    function set visible(v)
    {
        if (__visible == v)
        {
            return;
        } // end if
        __visible = v;
        if (!__visible)
        {
            skin_mc._visible = false;
        }
        else
        {
            this.setupSkinAutoHide();
        } // end else if
        //return (this.visible());
        null;
    } // End of the function
    function getControl(index)
    {
        return (controls[index]);
    } // End of the function
    function setControl(index, s)
    {
        if (s == null)
        {
            s = undefined;
        } // end if
        if (s == controls[index])
        {
            return;
        } // end if
        switch (index)
        {
            case mx.video.UIManager.PAUSE_BUTTON:
            case mx.video.UIManager.PLAY_BUTTON:
            {
                this.resetPlayPause();
                break;
            } 
            case mx.video.UIManager.PLAY_PAUSE_BUTTON:
            {
                if (s._parent != layout_mc)
                {
                    this.resetPlayPause();
                    this.setControl(mx.video.UIManager.PAUSE_BUTTON, s.pause_mc);
                    this.setControl(mx.video.UIManager.PLAY_BUTTON, s.play_mc);
                } // end if
                break;
            } 
            case mx.video.UIManager.MUTE_BUTTON:
            {
                if (s._parent != layout_mc)
                {
                    this.setControl(mx.video.UIManager.MUTE_ON_BUTTON, s.on_mc);
                    this.setControl(mx.video.UIManager.MUTE_OFF_BUTTON, s.off_mc);
                } // end if
                break;
            } 
        } // End of switch
        if (index >= mx.video.UIManager.NUM_BUTTONS)
        {
            controls[index] = s;
            switch (index)
            {
                case mx.video.UIManager.SEEK_BAR:
                {
                    this.addBarControl(mx.video.UIManager.SEEK_BAR);
                    break;
                } 
                case mx.video.UIManager.VOLUME_BAR:
                {
                    this.addBarControl(mx.video.UIManager.VOLUME_BAR);
                    controls[mx.video.UIManager.VOLUME_BAR].percentage = _vc.volume;
                    break;
                } 
                case mx.video.UIManager.BUFFERING_BAR:
                {
                    controls[mx.video.UIManager.BUFFERING_BAR].uiMgr = this;
                    controls[mx.video.UIManager.BUFFERING_BAR].controlIndex = mx.video.UIManager.BUFFERING_BAR;
                    if (controls[mx.video.UIManager.BUFFERING_BAR]._parent == skin_mc)
                    {
                        this.finishAddBufferingBar();
                    }
                    else
                    {
                        controls[mx.video.UIManager.BUFFERING_BAR].onEnterFrame = function ()
                        {
                            uiMgr.finishAddBufferingBar();
                        };
                    } // end else if
                    break;
                } 
            } // End of switch
            this.setEnabledAndVisibleForState(index, _vc.__get__state());
        }
        else
        {
            this.removeButtonControl(index);
            controls[index] = s;
            this.addButtonControl(index);
        } // end else if
    } // End of the function
    function resetPlayPause()
    {
        if (controls[mx.video.UIManager.PLAY_PAUSE_BUTTON] == undefined)
        {
            return;
        } // end if
        for (var _loc2 = mx.video.UIManager.PAUSE_BUTTON; _loc2 <= mx.video.UIManager.PLAY_BUTTON; ++_loc2)
        {
            this.removeButtonControl(_loc2);
        } // end of for
        controls[mx.video.UIManager.PLAY_PAUSE_BUTTON] = undefined;
    } // End of the function
    function addButtonControl(index)
    {
        var _loc3 = controls[index];
        if (_loc3 == undefined)
        {
            return;
        } // end if
        var _loc5 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        _loc3.id = index;
        _loc3.state = mx.video.UIManager.UP_STATE;
        _loc3.uiMgr = this;
        this.setEnabledAndVisibleForState(index, _vc.__get__state());
        _loc3.onRollOver = function ()
        {
            state = mx.video.UIManager.OVER_STATE;
            uiMgr.skinButtonControl(this);
        };
        _loc3.onRollOut = function ()
        {
            state = mx.video.UIManager.UP_STATE;
            uiMgr.skinButtonControl(this);
        };
        if (index == mx.video.UIManager.SEEK_BAR_HANDLE || index == mx.video.UIManager.VOLUME_BAR_HANDLE)
        {
            _loc3.onPress = function ()
            {
                if (_root.focusManager)
                {
                    _focusrect = false;
                    Selection.setFocus(this);
                } // end if
                state = mx.video.UIManager.DOWN_STATE;
                uiMgr.dispatchMessage(this);
                uiMgr.skinButtonControl(this);
            };
            _loc3.onRelease = function ()
            {
                state = mx.video.UIManager.OVER_STATE;
                uiMgr.handleRelease(controlIndex);
                uiMgr.skinButtonControl(this);
            };
            _loc3.onReleaseOutside = function ()
            {
                state = mx.video.UIManager.UP_STATE;
                uiMgr.handleRelease(controlIndex);
                uiMgr.skinButtonControl(this);
            };
        }
        else
        {
            _loc3.onPress = function ()
            {
                if (_root.focusManager)
                {
                    _focusrect = false;
                    Selection.setFocus(this);
                } // end if
                state = mx.video.UIManager.DOWN_STATE;
                uiMgr.skinButtonControl(this);
            };
            _loc3.onRelease = function ()
            {
                state = mx.video.UIManager.OVER_STATE;
                uiMgr.dispatchMessage(this);
                uiMgr.skinButtonControl(this);
            };
            _loc3.onReleaseOutside = function ()
            {
                state = mx.video.UIManager.UP_STATE;
                uiMgr.skinButtonControl(this);
            };
        } // end else if
        if (_loc3._parent == skin_mc)
        {
            this.skinButtonControl(_loc3);
        }
        else
        {
            _loc3.onEnterFrame = function ()
            {
                uiMgr.skinButtonControl(this);
            };
        } // end else if
        _vc.__set__activeVideoPlayerIndex(_loc5);
    } // End of the function
    function removeButtonControl(index)
    {
        if (controls[index] == undefined)
        {
            return;
        } // end if
        controls[index].uiMgr = undefined;
        controls[index].onRollOver = undefined;
        controls[index].onRollOut = undefined;
        controls[index].onPress = undefined;
        controls[index].onRelease = undefined;
        controls[index].onReleaseOutside = undefined;
        controls[index] = undefined;
    } // End of the function
    function downloadSkin()
    {
        if (skinLoader == undefined)
        {
            skinLoader = new MovieClipLoader();
            skinLoader.addListener(this);
        } // end if
        if (skin_mc == undefined)
        {
            skin_mc = _vc.createEmptyMovieClip("skin_mc", _vc.getNextHighestDepth());
        } // end if
        skin_mc._visible = false;
        skin_mc._x = Stage.width + 100;
        skin_mc._y = Stage.height + 100;
        skinLoader.loadClip(_skin, skin_mc);
    } // End of the function
    function onLoadError(target_mc, errorCode)
    {
        _skinReady = true;
        _vc.skinError("Unable to load skin swf");
    } // End of the function
    null[] = (Error)() == null ? (null, throw , function ()
    {
        try
        {
            skin_mc._visible = false;
            skin_mc._x = 0;
            skin_mc._y = 0;
            layout_mc = skin_mc.layout_mc;
            if (layout_mc == undefined)
            {
                throw new Error("No layout_mc");
            } // end if
            layout_mc._visible = false;
            customClips = new Array();
            this.setCustomClips("bg");
            if (layout_mc.playpause_mc != undefined)
            {
                this.setSkin(mx.video.UIManager.PLAY_PAUSE_BUTTON, layout_mc.playpause_mc);
            }
            else
            {
                this.setSkin(mx.video.UIManager.PAUSE_BUTTON, layout_mc.pause_mc);
                this.setSkin(mx.video.UIManager.PLAY_BUTTON, layout_mc.play_mc);
            } // end else if
            this.setSkin(mx.video.UIManager.STOP_BUTTON, layout_mc.stop_mc);
            this.setSkin(mx.video.UIManager.BACK_BUTTON, layout_mc.back_mc);
            this.setSkin(mx.video.UIManager.FORWARD_BUTTON, layout_mc.forward_mc);
            this.setSkin(mx.video.UIManager.MUTE_BUTTON, layout_mc.volumeMute_mc);
            this.setSkin(mx.video.UIManager.SEEK_BAR, layout_mc.seekBar_mc);
            this.setSkin(mx.video.UIManager.VOLUME_BAR, layout_mc.volumeBar_mc);
            this.setSkin(mx.video.UIManager.BUFFERING_BAR, layout_mc.bufferingBar_mc);
            this.setCustomClips("fg");
            this.layoutSkin();
            this.setupSkinAutoHide();
            skin_mc._visible = __visible;
            _skinReady = true;
            _vc.skinLoaded();
            var _loc4 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            var _loc3 = _vc.__get__state();
            for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_CONTROLS; ++_loc2)
            {
                if (controls[_loc2] == undefined)
                {
                    continue;
                } // end if
                this.setEnabledAndVisibleForState(_loc2, _loc3);
                if (_loc2 < mx.video.UIManager.NUM_BUTTONS)
                {
                    this.skinButtonControl(controls[_loc2]);
                } // end if
            } // end of for
            _vc.__set__activeVideoPlayerIndex(_loc4);
        } // End of try
        catch ()
        {
        } // End of catch
    }) : (var err = (Error)(), _vc.skinError(err.message), this.removeSkin(), "onLoadInit");
    function layoutSkin()
    {
        if (layout_mc == undefined)
        {
            return;
        } // end if
        var _loc3 = layout_mc.video_mc;
        if (_loc3 == undefined)
        {
            throw new Error("No layout_mc.video_mc");
        } // end if
        placeholderLeft = _loc3._x;
        placeholderRight = _loc3._x + _loc3._width;
        placeholderTop = _loc3._y;
        placeholderBottom = _loc3._y + _loc3._height;
        videoLeft = 0;
        videoRight = _vc.width;
        videoTop = 0;
        videoBottom = _vc.height;
        if (!isNaN(layout_mc.minWidth) && layout_mc.minWidth > 0 && layout_mc.minWidth > videoRight)
        {
            videoLeft = videoLeft - (layout_mc.minWidth - videoRight) / 2;
            videoRight = layout_mc.minWidth + videoLeft;
        } // end if
        if (!isNaN(layout_mc.minHeight) && layout_mc.minHeight > 0 && layout_mc.minHeight > videoBottom)
        {
            videoTop = videoTop - (layout_mc.minHeight - videoBottom) / 2;
            videoBottom = layout_mc.minHeight + videoTop;
        } // end if
        var _loc2;
        for (var _loc2 = 0; _loc2 < customClips.length; ++_loc2)
        {
            this.layoutControl(customClips[_loc2]);
        } // end of for
        for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_CONTROLS; ++_loc2)
        {
            this.layoutControl(controls[_loc2]);
        } // end of for
    } // End of the function
    function layoutControl(ctrl)
    {
        if (ctrl == undefined)
        {
            return;
        } // end if
        if (ctrl.skin.anchorRight)
        {
            if (ctrl.skin.anchorLeft)
            {
                ctrl._x = ctrl.skin._x - placeholderLeft + videoLeft;
                ctrl._width = ctrl.skin._x + ctrl.skin._width - placeholderRight + videoRight - ctrl._x;
                if (ctrl.origWidth != undefined)
                {
                    ctrl.origWidth = undefined;
                } // end if
            }
            else
            {
                ctrl._x = ctrl.skin._x - placeholderRight + videoRight;
            } // end else if
        }
        else
        {
            ctrl._x = ctrl.skin._x - placeholderLeft + videoLeft;
        } // end else if
        if (ctrl.skin.anchorTop)
        {
            if (ctrl.skin.anchorBottom)
            {
                ctrl._y = ctrl.skin._y - placeholderTop + videoTop;
                ctrl._height = ctrl.skin._y + ctrl.skin._height - placeholderBottom + videoBottom - ctrl._y;
                if (ctrl.origHeight != undefined)
                {
                    ctrl.origHeight = undefined;
                } // end if
            }
            else
            {
                ctrl._y = ctrl.skin._y - placeholderTop + videoTop;
            } // end else if
        }
        else
        {
            ctrl._y = ctrl.skin._y - placeholderBottom + videoBottom;
        } // end else if
        switch (ctrl.controlIndex)
        {
            case mx.video.UIManager.SEEK_BAR:
            case mx.video.UIManager.VOLUME_BAR:
            {
                if (ctrl.progress_mc != undefined)
                {
                    if (_progressPercent == undefined)
                    {
                        _progressPercent = _vc.__get__isRTMP() ? (100) : (0);
                    } // end if
                    this.positionBar(ctrl, "progress", _progressPercent);
                } // end if
                this.positionHandle(ctrl.controlIndex);
                break;
            } 
            case mx.video.UIManager.BUFFERING_BAR:
            {
                if (ctrl.fill_mc != undefined)
                {
                    this.positionMaskedFill(ctrl, ctrl.fill_mc, 100);
                } // end if
                break;
            } 
        } // End of switch
        if (ctrl.layoutSelf != undefined)
        {
            ctrl.layoutSelf();
        } // end if
    } // End of the function
    function removeSkin()
    {
        if (skin_mc != undefined)
        {
            for (var _loc2 = 0; _loc2 < mx.video.UIManager.NUM_BUTTONS; ++_loc2)
            {
                this.removeButtonControl(_loc2);
            } // end of for
            for (var _loc2 = mx.video.UIManager.NUM_BUTTONS; _loc2 < mx.video.UIManager.NUM_CONTROLS; ++_loc2)
            {
                controls[_loc2] = undefined;
            } // end of for
            skin_mc.unloadMovie();
            layout_mc = undefined;
            border_mc = undefined;
        } // end if
    } // End of the function
    function setCustomClips(prefix)
    {
        var _loc4 = 1;
        while (true)
        {
            var _loc2 = layout_mc[prefix + _loc4++ + "_mc"];
            if (_loc2 == undefined)
            {
                break;
            } // end if
            var _loc3 = _loc2.mc;
            if (_loc3 == undefined)
            {
                _loc3 = _loc2._parent._parent[_loc2._name];
            } // end if
            if (_loc3 == undefined)
            {
                throw new Error("Bad clip in skin: " + _loc2);
            } // end if
            _loc3.skin = _loc2;
            customClips.push(_loc3);
            if (prefix == "bg" && _loc4 == 2)
            {
                border_mc = _loc3;
            } // end if
        } // end while
    } // End of the function
    function setSkin(index, s)
    {
        if (s == undefined)
        {
            return;
        } // end if
        var _loc2 = s.mc;
        if (_loc2 == undefined)
        {
            _loc2 = s._parent._parent[s._name];
        } // end if
        if (_loc2 == undefined)
        {
            throw new Error("Bad clip in skin: " + s);
        } // end if
        _loc2.skin = s;
        if (index < mx.video.UIManager.NUM_BUTTONS)
        {
            this.setupSkinStates(_loc2);
        }
        else
        {
            switch (index)
            {
                case mx.video.UIManager.PLAY_PAUSE_BUTTON:
                {
                    this.setupSkinStates(_loc2.play_mc);
                    this.setupSkinStates(_loc2.pause_mc);
                    break;
                } 
                case mx.video.UIManager.MUTE_BUTTON:
                {
                    this.setupSkinStates(_loc2.on_mc);
                    this.setupSkinStates(_loc2.off_mc);
                    break;
                } 
                case mx.video.UIManager.SEEK_BAR:
                case mx.video.UIManager.VOLUME_BAR:
                {
                    var _loc4 = index == mx.video.UIManager.SEEK_BAR ? ("seekBar") : ("volumeBar");
                    if (_loc2.handle_mc == undefined)
                    {
                        _loc2.handle_mc = _loc2.skin.seekBarHandle_mc;
                        if (_loc2.handle_mc == undefined)
                        {
                            _loc2.handle_mc = _loc2.skin._parent._parent[_loc4 + "Handle_mc"];
                        } // end if
                    } // end if
                    if (_loc2.progress_mc == undefined)
                    {
                        _loc2.progress_mc = _loc2.skin.progress_mc;
                        if (_loc2.progress_mc == undefined)
                        {
                            _loc2.progress_mc = _loc2.skin._parent._parent[_loc4 + "Progress_mc"];
                        } // end if
                    } // end if
                    if (_loc2.fullness_mc == undefined)
                    {
                        _loc2.fullness_mc = _loc2.skin.fullness_mc;
                        if (_loc2.fullness_mc == undefined)
                        {
                            _loc2.fullness_mc = _loc2.skin._parent._parent[_loc4 + "Fullness_mc"];
                        } // end if
                    } // end if
                    break;
                } 
                case mx.video.UIManager.BUFFERING_BAR:
                {
                    if (_loc2.fill_mc == undefined)
                    {
                        _loc2.fill_mc = _loc2.skin.fill_mc;
                        if (_loc2.fill_mc == undefined)
                        {
                            _loc2.fill_mc = _loc2.skin._parent._parent.bufferingBarFill_mc;
                        } // end if
                    } // end if
                    break;
                } 
            } // End of switch
        } // end else if
        this.setControl(index, _loc2);
    } // End of the function
    function setupSkinStates(ctrl)
    {
        if (ctrl.up_mc == undefined)
        {
            ctrl.up_mc = ctrl;
            ctrl.over_mc = ctrl;
            ctrl.down_mc = ctrl;
            ctrl.disabled_mc = ctrl;
        }
        else
        {
            ctrl._x = 0;
            ctrl._y = 0;
            ctrl.up_mc._x = 0;
            ctrl.up_mc._y = 0;
            ctrl.up_mc._visible = true;
            if (ctrl.over_mc == undefined)
            {
                ctrl.over_mc = ctrl.up_mc;
            }
            else
            {
                ctrl.over_mc._x = 0;
                ctrl.over_mc._y = 0;
                ctrl.over_mc._visible = false;
            } // end else if
            if (ctrl.down_mc == undefined)
            {
                ctrl.down_mc = ctrl.up_mc;
            }
            else
            {
                ctrl.down_mc._x = 0;
                ctrl.down_mc._y = 0;
                ctrl.down_mc._visible = false;
            } // end else if
            if (ctrl.disabled_mc == undefined)
            {
                ctrl.disabled_mc_mc = ctrl.up_mc;
            }
            else
            {
                ctrl.disabled_mc._x = 0;
                ctrl.disabled_mc._y = 0;
                ctrl.disabled_mc._visible = false;
            } // end else if
        } // end else if
    } // End of the function
    function skinButtonControl(ctrl)
    {
        if (ctrl.onEnterFrame != undefined)
        {
            delete ctrl.onEnterFrame;
            ctrl.onEnterFrame = undefined;
        } // end if
        if (ctrl.enabled)
        {
            switch (ctrl.state)
            {
                case mx.video.UIManager.UP_STATE:
                {
                    if (ctrl.up_mc == undefined)
                    {
                        ctrl.up_mc = ctrl.attachMovie(ctrl.upLinkageID, "up_mc", ctrl.getNextHighestDepth());
                    } // end if
                    this.applySkinState(ctrl, ctrl.up_mc);
                    break;
                } 
                case mx.video.UIManager.OVER_STATE:
                {
                    if (ctrl.over_mc == undefined)
                    {
                        if (ctrl.overLinkageID == undefined)
                        {
                            ctrl.over_mc = ctrl.up_mc;
                        }
                        else
                        {
                            ctrl.over_mc = ctrl.attachMovie(ctrl.overLinkageID, "over_mc", ctrl.getNextHighestDepth());
                        } // end if
                    } // end else if
                    this.applySkinState(ctrl, ctrl.over_mc);
                    break;
                } 
                case mx.video.UIManager.DOWN_STATE:
                {
                    if (ctrl.down_mc == undefined)
                    {
                        if (ctrl.downLinkageID == undefined)
                        {
                            ctrl.down_mc = ctrl.up_mc;
                        }
                        else
                        {
                            ctrl.down_mc = ctrl.attachMovie(ctrl.downLinkageID, "down_mc", ctrl.getNextHighestDepth());
                        } // end if
                    } // end else if
                    this.applySkinState(ctrl, ctrl.down_mc);
                    break;
                } 
            } // End of switch
        }
        else
        {
            ctrl.state = mx.video.UIManager.UP_STATE;
            if (ctrl.disabled_mc == undefined)
            {
                if (ctrl.disabledLinkageID == undefined)
                {
                    ctrl.disabled_mc = ctrl.up_mc;
                }
                else
                {
                    ctrl.disabled_mc = ctrl.attachMovie(ctrl.disabledLinkageID, "disabled_mc", ctrl.getNextHighestDepth());
                } // end if
            } // end else if
            this.applySkinState(ctrl, ctrl.disabled_mc);
        } // end else if
        if (ctrl.placeholder_mc != undefined)
        {
            ctrl.placeholder_mc.unloadMovie();
            delete ctrl.placeholder_mc;
            ctrl.placeholder_mc = undefined;
        } // end if
    } // End of the function
    function applySkinState(ctrl, state)
    {
        if (state != ctrl.currentState_mc)
        {
            if (state != undefined)
            {
                state._visible = true;
            } // end if
            if (ctrl.currentState_mc != undefined)
            {
                ctrl.currentState_mc._visible = false;
            } // end if
            ctrl.currentState_mc = state;
        } // end if
    } // End of the function
    function addBarControl(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        _loc2.isDragging = false;
        _loc2.percentage = 0;
        _loc2.uiMgr = this;
        _loc2.controlIndex = controlIndex;
        if (_loc2._parent == skin_mc)
        {
            this.finishAddBarControl(controlIndex);
        }
        else
        {
            _loc2.onEnterFrame = function ()
            {
                uiMgr.finishAddBarControl(this.controlIndex);
            };
        } // end else if
    } // End of the function
    function finishAddBarControl(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        delete _loc2.onEnterFrame;
        _loc2.onEnterFrame = undefined;
        if (_loc2.addBarControl != undefined)
        {
            _loc2.addBarControl();
        } // end if
        this.calcBarMargins(_loc2, "handle", true);
        this.calcBarMargins(_loc2, "progress", false);
        this.calcBarMargins(_loc2.progress_mc, "fill", false);
        this.calcBarMargins(_loc2.progress_mc, "mask", false);
        this.calcBarMargins(_loc2, "fullness", false);
        this.calcBarMargins(_loc2.fullness_mc, "fill", false);
        this.calcBarMargins(_loc2.fullness_mc, "mask", false);
        _loc2.origWidth = _loc2._width;
        _loc2.origHeight = _loc2._height;
        this.fixUpBar(_loc2, "progress");
        if (_loc2.progress_mc != undefined)
        {
            this.fixUpBar(_loc2, "progressBarFill");
            if (_progressPercent == undefined)
            {
                _progressPercent = _vc.__get__isRTMP() ? (100) : (0);
            } // end if
            this.positionBar(_loc2, "progress", _progressPercent);
        } // end if
        this.fixUpBar(_loc2, "fullness");
        if (_loc2.fullness_mc != undefined)
        {
            this.fixUpBar(_loc2, "fullnessBarFill");
        } // end if
        this.fixUpBar(_loc2, "handle");
        _loc2.handle_mc.controlIndex = controlIndex;
        switch (controlIndex)
        {
            case mx.video.UIManager.SEEK_BAR:
            {
                this.setControl(mx.video.UIManager.SEEK_BAR_HANDLE, _loc2.handle_mc);
                break;
            } 
            case mx.video.UIManager.VOLUME_BAR:
            {
                this.setControl(mx.video.UIManager.VOLUME_BAR_HANDLE, _loc2.handle_mc);
                break;
            } 
        } // End of switch
        this.positionHandle(controlIndex);
    } // End of the function
    function fixUpBar(ctrl, type)
    {
        if (ctrl[type + "LinkageID"] != undefined && ctrl[type + "LinkageID"].length > 0)
        {
            var _loc1;
            if (ctrl[type + "Below"])
            {
                for (var _loc1 = -1; ctrl._parent.getInstanceAtDepth(_loc1) != undefined; --_loc1)
                {
                } // end of for
            }
            else
            {
                ctrl[type + "Below"] = false;
                _loc1 = ctrl._parent.getNextHighestDepth();
            } // end else if
            var _loc5 = ctrl.controlIndex == mx.video.UIManager.SEEK_BAR ? ("seekBar") : ("volumeBar");
            var _loc4 = _loc5 + type.substring(0, 1).toUpperCase() + type.substring(1) + "_mc";
            ctrl[type + "_mc"] = ctrl._parent.attachMovie(ctrl[type + "LinkageID"], _loc4, _loc1);
        } // end if
    } // End of the function
    function calcBarMargins(ctrl, type, symmetricMargins)
    {
        var _loc2 = ctrl[type + "_mc"];
        if (_loc2 == undefined)
        {
            return;
        } // end if
        if (ctrl[type + "LeftMargin"] == undefined && _loc2._parent == ctrl._parent)
        {
            ctrl[type + "LeftMargin"] = _loc2._x - ctrl._x;
        } // end if
        if (ctrl[type + "RightMargin"] == undefined)
        {
            if (symmetricMargins)
            {
                ctrl[type + "RightMargin"] = ctrl[type + "LeftMargin"];
            }
            else if (_loc2._parent == ctrl._parent)
            {
                ctrl[type + "RightMargin"] = ctrl._width - _loc2._width - _loc2._x + ctrl._x;
            } // end if
        } // end else if
        if (ctrl[type + "TopMargin"] == undefined && _loc2._parent == ctrl._parent)
        {
            ctrl[type + "TopMargin"] = _loc2._y - ctrl._y;
        } // end if
        if (ctrl[type + "BottomMargin"] == undefined)
        {
            if (symmetricMargins)
            {
                ctrl[type + "BottomMargin"] = ctrl[type + "TopMargin"];
            }
            else if (_loc2._parent == ctrl._parent)
            {
                ctrl[type + "BottomMargin"] = ctrl._height - _loc2._height - _loc2._y + ctrl._y;
            } // end if
        } // end else if
        if (ctrl[type + "X"] == undefined)
        {
            if (_loc2._parent == ctrl._parent)
            {
                ctrl[type + "X"] = _loc2._x - ctrl._x;
            }
            else if (_loc2._parent == ctrl)
            {
                ctrl[type + "X"] = _loc2._x;
            } // end if
        } // end else if
        if (ctrl[type + "Y"] == undefined)
        {
            if (_loc2._parent == ctrl._parent)
            {
                ctrl[type + "Y"] = _loc2._y - ctrl._y;
            }
            else if (_loc2._parent == ctrl)
            {
                ctrl[type + "Y"] = _loc2._y;
            } // end if
        } // end else if
        ctrl[type + "XScale"] = _loc2._xscale;
        ctrl[type + "YScale"] = _loc2._yscale;
        ctrl[type + "Width"] = _loc2._width;
        ctrl[type + "Height"] = _loc2._height;
    } // End of the function
    function finishAddBufferingBar()
    {
        var _loc2 = controls[mx.video.UIManager.BUFFERING_BAR];
        delete _loc2.onEnterFrame;
        _loc2.onEnterFrame = undefined;
        this.calcBarMargins(_loc2, "fill", true);
        this.fixUpBar(_loc2, "fill");
        if (_loc2.fill_mc != undefined)
        {
            this.positionMaskedFill(_loc2, _loc2.fill_mc, 100);
        } // end if
    } // End of the function
    function positionMaskedFill(ctrl, fill, percent)
    {
        var _loc5 = fill._parent;
        var _loc3 = ctrl.mask_mc;
        if (_loc3 == undefined)
        {
            _loc3 = _loc5.createEmptyMovieClip(ctrl._name + "Mask_mc", _loc5.getNextHighestDepth());
            ctrl.mask_mc = _loc3;
            _loc3.beginFill(16777215);
            _loc3.lineTo(0, 0);
            _loc3.lineTo(1, 0);
            _loc3.lineTo(1, 1);
            _loc3.lineTo(0, 1);
            _loc3.lineTo(0, 0);
            _loc3.endFill();
            fill.setMask(_loc3);
            _loc3._x = ctrl.fillX;
            _loc3._y = ctrl.fillY;
            _loc3._width = ctrl.fillWidth;
            _loc3._height = ctrl.fillHeight;
            _loc3._visible = false;
            this.calcBarMargins(ctrl, "mask", true);
        } // end if
        if (_loc5 == ctrl)
        {
            if (fill.slideReveal)
            {
                fill._x = ctrl.maskX - ctrl.fillWidth + ctrl.fillWidth * percent / 100;
            }
            else
            {
                _loc3._width = ctrl.fillWidth * percent / 100;
            } // end else if
        }
        else if (_loc5 == ctrl._parent)
        {
            if (fill.slideReveal)
            {
                _loc3._x = ctrl._x + ctrl.maskLeftMargin;
                _loc3._y = ctrl._y + ctrl.maskTopMargin;
                _loc3._width = ctrl._width - ctrl.maskRightMargin - ctrl.maskLeftMargin;
                _loc3._height = ctrl._height - ctrl.maskTopMargin - ctrl.maskBottomMargin;
                fill._x = _loc3._x - ctrl.fillWidth + ctrl.maskWidth * percent / 100;
                fill._y = ctrl._y + ctrl.fillTopMargin;
            }
            else
            {
                fill._x = ctrl._x + ctrl.fillLeftMargin;
                fill._y = ctrl._y + ctrl.fillTopMargin;
                _loc3._x = fill._x;
                _loc3._y = fill._y;
                _loc3._width = (ctrl._width - ctrl.fillRightMargin - ctrl.fillLeftMargin) * percent / 100;
                _loc3._height = ctrl._height - ctrl.fillTopMargin - ctrl.fillBottomMargin;
            } // end else if
        } // end else if
    } // End of the function
    function startHandleDrag(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        var _loc5 = _loc2.handle_mc;
        if (_loc2.startHandleDrag == undefined || !_loc2.startHandleDrag())
        {
            var _loc3 = _loc2._y + _loc2.handleY;
            var _loc4 = _loc2.origWidth == undefined ? (_loc2._width) : (_loc2.origWidth);
            _loc5.startDrag(false, _loc2._x + _loc2.handleLeftMargin, _loc3, _loc2._x + _loc4 - _loc2.handleRightMargin, _loc3);
        } // end if
        _loc2.isDragging = true;
    } // End of the function
    function stopHandleDrag(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        var _loc3 = _loc2.handle_mc;
        if (_loc2.stopHandleDrag == undefined || !_loc2.stopHandleDrag())
        {
            _loc3.stopDrag();
        } // end if
        _loc2.isDragging = false;
    } // End of the function
    function positionHandle(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        var _loc3 = _loc2.handle_mc;
        if (_loc3 == undefined)
        {
            return;
        } // end if
        if (_loc2.positionHandle != undefined && _loc2.positionHandle())
        {
            return;
        } // end if
        var _loc4 = _loc2.origWidth == undefined ? (_loc2._width) : (_loc2.origWidth);
        var _loc5 = _loc4 - _loc2.handleRightMargin - _loc2.handleLeftMargin;
        _loc3._x = _loc2._x + _loc2.handleLeftMargin + _loc5 * _loc2.percentage / 100;
        _loc3._y = _loc2._y + _loc2.handleY;
        if (_loc2.fullness_mc != undefined)
        {
            this.positionBar(_loc2, "fullness", _loc2.percentage);
        } // end if
    } // End of the function
    function positionBar(ctrl, type, percent)
    {
        if (ctrl.positionBar != undefined && ctrl.positionBar(type, percent))
        {
            return;
        } // end if
        var _loc2 = ctrl[type + "_mc"];
        if (_loc2._parent == ctrl)
        {
            if (_loc2.fill_mc == undefined)
            {
                _loc2._xscale = ctrl[type + "XScale"] * percent / 100;
            }
            else
            {
                this.positionMaskedFill(_loc2, _loc2.fill_mc, percent);
            } // end else if
        }
        else
        {
            _loc2._x = ctrl._x + ctrl[type + "LeftMargin"];
            _loc2._y = ctrl._y + ctrl[type + "Y"];
            if (_loc2.fill_mc == undefined)
            {
                _loc2._width = (ctrl._width - ctrl[type + "LeftMargin"] - ctrl[type + "RightMargin"]) * percent / 100;
            }
            else
            {
                this.positionMaskedFill(_loc2, _loc2.fill_mc, percent);
            } // end else if
        } // end else if
    } // End of the function
    function calcPercentageFromHandle(controlIndex)
    {
        var _loc2 = controls[controlIndex];
        var _loc5 = _loc2.handle_mc;
        if (_loc2.calcPercentageFromHandle == undefined || !_loc2.calcPercentageFromHandle())
        {
            var _loc3 = _loc2.origWidth == undefined ? (_loc2._width) : (_loc2.origWidth);
            var _loc6 = _loc3 - _loc2.handleRightMargin - _loc2.handleLeftMargin;
            var _loc4 = _loc5._x - (_loc2._x + _loc2.handleLeftMargin);
            _loc2.percentage = _loc4 / _loc6 * 100;
            if (_loc2.fullness_mc != undefined)
            {
                this.positionBar(_loc2, "fullness", _loc2.percentage);
            } // end if
        } // end if
        if (_loc2.percentage < 0)
        {
            _loc2.percentage = 0;
        } // end if
        if (_loc2.percentage > 100)
        {
            _loc2.percentage = 100;
        } // end if
    } // End of the function
    function handleRelease(controlIndex)
    {
        var _loc3 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        if (controlIndex == mx.video.UIManager.SEEK_BAR)
        {
            this.seekBarListener(true);
        }
        else if (controlIndex == mx.video.UIManager.VOLUME_BAR)
        {
            this.volumeBarListener(true);
        } // end else if
        this.stopHandleDrag(controlIndex);
        _vc.__set__activeVideoPlayerIndex(_loc3);
        if (controlIndex == mx.video.UIManager.SEEK_BAR)
        {
            _vc._scrubFinish();
        } // end if
    } // End of the function
    function seekBarListener(finish)
    {
        var _loc3 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        var _loc4 = controls[mx.video.UIManager.SEEK_BAR];
        this.calcPercentageFromHandle(mx.video.UIManager.SEEK_BAR);
        var _loc2 = _loc4.percentage;
        if (finish)
        {
            clearInterval(_seekBarIntervalID);
            _seekBarIntervalID = 0;
            if (_loc2 != _lastScrubPos)
            {
                _vc.seekPercent(_loc2);
            } // end if
            _vc.addEventListener("playheadUpdate", this);
            if (_playAfterScrub)
            {
                _vc.play();
            } // end if
        }
        else if (_vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex()).__get__state() == mx.video.VideoPlayer.SEEKING)
        {
        }
        else if (_seekBarScrubTolerance <= 0 || Math.abs(_loc2 - _lastScrubPos) > _seekBarScrubTolerance || _loc2 < _seekBarScrubTolerance || _loc2 > 100 - _seekBarScrubTolerance)
        {
            if (_loc2 != _lastScrubPos)
            {
                _lastScrubPos = _loc2;
                _vc.seekPercent(_loc2);
            } // end else if
        } // end else if
        _vc.__set__activeVideoPlayerIndex(_loc3);
    } // End of the function
    function volumeBarListener(finish)
    {
        var _loc3 = controls[mx.video.UIManager.VOLUME_BAR];
        this.calcPercentageFromHandle(mx.video.UIManager.VOLUME_BAR);
        var _loc2 = _loc3.percentage;
        if (finish)
        {
            clearInterval(_volumeBarIntervalID);
            _volumeBarIntervalID = 0;
            _vc.addEventListener("volumeUpdate", this);
        } // end if
        if (finish || _volumeBarScrubTolerance <= 0 || Math.abs(_loc2 - _lastVolumePos) > _volumeBarScrubTolerance || _loc2 < _volumeBarScrubTolerance || _loc2 > 100 - _volumeBarScrubTolerance)
        {
            if (_loc2 != _lastVolumePos)
            {
                if (_isMuted)
                {
                    cachedSoundLevel = _loc2;
                }
                else
                {
                    _vc.__set__volume(_loc2);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function doBufferingDelay()
    {
        clearInterval(_bufferingDelayIntervalID);
        _bufferingDelayIntervalID = 0;
        var _loc2 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        if (_vc.__get__state() == mx.video.FLVPlayback.BUFFERING)
        {
            _bufferingOn = true;
            this.handleEvent({type: "stateChange", state: mx.video.FLVPlayback.BUFFERING, vp: _vc.__get__visibleVideoPlayerIndex()});
        } // end if
        _vc.__set__activeVideoPlayerIndex(_loc2);
    } // End of the function
    function dispatchMessage(ctrl)
    {
        if (ctrl.id == mx.video.UIManager.SEEK_BAR_HANDLE)
        {
            _vc._scrubStart();
        } // end if
        var _loc2 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        switch (ctrl.id)
        {
            case mx.video.UIManager.PAUSE_BUTTON:
            {
                _vc.pause();
                break;
            } 
            case mx.video.UIManager.PLAY_BUTTON:
            {
                _vc.play();
                break;
            } 
            case mx.video.UIManager.STOP_BUTTON:
            {
                _vc.stop();
                break;
            } 
            case mx.video.UIManager.SEEK_BAR_HANDLE:
            {
                this.calcPercentageFromHandle(mx.video.UIManager.SEEK_BAR);
                _lastScrubPos = controls[mx.video.UIManager.SEEK_BAR].percentage;
                _vc.removeEventListener("playheadUpdate", this);
                if (_vc.__get__playing() || _vc.__get__buffering())
                {
                    _playAfterScrub = true;
                }
                else if (_vc.__get__state() != mx.video.VideoPlayer.SEEKING)
                {
                    _playAfterScrub = false;
                } // end else if
                _seekBarIntervalID = setInterval(this, "seekBarListener", _seekBarInterval, false);
                this.startHandleDrag(mx.video.UIManager.SEEK_BAR, mx.video.UIManager.SEEK_BAR_HANDLE);
                _vc.pause();
                break;
            } 
            case mx.video.UIManager.VOLUME_BAR_HANDLE:
            {
                this.calcPercentageFromHandle(mx.video.UIManager.VOLUME_BAR);
                _lastVolumePos = controls[mx.video.UIManager.VOLUME_BAR].percentage;
                _vc.removeEventListener("volumeUpdate", this);
                _volumeBarIntervalID = setInterval(this, "volumeBarListener", _volumeBarInterval, false);
                this.startHandleDrag(mx.video.UIManager.VOLUME_BAR, mx.video.UIManager.VOLUME_BAR_HANDLE);
                break;
            } 
            case mx.video.UIManager.BACK_BUTTON:
            {
                _vc.seekToPrevNavCuePoint();
                break;
            } 
            case mx.video.UIManager.FORWARD_BUTTON:
            {
                _vc.seekToNextNavCuePoint();
                break;
            } 
            case mx.video.UIManager.MUTE_ON_BUTTON:
            case mx.video.UIManager.MUTE_OFF_BUTTON:
            {
                if (!_isMuted)
                {
                    _isMuted = true;
                    cachedSoundLevel = _vc.volume;
                    _vc.__set__volume(0);
                }
                else
                {
                    _isMuted = false;
                    _vc.__set__volume(cachedSoundLevel);
                } // end else if
                this.setEnabledAndVisibleForState(mx.video.UIManager.MUTE_OFF_BUTTON, mx.video.FLVPlayback.PLAYING);
                this.skinButtonControl(controls[mx.video.UIManager.MUTE_OFF_BUTTON]);
                this.setEnabledAndVisibleForState(mx.video.UIManager.MUTE_ON_BUTTON, mx.video.FLVPlayback.PLAYING);
                this.skinButtonControl(controls[mx.video.UIManager.MUTE_ON_BUTTON]);
                break;
            } 
            default:
            {
                throw new Error("Unknown ButtonControl");
            } 
        } // End of switch
        _vc.__set__activeVideoPlayerIndex(_loc2);
    } // End of the function
    function setEnabledAndVisibleForState(index, state)
    {
        var _loc5 = _vc.__get__activeVideoPlayerIndex();
        _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
        var _loc3 = state;
        if (_loc3 == mx.video.FLVPlayback.BUFFERING && !_bufferingOn)
        {
            _loc3 = mx.video.FLVPlayback.PLAYING;
        } // end if
        switch (index)
        {
            case mx.video.UIManager.VOLUME_BAR:
            case mx.video.UIManager.VOLUME_BAR_HANDLE:
            {
                controls[index].myEnabled = true;
                controls[index].enabled = _controlsEnabled;
                break;
            } 
            case mx.video.UIManager.MUTE_ON_BUTTON:
            {
                controls[index].myEnabled = !_isMuted;
                if (controls[mx.video.UIManager.MUTE_BUTTON] != undefined)
                {
                    controls[index]._visible = controls[index].myEnabled;
                } // end if
                break;
            } 
            case mx.video.UIManager.MUTE_OFF_BUTTON:
            {
                controls[index].myEnabled = _isMuted;
                if (controls[mx.video.UIManager.MUTE_BUTTON] != undefined)
                {
                    controls[index]._visible = controls[index].myEnabled;
                } // end if
                break;
            } 
            default:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.LOADING:
                    case mx.video.FLVPlayback.CONNECTION_ERROR:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                    case mx.video.FLVPlayback.DISCONNECTED:
                    {
                        controls[index].myEnabled = _vc.__get__contentPath() != undefined;
                        break;
                    } 
                    case mx.video.FLVPlayback.SEEKING:
                    {
                        break;
                    } 
                    default:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                } // End of switch
                break;
            } 
        } // End of switch
        switch (index)
        {
            case mx.video.UIManager.SEEK_BAR:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.STOPPED:
                    case mx.video.FLVPlayback.PLAYING:
                    case mx.video.FLVPlayback.PAUSED:
                    case mx.video.FLVPlayback.REWINDING:
                    case mx.video.FLVPlayback.SEEKING:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                    case mx.video.FLVPlayback.BUFFERING:
                    {
                        controls[index].myEnabled = !_bufferingBarHides || controls[mx.video.UIManager.BUFFERING_BAR] == undefined;
                        break;
                    } 
                    default:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                } // End of switch
                if (controls[index].myEnabled)
                {
                    controls[index].myEnabled = !isNaN(_vc.__get__totalTime()) && _vc.__get__totalTime() > 0;
                } // end if
                controls[index].handle_mc.myEnabled = controls[index].myEnabled;
                controls[index].handle_mc.enabled = controls[index].handle_mc.myEnabled;
                controls[index].handle_mc._visible = controls[index].myEnabled;
                var _loc4 = !_bufferingBarHides || controls[index].myEnabled || controls[mx.video.UIManager.BUFFERING_BAR] == undefined || !controls[mx.video.UIManager.BUFFERING_BAR]._visible;
                controls[index]._visible = _loc4;
                controls[index].progress_mc._visible = _loc4;
                controls[index].progress_mc.fill_mc._visible = _loc4;
                controls[index].fullness_mc._visible = _loc4;
                controls[index].progress_mc.fill_mc._visible = _loc4;
                break;
            } 
            case mx.video.UIManager.BUFFERING_BAR:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.STOPPED:
                    case mx.video.FLVPlayback.PLAYING:
                    case mx.video.FLVPlayback.PAUSED:
                    case mx.video.FLVPlayback.REWINDING:
                    case mx.video.FLVPlayback.SEEKING:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                    default:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                } // End of switch
                controls[index]._visible = controls[index].myEnabled;
                controls[index].fill_mc._visible = controls[index].myEnabled;
                break;
            } 
            case mx.video.UIManager.PAUSE_BUTTON:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.DISCONNECTED:
                    case mx.video.FLVPlayback.STOPPED:
                    case mx.video.FLVPlayback.PAUSED:
                    case mx.video.FLVPlayback.REWINDING:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                    case mx.video.FLVPlayback.PLAYING:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                    case mx.video.FLVPlayback.BUFFERING:
                    {
                        controls[index].myEnabled = !_bufferingBarHides || controls[mx.video.UIManager.BUFFERING_BAR] == undefined;
                        break;
                    } 
                } // End of switch
                if (controls[mx.video.UIManager.PLAY_PAUSE_BUTTON] != undefined)
                {
                    controls[index]._visible = controls[index].myEnabled;
                } // end if
                break;
            } 
            case mx.video.UIManager.PLAY_BUTTON:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.PLAYING:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                    case mx.video.FLVPlayback.STOPPED:
                    case mx.video.FLVPlayback.PAUSED:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                    case mx.video.FLVPlayback.BUFFERING:
                    {
                        controls[index].myEnabled = !_bufferingBarHides || controls[mx.video.UIManager.BUFFERING_BAR] == undefined;
                        break;
                    } 
                } // End of switch
                if (controls[mx.video.UIManager.PLAY_PAUSE_BUTTON] != undefined)
                {
                    controls[index]._visible = !controls[mx.video.UIManager.PAUSE_BUTTON]._visible;
                } // end if
                break;
            } 
            case mx.video.UIManager.STOP_BUTTON:
            {
                switch (_loc3)
                {
                    case mx.video.FLVPlayback.DISCONNECTED:
                    case mx.video.FLVPlayback.STOPPED:
                    {
                        controls[index].myEnabled = false;
                        break;
                    } 
                    case mx.video.FLVPlayback.PAUSED:
                    case mx.video.FLVPlayback.PLAYING:
                    case mx.video.FLVPlayback.BUFFERING:
                    {
                        controls[index].myEnabled = true;
                        break;
                    } 
                } // End of switch
                break;
            } 
            case mx.video.UIManager.BACK_BUTTON:
            case mx.video.UIManager.FORWARD_BUTTON:
            {
                if (_loc3 !== mx.video.FLVPlayback.BUFFERING)
                {
                    break;
                } // end if
                controls[index].myEnabled = !_bufferingBarHides || controls[mx.video.UIManager.BUFFERING_BAR] == undefined;
                break;
            } 
        } // End of switch
        controls[index].enabled = _controlsEnabled && controls[index].myEnabled;
        _vc.__set__activeVideoPlayerIndex(_loc5);
    } // End of the function
    function setupSkinAutoHide()
    {
        var _loc2 = _vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex());
        if (_skinAutoHide && skin_mc != undefined)
        {
            this.skinAutoHideHitTest();
            if (_skinAutoHideIntervalID == 0)
            {
                _skinAutoHideIntervalID = setInterval(this, "skinAutoHideHitTest", mx.video.UIManager.SKIN_AUTO_HIDE_INTERVAL);
            } // end if
        }
        else
        {
            skin_mc._visible = __visible;
            clearInterval(_skinAutoHideIntervalID);
            _skinAutoHideIntervalID = 0;
        } // end else if
    } // End of the function
    function skinAutoHideHitTest()
    {
        if (!__visible)
        {
            skin_mc._visible = false;
        }
        else
        {
            var _loc4 = _vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex());
            var _loc3 = _loc4.hitTest(_root._xmouse, _root._ymouse, true);
            if (!_loc3 && border_mc != undefined)
            {
                _loc3 = border_mc.hitTest(_root._xmouse, _root._ymouse, true);
            } // end if
            skin_mc._visible = _loc3;
        } // end else if
    } // End of the function
    static var version = "1.0.1.10";
    static var shortVersion = "1.0.1";
    static var PAUSE_BUTTON = 0;
    static var PLAY_BUTTON = 1;
    static var STOP_BUTTON = 2;
    static var SEEK_BAR_HANDLE = 3;
    static var BACK_BUTTON = 4;
    static var FORWARD_BUTTON = 5;
    static var MUTE_ON_BUTTON = 6;
    static var MUTE_OFF_BUTTON = 7;
    static var VOLUME_BAR_HANDLE = 8;
    static var NUM_BUTTONS = 9;
    static var PLAY_PAUSE_BUTTON = 9;
    static var MUTE_BUTTON = 10;
    static var BUFFERING_BAR = 11;
    static var SEEK_BAR = 12;
    static var VOLUME_BAR = 13;
    static var NUM_CONTROLS = 14;
    static var UP_STATE = 0;
    static var OVER_STATE = 1;
    static var DOWN_STATE = 2;
    static var SKIN_AUTO_HIDE_INTERVAL = 200;
    static var VOLUME_BAR_INTERVAL_DEFAULT = 250;
    static var VOLUME_BAR_SCRUB_TOLERANCE_DEFAULT = 0;
    static var SEEK_BAR_INTERVAL_DEFAULT = 250;
    static var SEEK_BAR_SCRUB_TOLERANCE_DEFAULT = 5;
    static var BUFFERING_DELAY_INTERVAL_DEFAULT = 1000;
} // End of Class
