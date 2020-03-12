dynamic class tm.freshComponents.forms.formItems.RadiobuttonItem extends tm.freshComponents.forms.formItems.FormItem
{
    var _group;
    var _target;
    var _type;
    var selected;
    var updateGroups;

    function RadiobuttonItem(formManager, id, label, required)
    {
        super(formManager, id, label, required);
        this._type = tm.freshComponents.forms.formItems.FormItemType.RADIOBUTTON;
    }

    function updateParameters(data)
    {
        this.selected = data.selected.value && data.selected.value == "true" ? true : false;
        this.updateGroups(data);
    }

    function validate()
    {
        return true;
    }

    function getValue()
    {
        return String(mx.controls.RadioButton(this._target).selected);
    }

    function init()
    {
        this.reset();
    }

    function reset()
    {
        mx.controls.RadioButton(this._target).selected = this.selected;
    }

    function get target()
    {
        return this._target;
    }

    function set target(targetObject)
    {
        this._target = targetObject;
        mx.controls.RadioButton(this._target).__set__groupName(this._group.name);
    }

}
