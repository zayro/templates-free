
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.video.UIManager
    {
        var _vc, _skin, _skinAutoHide, _skinReady, __visible, _bufferingBarHides, _controlsEnabled, _lastScrubPos, _lastVolumePos, cachedSoundLevel, _isMuted, controls, customClips, skin_mc, skinLoader, layout_mc, border_mc, _seekBarIntervalID, _seekBarInterval, _seekBarScrubTolerance, _volumeBarIntervalID, _volumeBarInterval, _volumeBarScrubTolerance, _bufferingDelayIntervalID, _bufferingDelayInterval, _bufferingOn, _skinAutoHideIntervalID, _progressPercent, placeholderLeft, placeholderRight, placeholderTop, placeholderBottom, videoLeft, videoRight, videoTop, videoBottom, _playAfterScrub;
        function UIManager (_arg2) {
            _vc = _arg2;
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
            _seekBarInterval = SEEK_BAR_INTERVAL_DEFAULT;
            _seekBarScrubTolerance = SEEK_BAR_SCRUB_TOLERANCE_DEFAULT;
            _volumeBarIntervalID = 0;
            _volumeBarInterval = VOLUME_BAR_INTERVAL_DEFAULT;
            _volumeBarScrubTolerance = VOLUME_BAR_SCRUB_TOLERANCE_DEFAULT;
            _bufferingDelayIntervalID = 0;
            _bufferingDelayInterval = BUFFERING_DELAY_INTERVAL_DEFAULT;
            _bufferingOn = false;
            _skinAutoHideIntervalID = 0;
            _vc.addEventListener("metadataReceived", this);
            _vc.addEventListener("playheadUpdate", this);
            _vc.addEventListener("progress", this);
            _vc.addEventListener("stateChange", this);
            _vc.addEventListener("ready", this);
            _vc.addEventListener("resize", this);
            _vc.addEventListener("volumeUpdate", this);
        }
        function handleEvent(_arg3) {
            if ((_arg3.vp != undefined) && (_arg3.vp != _vc.__get__visibleVideoPlayerIndex())) {
                return(undefined);
            }
            var _local9 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            if (_arg3.type == "stateChange") {
                if (_arg3.state == mx.video.FLVPlayback.BUFFERING) {
                    if (!_bufferingOn) {
                        clearInterval(_bufferingDelayIntervalID);
                        _bufferingDelayIntervalID = setInterval(this, "doBufferingDelay", _bufferingDelayInterval);
                    }
                } else {
                    clearInterval(_bufferingDelayIntervalID);
                    _bufferingDelayIntervalID = 0;
                    _bufferingOn = false;
                }
                if (_arg3.state == mx.video.FLVPlayback.LOADING) {
                    _progressPercent = (_vc.getVideoPlayer(_arg3.vp).__get__isRTMP() ? 100 : 0);
                    var _local2 = SEEK_BAR;
                    while (_local2 <= VOLUME_BAR) {
                        var _local4 = controls[_local2];
                        if (_local4.progress_mc != undefined) {
                            positionBar(_local4, "progress", _progressPercent);
                        }
                        _local2++;
                    }
                }
                var _local2 = 0;
                while (_local2 < NUM_CONTROLS) {
                    if (controls[_local2] == undefined) {
                    } else {
                        setEnabledAndVisibleForState(_local2, _arg3.state);
                        if (_local2 < NUM_BUTTONS) {
                            skinButtonControl(controls[_local2]);
                        }
                    }
                    _local2++;
                }
            } else if ((_arg3.type == "ready") || (_arg3.type == "metadataReceived")) {
                var _local2 = 0;
                while (_local2 < NUM_CONTROLS) {
                    if (controls[_local2] == undefined) {
                    } else {
                        setEnabledAndVisibleForState(_local2, _vc.__get__state());
                        if (_local2 < NUM_BUTTONS) {
                            skinButtonControl(controls[_local2]);
                        }
                    }
                    _local2++;
                }
                if (_vc.getVideoPlayer(_arg3.vp).__get__isRTMP()) {
                    _progressPercent = 100;
                    _local2 = SEEK_BAR;
                    while (_local2 <= VOLUME_BAR) {
                        var _local4 = controls[_local2];
                        if (_local4.progress_mc != undefined) {
                            positionBar(_local4, "progress", _progressPercent);
                        }
                        _local2++;
                    }
                }
            } else if (_arg3.type == "resize") {
                layoutSkin();
                setupSkinAutoHide();
            } else if (_arg3.type == "volumeUpdate") {
                if (_isMuted && (_arg3.volume > 0)) {
                    _isMuted = false;
                    setEnabledAndVisibleForState(MUTE_OFF_BUTTON, mx.video.FLVPlayback.PLAYING);
                    skinButtonControl(controls[MUTE_OFF_BUTTON]);
                    setEnabledAndVisibleForState(MUTE_ON_BUTTON, mx.video.FLVPlayback.PLAYING);
                    skinButtonControl(controls[MUTE_ON_BUTTON]);
                }
                var _local5 = controls[VOLUME_BAR];
                _local5.percentage = (_isMuted ? (cachedSoundLevel) : (_arg3.volume));
                if (_local5.percentage < 0) {
                    _local5.percentage = 0;
                } else if (_local5.percentage > 100) {
                    _local5.percentage = 100;
                }
                positionHandle(VOLUME_BAR);
            } else if ((_arg3.type == "playheadUpdate") && (controls[SEEK_BAR] != undefined)) {
                if ((!_vc.__get__isLive()) && (_vc.__get__totalTime() > 0)) {
                    var _local6 = (_arg3.playheadTime / _vc.__get__totalTime()) * 100;
                    if (_local6 < 0) {
                        _local6 = 0;
                    } else if (_local6 > 100) {
                        _local6 = 100;
                    }
                    var _local10 = controls[SEEK_BAR];
                    _local10.percentage = _local6;
                    positionHandle(SEEK_BAR);
                }
            } else if (_arg3.type == "progress") {
                _progressPercent = ((_arg3.bytesTotal <= 0) ? 100 : ((_arg3.bytesLoaded / _arg3.bytesTotal) * 100));
                var _local7 = _vc._vpState[_arg3.vp].minProgressPercent;
                if ((!isNaN(_local7)) && (_local7 > _progressPercent)) {
                    _progressPercent = _local7;
                }
                if (_vc.__get__totalTime() > 0) {
                    var _local8 = (_vc.__get__playheadTime() / _vc.__get__totalTime()) * 100;
                    if (_local8 > _progressPercent) {
                        _progressPercent = _local8;
                        _vc._vpState[_arg3.vp].minProgressPercent = _progressPercent;
                    }
                }
                var _local2 = SEEK_BAR;
                while (_local2 <= VOLUME_BAR) {
                    var _local4 = controls[_local2];
                    if (_local4.progress_mc != undefined) {
                        positionBar(_local4, "progress", _progressPercent);
                    }
                    _local2++;
                }
            }
            _vc.__set__activeVideoPlayerIndex(_local9);
        }
        function get bufferingBarHidesAndDisablesOthers() {
            return(_bufferingBarHides);
        }
        function set bufferingBarHidesAndDisablesOthers(_arg2) {
            _bufferingBarHides = _arg2;
            //return(bufferingBarHidesAndDisablesOthers);
        }
        function get controlsEnabled() {
            return(_controlsEnabled);
        }
        function set controlsEnabled(_arg3) {
            if (_controlsEnabled == _arg3) {
                return;
            }
            _controlsEnabled = _arg3;
            var _local2 = 0;
            while (_local2 < NUM_BUTTONS) {
                if (controls[_local2] == undefined) {
                } else {
                    controls[_local2].releaseCapture();
                    controls[_local2].enabled = _controlsEnabled && (controls[_local2].myEnabled);
                    skinButtonControl(controls[_local2]);
                }
                _local2++;
            }
            //return(controlsEnabled);
        }
        function get skin() {
            return(_skin);
        }
        function set skin(_arg2) {
            if (_arg2 == _skin) {
                return;
            }
            if (_skin != undefined) {
                removeSkin();
            }
            _skin = _arg2;
            _skinReady = ((_skin == undefined) || (_skin == null)) || (_skin == "");
            if (!_skinReady) {
                downloadSkin();
            }
            //return(skin);
        }
        function get skinAutoHide() {
            return(_skinAutoHide);
        }
        function set skinAutoHide(_arg2) {
            if (_arg2 == _skinAutoHide) {
                return;
            }
            _skinAutoHide = _arg2;
            setupSkinAutoHide();
            //return(skinAutoHide);
        }
        function get skinReady() {
            return(_skinReady);
        }
        function get seekBarInterval() {
            return(_seekBarInterval);
        }
        function set seekBarInterval(_arg2) {
            if (_seekBarInterval == _arg2) {
                return;
            }
            _seekBarInterval = _arg2;
            if (_seekBarIntervalID > 0) {
                clearInterval(_seekBarIntervalID);
                _seekBarIntervalID = setInterval(this, "seekBarListener", _seekBarInterval, false);
            }
            //return(seekBarInterval);
        }
        function get volumeBarInterval() {
            return(_volumeBarInterval);
        }
        function set volumeBarInterval(_arg2) {
            if (_volumeBarInterval == _arg2) {
                return;
            }
            _volumeBarInterval = _arg2;
            if (_volumeBarIntervalID > 0) {
                clearInterval(_volumeBarIntervalID);
                _volumeBarIntervalID = setInterval(this, "volumeBarListener", _volumeBarInterval, false);
            }
            //return(volumeBarInterval);
        }
        function get bufferingDelayInterval() {
            return(_bufferingDelayInterval);
        }
        function set bufferingDelayInterval(_arg2) {
            if (_bufferingDelayInterval == _arg2) {
                return;
            }
            _bufferingDelayInterval = _arg2;
            if (_bufferingDelayIntervalID > 0) {
                clearInterval(_bufferingDelayIntervalID);
                _bufferingDelayIntervalID = setInterval(this, "doBufferingDelay", _bufferingDelayIntervalID);
            }
            //return(bufferingDelayInterval);
        }
        function get volumeBarScrubTolerance() {
            return(_volumeBarScrubTolerance);
        }
        function set volumeBarScrubTolerance(_arg2) {
            _volumeBarScrubTolerance = _arg2;
            //return(volumeBarScrubTolerance);
        }
        function get seekBarScrubTolerance() {
            return(_seekBarScrubTolerance);
        }
        function set seekBarScrubTolerance(_arg2) {
            _seekBarScrubTolerance = _arg2;
            //return(seekBarScrubTolerance);
        }
        function get visible() {
            return(__visible);
        }
        function set visible(_arg2) {
            if (__visible == _arg2) {
                return;
            }
            __visible = _arg2;
            if (!__visible) {
                skin_mc._visible = false;
            } else {
                setupSkinAutoHide();
            }
            //return(visible);
        }
        function getControl(_arg2) {
            return(controls[_arg2]);
        }
        function setControl(_arg3, _arg2) {
            if (_arg2 == null) {
                _arg2 = undefined;
            }
            if (_arg2 == controls[_arg3]) {
                return(undefined);
            }
            switch (_arg3) {
                case PAUSE_BUTTON : 
                case PLAY_BUTTON : 
                    resetPlayPause();
                    break;
                case PLAY_PAUSE_BUTTON : 
                    if (_arg2._parent != layout_mc) {
                        resetPlayPause();
                        setControl(PAUSE_BUTTON, _arg2.pause_mc);
                        setControl(PLAY_BUTTON, _arg2.play_mc);
                    }
                    break;
                case MUTE_BUTTON : 
                    if (_arg2._parent != layout_mc) {
                        setControl(MUTE_ON_BUTTON, _arg2.on_mc);
                        setControl(MUTE_OFF_BUTTON, _arg2.off_mc);
                    }
                    break;
            }
            if (_arg3 >= NUM_BUTTONS) {
                controls[_arg3] = _arg2;
                switch (_arg3) {
                    case SEEK_BAR : 
                        addBarControl(SEEK_BAR);
                        break;
                    case VOLUME_BAR : 
                        addBarControl(VOLUME_BAR);
                        controls[VOLUME_BAR].percentage = _vc.volume;
                        break;
                    case BUFFERING_BAR : 
                        controls[BUFFERING_BAR].uiMgr = this;
                        controls[BUFFERING_BAR].controlIndex = BUFFERING_BAR;
                        if (controls[BUFFERING_BAR]._parent == skin_mc) {
                            finishAddBufferingBar();
                        } else {
                            controls[BUFFERING_BAR].onEnterFrame = function () {
                                this.uiMgr.finishAddBufferingBar();
                            };
                        }
                        break;
                }
                setEnabledAndVisibleForState(_arg3, _vc.__get__state());
            } else {
                removeButtonControl(_arg3);
                controls[_arg3] = _arg2;
                addButtonControl(_arg3);
            }
        }
        function resetPlayPause() {
            if (controls[PLAY_PAUSE_BUTTON] == undefined) {
                return(undefined);
            }
            var _local2 = PAUSE_BUTTON;
            while (_local2 <= PLAY_BUTTON) {
                removeButtonControl(_local2);
                _local2++;
            }
            controls[PLAY_PAUSE_BUTTON] = undefined;
        }
        function addButtonControl(_arg4) {
            var _local3 = controls[_arg4];
            if (_local3 == undefined) {
                return(undefined);
            }
            var _local5 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            _local3.id = _arg4;
            _local3.state = UP_STATE;
            _local3.uiMgr = this;
            setEnabledAndVisibleForState(_arg4, _vc.__get__state());
            _local3.onRollOver = function () {
                this.state = mx.video.UIManager.OVER_STATE;
                this.uiMgr.skinButtonControl(this);
            };
            _local3.onRollOut = function () {
                this.state = mx.video.UIManager.UP_STATE;
                this.uiMgr.skinButtonControl(this);
            };
            if ((_arg4 == SEEK_BAR_HANDLE) || (_arg4 == VOLUME_BAR_HANDLE)) {
                _local3.onPress = function () {
                    if (_root.focusManager) {
                        this._focusrect = false;
                        Selection.setFocus(this);
                    }
                    this.state = mx.video.UIManager.DOWN_STATE;
                    this.uiMgr.dispatchMessage(this);
                    this.uiMgr.skinButtonControl(this);
                };
                _local3.onRelease = function () {
                    this.state = mx.video.UIManager.OVER_STATE;
                    this.uiMgr.handleRelease(this.controlIndex);
                    this.uiMgr.skinButtonControl(this);
                };
                _local3.onReleaseOutside = function () {
                    this.state = mx.video.UIManager.UP_STATE;
                    this.uiMgr.handleRelease(this.controlIndex);
                    this.uiMgr.skinButtonControl(this);
                };
            } else {
                _local3.onPress = function () {
                    if (_root.focusManager) {
                        this._focusrect = false;
                        Selection.setFocus(this);
                    }
                    this.state = mx.video.UIManager.DOWN_STATE;
                    this.uiMgr.skinButtonControl(this);
                };
                _local3.onRelease = function () {
                    this.state = mx.video.UIManager.OVER_STATE;
                    this.uiMgr.dispatchMessage(this);
                    this.uiMgr.skinButtonControl(this);
                };
                _local3.onReleaseOutside = function () {
                    this.state = mx.video.UIManager.UP_STATE;
                    this.uiMgr.skinButtonControl(this);
                };
            }
            if (_local3._parent == skin_mc) {
                skinButtonControl(_local3);
            } else {
                _local3.onEnterFrame = function () {
                    this.uiMgr.skinButtonControl(this);
                };
            }
            _vc.__set__activeVideoPlayerIndex(_local5);
        }
        function removeButtonControl(_arg2) {
            if (controls[_arg2] == undefined) {
                return(undefined);
            }
            controls[_arg2].uiMgr = undefined;
            controls[_arg2].onRollOver = undefined;
            controls[_arg2].onRollOut = undefined;
            controls[_arg2].onPress = undefined;
            controls[_arg2].onRelease = undefined;
            controls[_arg2].onReleaseOutside = undefined;
            controls[_arg2] = undefined;
        }
        function downloadSkin() {
            if (skinLoader == undefined) {
                skinLoader = new MovieClipLoader();
                skinLoader.addListener(this);
            }
            if (skin_mc == undefined) {
                skin_mc = _vc.createEmptyMovieClip("skin_mc", _vc.getNextHighestDepth());
            }
            skin_mc._visible = false;
            skin_mc._x = Stage.width + 100;
            skin_mc._y = Stage.height + 100;
            skinLoader.loadClip(_skin, skin_mc);
        }
        function onLoadError(target_mc, errorCode) {
            _skinReady = true;
            _vc.skinError("Unable to load skin swf");
        }
        function onLoadInit() {
            try {
                skin_mc._visible = false;
                skin_mc._x = 0;
                skin_mc._y = 0;
                layout_mc = skin_mc.layout_mc;
                if (layout_mc == undefined) {
                    throw new Error("No layout_mc");
                }
                layout_mc._visible = false;
                customClips = new Array();
                setCustomClips("bg");
                if (layout_mc.playpause_mc != undefined) {
                    setSkin(PLAY_PAUSE_BUTTON, layout_mc.playpause_mc);
                } else {
                    setSkin(PAUSE_BUTTON, layout_mc.pause_mc);
                    setSkin(PLAY_BUTTON, layout_mc.play_mc);
                }
                setSkin(STOP_BUTTON, layout_mc.stop_mc);
                setSkin(BACK_BUTTON, layout_mc.back_mc);
                setSkin(FORWARD_BUTTON, layout_mc.forward_mc);
                setSkin(MUTE_BUTTON, layout_mc.volumeMute_mc);
                setSkin(SEEK_BAR, layout_mc.seekBar_mc);
                setSkin(VOLUME_BAR, layout_mc.volumeBar_mc);
                setSkin(BUFFERING_BAR, layout_mc.bufferingBar_mc);
                setCustomClips("fg");
                layoutSkin();
                setupSkinAutoHide();
                skin_mc._visible = __visible;
                _skinReady = true;
                _vc.skinLoaded();
                var _local4 = _vc.__get__activeVideoPlayerIndex();
                _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
                var _local3 = _vc.__get__state();
                var _local2 = 0;
                while (_local2 < NUM_CONTROLS) {
                    if (controls[_local2] == undefined) {
                    } else {
                        setEnabledAndVisibleForState(_local2, _local3);
                        if (_local2 < NUM_BUTTONS) {
                            skinButtonControl(controls[_local2]);
                        }
                    }
                    _local2++;
                }
                _vc.__set__activeVideoPlayerIndex(_local4);
            } catch(err:Error) {
                _vc.skinError(err.message);
                removeSkin();
            }
        }
        function layoutSkin() {
            if (layout_mc == undefined) {
                return(undefined);
            }
            var _local3 = layout_mc.video_mc;
            if (_local3 == undefined) {
                throw new Error("No layout_mc.video_mc");
            }
            placeholderLeft = _local3._x;
            placeholderRight = _local3._x + _local3._width;
            placeholderTop = _local3._y;
            placeholderBottom = _local3._y + _local3._height;
            videoLeft = 0;
            videoRight = _vc.width;
            videoTop = 0;
            videoBottom = _vc.height;
            if (((!isNaN(layout_mc.minWidth)) && (layout_mc.minWidth > 0)) && (layout_mc.minWidth > videoRight)) {
                videoLeft = videoLeft - ((layout_mc.minWidth - videoRight) / 2);
                videoRight = layout_mc.minWidth + videoLeft;
            }
            if (((!isNaN(layout_mc.minHeight)) && (layout_mc.minHeight > 0)) && (layout_mc.minHeight > videoBottom)) {
                videoTop = videoTop - ((layout_mc.minHeight - videoBottom) / 2);
                videoBottom = layout_mc.minHeight + videoTop;
            }
            var _local2;
            _local2 = 0;
            while (_local2 < customClips.length) {
                layoutControl(customClips[_local2]);
                _local2++;
            }
            _local2 = 0;
            while (_local2 < NUM_CONTROLS) {
                layoutControl(controls[_local2]);
                _local2++;
            }
        }
        function layoutControl(_arg2) {
            if (_arg2 == undefined) {
                return(undefined);
            }
            if (_arg2.skin.anchorRight) {
                if (_arg2.skin.anchorLeft) {
                    _arg2._x = (_arg2.skin._x - placeholderLeft) + videoLeft;
                    _arg2._width = (((_arg2.skin._x + _arg2.skin._width) - placeholderRight) + videoRight) - _arg2._x;
                    if (_arg2.origWidth != undefined) {
                        _arg2.origWidth = undefined;
                    }
                } else {
                    _arg2._x = (_arg2.skin._x - placeholderRight) + videoRight;
                }
            } else {
                _arg2._x = (_arg2.skin._x - placeholderLeft) + videoLeft;
            }
            if (_arg2.skin.anchorTop) {
                if (_arg2.skin.anchorBottom) {
                    _arg2._y = (_arg2.skin._y - placeholderTop) + videoTop;
                    _arg2._height = (((_arg2.skin._y + _arg2.skin._height) - placeholderBottom) + videoBottom) - _arg2._y;
                    if (_arg2.origHeight != undefined) {
                        _arg2.origHeight = undefined;
                    }
                } else {
                    _arg2._y = (_arg2.skin._y - placeholderTop) + videoTop;
                }
            } else {
                _arg2._y = (_arg2.skin._y - placeholderBottom) + videoBottom;
            }
            switch (_arg2.controlIndex) {
                case SEEK_BAR : 
                case VOLUME_BAR : 
                    if (_arg2.progress_mc != undefined) {
                        if (_progressPercent == undefined) {
                            _progressPercent = (_vc.__get__isRTMP() ? 100 : 0);
                        }
                        positionBar(_arg2, "progress", _progressPercent);
                    }
                    positionHandle(_arg2.controlIndex);
                    break;
                case BUFFERING_BAR : 
                    if (_arg2.fill_mc != undefined) {
                        positionMaskedFill(_arg2, _arg2.fill_mc, 100);
                    }
                    break;
            }
            if (_arg2.layoutSelf != undefined) {
                _arg2.layoutSelf();
            }
        }
        function removeSkin() {
            if (skin_mc != undefined) {
                var _local2 = 0;
                while (_local2 < NUM_BUTTONS) {
                    removeButtonControl(_local2);
                    _local2++;
                }
                _local2 = NUM_BUTTONS;
                while (_local2 < NUM_CONTROLS) {
                    controls[_local2] = undefined;
                    _local2++;
                }
                skin_mc.unloadMovie();
                layout_mc = undefined;
                border_mc = undefined;
            }
        }
        function setCustomClips(_arg5) {
            var _local4 = 1;
            while (true) {
                var _local2 = layout_mc[(_arg5 + (_local4++)) + "_mc"];
                if (_local2 == undefined) {
                    break;
                }
                var _local3 = _local2.mc;
                if (_local3 == undefined) {
                    _local3 = _local2._parent._parent[_local2._name];
                }
                if (_local3 == undefined) {
                    throw new Error("Bad clip in skin: " + _local2);
                }
                _local3.skin = _local2;
                customClips.push(_local3);
                if ((_arg5 == "bg") && (_local4 == 2)) {
                    border_mc = _local3;
                }
            }
        }
        function setSkin(_arg5, _arg3) {
            if (_arg3 == undefined) {
                return(undefined);
            }
            var _local2 = _arg3.mc;
            if (_local2 == undefined) {
                _local2 = _arg3._parent._parent[_arg3._name];
            }
            if (_local2 == undefined) {
                throw new Error("Bad clip in skin: " + _arg3);
            }
            _local2.skin = _arg3;
            if (_arg5 < NUM_BUTTONS) {
                setupSkinStates(_local2);
            } else {
                switch (_arg5) {
                    case PLAY_PAUSE_BUTTON : 
                        setupSkinStates(_local2.play_mc);
                        setupSkinStates(_local2.pause_mc);
                        break;
                    case MUTE_BUTTON : 
                        setupSkinStates(_local2.on_mc);
                        setupSkinStates(_local2.off_mc);
                        break;
                    case SEEK_BAR : 
                    case VOLUME_BAR : 
                        var _local4 = ((_arg5 == SEEK_BAR) ? "seekBar" : "volumeBar");
                        if (_local2.handle_mc == undefined) {
                            _local2.handle_mc = _local2.skin.seekBarHandle_mc;
                            if (_local2.handle_mc == undefined) {
                                _local2.handle_mc = _local2.skin._parent._parent[_local4 + "Handle_mc"];
                            }
                        }
                        if (_local2.progress_mc == undefined) {
                            _local2.progress_mc = _local2.skin.progress_mc;
                            if (_local2.progress_mc == undefined) {
                                _local2.progress_mc = _local2.skin._parent._parent[_local4 + "Progress_mc"];
                            }
                        }
                        if (_local2.fullness_mc == undefined) {
                            _local2.fullness_mc = _local2.skin.fullness_mc;
                            if (_local2.fullness_mc == undefined) {
                                _local2.fullness_mc = _local2.skin._parent._parent[_local4 + "Fullness_mc"];
                            }
                        }
                        break;
                    case BUFFERING_BAR : 
                        if (_local2.fill_mc == undefined) {
                            _local2.fill_mc = _local2.skin.fill_mc;
                            if (_local2.fill_mc == undefined) {
                                _local2.fill_mc = _local2.skin._parent._parent.bufferingBarFill_mc;
                            }
                        }
                        break;
                }
            }
            setControl(_arg5, _local2);
        }
        function setupSkinStates(_arg1) {
            if (_arg1.up_mc == undefined) {
                _arg1.up_mc = _arg1;
                _arg1.over_mc = _arg1;
                _arg1.down_mc = _arg1;
                _arg1.disabled_mc = _arg1;
            } else {
                _arg1._x = 0;
                _arg1._y = 0;
                _arg1.up_mc._x = 0;
                _arg1.up_mc._y = 0;
                _arg1.up_mc._visible = true;
                if (_arg1.over_mc == undefined) {
                    _arg1.over_mc = _arg1.up_mc;
                } else {
                    _arg1.over_mc._x = 0;
                    _arg1.over_mc._y = 0;
                    _arg1.over_mc._visible = false;
                }
                if (_arg1.down_mc == undefined) {
                    _arg1.down_mc = _arg1.up_mc;
                } else {
                    _arg1.down_mc._x = 0;
                    _arg1.down_mc._y = 0;
                    _arg1.down_mc._visible = false;
                }
                if (_arg1.disabled_mc == undefined) {
                    _arg1.disabled_mc_mc = _arg1.up_mc;
                } else {
                    _arg1.disabled_mc._x = 0;
                    _arg1.disabled_mc._y = 0;
                    _arg1.disabled_mc._visible = false;
                }
            }
        }
        function skinButtonControl(_arg2) {
            if (_arg2.onEnterFrame != undefined) {
                delete _arg2.onEnterFrame;
                _arg2.onEnterFrame = undefined;
            }
            if (_arg2.enabled) {
                switch (_arg2.state) {
                    case UP_STATE : 
                        if (_arg2.up_mc == undefined) {
                            _arg2.up_mc = _arg2.attachMovie(_arg2.upLinkageID, "up_mc", _arg2.getNextHighestDepth());
                        }
                        applySkinState(_arg2, _arg2.up_mc);
                        break;
                    case OVER_STATE : 
                        if (_arg2.over_mc == undefined) {
                            if (_arg2.overLinkageID == undefined) {
                                _arg2.over_mc = _arg2.up_mc;
                            } else {
                                _arg2.over_mc = _arg2.attachMovie(_arg2.overLinkageID, "over_mc", _arg2.getNextHighestDepth());
                            }
                        }
                        applySkinState(_arg2, _arg2.over_mc);
                        break;
                    case DOWN_STATE : 
                        if (_arg2.down_mc == undefined) {
                            if (_arg2.downLinkageID == undefined) {
                                _arg2.down_mc = _arg2.up_mc;
                            } else {
                                _arg2.down_mc = _arg2.attachMovie(_arg2.downLinkageID, "down_mc", _arg2.getNextHighestDepth());
                            }
                        }
                        applySkinState(_arg2, _arg2.down_mc);
                        break;
                }
            } else {
                _arg2.state = UP_STATE;
                if (_arg2.disabled_mc == undefined) {
                    if (_arg2.disabledLinkageID == undefined) {
                        _arg2.disabled_mc = _arg2.up_mc;
                    } else {
                        _arg2.disabled_mc = _arg2.attachMovie(_arg2.disabledLinkageID, "disabled_mc", _arg2.getNextHighestDepth());
                    }
                }
                applySkinState(_arg2, _arg2.disabled_mc);
            }
            if (_arg2.placeholder_mc != undefined) {
                _arg2.placeholder_mc.unloadMovie();
                delete _arg2.placeholder_mc;
                _arg2.placeholder_mc = undefined;
            }
        }
        function applySkinState(_arg1, _arg2) {
            if (_arg2 != _arg1.currentState_mc) {
                if (_arg2 != undefined) {
                    _arg2._visible = true;
                }
                if (_arg1.currentState_mc != undefined) {
                    _arg1.currentState_mc._visible = false;
                }
                _arg1.currentState_mc = _arg2;
            }
        }
        function addBarControl(controlIndex) {
            var _local2 = controls[controlIndex];
            _local2.isDragging = false;
            _local2.percentage = 0;
            _local2.uiMgr = this;
            _local2.controlIndex = controlIndex;
            if (_local2._parent == skin_mc) {
                finishAddBarControl(controlIndex);
            } else {
                _local2.onEnterFrame = function () {
                    this.uiMgr.finishAddBarControl(this.controlIndex);
                };
            }
        }
        function finishAddBarControl(_arg3) {
            var _local2 = controls[_arg3];
            delete _local2.onEnterFrame;
            _local2.onEnterFrame = undefined;
            if (_local2.addBarControl != undefined) {
                _local2.addBarControl();
            }
            calcBarMargins(_local2, "handle", true);
            calcBarMargins(_local2, "progress", false);
            calcBarMargins(_local2.progress_mc, "fill", false);
            calcBarMargins(_local2.progress_mc, "mask", false);
            calcBarMargins(_local2, "fullness", false);
            calcBarMargins(_local2.fullness_mc, "fill", false);
            calcBarMargins(_local2.fullness_mc, "mask", false);
            _local2.origWidth = _local2._width;
            _local2.origHeight = _local2._height;
            fixUpBar(_local2, "progress");
            if (_local2.progress_mc != undefined) {
                fixUpBar(_local2, "progressBarFill");
                if (_progressPercent == undefined) {
                    _progressPercent = (_vc.__get__isRTMP() ? 100 : 0);
                }
                positionBar(_local2, "progress", _progressPercent);
            }
            fixUpBar(_local2, "fullness");
            if (_local2.fullness_mc != undefined) {
                fixUpBar(_local2, "fullnessBarFill");
            }
            fixUpBar(_local2, "handle");
            _local2.handle_mc.controlIndex = _arg3;
            switch (_arg3) {
                case SEEK_BAR : 
                    setControl(SEEK_BAR_HANDLE, _local2.handle_mc);
                    break;
                case VOLUME_BAR : 
                    setControl(VOLUME_BAR_HANDLE, _local2.handle_mc);
                    break;
            }
            positionHandle(_arg3);
        }
        function fixUpBar(_arg2, _arg3) {
            if ((_arg2[_arg3 + "LinkageID"] != undefined) && (_arg2[_arg3 + "LinkageID"].length > 0)) {
                var _local1;
                if (_arg2[_arg3 + "Below"]) {
                    _local1 = -1;
                    while (_arg2._parent.getInstanceAtDepth(_local1) != undefined) {
                        _local1--;
                    }
                } else {
                    _arg2[_arg3 + "Below"] = false;
                    _local1 = _arg2._parent.getNextHighestDepth();
                }
                _arg2[_arg3 + "_mc"] = _arg2._parent.attachMovie(_arg2[_arg3 + "LinkageID"], _arg3 + "_mc", _local1);
            }
        }
        function calcBarMargins(_arg1, _arg3, _arg4) {
            var _local2 = _arg1[_arg3 + "_mc"];
            if (_local2 == undefined) {
                return(undefined);
            }
            if ((_arg1[_arg3 + "LeftMargin"] == undefined) && (_local2._parent == _arg1._parent)) {
                _arg1[_arg3 + "LeftMargin"] = _local2._x - _arg1._x;
            }
            if (_arg1[_arg3 + "RightMargin"] == undefined) {
                if (_arg4) {
                    _arg1[_arg3 + "RightMargin"] = _arg1[_arg3 + "LeftMargin"];
                } else if (_local2._parent == _arg1._parent) {
                    _arg1[_arg3 + "RightMargin"] = ((_arg1._width - _local2._width) - _local2._x) + _arg1._x;
                }
            }
            if ((_arg1[_arg3 + "TopMargin"] == undefined) && (_local2._parent == _arg1._parent)) {
                _arg1[_arg3 + "TopMargin"] = _local2._y - _arg1._y;
            }
            if (_arg1[_arg3 + "BottomMargin"] == undefined) {
                if (_arg4) {
                    _arg1[_arg3 + "BottomMargin"] = _arg1[_arg3 + "TopMargin"];
                } else if (_local2._parent == _arg1._parent) {
                    _arg1[_arg3 + "BottomMargin"] = ((_arg1._height - _local2._height) - _local2._y) + _arg1._y;
                }
            }
            if (_arg1[_arg3 + "X"] == undefined) {
                if (_local2._parent == _arg1._parent) {
                    _arg1[_arg3 + "X"] = _local2._x - _arg1._x;
                } else if (_local2._parent == _arg1) {
                    _arg1[_arg3 + "X"] = _local2._x;
                }
            }
            if (_arg1[_arg3 + "Y"] == undefined) {
                if (_local2._parent == _arg1._parent) {
                    _arg1[_arg3 + "Y"] = _local2._y - _arg1._y;
                } else if (_local2._parent == _arg1) {
                    _arg1[_arg3 + "Y"] = _local2._y;
                }
            }
            _arg1[_arg3 + "XScale"] = _local2._xscale;
            _arg1[_arg3 + "YScale"] = _local2._yscale;
            _arg1[_arg3 + "Width"] = _local2._width;
            _arg1[_arg3 + "Height"] = _local2._height;
        }
        function finishAddBufferingBar() {
            var _local2 = controls[BUFFERING_BAR];
            delete _local2.onEnterFrame;
            _local2.onEnterFrame = undefined;
            calcBarMargins(_local2, "fill", true);
            fixUpBar(_local2, "fill");
            if (_local2.fill_mc != undefined) {
                positionMaskedFill(_local2, _local2.fill_mc, 100);
            }
        }
        function positionMaskedFill(_arg2, _arg4, _arg6) {
            var _local5 = _arg4._parent;
            var _local3 = _arg2.mask_mc;
            if (_local3 == undefined) {
                _local3 = _local5.createEmptyMovieClip(_arg2._name + "Mask_mc", _local5.getNextHighestDepth());
                _arg2.mask_mc = _local3;
                _local3.beginFill(16777215);
                _local3.lineTo(0, 0);
                _local3.lineTo(1, 0);
                _local3.lineTo(1, 1);
                _local3.lineTo(0, 1);
                _local3.lineTo(0, 0);
                _local3.endFill();
                _arg4.setMask(_local3);
                _local3._x = _arg2.fillX;
                _local3._y = _arg2.fillY;
                _local3._width = _arg2.fillWidth;
                _local3._height = _arg2.fillHeight;
                _local3._visible = false;
                calcBarMargins(_arg2, "mask", true);
            }
            if (_local5 == _arg2) {
                if (_arg4.slideReveal) {
                    _arg4._x = (_arg2.maskX - _arg2.fillWidth) + ((_arg2.fillWidth * _arg6) / 100);
                } else {
                    _local3._width = (_arg2.fillWidth * _arg6) / 100;
                }
            } else if (_local5 == _arg2._parent) {
                if (_arg4.slideReveal) {
                    _local3._x = _arg2._x + _arg2.maskLeftMargin;
                    _local3._y = _arg2._y + _arg2.maskTopMargin;
                    _local3._width = (_arg2._width - _arg2.maskRightMargin) - _arg2.maskLeftMargin;
                    _local3._height = (_arg2._height - _arg2.maskTopMargin) - _arg2.maskBottomMargin;
                    _arg4._x = (_local3._x - _arg2.fillWidth) + ((_arg2.maskWidth * _arg6) / 100);
                    _arg4._y = _arg2._y + _arg2.fillTopMargin;
                } else {
                    _arg4._x = _arg2._x + _arg2.fillLeftMargin;
                    _arg4._y = _arg2._y + _arg2.fillTopMargin;
                    _local3._x = _arg4._x;
                    _local3._y = _arg4._y;
                    _local3._width = (((_arg2._width - _arg2.fillRightMargin) - _arg2.fillLeftMargin) * _arg6) / 100;
                    _local3._height = (_arg2._height - _arg2.fillTopMargin) - _arg2.fillBottomMargin;
                }
            }
        }
        function startHandleDrag(_arg6) {
            var _local2 = controls[_arg6];
            var _local5 = _local2.handle_mc;
            if ((_local2.startHandleDrag == undefined) || (!_local2.startHandleDrag())) {
                var _local3 = _local2._y + _local2.handleY;
                var _local4 = ((_local2.origWidth == undefined) ? (_local2._width) : (_local2.origWidth));
                _local5.startDrag(false, _local2._x + _local2.handleLeftMargin, _local3, (_local2._x + _local4) - _local2.handleRightMargin, _local3);
            }
            _local2.isDragging = true;
        }
        function stopHandleDrag(_arg4) {
            var _local2 = controls[_arg4];
            var _local3 = _local2.handle_mc;
            if ((_local2.stopHandleDrag == undefined) || (!_local2.stopHandleDrag())) {
                _local3.stopDrag();
            }
            _local2.isDragging = false;
        }
        function positionHandle(_arg6) {
            var _local2 = controls[_arg6];
            var _local3 = _local2.handle_mc;
            if (_local3 == undefined) {
                return(undefined);
            }
            if ((_local2.positionHandle != undefined) && (_local2.positionHandle())) {
                return(undefined);
            }
            var _local4 = ((_local2.origWidth == undefined) ? (_local2._width) : (_local2.origWidth));
            var _local5 = (_local4 - _local2.handleRightMargin) - _local2.handleLeftMargin;
            _local3._x = (_local2._x + _local2.handleLeftMargin) + ((_local5 * _local2.percentage) / 100);
            _local3._y = _local2._y + _local2.handleY;
            if (_local2.fullness_mc != undefined) {
                positionBar(_local2, "fullness", _local2.percentage);
            }
        }
        function positionBar(_arg3, _arg4, _arg5) {
            if ((_arg3.positionBar != undefined) && (_arg3.positionBar(_arg4, _arg5))) {
                return(undefined);
            }
            var _local2 = _arg3[_arg4 + "_mc"];
            if (_local2._parent == _arg3) {
                if (_local2.fill_mc == undefined) {
                    _local2._xscale = (_arg3[_arg4 + "XScale"] * _arg5) / 100;
                } else {
                    positionMaskedFill(_local2, _local2.fill_mc, _arg5);
                }
            } else {
                _local2._x = _arg3._x + _arg3[_arg4 + "LeftMargin"];
                _local2._y = _arg3._y + _arg3[_arg4 + "Y"];
                if (_local2.fill_mc == undefined) {
                    _local2._width = (((_arg3._width - _arg3[_arg4 + "LeftMargin"]) - _arg3[_arg4 + "RightMargin"]) * _arg5) / 100;
                } else {
                    positionMaskedFill(_local2, _local2.fill_mc, _arg5);
                }
            }
        }
        function calcPercentageFromHandle(_arg7) {
            var _local2 = controls[_arg7];
            var _local5 = _local2.handle_mc;
            if ((_local2.calcPercentageFromHandle == undefined) || (!_local2.calcPercentageFromHandle())) {
                var _local3 = ((_local2.origWidth == undefined) ? (_local2._width) : (_local2.origWidth));
                var _local6 = (_local3 - _local2.handleRightMargin) - _local2.handleLeftMargin;
                var _local4 = _local5._x - (_local2._x + _local2.handleLeftMargin);
                _local2.percentage = (_local4 / _local6) * 100;
                if (_local2.fullness_mc != undefined) {
                    positionBar(_local2, "fullness", _local2.percentage);
                }
            }
            if (_local2.percentage < 0) {
                _local2.percentage = 0;
            }
            if (_local2.percentage > 100) {
                _local2.percentage = 100;
            }
        }
        function handleRelease(_arg2) {
            var _local3 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            if (_arg2 == SEEK_BAR) {
                seekBarListener(true);
            } else if (_arg2 == VOLUME_BAR) {
                volumeBarListener(true);
            }
            stopHandleDrag(_arg2);
            _vc.__set__activeVideoPlayerIndex(_local3);
            if (_arg2 == SEEK_BAR) {
                _vc._scrubFinish();
            }
        }
        function seekBarListener(_arg5) {
            var _local3 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            var _local4 = controls[SEEK_BAR];
            calcPercentageFromHandle(SEEK_BAR);
            var _local2 = _local4.percentage;
            if (_arg5) {
                clearInterval(_seekBarIntervalID);
                _seekBarIntervalID = 0;
                if (_local2 != _lastScrubPos) {
                    _vc.seekPercent(_local2);
                }
                _vc.addEventListener("playheadUpdate", this);
                if (_playAfterScrub) {
                    _vc.play();
                }
            } else if (_vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex()).__get__state() == mx.video.VideoPlayer.SEEKING) {
            } else if ((((_seekBarScrubTolerance <= 0) || (Math.abs(_local2 - _lastScrubPos) > _seekBarScrubTolerance)) || (_local2 < _seekBarScrubTolerance)) || (_local2 > (100 - _seekBarScrubTolerance))) {
                if (_local2 != _lastScrubPos) {
                    _lastScrubPos = _local2;
                    _vc.seekPercent(_local2);
                }
            }
            _vc.__set__activeVideoPlayerIndex(_local3);
        }
        function volumeBarListener(_arg4) {
            var _local3 = controls[VOLUME_BAR];
            calcPercentageFromHandle(VOLUME_BAR);
            var _local2 = _local3.percentage;
            if (_arg4) {
                clearInterval(_volumeBarIntervalID);
                _volumeBarIntervalID = 0;
                _vc.addEventListener("volumeUpdate", this);
            }
            if ((((_arg4 || (_volumeBarScrubTolerance <= 0)) || (Math.abs(_local2 - _lastVolumePos) > _volumeBarScrubTolerance)) || (_local2 < _volumeBarScrubTolerance)) || (_local2 > (100 - _volumeBarScrubTolerance))) {
                if (_local2 != _lastVolumePos) {
                    if (_isMuted) {
                        cachedSoundLevel = _local2;
                    } else {
                        _vc.__set__volume(_local2);
                    }
                }
            }
        }
        function doBufferingDelay() {
            clearInterval(_bufferingDelayIntervalID);
            _bufferingDelayIntervalID = 0;
            var _local2 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            if (_vc.__get__state() == mx.video.FLVPlayback.BUFFERING) {
                _bufferingOn = true;
                handleEvent({type:"stateChange", state:mx.video.FLVPlayback.BUFFERING, vp:_vc.__get__visibleVideoPlayerIndex()});
            }
            _vc.__set__activeVideoPlayerIndex(_local2);
        }
        function dispatchMessage(_arg3) {
            if (_arg3.id == SEEK_BAR_HANDLE) {
                _vc._scrubStart();
            }
            var _local2 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            switch (_arg3.id) {
                case PAUSE_BUTTON : 
                    _vc.pause();
                    break;
                case PLAY_BUTTON : 
                    _vc.play();
                    break;
                case STOP_BUTTON : 
                    _vc.stop();
                    break;
                case SEEK_BAR_HANDLE : 
                    calcPercentageFromHandle(SEEK_BAR);
                    _lastScrubPos = controls[SEEK_BAR].percentage;
                    _vc.removeEventListener("playheadUpdate", this);
                    if (_vc.__get__playing() || (_vc.__get__buffering())) {
                        _playAfterScrub = true;
                    } else if (_vc.__get__state() != mx.video.VideoPlayer.SEEKING) {
                        _playAfterScrub = false;
                    }
                    _seekBarIntervalID = setInterval(this, "seekBarListener", _seekBarInterval, false);
                    startHandleDrag(SEEK_BAR, SEEK_BAR_HANDLE);
                    _vc.pause();
                    break;
                case VOLUME_BAR_HANDLE : 
                    calcPercentageFromHandle(VOLUME_BAR);
                    _lastVolumePos = controls[VOLUME_BAR].percentage;
                    _vc.removeEventListener("volumeUpdate", this);
                    _volumeBarIntervalID = setInterval(this, "volumeBarListener", _volumeBarInterval, false);
                    startHandleDrag(VOLUME_BAR, VOLUME_BAR_HANDLE);
                    break;
                case BACK_BUTTON : 
                    _vc.seekToPrevNavCuePoint();
                    break;
                case FORWARD_BUTTON : 
                    _vc.seekToNextNavCuePoint();
                    break;
                case MUTE_ON_BUTTON : 
                case MUTE_OFF_BUTTON : 
                    if (!_isMuted) {
                        _isMuted = true;
                        cachedSoundLevel = _vc.volume;
                        _vc.__set__volume(0);
                    } else {
                        _isMuted = false;
                        _vc.__set__volume(cachedSoundLevel);
                    }
                    setEnabledAndVisibleForState(MUTE_OFF_BUTTON, mx.video.FLVPlayback.PLAYING);
                    skinButtonControl(controls[MUTE_OFF_BUTTON]);
                    setEnabledAndVisibleForState(MUTE_ON_BUTTON, mx.video.FLVPlayback.PLAYING);
                    skinButtonControl(controls[MUTE_ON_BUTTON]);
                    break;
                default : 
                    throw new Error("Unknown ButtonControl");
            }
            _vc.__set__activeVideoPlayerIndex(_local2);
        }
        function setEnabledAndVisibleForState(_arg2, _arg6) {
            var _local5 = _vc.__get__activeVideoPlayerIndex();
            _vc.__set__activeVideoPlayerIndex(_vc.visibleVideoPlayerIndex);
            var _local3 = _arg6;
            if ((_local3 == mx.video.FLVPlayback.BUFFERING) && (!_bufferingOn)) {
                _local3 = mx.video.FLVPlayback.PLAYING;
            }
            switch (_arg2) {
                case VOLUME_BAR : 
                case VOLUME_BAR_HANDLE : 
                    controls[_arg2].myEnabled = true;
                    controls[_arg2].enabled = _controlsEnabled;
                    break;
                case MUTE_ON_BUTTON : 
                    controls[_arg2].myEnabled = !_isMuted;
                    if (controls[MUTE_BUTTON] != undefined) {
                        controls[_arg2]._visible = controls[_arg2].myEnabled;
                    }
                    break;
                case MUTE_OFF_BUTTON : 
                    controls[_arg2].myEnabled = _isMuted;
                    if (controls[MUTE_BUTTON] != undefined) {
                        controls[_arg2]._visible = controls[_arg2].myEnabled;
                    }
                    break;
                default : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.LOADING : 
                        case mx.video.FLVPlayback.CONNECTION_ERROR : 
                            controls[_arg2].myEnabled = false;
                            break;
                        case mx.video.FLVPlayback.DISCONNECTED : 
                            controls[_arg2].myEnabled = _vc.__get__contentPath() != undefined;
                            break;
                        case mx.video.FLVPlayback.SEEKING : 
                            break;
                        default : 
                            controls[_arg2].myEnabled = true;
                            break;
                    }
                    break;
            }
            switch (_arg2) {
                case SEEK_BAR : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.STOPPED : 
                        case mx.video.FLVPlayback.PLAYING : 
                        case mx.video.FLVPlayback.PAUSED : 
                        case mx.video.FLVPlayback.REWINDING : 
                        case mx.video.FLVPlayback.SEEKING : 
                            controls[_arg2].myEnabled = true;
                            break;
                        case mx.video.FLVPlayback.BUFFERING : 
                            controls[_arg2].myEnabled = (!_bufferingBarHides) || (controls[BUFFERING_BAR] == undefined);
                            break;
                        default : 
                            controls[_arg2].myEnabled = false;
                            break;
                    }
                    if (controls[_arg2].myEnabled) {
                        controls[_arg2].myEnabled = (!isNaN(_vc.__get__totalTime())) && (_vc.__get__totalTime() > 0);
                    }
                    controls[_arg2].handle_mc.myEnabled = controls[_arg2].myEnabled;
                    controls[_arg2].handle_mc.enabled = controls[_arg2].handle_mc.myEnabled;
                    controls[_arg2].handle_mc._visible = controls[_arg2].myEnabled;
                    var _local4 = (((!_bufferingBarHides) || (controls[_arg2].myEnabled)) || (controls[BUFFERING_BAR] == undefined)) || (!controls[BUFFERING_BAR]._visible);
                    controls[_arg2]._visible = _local4;
                    controls[_arg2].progress_mc._visible = _local4;
                    controls[_arg2].progress_mc.fill_mc._visible = _local4;
                    controls[_arg2].fullness_mc._visible = _local4;
                    controls[_arg2].progress_mc.fill_mc._visible = _local4;
                    break;
                case BUFFERING_BAR : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.STOPPED : 
                        case mx.video.FLVPlayback.PLAYING : 
                        case mx.video.FLVPlayback.PAUSED : 
                        case mx.video.FLVPlayback.REWINDING : 
                        case mx.video.FLVPlayback.SEEKING : 
                            controls[_arg2].myEnabled = false;
                            break;
                        default : 
                            controls[_arg2].myEnabled = true;
                            break;
                    }
                    controls[_arg2]._visible = controls[_arg2].myEnabled;
                    controls[_arg2].fill_mc._visible = controls[_arg2].myEnabled;
                    break;
                case PAUSE_BUTTON : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.DISCONNECTED : 
                        case mx.video.FLVPlayback.STOPPED : 
                        case mx.video.FLVPlayback.PAUSED : 
                        case mx.video.FLVPlayback.REWINDING : 
                            controls[_arg2].myEnabled = false;
                            break;
                        case mx.video.FLVPlayback.PLAYING : 
                            controls[_arg2].myEnabled = true;
                            break;
                        case mx.video.FLVPlayback.BUFFERING : 
                            controls[_arg2].myEnabled = (!_bufferingBarHides) || (controls[BUFFERING_BAR] == undefined);
                            break;
                    }
                    if (controls[PLAY_PAUSE_BUTTON] != undefined) {
                        controls[_arg2]._visible = controls[_arg2].myEnabled;
                    }
                    break;
                case PLAY_BUTTON : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.PLAYING : 
                            controls[_arg2].myEnabled = false;
                            break;
                        case mx.video.FLVPlayback.STOPPED : 
                        case mx.video.FLVPlayback.PAUSED : 
                            controls[_arg2].myEnabled = true;
                            break;
                        case mx.video.FLVPlayback.BUFFERING : 
                            controls[_arg2].myEnabled = (!_bufferingBarHides) || (controls[BUFFERING_BAR] == undefined);
                            break;
                    }
                    if (controls[PLAY_PAUSE_BUTTON] != undefined) {
                        controls[_arg2]._visible = !controls[PAUSE_BUTTON]._visible;
                    }
                    break;
                case STOP_BUTTON : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.DISCONNECTED : 
                        case mx.video.FLVPlayback.STOPPED : 
                            controls[_arg2].myEnabled = false;
                            break;
                        case mx.video.FLVPlayback.PAUSED : 
                        case mx.video.FLVPlayback.PLAYING : 
                        case mx.video.FLVPlayback.BUFFERING : 
                            controls[_arg2].myEnabled = true;
                            break;
                    }
                    break;
                case BACK_BUTTON : 
                case FORWARD_BUTTON : 
                    switch (_local3) {
                        case mx.video.FLVPlayback.BUFFERING : 
                            controls[_arg2].myEnabled = (!_bufferingBarHides) || (controls[BUFFERING_BAR] == undefined);
                            break;
                        default : 
                    }
            }
            controls[_arg2].enabled = _controlsEnabled && (controls[_arg2].myEnabled);
            _vc.__set__activeVideoPlayerIndex(_local5);
        }
        function setupSkinAutoHide() {
            var _local2 = _vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex());
            if (_skinAutoHide && (skin_mc != undefined)) {
                skinAutoHideHitTest();
                if (_skinAutoHideIntervalID == 0) {
                    _skinAutoHideIntervalID = setInterval(this, "skinAutoHideHitTest", SKIN_AUTO_HIDE_INTERVAL);
                }
            } else {
                skin_mc._visible = __visible;
                clearInterval(_skinAutoHideIntervalID);
                _skinAutoHideIntervalID = 0;
            }
        }
        function skinAutoHideHitTest() {
            if (!__visible) {
                skin_mc._visible = false;
            } else {
                var _local4 = _vc.getVideoPlayer(_vc.__get__visibleVideoPlayerIndex());
                var _local3 = _local4.hitTest(_root._xmouse, _root._ymouse, true);
                if ((!_local3) && (border_mc != undefined)) {
                    _local3 = border_mc.hitTest(_root._xmouse, _root._ymouse, true);
                }
                skin_mc._visible = _local3;
            }
        }
        static var version = "1.0.0.103";
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
    }
