dynamic class tm.freshComponents.forms.Form extends MovieClip
{
    var xmlFilesPrefix: String = "";
    var formConfigurationPath: String = "fcFormConfiguration.xml";
    var formStructurePath: String = "fcFormStructure.xml";
    var formItemsPrefix: String = "tf_";
    var messageTextFieldPath: String = "cfMessage";
    var submitButtonPath: String = "bSubmit";
    var resetButtonPath: String = "bReset";
    var buttonsOverLabel: String = "over";
    var buttonsOutLabel: String = "out";
    var _formConfiguration;
    var _formManager;
    var _formStructure;
    var _holder;
    var _items;
    var _parent;
    var _validationMessages;
    var _visible;
    var contactFormObject;
    var handlerFilePath;
    var mail;
    var messageTextField;

    function Form()
    {
        super();
        mx.events.EventDispatcher.initialize(this);
        this._visible = false;
        this._holder = this._parent;
        trace("Forms Component - Version 0.81");
        this.init();
    }

    function init()
    {
        this._items = new Array();
        this._formManager = new tm.freshComponents.forms.FormManager();
        this._formManager.submitButton = eval(String(this._holder) + "." + this.submitButtonPath);
        this._formManager.resetButton = eval(String(this._holder) + "." + this.resetButtonPath);
        this._formManager.buttonsOverLabel = this.buttonsOverLabel;
        this._formManager.buttonsOutLabel = this.buttonsOutLabel;
        this.messageTextField = eval(String(this._holder) + "." + this.messageTextFieldPath);
        this.messageTextField.text = "";
        if (this.xmlFilesPrefix && this.xmlFilesPrefix.length > 0 && eval(String(this.xmlFilesPrefix)) != undefined) 
        {
            this.xmlFilesPrefix = eval(String(this.xmlFilesPrefix)) + "_";
        }
        this.loadConfig(this.formConfigurationPath, this.onConfigurationLoaded);
    }

    function loadConfig(configurationPath, callback)
    {
        var __reg2 = new tm.utils.XMLParser();
        __reg2.load(this.xmlFilesPrefix + configurationPath, this, callback);
    }

    function onStructureLoaded(success, data)
    {
        if (success) 
        {
            this._formStructure = data;
            var __reg13 = false;
            var __reg3 = this._formStructure.formItems[0].item;
            var __reg2 = 0;
            while (__reg2 < __reg3.length) 
            {
                var __reg5 = __reg3[__reg2].id;
                if (__reg5 && __reg5 > 0 && __reg5 <= __reg3.length && this._formManager.getFormItem(__reg5) == undefined) 
                {
                    var __reg4 = {id: __reg5, label: __reg3[__reg2].label, required: __reg3[__reg2].required, type: __reg3[__reg2].type};
                    for (var __reg8 in __reg3[__reg2]) 
                    {
                        if (!__reg4[__reg8]) 
                        {
                            __reg4[__reg8] = new Object();
                            if (__reg3[__reg2][__reg8][0].value) 
                            {
                                __reg4[__reg8].value = __reg3[__reg2][__reg8][0].value;
                            }
                            else 
                            {
                                if (__reg3[__reg2][__reg8][0].item && __reg3[__reg2][__reg8][0].item.length > 0) 
                                {
                                    __reg4[__reg8].value = __reg3[__reg2][__reg8][0].item;
                                }
                            }
                            for (var __reg7 in __reg3[__reg2][__reg8][0]) 
                            {
                                if (__reg7 != "value") 
                                {
                                    __reg4[__reg8][__reg7] = __reg3[__reg2][__reg8][0][__reg7];
                                }
                            }
                        }
                    }
                    this._formManager.addNewItem(__reg4);
                }
                else 
                {
                    __reg13 = true;
                }
                ++__reg2;
            }
            if (__reg13) 
            {
                trace("Structure Error. Please check you xml structure file.");
            }
            else 
            {
                var __reg6 = 1;
                while (this._holder[this.formItemsPrefix + __reg6]) 
                {
                    this._items.push(this._holder[this.formItemsPrefix + __reg6]);
                    this._formManager.getFormItem(__reg6).__set__target(this._holder[this.formItemsPrefix + __reg6]);
                    ++__reg6;
                }
                this._formManager.init();
            }
            return;
        }
        trace("Couldn\'t load structure.");
    }

    function onConfigurationLoaded(success, data)
    {
        if (success) 
        {
            this._formConfiguration = data;
            this._formManager.validateRequiredOnly = this.getConfigOption("validateRequiredOnly") == "true" ? true : false;
            this._formManager.submitFormOnEnter = this.getConfigOption("submitFormOnEnter") == "true" ? true : false;
            this.handlerFilePath = this.getConfigOption("serverProcessorFileName") + "." + this.getConfigOption("serverProcessorType");
            this._validationMessages = new Object();
            var __reg3 = this._formConfiguration.validationErrorMessages[0].message;
            var __reg2 = undefined;
            __reg2 = 0;
            while (__reg2 < __reg3.length) 
            {
                this._validationMessages[__reg3[__reg2].type] = __reg3[__reg2].value;
                ++__reg2;
            }
            this._formManager.onValidationError = tm.utils.Delegate.create(this, this.onFormValidationError);
            this._formManager.onFormGroupValidationError = tm.utils.Delegate.create(this, this.onFormGroupValidationError);
            this._formManager.onValidFormSubmit = tm.utils.Delegate.create(this, this.onValidFormSubmit);
            this._formManager.onFormReset = tm.utils.Delegate.create(this, this.onFormReset);
            this.loadConfig(this.formStructurePath, this.onStructureLoaded);
            return;
        }
        trace("Couldn\'t load configuration.");
    }

    function onFormValidationError(formItem, validationError)
    {
        var __reg2 = this._validationMessages[validationError];
        __reg2 = tm.utils.Utils.searchAndReplace(__reg2, "{LABEL}", formItem.__get__label());
        this.messageTextField.text = __reg2;
        this.showMessage(__reg2);
    }

    function onFormGroupValidationError(group, validationError)
    {
        var __reg2 = this._validationMessages[validationError];
        __reg2 = tm.utils.Utils.searchAndReplace(__reg2, "{LABEL}", group.name);
        this.messageTextField.text = __reg2;
        this.showMessage(__reg2);
    }

    function onValidFormSubmit()
    {
        this.messageTextField.text = this.getConfigOption("formProcessingText");
        this.showMessage(this.getConfigOption("formProcessingText"));
        var __reg4 = new LoadVars();
        var __reg7 = new LoadVars();
        __reg7.contactFormObject = this;
        __reg7.onLoad = this.onServerResponse;
        var __reg3 = this._formManager.getFormData();
        var __reg5 = Number(this.getConfigOption("emailFromSource"));
        if (!(__reg5 && __reg5 > 0)) 
        {
            __reg4.mail_from = this.getConfigOption("emailFromSource");
        }
        var __reg6 = Number(this.getConfigOption("subjectSource"));
        if (!(__reg6 && __reg6 > 0)) 
        {
            __reg4.mail_subject = this.getConfigOption("subjectSource");
        }
        var __reg8 = Number(this.getConfigOption("emailTo"));
        if (__reg8 && __reg8 > 0) 
        {
            __reg4.mail_to = __reg3[__reg8 - 1].value;
        }
        else 
        {
            __reg4.mail_to = this.getConfigOption("emailTo");
        }
        __reg4.plain_text = this.getConfigOption("plainText");
        __reg4.smtp_server = this.getConfigOption("smtpServer");
        __reg4.smtp_port = this.getConfigOption("smtpPort");
        var __reg2 = __reg3.length - 1;
        while (__reg2 >= 0) 
        {
            if (__reg5 && __reg5 > 0 && __reg5 == __reg3[__reg2].id || __reg6 && __reg6 > 0 && __reg6 == __reg3[__reg2].id) 
            {
                if (__reg5 == __reg3[__reg2].id) 
                {
                    __reg4.mail_from = __reg3[__reg2].value;
                }
                else 
                {
                    __reg4.mail_subject = __reg3[__reg2].value;
                }
            }
            else 
            {
                __reg4[__reg3[__reg2].key] = __reg3[__reg2].value;
            }
            --__reg2;
        }
        __reg4.sendAndLoad(this.handlerFilePath, __reg7, "POST");
    }

    function onFormReset()
    {
        this.messageTextField.text = "";
        this.hideMessage();
    }

    function onServerResponse(success)
    {
        var __reg2 = this.contactFormObject;
        if (success) 
        {
            if (this.mail == 1) 
            {
                __reg2._formManager.resetForm();
                __reg2.messageTextField.text = __reg2.getConfigOption("messageSentText");
                __reg2.showMessage(__reg2.getConfigOption("messageSentText"));
            }
            else 
            {
                __reg2.messageTextField.text = __reg2.getConfigOption("messageSentFailedText");
                __reg2.showMessage(__reg2.getConfigOption("messageSentFailedText"));
            }
            return;
        }
        __reg2.messageTextField.text = __reg2.getConfigOption("messageSentFailedText");
        __reg2.showMessage(__reg2.getConfigOption("messageSentFailedText"));
    }

    function getConfigOption(name)
    {
        return this._formConfiguration[name][0].value;
    }

    function getStructureOption(name)
    {
        return this._formStructure[name][0].value;
    }

    function showMessage(message)
    {
        var __reg2 = {target: this, type: "onSubmit", message: message};
        this.dispatchEvent(__reg2);
    }

    function hideMessage()
    {
        var __reg2 = {target: this, type: "onReset"};
        this.dispatchEvent(__reg2);
    }

    function dispatchEvent()
    {
    }

    function addEventListener()
    {
    }

    function removeEventListener()
    {
    }

}
