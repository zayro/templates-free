dynamic class tm.freshComponents.forms.formItems.FormItemsGroup
{
    var delimiter: String = "";
    var shouldBeEqual: Boolean = false;
    var minRequirementError: String = "minRequirementError";
    var maxRequirementError: String = "maxRequirementError";
    var shouldBeEqualError: String = "shouldBeEqualError";
    var _groupItemsCollection;
    var maxRequired;
    var minRequired;
    var name;
    var validationError;

    function FormItemsGroup(groupName, groupParameters)
    {
        this.name = groupName;
        this._groupItemsCollection = new Array();
        if (groupParameters.delimiter && groupParameters.delimiter.length > 0) 
        {
            this.delimiter = groupParameters.delimiter;
        }
        if (groupParameters.minRequired && Number(groupParameters.minRequired) > 0) 
        {
            this.minRequired = groupParameters.minRequired;
        }
        if (groupParameters.maxRequired && Number(groupParameters.maxRequired) > 0) 
        {
            this.maxRequired = groupParameters.maxRequired;
        }
        if (groupParameters.shouldBeEqual && groupParameters.shouldBeEqual == "true") 
        {
            this.shouldBeEqual = true;
        }
    }

    function addNewItem(formItem)
    {
        if (this.itemExists(formItem)) 
        {
            return;
        }
        this._groupItemsCollection.push(formItem);
    }

    function validate()
    {
        var __reg4 = 0;
        var __reg6 = true;
        var __reg5 = tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[0]).getValue();
        var __reg3 = 0;
        while (__reg3 < this._groupItemsCollection.length) 
        {
            var __reg2 = tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[__reg3]);
            if (__reg5 != tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[__reg3]).getValue()) 
            {
                __reg6 = false;
            }
            if (__reg2.__get__type() == tm.freshComponents.forms.formItems.FormItemType.RADIOBUTTON) 
            {
                if (__reg2.getValue() == "true") 
                {
                    ++__reg4;
                }
            }
            else 
            {
                if (__reg2.__get__type() == tm.freshComponents.forms.formItems.FormItemType.CHECKBOX) 
                {
                    if (__reg2.getValue() == "true") 
                    {
                        ++__reg4;
                    }
                }
                else 
                {
                    if (__reg2.getValue() && __reg2.getValue().length > 0) 
                    {
                        ++__reg4;
                    }
                }
            }
            ++__reg3;
        }
        if (this.minRequired && this.minRequired && __reg4 < this.minRequired) 
        {
            this.validationError = this.minRequirementError;
            return false;
        }
        if (this.maxRequired && this.maxRequired && __reg4 > this.maxRequired) 
        {
            this.validationError = this.maxRequirementError;
            return false;
        }
        if (this.shouldBeEqual == true && !__reg5 || !__reg6) 
        {
            this.validationError = this.shouldBeEqualError;
            return false;
        }
        return true;
    }

    function getData()
    {
        var __reg5 = "";
        var __reg2 = undefined;
        if (this.shouldBeEqual == true && this._groupItemsCollection.length > 0 && this._groupItemsCollection[0]) 
        {
            __reg2 = tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[0]);
            __reg5 = __reg2.getValue();
        }
        else 
        {
            var __reg6 = false;
            var __reg4 = new Array();
            var __reg3 = 0;
            while (__reg3 < this._groupItemsCollection.length) 
            {
                __reg2 = tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[__reg3]);
                if (__reg2.__get__type() == tm.freshComponents.forms.formItems.FormItemType.RADIOBUTTON) 
                {
                    if (__reg2.getValue() == "true") 
                    {
                        __reg5 = __reg2.label;
                    }
                }
                else 
                {
                    __reg6 = true;
                    if (__reg2.__get__type() == tm.freshComponents.forms.formItems.FormItemType.CHECKBOX) 
                    {
                        if (__reg2.getValue() == "true") 
                        {
                            __reg4.push(__reg2.__get__label());
                        }
                    }
                    else 
                    {
                        __reg4.push(__reg2.getValue());
                    }
                }
                ++__reg3;
            }
            if (__reg6) 
            {
                __reg5 = __reg4.join(this.delimiter);
            }
        }
        return __reg5;
    }

    function itemExists(formItem)
    {
        var __reg2 = 0;
        while (__reg2 < this._groupItemsCollection.length) 
        {
            if (tm.freshComponents.forms.formItems.FormItem(this._groupItemsCollection[__reg2]).__get__id() == formItem.__get__id()) 
            {
                return true;
            }
            ++__reg2;
        }
        return false;
    }

}
