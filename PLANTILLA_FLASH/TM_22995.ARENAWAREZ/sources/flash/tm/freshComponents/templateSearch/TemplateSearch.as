class tm.freshComponents.templateSearch.TemplateSearch extends MovieClip
{
	var _visible, _holder, _parent, _pagesContentCollection, _rawParsedXMLData;
	function TemplateSearch () {
		super();
		mx.events.EventDispatcher.initialize(this);
		_visible = false;
		_holder = _parent;
		init();
	}
	function search(key) {
		var _local5 = new Array();
		if (_isReadyForSearch) {
			var _local2 = 0;
			while (_local2 < _pagesContentCollection.length) {
				if (!_pagesContentCollection[_local2].strippedContent) {
					_pagesContentCollection[_local2].strippedContent = stripTags(_pagesContentCollection[_local2].content);
				}
				var _local4 = doSearch(key, _pagesContentCollection[_local2].strippedContent);
				if (_local4.occurences > 0) {
					var _local3 = _pagesContentCollection[_local2];
					_local3.strippedContent = _pagesContentCollection[_local2].strippedContent;
					_local3.occurences = _local4.occurences;
					_local3.occurencesPositions = _local4.occurencesPositions;
					_local5.push(_local3);
				}
				_local2++;
			}
			_local5.sortOn("occurences", Array.DESCENDING | Array.NUMERIC);
		}
		return(_local5);
	}
	function init() {
		var _local2 = tm.utils.Utils.getObjectByPath(xmlDataSource);
		if (_local2) {
			_rawParsedXMLData = _local2;
			extractPagesContent();
		} else {
			var _local3 = new tm.utils.XMLParser();
			_local3.load(xmlDataSource, this, onDataLoaded);
		}
	}
	function onDataLoaded(success, data) {
		if (success) {
			_rawParsedXMLData = data;
			extractPagesContent();
		} else {
			trace("Couldn't load xml data.");
		}
	}
	function getXMLSectionNumber(sectionName) {
		var _local2 = 0;
		while (_rawParsedXMLData.section[_local2]) {
			if (_rawParsedXMLData.section[_local2].name == sectionName) {
				return(_local2);
			}
			_local2++;
		}
	}
	function getPageTitleByOrderNumber(systemOrderNumber) {
		var _local3 = getXMLSectionNumber("menu");
		var _local2 = 0;
		while (_rawParsedXMLData.section[_local3].link[_local2]) {
			if (_rawParsedXMLData.section[_local3].link[_local2].systemOrder == systemOrderNumber) {
				return(_rawParsedXMLData.section[_local3].link[_local2].value);
			}
			_local2++;
		}
	}
	function extractPagesContent() {
		var _local3;
		var _local4;
		var _local2;
		_pagesContentCollection = new Array();
		var _local11 = getXMLSectionNumber("pages");
		var _local8 = _rawParsedXMLData.section[_local11].page;
		_local4 = 0;
		while (_local4 < _local8.length) {
			_local3 = "";
			var _local6 = _local8[_local4].texts[0].pageText;
			_local2 = 0;
			while (_local2 < _local6.length) {
				_local3 = _local3 + _local6[_local2].value;
				_local3 = _local3 + newline;
				_local2++;
			}
			_pagesContentCollection.push({title:getPageTitleByOrderNumber(_local4 + 1), page:_local4 + 1, type:"text", content:_local3});
			var _local5 = _local8[_local4].link;
			_local2 = 0;
			while (_local2 < _local5.length) {
				_local3 = "";
				_local3 = _local3 + _local5[_local2].item[1].value;
				_pagesContentCollection.push({title:_local5[_local2].item[0].value, page:_local4 + 1, type:"link", link:_local2, content:_local3});
				_local2++;
			}
			_local4++;
		}
		var _local10 = getXMLSectionNumber("privacyPolicy");
		if (_rawParsedXMLData.section[_local10].item) {
			_local3 = "";
			_local3 = _local3 + _rawParsedXMLData.section[_local10].item[1].value;
			_pagesContentCollection.push({title:_rawParsedXMLData.section[_local10].item[0].value, page:"privacyPolicy", type:"text", content:_local3});
		}
		var _local9 = getXMLSectionNumber("termsOfUse");
		if (_rawParsedXMLData.section[_local9].item) {
			_local3 = "";
			_local3 = _local3 + _rawParsedXMLData.section[_local9].item[1].value;
			_pagesContentCollection.push({title:_rawParsedXMLData.section[_local9].item[0].value, page:"termsOfUse", type:"text", content:_local3});
		}
		_isReadyForSearch = true;
	}
	function stripTags(textString) {
		var _local2 = false;
		var _local3 = false;
		var _local6 = textString;
		var _local11 = textString.length;
		var _local10 = "<";
		var _local9 = ">";
		var _local5;
		var _local8;
		var _local7;
		var _local1 = 0;
		while (_local1 < _local11) {
			if (_local10.indexOf(textString.charAt(_local1)) != -1) {
				_local5 = _local1;
				_local2 = true;
			}
			if (_local9.indexOf(textString.charAt(_local1)) != -1) {
				_local8 = _local1;
				_local3 = true;
			}
			if ((_local2 == true) && (_local3 == true)) {
				_local7 = _local8 - _local5;
				_local6 = _local6.split(textString.substr(_local5, _local7 + 1)).join("");
				_local2 = false;
				_local3 = false;
			}
			_local1++;
		}
		_local6 = tm.utils.Utils.searchAndReplace(_local6, "&#8226;", "-");
		return(_local6);
	}
	function doSearch(key, searched) {
		key = key.toLowerCase();
		searched = searched.toLowerCase();
		var _local2 = searched.split(key);
		if (_local2.length > 1) {
			var _local7 = new Array();
			var _local3 = 0;
			var _local1 = 0;
			while (_local1 < _local2.length) {
				_local7.push({positionStart:_local2[_local1].length + _local3, positionEnd:(_local2[_local1].length + _local3) + key.length});
				_local3 = _local3 + (_local2[_local1].length + key.length);
				_local1++;
			}
			_local7.pop();
			return({occurences:_local7.length, occurencesPositions:_local7});
		}
		return({occurences:0});
	}
	function doSearchAll(key, searched) {
		var _local7 = doSearch(key, searched);
		var _local5 = new Array();
		var _local4 = key.split(" ");
		var _local2 = 0;
		while (_local2 < _local4.length) {
			var _local3 = _local4[_local2];
			_local5.push(doSearch(_local3, searched));
			_local2++;
		}
		return({wholeSearch:_local7, wordSearch:_local5});
	}
	function get isReadyForSearch() {
		return(_isReadyForSearch);
	}
	function dispatchEvent() {
	}
	function addEventListener() {
	}
	function removeEventListener() {
	}
	var xmlDataSource = "";
	var _isReadyForSearch = false;
}
