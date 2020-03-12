//UDMv2.1.1
//**DO NOT EDIT THIS *****
if (!exclude) { //********
//************************

// *** for more information about the script ******************************
// *** see http://www.brothercake.com/dropdown/ ***************************
// *** or http://www.dynamicdrive.com/dynamicindex1/topmen3/index.htm ****


// *** POSITIONING AND STYLES *********************************************


var menuALIGN = "center";		// alignment
var absLEFT = 	0;		// absolute left or right position (if not center)
var absTOP = 	0; 		// absolute top position

var staticMENU = false;		// static positioning mode (not Opera 5)

var stretchMENU = false;		// show empty cells
var showBORDERS = false;		// show empty cell borders

var baseHREF =	"";	        // base path to .js and image files
var zORDER = 	100;		// base z-order of nav structure (not ns4)

var mCOLOR = 	"0D0E30";	        // main nav cell color
var rCOLOR = 	"cococo";	// main nav cell rollover color
var keepLIT =	true;		// keep rollover color when browsing menu
var bSIZE = 	1;		// main nav border size
var bCOLOR = 	"0D0E30"	// main nav border color
var aLINK = 	"FFFFFF";	// main nav link color
var aHOVER = 	"";		// main nav link hover-color (not ns4)
var aDEC = 	"none";		// main nav link decoration
var fFONT = 	"arial";	// main nav font face		
var fSIZE = 	13;		// main nav font size (pixels)	
var fWEIGHT = 	"bold"		// main nav font weight
var tINDENT = 	7;		// main nav text indent (if text is left or right aligned)
var vPADDING = 	5;		// main nav vertical cell padding
var vtOFFSET = 	0;		// main nav vertical text offset (+/- pixels from middle)

var vOFFSET = 	-5;		// shift the submenus vertically
var hOFFSET = 	4;		// shift the submenus horizontally

var smCOLOR = 	"e8e8e8";	// submenu cell color
var srCOLOR = 	"cococo";	// submenu cell rollover color
var sbSIZE = 	1;		// submenu border size
var sbCOLOR = 	"cococo"	// submenu border color
var saLINK = 	"cococo";	// submenu link color
var saHOVER = 	"";		// submenu link hover-color (not ns4)
var saDEC = 	"none";		// submenu link decoration
var sfFONT = 	"arial";// submenu font face		
var sfSIZE = 	13;		// submenu font size (pixels)	
var sfWEIGHT = 	"normal"	// submenu font weight
var stINDENT = 	5;		// submenu text indent (if text is left or right aligned)
var svPADDING = 2;		// submenu vertical cell padding
var svtOFFSET = 0;		// submenu vertical text offset (+/- pixels from middle)

var shSIZE =	2;		// submenu drop shadow size
var shCOLOR =	"#cccccc";	// submenu drop shadow color
var shOPACITY = 45;		// submenu drop shadow opacity (not ns4 or Opera 5)



//** LINKS ***********************************************************


// add main link item ("url","Link name",width,"text-alignment","target")

addMainItem("index.html","Home",60,"center","_self"); 



addMainItem("products.html","Products",80,"center","_self"); 

	defineSubmenuProperties(120,"right","left");
	
	addSubmenuItem("product1.html","Product 1","_self");
	addSubmenuItem("product2.html","Product 2","_self");
	addSubmenuItem("product3.html","Product 3","_self");
	addSubmenuItem("product4.html","Product 4","_self");



addMainItem("services.html","Services",80,"center","_self"); 

	defineSubmenuProperties(120,"left","left");

	addSubmenuItem("service1.html","Service 1","_self");
	addSubmenuItem("service2.html","Service 2","_self");
	addSubmenuItem("service3.html","Service 3","_self");


addMainItem("news.html","News",60,"center","_self"); 

	defineSubmenuProperties(120,"right","right");

	addSubmenuItem("article1.html","Article 1","_self");
	addSubmenuItem("article2.html","Article 2","_self");
	addSubmenuItem("article3.html","Article 3","_self");
	addSubmenuItem("article4.html","Article 4","_self");
	




addMainItem("contact.html","Contact",80,"center","_self"); 

	defineSubmenuProperties(120,"left","left");

	addSubmenuItem("customerservice.html","Customer Service","_self");
	addSubmenuItem("faq.html","FAQ","_self");
	addSubmenuItem("troubleshooting.html","Troubleshooting","_self");



//********************************************************************

//**DO NOT EDIT THIS *****
}//***********************
//************************

