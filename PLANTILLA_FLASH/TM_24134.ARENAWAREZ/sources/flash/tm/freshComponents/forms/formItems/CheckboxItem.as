dynamic class tm.freshComponents.forms.formItems.CheckboxItem extends tm.freshComponents.forms.formItems.FormItem
{
    var selected: Boolean = false;
    var _required;
    var _target;
    var _type;
    var fieldRequiredError;
    var updateGroups;
    var validationError;

    function CheckboxItem(formManager, id, label, required)
    {
        super(formManager, id, label, required);
        this._type = tm.freshComponents.forms.formItems.FormItemType.CHECKBOX;
    }

    function updateParameters(data)
    {
        this.selected = data.selected.value && data.selected.value == "true" ? true : false;
        this.updateGroups(data);
    }

    function validate()
    {
        if (this._required && this.getValue() == "false") 
        {
            this.validationError = this.fieldRequiredError;
            return false;
        }
        return true;
    }

    function getValue()
    {
        return String(mx.controls.CheckBox(this._target).selected);
    }

    function init()
    {
        this.reset();
    }

    function reset()
    {
        mx.controls.CheckBox(this._target).selected = this.selected;
    }

}
