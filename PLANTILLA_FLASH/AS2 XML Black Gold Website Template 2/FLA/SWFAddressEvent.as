class SWFAddressEvent
{
    var _type, _value, _path, _pathNames, _parameters, __get__parametersNames, _parametersNames, __get__parameters, __get__path, __get__pathNames, __get__target, __get__type, __get__value;
    function SWFAddressEvent(type)
    {
        _type = type;
    } // End of the function
    function toString()
    {
        return ("[class SWFAddressEvent]");
    } // End of the function
    function get type()
    {
        return (_type);
    } // End of the function
    function get target()
    {
        return (SWFAddress);
    } // End of the function
    function get value()
    {
        if (typeof(_value) == "undefined")
        {
            _value = SWFAddress.getValue();
        } // end if
        return (_value);
    } // End of the function
    function get path()
    {
        if (typeof(_path) == "undefined")
        {
            _path = SWFAddress.getPath();
        } // end if
        return (_path);
    } // End of the function
    function get pathNames()
    {
        if (typeof(_pathNames) == "undefined")
        {
            _pathNames = SWFAddress.getPathNames();
        } // end if
        return (_pathNames);
    } // End of the function
    function get parameters()
    {
        if (typeof(_parameters) == "undefined")
        {
            _parameters = new Array();
            for (var _loc2 = 0; _loc2 < this.__get__parametersNames().length; ++_loc2)
            {
                _parameters[this.__get__parametersNames()[_loc2]] = SWFAddress.getParameter(this.__get__parametersNames()[_loc2]);
            } // end of for
        } // end if
        return (_parameters);
    } // End of the function
    function get parametersNames()
    {
        if (typeof(_parametersNames) == "undefined")
        {
            _parametersNames = SWFAddress.getParameterNames();
        } // end if
        return (_parametersNames);
    } // End of the function
    static var INIT = "init";
    static var CHANGE = "change";
} // End of Class
