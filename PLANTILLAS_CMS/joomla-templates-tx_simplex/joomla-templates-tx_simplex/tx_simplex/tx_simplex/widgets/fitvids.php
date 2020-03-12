<?php
/**
 * @package     Expose
 * @subpackage  Bootstrap Theme
 * @version     1.0
 * @author      ThemeXpert http://www.themexpert.com
 * @copyright   Copyright (C) 2010 - 2011 ThemeXpert
 * @license     http://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3
 **/

//prevent direct access
defined ('EXPOSE_VERSION') or die ('resticted aceess');

//import parent gist class
expose_import('core.widget');

class ExposeWidgetFitvids extends ExposeWidget{
    
    public $name = 'fitvids';

    public function isEnabled()
    {
        return TRUE;
    }

    public function init()
    {
        global $expose;

        $expose->addLink('jquery.fitvids.js', 'js', 11);

        $js = 'jQuery(".container").fitVids();';

        $expose->addjQDom($js);
    }

}

?>

