//=========================================================================================
//------ Make it Full Screen
//=========================================================================================
fscommand("fullscreen", true);
Stage.scaleMode = "noScale";
Stage.align = "TL";

//=========================================================================================
//------ Preload It
//=========================================================================================
function preloadSite():Void {
	createEmptyMovieClip("loader_mc", this.getNextHighestDepth());
	loader_mc.createEmptyMovieClip("loaderBG_mc", 1);
	loader_mc.createEmptyMovieClip("loaderProgress_mc", 2);

	loader_mc._y = Stage.height/2;
	
	// (loader background)
	loader_mc.loaderBG_mc.beginFill(0x000000, 100);
	loader_mc.loaderBG_mc.moveTo(0,0);
	loader_mc.loaderBG_mc.lineTo(Stage.width, 0);
	loader_mc.loaderBG_mc.lineTo(Stage.width, 1);
	loader_mc.loaderBG_mc.lineTo(0, 1);
	loader_mc.loaderBG_mc.lineTo(0,0);
	loader_mc.loaderBG_mc.endFill();
	
	
	// (loader progress bar)
	loader_mc.loaderProgress_mc.beginFill(0x666666, 100);
	loader_mc.loaderProgress_mc.moveTo(0,0);
	loader_mc.loaderProgress_mc.lineTo(Stage.width, 0);
	loader_mc.loaderProgress_mc.lineTo(Stage.width, 1);
	loader_mc.loaderProgress_mc.lineTo(0, 1);
	loader_mc.loaderProgress_mc.lineTo(0,0);
	loader_mc.loaderProgress_mc.endFill();
		
	this.onEnterFrame = function() {
		var bytesTotal:Number = getBytesTotal();
		var bytesLoaded:Number = getBytesLoaded();

		if (bytesLoaded < bytesTotal) {
			loader_mc.loaderProgress_mc._width = bytesLoaded/bytesTotal * Stage.width;
			loader_mc._x = Stage.width/2 - loader_mc._width/2;
		} else {
			loader_mc.removeMovieClip();
			
			gotoAndPlay("main");
			delete this.onEnterFrame;
		}
	}
};

//=========================================================================================
//------ Full Browser Flash
//=========================================================================================
var stageListener:Object  = new Object();
Stage.addListener(stageListener);
stageListener.onResize = function() { 
	resizeStage(); 
};

function resizeStage():Void {
	var stageCenterX = Stage.width/2;
	var stageCenterY = Stage.height/2;
	
	background_mc._x = 	Math.round(stageCenterX);
	background_mc._y = Math.round(stageCenterY);

	background_mc._width = Stage.width;
	background_mc._height = Stage.height;
};

resizeStage();
preloadSite();