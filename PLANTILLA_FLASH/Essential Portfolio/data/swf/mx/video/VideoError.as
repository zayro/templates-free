
//Created by Action Script Viewer - http://www.buraks.com/asv
    class mx.video.VideoError extends Error
    {
        var _code, message, name;
        function VideoError (_arg3, _arg4) {
            super();
            _code = _arg3;
            message = ((("" + _arg3) + ": ") + ERROR_MSG[_arg3 - BASE_ERROR_CODE]) + ((_arg4 == undefined) ? "" : (": " + _arg4));
            name = "VideoError";
        }
        function get code() {
            return(_code);
        }
        static var version = "1.0.0.103";
        static var BASE_ERROR_CODE = 1000;
        static var NO_CONNECTION = 1000;
        static var NO_CUE_POINT_MATCH = 1001;
        static var ILLEGAL_CUE_POINT = 1002;
        static var INVALID_SEEK = 1003;
        static var INVALID_CONTENT_PATH = 1004;
        static var INVALID_XML = 1005;
        static var NO_BITRATE_MATCH = 1006;
        static var DELETE_DEFAULT_PLAYER = 1007;
        static var ERROR_MSG = ["Unable to make connection to server or to find FLV on server", "No matching cue point found", "Illegal cue point", "Invalid seek", "Invalid contentPath", "Invalid xml", "No bitrate match, must be no default flv", "Cannot delete default VideoPlayer"];
    }
