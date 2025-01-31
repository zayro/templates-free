<?php
/*
 * This field is using for hide and show
 * groups of another fields. It is using for
 * more undestandable interface.
 */
class NHP_Options_select_hide_show_opts extends NHP_Options{

    /**
     * Field Constructor.
     *
     * Required - must call the parent constructor, then assign field and value to vars, and obviously call the render field function
     *
     * @since NHP_Options 1.0.1
     */
    function __construct($field = array(), $value ='', $parent){

        parent::__construct($parent->sections, $parent->args, $parent->extra_tabs);
        $this->field = $field;
        $this->value = $value;

        //$this->render();

    }//function


    /**
     * Field Render Function.
     *
     * Takes the vars and outputs the HTML for the field in the settings
     *
     * @since NHP_Options 1.0.1
     */
    function render(){
        $class = (isset($this->field['class']))?$this->field['class']:'';
        echo '<select id="'.$this->field['id'].'"  name="'.$this->args['opt_name'].'['.$this->field['id'].']" class="'.$class.' nhp-opts-select-hide-show-opts" >';
        foreach($this->field['options'] as $k => $v){
            echo '<option value="'.$k.'" '.selected($this->value, $k, false).' data-opts="'.$this->field['options_to_show'][$k].'" data-allow="'.$v.'">'.$v.'</option>';
        }//foreach
        echo '</select>';
        echo (isset($this->field['desc']) && !empty($this->field['desc']))?' <span class="description">'.$this->field['desc'].'</span>':'';
    }//function

    /**
     * Enqueue Function.
     *
     * If this field requires any scripts, or css define this function and register/enqueue the scripts/css
     *
     * @since NHP_Options 1.0.1
     */
    function enqueue(){

        wp_enqueue_script(
            'nhp-opts-select-hide-below-js',
            NHP_OPTIONS_URL.'fields/select_hide_show_opts/field_select_hide_show_opts.js',
            array('jquery'),
            time(),
            true
        );

    }//function

}//class
?>