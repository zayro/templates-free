class caurina.transitions.properties.SoundShortcuts
{
    function SoundShortcuts()
    {
        trace ("This is an static class and should not be instantiated.");
    } // End of the function
    static function init()
    {
        caurina.transitions.Tweener.registerSpecialProperty("_sound_volume", caurina.transitions.properties.SoundShortcuts._sound_volume_get, caurina.transitions.properties.SoundShortcuts._sound_volume_set);
        caurina.transitions.Tweener.registerSpecialProperty("_sound_pan", caurina.transitions.properties.SoundShortcuts._sound_pan_get, caurina.transitions.properties.SoundShortcuts._sound_pan_set);
    } // End of the function
    static function _sound_volume_get(p_obj)
    {
        return (p_obj.getVolume());
    } // End of the function
    static function _sound_volume_set(p_obj, p_value)
    {
        p_obj.setVolume(p_value);
    } // End of the function
    static function _sound_pan_get(p_obj)
    {
        return (p_obj.getPan());
    } // End of the function
    static function _sound_pan_set(p_obj, p_value)
    {
        p_obj.setPan(p_value);
    } // End of the function
} // End of Class
