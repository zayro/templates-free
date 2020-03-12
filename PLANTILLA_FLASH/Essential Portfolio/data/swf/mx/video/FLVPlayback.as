
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.video.FLVPlayback extends MovieClip
    {
        var _autoPlay, _autoRewind, _autoSize, _bufferTime, _contentPath, _cuePoints, _idleTimeout, _isLive, _aspectRatio, _seekToPrevOffset, _playheadUpdateInterval, _progressInterval, _totalTime, _transform, _volume, _skinAutoHide, _bufferingBarHides, _origHeight, _prevHeight, __height, _height, _origWidth, _prevWidth, __width, _width, _scaleX, _scaleY, _xscale, _yscale, _preSeekTime, _firstStreamReady, _firstStreamShown, _activeVP, _visibleVP, _topVP, _vp, _vpState, _cpMgr, boundingBox_mc, preview_mc, dispatchEvent, _uiMgr, _bufferingBar, _backButton, __get__cuePoints, _forwardButton, _muteButton, _pauseButton, _playButton, _playPauseButton, _seekBar, _seekBarInterval, _seekBarScrubTolerance, _skin, _stopButton, _visible, _volumeBar, _volumeBarInterval, _volumeBarScrubTolerance, _x, _y, attachMovie, createEmptyMovieClip;
        function FLVPlayback () {
            super();
            mx.events.EventDispatcher.initialize(this);
            if (_autoPlay == undefined) {
                _autoPlay = true;
            }
            if (_autoRewind == undefined) {
                _autoRewind = true;
            }
            if (_autoSize == undefined) {
                _autoSize = false;
            }
            if (_bufferTime == undefined) {
                _bufferTime = 0.1;
            }
            if (_contentPath == undefined) {
                _contentPath = "";
            }
            if (_cuePoints == undefined) {
                _cuePoints = null;
            }
            if (_idleTimeout == undefined) {
                _idleTimeout = mx.video.VideoPlayer.DEFAULT_IDLE_TIMEOUT_INTERVAL;
            }
            if (_isLive == undefined) {
                _isLive = false;
            }
            if (_aspectRatio == undefined) {
                _aspectRatio = true;
            }
            if (_seekToPrevOffset == undefined) {
                _seekToPrevOffset = SEEK_TO_PREV_OFFSET_DEFAULT;
            }
            if (_playheadUpdateInterval == undefined) {
                _playheadUpdateInterval = mx.video.VideoPlayer.DEFAULT_UPDATE_PROGRESS_INTERVAL;
            }
            if (_progressInterval == undefined) {
                _progressInterval = mx.video.VideoPlayer.DEFAULT_UPDATE_TIME_INTERVAL;
            }
            if (_totalTime == undefined) {
                _totalTime = 0;
            }
            if (_transform == undefined) {
                _transform = null;
            }
            if (_volume == undefined) {
                _volume = 100;
            }
            if (_skinAutoHide == undefined) {
                _skinAutoHide = false;
            }
            if (_bufferingBarHides == undefined) {
                _bufferingBarHides = false;
            }
            _origHeight = (_prevHeight = (__height = _height));
            _origWidth = (_prevWidth = (__width = _width));
            _scaleX = 100;
            _scaleY = 100;
            _xscale = 100;
            _yscale = 100;
            _preSeekTime = -1;
            _firstStreamReady = false;
            _firstStreamShown = false;
            createUIManager();
            _activeVP = 0;
            _visibleVP = 0;
            _topVP = 0;
            _vp = new Array();
            _vpState = new Array();
            _cpMgr = new Array();
            createVideoPlayer(0);
            _vp[0].visible = false;
            _vp[0].volume = 0;
            boundingBox_mc._visible = false;
            boundingBox_mc.unloadMovie();
            delete boundingBox_mc;
            if (_global.isLivePreview) {
                createLivePreviewMovieClip();
                setSize(__width, __height);
            }
            _cpMgr[0].processCuePointsProperty(_cuePoints);
            delete _cuePoints;
            _cuePoints = null;
        }
        function setSize(_arg5, _arg4) {
            if (_global.isLivePreview) {
                if (preview_mc == undefined) {
                    createLivePreviewMovieClip();
                }
                preview_mc.box_mc._width = _arg5;
                preview_mc.box_mc._height = _arg4;
                if ((preview_mc.box_mc._width < preview_mc.icon_mc._width) || (preview_mc.box_mc._height < preview_mc.icon_mc._height)) {
                    preview_mc.icon_mc._visible = false;
                } else {
                    preview_mc.icon_mc._visible = true;
                    preview_mc.icon_mc._x = (preview_mc.box_mc._width - preview_mc.icon_mc._width) / 2;
                    preview_mc.icon_mc._y = (preview_mc.box_mc._height - preview_mc.icon_mc._height) / 2;
                }
            }
            if ((_arg5 == width) && (_arg4 == height)) {
                return(undefined);
            }
            _prevWidth = (__width = _arg5);
            _prevHeight = (__height = _arg4);
            var _local3 = 0;
            while (_local3 < _vp.length) {
                if (_vp[_local3] != undefined) {
                    _vp[_local3].setSize(_arg5, _arg4);
                }
                _local3++;
            }
            dispatchEvent({type:"resize", x:x, y:y, width:_arg5, height:_arg4});
        }
        function setScale(_arg4, _arg3) {
            if ((_arg4 == scaleX) && (_arg3 == scaleY)) {
                return(undefined);
            }
            _scaleX = _arg4;
            _scaleY = _arg3;
            var _local2 = 0;
            while (_local2 < _vp.length) {
                if (_vp[_local2] != undefined) {
                    _vp[_local2].setSize((_origWidth * _arg4) / 100, (_origHeight * _arg3) / 100);
                }
                _local2++;
            }
            dispatchEvent({type:"resize", x:x, y:y, width:width, height:height});
        }
        function handleEvent(_arg2) {
            var _local3 = _arg2.state;
            if (((_arg2.state != undefined) && (_arg2.target._name == _visibleVP)) && (scrubbing)) {
                _local3 = SEEKING;
            }
            if (_arg2.type == "metadataReceived") {
                _cpMgr[_arg2.target._name].processFLVCuePoints(_arg2.info.cuePoints);
                dispatchEvent({type:_arg2.type, info:_arg2.info, vp:_arg2.target._name});
            } else if (_arg2.type == "cuePoint") {
                if (_cpMgr[_arg2.target._name].isFLVCuePointEnabled(_arg2.info)) {
                    dispatchEvent({type:_arg2.type, info:_arg2.info, vp:_arg2.target._name});
                }
            } else if (_arg2.type == "rewind") {
                dispatchEvent({type:_arg2.type, auto:true, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                _cpMgr[_arg2.target._name].resetASCuePointIndex(_arg2.playheadTime);
            } else if (_arg2.type == "resize") {
                dispatchEvent({type:_arg2.type, x:x, y:y, width:width, height:height, auto:true, vp:_arg2.target._name});
                _prevWidth = __width;
                _prevHeight = __height;
            } else if (_arg2.type == "playheadUpdate") {
                dispatchEvent({type:_arg2.type, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                if ((_preSeekTime >= 0) && (_arg2.target.state != SEEKING)) {
                    var _local5 = _preSeekTime;
                    _preSeekTime = -1;
                    _cpMgr[_arg2.target._name].resetASCuePointIndex(_arg2.playheadTime);
                    dispatchEvent({type:"seek", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                    if (_local5 < _arg2.playheadTime) {
                        dispatchEvent({type:"fastForward", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                    } else if (_local5 > _arg2.playheadTime) {
                        dispatchEvent({type:"rewind", auto:false, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                    }
                }
                _cpMgr[_arg2.target._name].dispatchASCuePoints();
            } else if (_arg2.type == "stateChange") {
                var _local4 = _arg2.target._name;
                if ((_local4 == _visibleVP) && (scrubbing)) {
                    return(undefined);
                }
                if (_arg2.state == mx.video.VideoPlayer.RESIZING) {
                    return(undefined);
                }
                if (((_vpState[_local4].prevState == LOADING) && (_vpState[_local4].autoPlay)) && (_arg2.state == STOPPED)) {
                    return(undefined);
                }
                _vpState[_local4].prevState = _arg2.state;
                dispatchEvent({type:_arg2.type, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                if (_vp[_arg2.target._name].state != _local3) {
                    return(undefined);
                }
                switch (_local3) {
                    case BUFFERING : 
                        dispatchEvent({type:"buffering", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                        break;
                    case PAUSED : 
                        dispatchEvent({type:"paused", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                        break;
                    case PLAYING : 
                        dispatchEvent({type:"playing", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                        break;
                    case STOPPED : 
                        dispatchEvent({type:"stopped", state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
                        break;
                }
            } else if (_arg2.type == "progress") {
                dispatchEvent({type:_arg2.type, bytesLoaded:_arg2.bytesLoaded, bytesTotal:_arg2.bytesTotal, vp:_arg2.target._name});
            } else if (_arg2.type == "ready") {
                var _local4 = _arg2.target._name;
                if (!_firstStreamReady) {
                    if (_local4 == _visibleVP) {
                        _firstStreamReady = true;
                        if (_uiMgr.__get__skinReady() && (!_firstStreamShown)) {
                            _uiMgr.__set__visible(true);
                            showFirstStream();
                        }
                    }
                } else if ((_firstStreamShown && (_local3 == STOPPED)) && _vpState[_local4].autoPlay) {
                    _vp[_local4].play();
                }
                dispatchEvent({type:_arg2.type, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
            } else if ((_arg2.type == "close") || (_arg2.type == "complete")) {
                dispatchEvent({type:_arg2.type, state:_local3, playheadTime:_arg2.playheadTime, vp:_arg2.target._name});
            }
        }
        function load(_arg2, _arg4, _arg3) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            if (((_arg2 == undefined) || (_arg2 == null)) || (_arg2 == "")) {
                return(undefined);
            }
            autoPlay = (false);
            if (_arg4 != undefined) {
                totalTime = (_arg4);
            }
            if (_arg3 != undefined) {
                isLive = (_arg3);
            }
            contentPath = (_arg2);
        }
        function play(_arg3, _arg4, _arg2) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            if (_arg3 == undefined) {
                _vp[_activeVP].play();
            } else {
                autoPlay = (true);
                if (_arg4 != undefined) {
                    totalTime = (_arg4);
                }
                if (_arg2 != undefined) {
                    isLive = (_arg2);
                }
                contentPath = (_arg3);
            }
        }
        function pause() {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            _vp[_activeVP].pause();
        }
        function stop() {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            _vp[_activeVP].stop();
        }
        function seek(_arg2) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            _preSeekTime = playheadTime;
            _vp[_activeVP].seek(_arg2);
        }
        function seekSeconds(_arg2) {
            this.seek(_arg2);
        }
        function seekPercent(_arg2) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            if (((((_arg2 < 0) || (_arg2 > 100)) || (_vp[_activeVP].totalTime == undefined)) || (_vp[_activeVP].totalTime == null)) || (_vp[_activeVP].totalTime <= 0)) {
                throw new mx.video.VideoError(mx.video.VideoError.INVALID_SEEK);
            }
            this.seek((_vp[_activeVP].totalTime * _arg2) / 100);
        }
        function get playheadPercentage() {
            if (((_vp[_activeVP].totalTime == undefined) || (_vp[_activeVP].totalTime == null)) || (_vp[_activeVP].totalTime <= 0)) {
                return(undefined);
            }
            return((_vp[_activeVP].playheadTime / _vp[_activeVP].totalTime) * 100);
        }
        function set playheadPercentage(_arg2) {
            seekPercent(_arg2);
            //return(playheadPercentage);
        }
        function seekToNavCuePoint(_arg4) {
            var _local3;
            switch (typeof(_arg4)) {
                case "string" : 
                    _local3 = {name:_arg4};
                    break;
                case "number" : 
                    _local3 = {time:_arg4};
                    break;
                case "object" : 
                    _local3 = _arg4;
                    break;
            }
            if (((_local3.name == null) || (_local3.name == undefined)) || (typeof(_local3.name) != "string")) {
                seekToNextNavCuePoint(_local3.time);
                return(undefined);
            }
            if (isNaN(_local3.time)) {
                _local3.time = 0;
            }
            var _local2 = findNearestCuePoint(_arg4, NAVIGATION);
            while ((_local2 != null) && ((_local2.time < _local3.time) || (!isFLVCuePointEnabled(_local2)))) {
                _local2 = findNextCuePointWithName(_local2);
            }
            if (_local2 == null) {
                throw new mx.video.VideoError(mx.video.VideoError.INVALID_SEEK);
            }
            this.seek(_local2.time);
        }
        function seekToNextNavCuePoint(_arg4) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            if (isNaN(_arg4) || (_arg4 < 0)) {
                _arg4 = _vp[_activeVP].playheadTime + 0.001;
            }
            var _local3;
            _local3 = findNearestCuePoint(_arg4, NAVIGATION);
            if (_local3 == null) {
                this.seek(_vp[_activeVP].totalTime);
                return(undefined);
            }
            var _local2 = _local3.index;
            if (_local3.time < _arg4) {
                _local2++;
            }
            while ((_local2 < _local3["array"].length) && (!isFLVCuePointEnabled(_local3["array"][_local2]))) {
                _local2++;
            }
            if (_local2 >= _local3["array"].length) {
                var _local5 = _vp[_activeVP].totalTime;
                if (_local3["array"][_local3["array"].length - 1].time > _local5) {
                    _local5 = _local3["array"][_local3["array"].length - 1];
                }
                this.seek(_local5);
            } else {
                this.seek(_local3["array"][_local2].time);
            }
        }
        function seekToPrevNavCuePoint(_arg4) {
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            if (isNaN(_arg4) || (_arg4 < 0)) {
                _arg4 = _vp[_activeVP].playheadTime;
            }
            var _local3 = findNearestCuePoint(_arg4, NAVIGATION);
            if (_local3 == null) {
                this.seek(0);
                return(undefined);
            }
            var _local2 = _local3.index;
            while ((_local2 >= 0) && ((!isFLVCuePointEnabled(_local3["array"][_local2])) || (_local3["array"][_local2].time >= (_arg4 - _seekToPrevOffset)))) {
                _local2--;
            }
            if (_local2 < 0) {
                this.seek(0);
            } else {
                this.seek(_local3["array"][_local2].time);
            }
        }
        function addASCuePoint(_arg4, _arg2, _arg3) {
            return(_cpMgr[_activeVP].addASCuePoint(_arg4, _arg2, _arg3));
        }
        function removeASCuePoint(_arg2) {
            return(_cpMgr[_activeVP].removeASCuePoint(_arg2));
        }
        function findCuePoint(_arg2, _arg3) {
            switch (_arg3) {
                case "event" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].eventCuePoints, false, _arg2));
                case "navigation" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].navCuePoints, false, _arg2));
                case "flv" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].flvCuePoints, false, _arg2));
                case "actionscript" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].asCuePoints, false, _arg2));
                case "all" : 
            }
            return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].allCuePoints, false, _arg2));
        }
        function findNearestCuePoint(_arg2, _arg3) {
            switch (_arg3) {
                case "event" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].eventCuePoints, true, _arg2));
                case "navigation" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].navCuePoints, true, _arg2));
                case "flv" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].flvCuePoints, true, _arg2));
                case "actionscript" : 
                    return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].asCuePoints, true, _arg2));
                case "all" : 
            }
            return(_cpMgr[_activeVP].getCuePoint(_cpMgr[_activeVP].allCuePoints, true, _arg2));
        }
        function findNextCuePointWithName(_arg2) {
            return(_cpMgr[_activeVP].getNextCuePointWithName(_arg2));
        }
        function setFLVCuePointEnabled(_arg3, _arg2) {
            return(_cpMgr[_activeVP].setFLVCuePointEnabled(_arg3, _arg2));
        }
        function isFLVCuePointEnabled(_arg2) {
            return(_cpMgr[_activeVP].isFLVCuePointEnabled(_arg2));
        }
        function getNextHighestDepth() {
            var _local2 = super.getNextHighestDepth();
            return(((_local2 < 1000) ? 1000 : (_local2)));
        }
        function bringVideoPlayerToFront(_arg2) {
            if ((_arg2 == _topVP) || (_vp[_arg2] == undefined)) {
                return(undefined);
            }
            _vp[_topVP].swapDepths(_vp[_arg2].getDepth());
            _topVP = _arg2;
        }
        function getVideoPlayer(_arg2) {
            return(_vp[_arg2]);
        }
        function closeVideoPlayer(_arg2) {
            if (_vp[_arg2] == undefined) {
                return(undefined);
            }
            if (_arg2 == 0) {
                throw new mx.video.VideoError(mx.video.VideoError.DELETE_DEFAULT_PLAYER);
            }
            if (_visibleVP == _arg2) {
                visibleVideoPlayerIndex = (0);
            }
            if (_activeVP == _arg2) {
                activeVideoPlayerIndex = (0);
            }
            _vp[_arg2].close();
            _vp[_arg2].unloadMovie();
            delete _vp[_arg2];
            _vp[_arg2] = undefined;
        }
        function get activeVideoPlayerIndex() {
            return(_activeVP);
        }
        function set activeVideoPlayerIndex(_arg2) {
            if (_activeVP == _arg2) {
                return;
            }
            if (_vp[_activeVP].onEnterFrame != undefined) {
                doContentPathConnect();
            }
            _activeVP = _arg2;
            if (_vp[_activeVP] == undefined) {
                createVideoPlayer(_activeVP);
                _vp[_activeVP].visible = false;
                _vp[_activeVP].volume = 0;
            }
            //return(activeVideoPlayerIndex);
        }
        function get autoPlay() {
            if (_vpState[_activeVP] == undefined) {
                return(_autoPlay);
            }
            return(_vpState[_activeVP].autoPlay);
        }
        function set autoPlay(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _autoPlay = _arg2;
            }
            _vpState[_activeVP].autoPlay = _arg2;
            //return(autoPlay);
        }
        function get autoRewind() {
            if (_vp[_activeVP] == undefined) {
                return(_autoRewind);
            }
            return(_vp[_activeVP].autoRewind);
        }
        function set autoRewind(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _autoRewind = _arg2;
            }
            _vp[_activeVP].autoRewind = _arg2;
            //return(autoRewind);
        }
        function get autoSize() {
            if (_vp[_activeVP] == undefined) {
                return(_autoSize);
            }
            return(_vp[_activeVP].autoSize);
        }
        function set autoSize(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _autoSize = _arg2;
            }
            _vp[_activeVP].autoSize = _arg2;
            //return(autoSize);
        }
        function get bitrate() {
            return(ncMgr.getBitrate());
        }
        function set bitrate(_arg2) {
            ncMgr.setBitrate(_arg2);
            //return(bitrate);
        }
        function get buffering() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_vp[_activeVP].state == BUFFERING);
        }
        function get bufferingBar() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _bufferingBar = _uiMgr.getControl(mx.video.UIManager.BUFFERING_BAR);
            }
            return(_bufferingBar);
        }
        function set bufferingBar(_arg2) {
            _bufferingBar = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.BUFFERING_BAR, _arg2);
            }
            //return(bufferingBar);
        }
        function get bufferingBarHidesAndDisablesOthers() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _bufferingBarHides = _uiMgr.bufferingBarHidesAndDisablesOthers;
            }
            return(_bufferingBarHides);
        }
        function set bufferingBarHidesAndDisablesOthers(_arg2) {
            _bufferingBarHides = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__bufferingBarHidesAndDisablesOthers(_arg2);
            }
            //return(bufferingBarHidesAndDisablesOthers);
        }
        function get backButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _backButton = _uiMgr.getControl(mx.video.UIManager.BACK_BUTTON);
            }
            return(_backButton);
        }
        function set backButton(_arg2) {
            _backButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.BACK_BUTTON, _arg2);
            }
            //return(backButton);
        }
        function get bufferTime() {
            if (_vp[_activeVP] == undefined) {
                return(_bufferTime);
            }
            return(_vp[_activeVP].bufferTime);
        }
        function set bufferTime(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _bufferTime = _arg2;
            }
            _vp[_activeVP].bufferTime = _arg2;
            //return(bufferTime);
        }
        function get bytesLoaded() {
            return(_vp[_activeVP].bytesLoaded);
        }
        function get bytesTotal() {
            return(_vp[_activeVP].bytesTotal);
        }
        function get contentPath() {
            if ((_vp[_activeVP] == undefined) || (_vp[_activeVP].onEnterFrame != undefined)) {
                return(_contentPath);
            }
            return(_vp[_activeVP].url);
        }
        function set contentPath(_arg3) {
            if (_global.isLivePreview) {
                return;
            }
            if (_vp[_activeVP] == undefined) {
                if (_arg3 == _contentPath) {
                    return;
                }
                _contentPath = _arg3;
            } else {
                if (_vp[_activeVP].url == _arg3) {
                    return;
                }
                _vpState[_activeVP].minProgressPercent = undefined;
                if (_vp[_activeVP].onEnterFrame != undefined) {
                    delete _vp[_activeVP].onEnterFrame;
                    _vp[_activeVP].onEnterFrame = undefined;
                }
                _cpMgr[_activeVP].reset();
                if (_vpState[_activeVP].autoPlay && (_firstStreamShown)) {
                    _vp[_activeVP].play(_arg3, _vpState[_activeVP].isLive, _vpState[_activeVP].totalTime);
                } else {
                    _vp[_activeVP].load(_arg3, _vpState[_activeVP].isLive, _vpState[_activeVP].totalTime);
                }
                _vpState[_activeVP].isLiveSet = false;
                _vpState[_activeVP].totalTimeSet = false;
            }
            //return(contentPath);
        }
        function set cuePoints(_arg2) {
            if (_cuePoints != undefined) {
                return;
            }
            _cuePoints = _arg2;
            //return(__get__cuePoints());
        }
        function get forwardButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _forwardButton = _uiMgr.getControl(mx.video.UIManager.FORWARD_BUTTON);
            }
            return(_forwardButton);
        }
        function set forwardButton(_arg2) {
            _forwardButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.FORWARD_BUTTON, _arg2);
            }
            //return(forwardButton);
        }
        function get height() {
            if (_global.isLivePreview) {
                return(__height);
            }
            if (_vp[_visibleVP] != undefined) {
                __height = _vp[_visibleVP].height;
            }
            return(__height);
        }
        function set height(_arg2) {
            setSize(width, _arg2);
            //return(height);
        }
        function get idleTimeout() {
            if (_vp[_activeVP] == undefined) {
                return(_idleTimeout);
            }
            return(_vp[_activeVP].idleTimeout);
        }
        function set idleTimeout(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _idleTimeout = _arg2;
            }
            _vp[_activeVP].idleTimeout = _arg2;
            //return(idleTimeout);
        }
        function get isRTMP() {
            if (_global.isLivePreview) {
                return(true);
            }
            if (_vp[_activeVP] == undefined) {
                return(undefined);
            }
            return(_vp[_activeVP].isRTMP);
        }
        function get isLive() {
            if (_vp[_activeVP] == undefined) {
                return(_isLive);
            } else if (_vpState[_activeVP].isLiveSet) {
                return(_vpState[_activeVP].isLive);
            } else {
                return(_vp[_activeVP].isLive);
            }
        }
        function set isLive(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _isLive = _arg2;
            }
            _vpState[_activeVP].isLive = _arg2;
            _vpState[_activeVP].isLiveSet = true;
            //return(isLive);
        }
        function get maintainAspectRatio() {
            if (_vp[_activeVP] == undefined) {
                return(_aspectRatio);
            }
            return(_vp[_activeVP].maintainAspectRatio);
        }
        function set maintainAspectRatio(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _aspectRatio = _arg2;
            }
            _vp[_activeVP].maintainAspectRatio = _arg2;
            //return(maintainAspectRatio);
        }
        function get metadata() {
            if (_vp[_activeVP] == undefined) {
                return(null);
            }
            return(_vp[_activeVP].metadata);
        }
        function get metadataLoaded() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_cpMgr[_activeVP].metadataLoaded);
        }
        function get muteButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _muteButton = _uiMgr.getControl(mx.video.UIManager.MUTE_BUTTON);
            }
            return(_muteButton);
        }
        function set muteButton(_arg2) {
            _muteButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.MUTE_BUTTON, _arg2);
            }
            //return(muteButton);
        }
        function get ncMgr() {
            if (_vp[_activeVP] == undefined) {
                return(null);
            }
            return(_vp[_activeVP].ncMgr);
        }
        function get pauseButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _pauseButton = _uiMgr.getControl(mx.video.UIManager.PAUSE_BUTTON);
            }
            return(_pauseButton);
        }
        function set pauseButton(_arg2) {
            _pauseButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.PAUSE_BUTTON, _arg2);
            }
            //return(pauseButton);
        }
        function get paused() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_vp[_activeVP].state == PAUSED);
        }
        function get playButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _playButton = _uiMgr.getControl(mx.video.UIManager.PLAY_BUTTON);
            }
            return(_playButton);
        }
        function set playButton(_arg2) {
            _playButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.PLAY_BUTTON, _arg2);
            }
            //return(playButton);
        }
        function get playheadTime() {
            if (_vp[_activeVP] == undefined) {
                return(0);
            }
            return(_vp[_activeVP].playheadTime);
        }
        function set playheadTime(_arg2) {
            this.seek(_arg2);
            //return(playheadTime);
        }
        function get playheadUpdateInterval() {
            if (_vp[_activeVP] == undefined) {
                return(_playheadUpdateInterval);
            }
            return(_vp[_activeVP].playheadUpdateInterval);
        }
        function set playheadUpdateInterval(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _playheadUpdateInterval = _arg2;
            }
            _cpMgr[_activeVP].playheadUpdateInterval = _arg2;
            _vp[_activeVP].playheadUpdateInterval = _arg2;
            //return(playheadUpdateInterval);
        }
        function get playing() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_vp[_activeVP].state == PLAYING);
        }
        function get playPauseButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _playPauseButton = _uiMgr.getControl(mx.video.UIManager.PLAY_PAUSE_BUTTON);
            }
            return(_playPauseButton);
        }
        function set playPauseButton(_arg2) {
            _playPauseButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.PLAY_PAUSE_BUTTON, _arg2);
            }
            //return(playPauseButton);
        }
        function get preferredHeight() {
            if (_vp[_activeVP] == undefined) {
                return(0);
            }
            return(_vp[_activeVP].videoHeight);
        }
        function get preferredWidth() {
            if (_vp[_activeVP] == undefined) {
                return(0);
            }
            return(_vp[_activeVP].videoWidth);
        }
        function get progressInterval() {
            if (_vp[_activeVP] == undefined) {
                return(_progressInterval);
            }
            return(_vp[_activeVP].progressInterval);
        }
        function set progressInterval(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _progressInterval = _arg2;
            }
            _vp[_activeVP].progressInterval = _arg2;
            //return(progressInterval);
        }
        function get scaleX() {
            if (_vp[_visibleVP] != undefined) {
                _scaleX = (_vp[_visibleVP].width / _origWidth) * 100;
            }
            return(_scaleX);
        }
        function set scaleX(_arg2) {
            setScale(_arg2, scaleY);
            //return(scaleX);
        }
        function get scaleY() {
            if (_vp[_visibleVP] != undefined) {
                _scaleY = (_vp[_visibleVP].height / _origHeight) * 100;
            }
            return(_scaleY);
        }
        function set scaleY(_arg2) {
            setScale(scaleX, _arg2);
            //return(scaleY);
        }
        function get scrubbing() {
            var _local2 = seekBar;
            if ((_local2 == undefined) || (_local2.isDragging == undefined)) {
                return(false);
            }
            return(_local2.isDragging);
        }
        function get seekBar() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _seekBar = _uiMgr.getControl(mx.video.UIManager.SEEK_BAR);
            }
            return(_seekBar);
        }
        function set seekBar(_arg2) {
            _seekBar = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.SEEK_BAR, _arg2);
            }
            //return(seekBar);
        }
        function get seekBarInterval() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _seekBarInterval = _uiMgr.seekBarInterval;
            }
            return(_seekBarInterval);
        }
        function set seekBarInterval(_arg2) {
            _seekBarInterval = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__seekBarInterval(_seekBarInterval);
            }
            //return(seekBarInterval);
        }
        function get seekBarScrubTolerance() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _seekBarScrubTolerance = _uiMgr.seekBarScrubTolerance;
            }
            return(_seekBarScrubTolerance);
        }
        function set seekBarScrubTolerance(_arg2) {
            _seekBarScrubTolerance = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__seekBarScrubTolerance(_seekBarScrubTolerance);
            }
            //return(seekBarScrubTolerance);
        }
        function get seekToPrevOffset() {
            return(_seekToPrevOffset);
        }
        function set seekToPrevOffset(_arg2) {
            _seekToPrevOffset = _arg2;
            //return(seekToPrevOffset);
        }
        function get skin() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _skin = _uiMgr.skin;
            }
            return(_skin);
        }
        function set skin(_arg2) {
            _skin = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__skin(_arg2);
            }
            //return(skin);
        }
        function get skinAutoHide() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _skinAutoHide = _uiMgr.skinAutoHide;
            }
            return(_skinAutoHide);
        }
        function set skinAutoHide(_arg3) {
            if (_global.isLivePreview) {
                return;
            }
            _skinAutoHide = _arg3;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__skinAutoHide(_arg3);
            }
            //return(skinAutoHide);
        }
        function get transform() {
            return(_transform);
        }
        function set transform(_arg2) {
            _transform = _arg2;
            if (_vp[_activeVP] != undefined) {
                _vp[_activeVP].transform = _transform;
            }
            //return(transform);
        }
        function get state() {
            if (_global.isLivePreview) {
                return(STOPPED);
            }
            if (_vp[_activeVP] == undefined) {
                return(DISCONNECTED);
            }
            if ((_activeVP == _visibleVP) && (scrubbing)) {
                return(SEEKING);
            }
            var _local3 = _vp[_activeVP].state;
            if (_local3 == mx.video.VideoPlayer.RESIZING) {
                return(LOADING);
            }
            if (((_vpState[_activeVP].prevState == LOADING) && (_vpState[_activeVP].autoPlay)) && (_local3 == STOPPED)) {
                return(LOADING);
            }
            return(_local3);
        }
        function get stateResponsive() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_vp[_activeVP].stateResponsive);
        }
        function get stopButton() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _stopButton = _uiMgr.getControl(mx.video.UIManager.STOP_BUTTON);
            }
            return(_stopButton);
        }
        function set stopButton(_arg2) {
            _stopButton = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.STOP_BUTTON, _arg2);
            }
            //return(stopButton);
        }
        function get stopped() {
            if (_vp[_activeVP] == undefined) {
                return(false);
            }
            return(_vp[_activeVP].state == STOPPED);
        }
        function get totalTime() {
            if (_global.isLivePreview) {
                return(1);
            }
            if (_vp[_activeVP] == undefined) {
                return(_totalTime);
            } else if (_vpState[_activeVP].totalTimeSet) {
                return(_vpState[_activeVP].totalTime);
            } else {
                return(_vp[_activeVP].totalTime);
            }
        }
        function set totalTime(_arg2) {
            if ((_activeVP == 0) || (_activeVP == undefined)) {
                _totalTime = _arg2;
            }
            _vpState[_activeVP].totalTime = _arg2;
            _vpState[_activeVP].totalTimeSet = true;
            //return(totalTime);
        }
        function get visible() {
            return(_visible);
        }
        function set visible(_arg2) {
            _visible = _arg2;
            //return(visible);
        }
        function get visibleVideoPlayerIndex() {
            return(_visibleVP);
        }
        function set visibleVideoPlayerIndex(_arg3) {
            if (_visibleVP == _arg3) {
                return;
            }
            var _local2 = _visibleVP;
            if (_vp[_arg3] == undefined) {
                createVideoPlayer(_arg3);
            }
            var _local5 = (_vp[_arg3].height != _vp[_visibleVP].height) || (_vp[_arg3].width != _vp[_visibleVP].width);
            _vp[_visibleVP].visible = false;
            _vp[_visibleVP].volume = 0;
            _visibleVP = _arg3;
            if (_firstStreamShown) {
                _uiMgr.setupSkinAutoHide(_local2);
                _vp[_visibleVP].visible = true;
                if (!scrubbing) {
                    _vp[_visibleVP].volume = _volume;
                }
            } else if ((_vp[_visibleVP].stateResponsive && (_vp[_visibleVP].state != DISCONNECTED)) && (_uiMgr.__get__skinReady())) {
                _uiMgr.__set__visible(true);
                _uiMgr.setupSkinAutoHide(_local2);
                _firstStreamReady = true;
                showFirstStream();
            }
            if ((_vp[_local2].height != _vp[_visibleVP].height) || (_vp[_local2].width != _vp[_visibleVP].width)) {
                dispatchEvent({type:"resize", x:x, y:y, width:width, height:height, auto:false, vp:_visibleVP});
            }
            _uiMgr.handleEvent({type:"stateChange", state:_vp[_visibleVP].state, vp:_visibleVP});
            _uiMgr.handleEvent({type:"playheadUpdate", playheadTime:_vp[_visibleVP].playheadTime, vp:_visibleVP});
            if (_vp[_visibleVP].isRTMP) {
                _uiMgr.handleEvent({type:"ready", vp:_visibleVP});
            } else {
                _uiMgr.handleEvent({type:"progress", bytesLoaded:_vp[_visibleVP].bytesLoaded, bytesTotal:_vp[_visibleVP].bytesTotal, vp:_visibleVP});
            }
            //return(visibleVideoPlayerIndex);
        }
        function get volume() {
            return(_volume);
        }
        function set volume(_arg2) {
            if (_volume == _arg2) {
                return;
            }
            _volume = _arg2;
            if (!scrubbing) {
                _vp[_visibleVP].volume = _volume;
            }
            dispatchEvent({type:"volumeUpdate", volume:_arg2});
            //return(volume);
        }
        function get volumeBar() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _volumeBar = _uiMgr.getControl(mx.video.UIManager.VOLUME_BAR);
            }
            return(_volumeBar);
        }
        function set volumeBar(_arg2) {
            _volumeBar = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.setControl(mx.video.UIManager.VOLUME_BAR, _arg2);
            }
            //return(volumeBar);
        }
        function get volumeBarInterval() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _volumeBarInterval = _uiMgr.volumeBarInterval;
            }
            return(_volumeBarInterval);
        }
        function set volumeBarInterval(_arg2) {
            _volumeBarInterval = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__volumeBarInterval(_volumeBarInterval);
            }
            //return(volumeBarInterval);
        }
        function get volumeBarScrubTolerance() {
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _volumeBarScrubTolerance = _uiMgr.volumeBarScrubTolerance;
            }
            return(_volumeBarScrubTolerance);
        }
        function set volumeBarScrubTolerance(_arg2) {
            _volumeBarScrubTolerance = _arg2;
            if ((_uiMgr != null) && (_uiMgr != undefined)) {
                _uiMgr.__set__volumeBarScrubTolerance(_volumeBarScrubTolerance);
            }
            //return(volumeBarScrubTolerance);
        }
        function get width() {
            if (_global.isLivePreview) {
                return(__width);
            }
            if (_vp[_visibleVP] != undefined) {
                __width = _vp[_visibleVP].width;
            }
            return(__width);
        }
        function set width(_arg2) {
            setSize(_arg2, height);
            //return(width);
        }
        function get x() {
            return(_x);
        }
        function set x(_arg2) {
            _x = _arg2;
            //return(x);
        }
        function get y() {
            return(_y);
        }
        function set y(_arg2) {
            _y = _arg2;
            //return(y);
        }
        function createVideoPlayer(_arg3) {
            if (_global.isLivePreview) {
                return(undefined);
            }
            var _local4 = width;
            var _local5 = height;
            _vp[_arg3] = mx.video.VideoPlayer(this.attachMovie("VideoPlayer", String(_arg3), VP_DEPTH_OFFSET + _arg3));
            _vp[_arg3].setSize(_local4, _local5);
            _topVP = _arg3;
            _vp[_arg3].autoRewind = _autoRewind;
            _vp[_arg3].autoSize = _autoSize;
            _vp[_arg3].bufferTime = _bufferTime;
            _vp[_arg3].idleTimeout = _idleTimeout;
            _vp[_arg3].maintainAspectRatio = _aspectRatio;
            _vp[_arg3].playheadUpdateInterval = _playheadUpdateInterval;
            _vp[_arg3].progressInterval = _progressInterval;
            _vp[_arg3].transform = _transform;
            _vp[_arg3].volume = _volume;
            if (_arg3 == 0) {
                _vpState[_arg3] = {id:_arg3, isLive:_isLive, isLiveSet:true, totalTime:_totalTime, totalTimeSet:true, autoPlay:_autoPlay};
                if (((_contentPath != null) && (_contentPath != undefined)) && (_contentPath != "")) {
                    _vp[_arg3].onEnterFrame = mx.utils.Delegate.create(this, doContentPathConnect);
                }
            } else {
                _vpState[_arg3] = {id:_arg3, isLive:false, isLiveSet:true, totalTime:0, totalTimeSet:true, autoPlay:false};
            }
            _vp[_arg3].addEventListener("resize", this);
            _vp[_arg3].addEventListener("close", this);
            _vp[_arg3].addEventListener("complete", this);
            _vp[_arg3].addEventListener("cuePoint", this);
            _vp[_arg3].addEventListener("playheadUpdate", this);
            _vp[_arg3].addEventListener("progress", this);
            _vp[_arg3].addEventListener("metadataReceived", this);
            _vp[_arg3].addEventListener("stateChange", this);
            _vp[_arg3].addEventListener("ready", this);
            _vp[_arg3].addEventListener("rewind", this);
            _cpMgr[_arg3] = new mx.video.CuePointManager(this, _arg3);
            _cpMgr[_arg3].playheadUpdateInterval = _playheadUpdateInterval;
        }
        function createUIManager() {
            _uiMgr = new mx.video.UIManager(this);
            _uiMgr.__set__visible(false);
            if ((_backButton != undefined) && (_backButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.BACK_BUTTON, _backButton);
            }
            if ((_bufferingBar != undefined) && (_bufferingBar != null)) {
                _uiMgr.setControl(mx.video.UIManager.BUFFERING_BAR, _bufferingBar);
            }
            _uiMgr.__set__bufferingBarHidesAndDisablesOthers(_bufferingBarHides);
            if ((_forwardButton != undefined) && (_forwardButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.FORWARD_BUTTON, _forwardButton);
            }
            if ((_pauseButton != undefined) && (_pauseButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.PAUSE_BUTTON, _pauseButton);
            }
            if ((_playButton != undefined) && (_playButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.PLAY_BUTTON, _playButton);
            }
            if ((_playPauseButton != undefined) && (_playPauseButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.PLAY_PAUSE_BUTTON, _playPauseButton);
            }
            if ((_stopButton != undefined) && (_stopButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.STOP_BUTTON, _stopButton);
            }
            if ((_seekBar != undefined) && (_seekBar != null)) {
                _uiMgr.setControl(mx.video.UIManager.SEEK_BAR, _seekBar);
            }
            if ((_seekBarInterval != undefined) && (_seekBarInterval != null)) {
                _uiMgr.__set__seekBarInterval(_seekBarInterval);
            }
            if ((_seekBarScrubTolerance != undefined) && (_seekBarScrubTolerance != null)) {
                _uiMgr.__set__seekBarScrubTolerance(_seekBarScrubTolerance);
            }
            if ((_skin != undefined) && (_skin != null)) {
                _uiMgr.__set__skin(_skin);
            }
            if ((_skinAutoHide != undefined) && (_skinAutoHide != null)) {
                _uiMgr.__set__skinAutoHide(_skinAutoHide);
            }
            if ((_muteButton != undefined) && (_muteButton != null)) {
                _uiMgr.setControl(mx.video.UIManager.MUTE_BUTTON, _muteButton);
            }
            if ((_volumeBar != undefined) && (_volumeBar != null)) {
                _uiMgr.setControl(mx.video.UIManager.VOLUME_BAR, _volumeBar);
            }
            if ((_volumeBarInterval != undefined) && (_volumeBarInterval != null)) {
                _uiMgr.__set__volumeBarInterval(_volumeBarInterval);
            }
            if ((_volumeBarScrubTolerance != undefined) && (_volumeBarScrubTolerance != null)) {
                _uiMgr.__set__volumeBarScrubTolerance(_volumeBarScrubTolerance);
            }
        }
        function createLivePreviewMovieClip() {
            preview_mc = this.createEmptyMovieClip("preview_mc", 10);
            preview_mc.createEmptyMovieClip("box_mc", 10);
            preview_mc.box_mc.beginFill(0);
            preview_mc.box_mc.moveTo(0, 0);
            preview_mc.box_mc.lineTo(0, 100);
            preview_mc.box_mc.lineTo(100, 100);
            preview_mc.box_mc.lineTo(100, 0);
            preview_mc.box_mc.lineTo(0, 0);
            preview_mc.box_mc.endFill();
            preview_mc.attachMovie("Icon", "icon_mc", 20);
        }
        function doContentPathConnect() {
            delete _vp[0].onEnterFrame;
            _vp[0].onEnterFrame = undefined;
            if (_global.isLivePreview) {
                return(undefined);
            }
            if (_vpState[0].autoPlay && (_firstStreamShown)) {
                _vp[0].play(_contentPath, _isLive, _totalTime);
            } else {
                _vp[0].load(_contentPath, _isLive, _totalTime);
            }
            _vpState[0].isLiveSet = false;
            _vpState[0].totalTimeSet = false;
        }
        function showFirstStream() {
            _firstStreamShown = true;
            _vp[_visibleVP].visible = true;
            if (!scrubbing) {
                _vp[_visibleVP].volume = _volume;
            }
            var _local2 = 0;
            while (_local2 < _vp.length) {
                if (((_vp[_local2] != undefined) && (_vp[_local2].state == STOPPED)) && (_vpState[_local2].autoPlay)) {
                    _vp[_local2].play();
                }
                _local2++;
            }
        }
        function _scrubStart() {
            var _local2 = playheadTime;
            _vp[_visibleVP].volume = 0;
            dispatchEvent({type:"stateChange", state:SEEKING, playheadTime:_local2, vp:_visibleVP});
            dispatchEvent({type:"scrubStart", state:SEEKING, playheadTime:_local2});
        }
        function _scrubFinish() {
            var _local3 = playheadTime;
            var _local2 = state;
            _vp[_visibleVP].volume = _volume;
            if (_local2 != SEEKING) {
                dispatchEvent({type:"stateChange", state:_local2, playheadTime:_local3, vp:_visibleVP});
            }
            dispatchEvent({type:"scrubFinish", state:_local2, playheadTime:_local3});
        }
        function skinError(_arg2) {
            if (_firstStreamReady && (!_firstStreamShown)) {
                showFirstStream();
            }
            dispatchEvent({type:"skinError", message:_arg2});
        }
        function skinLoaded() {
            if (_firstStreamReady) {
                _uiMgr.__set__visible(true);
                if (!_firstStreamShown) {
                    showFirstStream();
                }
            } else if (((_contentPath == undefined) || (_contentPath == null)) || (_contentPath == "")) {
                _uiMgr.__set__visible(true);
            }
            dispatchEvent({type:"skinLoaded"});
        }
        static var version = "1.0.0.103";
        static var DISCONNECTED = "disconnected";
        static var STOPPED = "stopped";
        static var PLAYING = "playing";
        static var PAUSED = "paused";
        static var BUFFERING = "buffering";
        static var LOADING = "loading";
        static var CONNECTION_ERROR = "connectionError";
        static var REWINDING = "rewinding";
        static var SEEKING = "seeking";
        static var ALL = "all";
        static var EVENT = "event";
        static var NAVIGATION = "navigation";
        static var FLV = "flv";
        static var ACTIONSCRIPT = "actionscript";
        static var VP_DEPTH_OFFSET = 100;
        static var SEEK_TO_PREV_OFFSET_DEFAULT = 1;
    }
