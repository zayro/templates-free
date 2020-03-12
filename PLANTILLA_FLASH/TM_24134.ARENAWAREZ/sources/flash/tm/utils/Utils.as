dynamic class tm.utils.Utils
{

    function Utils()
    {
    }

    static function searchAndReplace(haystack, needle, replacement)
    {
        var __reg1 = haystack.split(needle);
        return __reg1.join(replacement);
    }

    static function inArray(target, array)
    {
        var __reg1 = 0;
        while (__reg1 < array.length) 
        {
            if (array[__reg1] == target) 
            {
                return true;
            }
            ++__reg1;
        }
        return false;
    }

    static function getFullObjectPath(holder, objectPath)
    {
        return String(holder) + "." + objectPath;
    }

    static function traceObject(object, name, dec)
    {
        var __reg3 = "";
        var __reg5 = "  ";
        var __reg2 = 0;
        while (__reg2 < dec) 
        {
            __reg3 = __reg3 + (__reg5 + "|");
            ++__reg2;
        }
        if (name == undefined) 
        {
            trace(__reg3 + "[Object]");
        }
        else 
        {
            trace(__reg3 + "[" + name + "]");
        }
        __reg3 = __reg3 + (__reg5 + "+");
        for (var __reg7 in object) 
        {
            if (typeof object[__reg7] != "object") 
            {
                trace(__reg3 + "[" + typeof object[__reg7] + "|" + __reg7 + "]" + " = " + object[__reg7]);
            }
        }
        for (var __reg6 in object) 
        {
            if (typeof object[__reg6] == "object") 
            {
                tm.utils.Utils.traceObject(object[__reg6], __reg6, dec + 1);
            }
        }
    }

}
