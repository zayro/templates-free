class com.pixelbreaker.event.EventBroadcaster
{
    var _listeners;
    function EventBroadcaster()
    {
        _listeners = [];
    } // End of the function
    function addListener(obj)
    {
        if (this.indexOf(obj) == -1)
        {
            _listeners.push(obj);
            return (true);
        } // end if
        return (false);
    } // End of the function
    function removeListener(obj)
    {
        for (var _loc3 = false; this.indexOf(obj) != -1; _loc3 = true)
        {
            _listeners.splice(this.indexOf(obj), 1);
        } // end of for
        return (_loc3);
    } // End of the function
    function broadcastMessage(method)
    {
        var _loc3;
        var _loc4;
        var _loc5 = arguments.splice(1);
        for (var _loc3 = 0; _loc3 < _listeners.length; ++_loc3)
        {
            _loc4 = _listeners[_loc3];
            _loc4[method].apply(_loc4, _loc5);
            if (_loc4 == undefined)
            {
                _listeners.splice(_loc3--, 1);
            } // end if
        } // end of for
    } // End of the function
    function indexOf(str)
    {
        var _loc3 = -1;
        for (var _loc2 = 0; _loc2 < _listeners.length; ++_loc2)
        {
            if (_listeners[_loc2] == str)
            {
                _loc3 = _loc2;
                break;
            } // end if
        } // end of for
        return (_loc3);
    } // End of the function
} // End of Class
