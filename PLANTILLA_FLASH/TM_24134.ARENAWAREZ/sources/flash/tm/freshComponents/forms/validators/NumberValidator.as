dynamic class tm.freshComponents.forms.validators.NumberValidator implements tm.freshComponents.forms.validators.IFormValidator
{
    var biggerThanMaxError: String = "biggerThanMaxError";
    var lowerThanMinError: String = "lowerThanMinError";
    var notANumberError: String = "notANumberError";
    var negativeError: String = "negativeError";
    var _validationErrorMessage;
    var allowNegative;
    var maxValue;
    var minValue;

    function NumberValidator()
    {
    }

    function updateProperties(data)
    {
        if (data.minValue.value && Number(data.minValue.value) > 0) 
        {
            this.minValue = data.minValue.value;
        }
        if (data.maxValue.value && Number(data.maxValue.value) > 0) 
        {
            this.maxValue = data.maxValue.value;
        }
        this.allowNegative = data.allowNegative.value && data.allowNegative.value == "true" ? true : false;
    }

    function validate(value)
    {
        if (String(value).length > 0) 
        {
            value = Number(value);
            if (!value || isNaN(value)) 
            {
                this._validationErrorMessage = this.notANumberError;
                return false;
            }
            if (!this.allowNegative && value < 0) 
            {
                this._validationErrorMessage = this.negativeError;
                return false;
            }
            if (value > this.maxValue) 
            {
                this._validationErrorMessage = this.biggerThanMaxError;
                return false;
            }
            if (value < this.minValue) 
            {
                this._validationErrorMessage = this.lowerThanMinError;
                return false;
            }
        }
        return true;
    }

    function error()
    {
        return this._validationErrorMessage;
    }

}
