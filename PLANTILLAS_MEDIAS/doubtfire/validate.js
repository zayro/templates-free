// Load the getForm function while page is loading
window.onload = getForm;

// Set this to your validation PHP script, default is "validate.php?value="
var vUrl = "validate.php?value=";

// Set this to your form's id
var formid = "vform";

// This is the array for error handling
var vError =  [];

// We attach to every input field a little js
function getForm() {

	// Important: Our form has to got the "vform" id
	var form = document.getElementById(formid);

	if (document.getElementsByTagName) {
		var vInput = document.getElementsByTagName("input");
		for (var vCount=0; vCount<vInput.length; vCount++)
			vInput[vCount].onblur = function() { return validateIt(this); }
	}
}

// Refers to the function
http = getHTTPObject();

function getHTTPObject() {

  var xmlhttp;
 
  /*@cc_on
 
  @if (@_jscript_version >= 5)
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    }catch(e){
      try{
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }catch(E){
      xmlhttp = false;
    }
  }
  @else
    xmlhttp = false;
  @end @*/
 
  if(!xmlhttp && typeof XMLHttpRequest != 'undefined'){
    try {
      xmlhttp = new XMLHttpRequest();
    }catch(e){
      xmlhttp = false;
    }
  }
 
  return xmlhttp;

}

// The main validation-function
function validateIt(vInput) {

	// Each input field's id
	vId = vInput.id;
	vValue = vInput.value;

	// Separate the class attr of each input field
	getValue = vInput.className;
	if(getValue.indexOf(",") == -1 ) {
		vType = getValue;
		vRequired = "";
	} else {
		vRules = vInput.className.split(",");
		vRequired = vRules[0];
		vType = vRules[1];
	}

	// The whole URL
	var url = vUrl + (vValue) + "&required=" + (vRequired) + "&type=" + (vType);

	// And finally we send it to the url we specified
	http.open("GET", url, true);

	// The handleHttpResponse is the function we call, when we have an
	// answer back from the PHP script
	http.onreadystatechange = handleHttpResponse;
	http.send(null);

}

// A function to handle the response from the PHP script
function handleHttpResponse() {

	if(http.readyState == 4) {

		// Refering to the PHP script, for every validation we'll get
		// either true or false and apply some visual changes in order to
		// get the user focusing on each field whether it's ok or not
		// If one of the input fields contains an error, the submit button
		// will be disabled, until the error (that means all errors) are
		// solved
		if(http.responseText == "false") {

			var sInput = document.getElementById(vId);
			var vButton = document.getElementById("submit");

			document[vId].src = "./images/false.png";
			sInput.style.border = "1px solid #d12f19";
			sInput.style.background = "#f7cbc2";
			vButton.disabled = true;
			vError.push(vId);

		}

		if(http.responseText == "true") {

			var sInput = document.getElementById(vId);

			document[vId].src = "./images/true.png";
			sInput.style.border = "1px solid #338800";
			sInput.style.background = "#c7f7be";

			// We do a check if our element is in the error array, and if
			// so, we can delete it from the array
			if(vError.indexOf(vId) != -1) {
				var aId = vError.indexOf(vId);
				vError.splice(aId, 1);
				if(vError.length > 0) {
					var vButton = document.getElementById("submit");
					vButton.disabled = true;
				} else {
					var vButton = document.getElementById("submit");
					vButton.disabled = false;
				}
			}
		}

		if(http.responseText == "none") {

			var sInput = document.getElementById(vId);
			var vButton = document.getElementById("submit");

			document[vId].src = "./images/blank.gif";
			sInput.style.border = "1px solid #aaa";
			sInput.style.background = "#ffffff";
			vButton.disabled = false;

		}

	}
}
