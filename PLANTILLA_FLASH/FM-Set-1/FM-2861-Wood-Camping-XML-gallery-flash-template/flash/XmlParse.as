class XmlParse
{
	function XmlParse (targetXmlStr, f) {
		var thisObj = this;
		var _local2 = new XML();
		_local2.ignoreWhite = true;
		_local2.onLoad = function (success) {
			if (success) {
				thisObj.myXml = this;
				thisObj.init(f);
			} else {
				trace("error loading XML");
			}
		};
		_local2.load(targetXmlStr);
	}
	function init(functionName) {
		if (functionName != undefined) {
			functionName();
		}
	}
}
