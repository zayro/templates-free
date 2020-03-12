import mx.controls.streamingmedia.HMiniPlayBarTray;
import mx.transitions.Tween;
import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration
import flash.filters.GlowFilter;

   
class templateBook.mvctemplate.SheetView extends AbstractView {
	
	static var currentPageLoading:Array
	var __width:Number,__height:Number;
	var mouse_x:Number,mouse_y:Number;
	////mouse korekte
	var diff_x:Number, diff_x2:Number, diff_y:Number, diff_y2:Number;
	var mask_next_page:MovieClip, mask__mc_main:MovieClip;  ///mask
	var tween_automatic:Tween
	var __shadow:MovieClip
	var _sx:Number,_sy:Number; /////center of the rotation
	var rmax:Number,rmax2:Number;
	var rcurrent:Number,rcurrent2:Number;
	var angle_sheet:Number;
	var mouse_x0:Number, mouse_y0:Number; ////position mouse
	var mask_shadow:MovieClip
	var twen1:Tween,twen2:Tween,twen3:Tween,twen4:Tween,twen5:Tween,twen6:Tween,twen7:Tween,twen8:Tween,twen9:Tween
	var __nr:Number;  ////numer position in array
	var __orginal_symmetry:Number  /// first value variable __symmetry 
	var __symmetry:Number;///( value -1 if to right page and value if left page )
	var __deph:Number; ////dep Sheet
	var shadow_left:MovieClip,__shadow_right:MovieClip //dropShadow
	var __pages:Array  /////////////array sheet
	var mcArea:MovieClip ///backgroud sheet
	var __loaded:Number=0 ///loading sheet end
	var __loadingStart:Number  ////loading image/swf start
	var __loadingEnd:Number    ////loading image/swf end
    var __loader:MovieClipLoader  //////loader
	var __shadows:Array  ///arrow shadow
	var __preloader__mc_main:MovieClip //////preloader 
	var __preloader_next_page:MovieClip /////preloader
	var __url1:String /// name first image
	var __url2:String ////name two image
	/////events
	var __onTweenPageEnd:Function;  ////evens sheet
	var __onTweenPageExit:Function;    ////events sheet
	var MULTIPLE_LOADING:Boolean=true
	var __numberSheet:MovieClip
	var __numberSheet2:MovieClip
	var __sheetPosition:String="down"   ////up and down
	var __book:BookView
	var _mc_main:MovieClip;
	var mc_main:MovieClip;
	var nextPage:MovieClip
    var _next_page:MovieClip
	var dir:Number=1
	var tween_intro:Tween
	var tweenBackground:Tween

////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function SheetView() {}
		
//////////////////////////////////////////////////////////////////////////////////////////////////

    public function ini() {
		if(currentPageLoading==undefined){
		currentPageLoading=[]
		}
		__pages=[]
		__shadows=[]
		__loader=new MovieClipLoader()
		__loader.addListener(this)
	
				
		if(symmetry==1){
			mc_main._x=-__width
		}
				
	  	__width = Configuration.PAGE_WIDTH+Configuration.FRAME_SHEET*2
		__height = Configuration.PAGE_HEIGHT+Configuration.FRAME_SHEET*2
		
        mask_shadow._width=__width*2
        mask_shadow._height=__height
        mask_shadow._x=-__width
        shadows_sheet(this.symmetry)
        this._mc_main._visible=true
   
		setSizePages()
      
        loadImages();
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////

    private function setSizePages(){
		
	  ///////////////////set Size Area
      _mc_main.mcArea._width=__width
      _mc_main.mcArea._height=__height
      _next_page.mcArea._width=__width
      _next_page.mcArea._height=__height	
	  _next_page.mcArea._visible=false
	  _mc_main.mcArea._visible=false
	  	  
	  /////////////////setSize Frame
	  var mask_space:Number= 20
	  
	  ////////////////////////////////main
	  var frame_mc_main=_mc_main.createEmptyMovieClip("containerFrame",-3)
	  Drawing.frame( frame_mc_main.createEmptyMovieClip("frame",1), Configuration.FRAME_SHEET + .5, __width, __height, [Configuration.COLOR_FRAME, 100], 0)
	  var mask1:MovieClip = _mc_main.createEmptyMovieClip("Mask", -2)
	  Drawing.rectangle(mask1,(symmetry==-1) ? 0 : -mask_space ,-mask_space, __width+mask_space, __height+(mask_space*2), ["0xFF0000", 50])
	  frame_mc_main.setMask(mask1)
	  	  
	  ////////////////////////////////next
	  var frame_next_page=_next_page.createEmptyMovieClip("containerFrame",-3)
	  Drawing.frame(frame_next_page.createEmptyMovieClip("frame",1), Configuration.FRAME_SHEET + .5, __width, __height, [Configuration.COLOR_FRAME, 100], 0)
	  var mask2:MovieClip = _next_page.createEmptyMovieClip("Mask", -2)
	  Drawing.rectangle(mask2,(symmetry==-1) ? -mask_space : 0 ,-mask_space,__width+mask_space,__height+(mask_space*2), ["0xFFFF00", 50])
	  frame_next_page.setMask(mask2)
   

	  /////////////////////////////////glow
	  var filter:GlowFilter = new GlowFilter(0x000000,.2,10,10,1,3, false, false);
      var filterArray:Array = new Array();
      filterArray.push(filter);
      frame_mc_main.frame.filters = filterArray;
	  frame_next_page.frame.filters = filterArray;
	  
  
	  /////set Background
	  setBackground(Configuration.COLOR_BACKGROUND)
	 }

/////////////////////////////////////////////////////////////////////////////////////////////////////////

function setBackground(color_){
	////////////setSize Background
	 if(color_=="transparent"){
		 _mc_main.mc_bck._visible=false
		 _next_page.mc_bck._visible=false
	 }else{
	 //main
	 var bck_mc_main=_mc_main.createEmptyMovieClip("mc_bck",0)
	 bck_mc_main.onPress=function(){}
	 bck_mc_main.useHandCursor=false
	 var sheet_width=Configuration.FRAME_SHEET
	 Drawing.rectangle(bck_mc_main,sheet_width,sheet_width,__width-2*sheet_width,__height-2*sheet_width,[color_,100])
	 ///// next
	 var bck_next_page=_next_page.createEmptyMovieClip("mc_bck",0)
	 bck_next_page.onPress=function(){}
	 bck_next_page.useHandCursor=false
	 Drawing.rectangle(bck_next_page,sheet_width,sheet_width,__width-2*sheet_width,__height-2*sheet_width,[color_,100])
	 }
}
	 
//////////////////////////////////////////////////////////////////////////////////////////////////////////

     function onLoad(){
		 this._mc_main.mcArea.onPress=function(){}
		 this._next_page.mcArea.onPress=function(){}
		 //this._mc_main.mcArea.useHandCursor=false
		// this._next_page.mcArea.useHandCursor=false
		
	}
	 
////////////////////////////////////////////////////////////////////////////////////////////

    private function getAreaMouseDown(){
	var margin:Number=25
	var w=Configuration.PAGE_WIDTH+Configuration.FRAME_SHEET*2
	var h=Configuration.PAGE_HEIGHT+Configuration.FRAME_SHEET*2
		
	if(this.symmetry==-1){ ///right page
	if( (this._xmouse<w&&this._xmouse>(w-margin))||(this._ymouse>0&&this._ymouse<margin&&_xmouse>0)||(this._ymouse<h&&this._ymouse>h-margin&&this._xmouse>0)){
		return true;
	}else{
		return false	
	}
	}else{  ////left page
		if( (this._xmouse>-w&&this._xmouse<(-w+margin)&&this._ymouse<h&&this._ymouse>0)||(this._ymouse>0&&this._ymouse<margin&&_xmouse<0)||(this._ymouse<h&&this._ymouse>h-margin&&this._xmouse<0)){
		return true;
	}else{
		return false	
	}
			
	}
    }
	
///////////////////////////////////////////////////////////////////////////////////////////////////
		
    public function onMouseDown(auto_:Boolean,time_) {
	
	  var m:BookModel=BookModel(this.getModel())
	  var hitTestMouse= this.hitTest(_root._xmouse,_root._ymouse,true)
	  var maxDepSheet=(this.__symmetry==-1) ? m.__currentRight : m.__currentLeft
		   
	  if( (hitTestMouse&&maxDepSheet==this&&getAreaMouseDown())||auto_){
			  
	  this.__sheetPosition="up"
	  this._visible=true
	
		
	  if(this.MULTIPLE_LOADING==true){
		this.addSheet()		
	   }
		//__book.__blockade==false
	    if(1&&this.__loadingEnd||this.MULTIPLE_LOADING==true&&m.__blockade==false){
		  
	   	  m.__blockade=true
		  m.__currentLeft=undefined
		  m.__currentRight=undefined
		  stopTweny()
		  this.swapDepths(_parent.getNextHighestDepth());
			  if(symmetry==-1){
				  _sx=0		
			  }else{
				  	_sx =__width	  
			  }
			var wsp_y=angle_horm()
			_sy = (auto_==undefined) ?  this._ymouse+wsp_y : __height

			if(auto_!=true){
			this.onEnterFrame = function() {
				this.OEF(_xmouse, _ymouse);
			};
			
	         this.onMouseUp = function() {
				           delete this.onMouseUp
				           delete this.onEnterFrame;
						   
						   if(_xmouse<0&&symmetry==-1||_xmouse>0&&symmetry==1){
				           tweenPageFinish(time_);
				          }else{
				          pageExit() 
				          }
	        };
	        }else{
              automat(time_)
	        }
			
	       }
          }
     };

////////////////////////////////////////////////////////////////////////////////////////////
 
    private function automat(time_){
		
    stopTweny()
    var __this=this
    var time=(time_) ? time_ : 17
   
	if(symmetry==-1){
    twen9 = new Tween(tween_automatic, "_x", mx.transitions.easing.Strong.easeOut,__width,-__width, time, false);
    twen9 = new Tween(tween_automatic, "_y", mx.transitions.easing.Strong.easeOut,180+angle_horm(),0,time,false);
	}else{
	twen9 = new Tween(tween_automatic, "_x", mx.transitions.easing.Strong.easeOut,-__width,__width, time, false);
    twen9 = new Tween(tween_automatic, "_y", mx.transitions.easing.Strong.easeOut,180+angle_horm(),0,time,false);
	}
    twen9.onMotionChanged = function() {
	var x=__this.tween_automatic._x
	var y=__this.tween_automatic._y
	var y2=__this.__height-(Math.sin(  y*Math.PI/180  )*__this.__height/3)
	////
	__this.OEF(x,y2);
    };
    twen9.onMotionFinished = function() {
	 __this.__onTweenPageEnd();
     };
	}

////////////////////////////////////////////////////////////////////////////////////////////

private function tweenPageFinish(time_) {
	
	    var m:BookModel=BookModel(this.getModel())	
	    stopTweny()
		m.dispatchEvent({target:this,type:"onTweenPageStart"})
		
	    var time=(time_)? time_ : 0.7
	
	    if(symmetry==-1){
	   	twen1 = new Tween(tween_automatic, "_x", mx.transitions.easing.Strong.easeOut, mouse_x, -__width, time, true);
		twen2 = new Tween(tween_automatic, "_y", mx.transitions.easing.Strong.easeOut, mouse_y, _sy, time, true);
		}else{
			
		twen1 = new Tween(tween_automatic, "_x", mx.transitions.easing.Strong.easeOut, mouse_x, __width, time, true);
		twen2 = new Tween(tween_automatic, "_y", mx.transitions.easing.Strong.easeOut, mouse_y, _sy, time, true);	
		}
				
		var _this = this;
		twen1.onMotionChanged = function() {
			_this.OEF(_this.tween_automatic._x, _this.tween_automatic._y);
		};
		twen1.onMotionFinished = function() {
			_this.__onTweenPageEnd()
		};
}


//////////////////////////////
     
     private function setColor(mc_,color_){
		 var k:Color=new Color(mc_)
		k.setRGB(color_)
	 }

////////////////////////////////////////////////////

	function set onTweenPageEnd(f) {
		__onTweenPageEnd = f;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function checkLoaded(){
         var m:BookModel=BookModel(this.getModel())	
	     if(symmetry==-1&&m.__currentRight!=undefined&&m.__blockade==false){
		     m.dispatchEvent({target:this,type:"onLoadingRight"})
	     }
		 else if(symmetry==1&&m.__currentLeft!=undefined&&m.__blockade==false){
			m.dispatchEvent({target:this,type:"onLoadingLeft"})
     	}
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function set symmetry(value){
		__symmetry=value
		
		if(__symmetry==-1){  ///all right sheet
		_next_page=undefined
        _mc_main=undefined
	    _next_page=nextPage
	    _mc_main=mc_main
	    _sx=0
		}else{ ////left page
		_sx=__width		
	    _next_page=undefined
	    _mc_main=undefined
        _next_page=mc_main
	    _mc_main=nextPage
		}
		
		this._mc_main._visible=true
     	_next_page.swapDepths(_mc_main.getDepths()+7)
	    shadows_sheet((this.symmetry))
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

    public function get symmetry(){
		return __symmetry
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function set onTweenPageExit(f) {
		__onTweenPageExit = f;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

    private function loadImages() {
		
	var m:BookModel=BookModel(this.getModel())
	if(__orginal_symmetry==undefined){
		__orginal_symmetry= symmetry 
	}
    __url1=__book.__pages[__nr].thumb
    __url2 = (symmetry == -1) ? __book.__pages[(__nr+1)].thumb : __book.__pages[(__nr-1)].thumb
    
    loadImage(1)
    onLoadStart__()
  
    //////add array loaded
    if(__symmetry==-1){
	  addNumberLoading(__nr)
	  addNumberLoading((__nr+1))
    }else{
	  addNumberLoading(__nr)
	  addNumberLoading((__nr-1))
    }
	
    }
	
////////////////////////////////////////////////////////////////////////////////////////////////////////	

    private function loadImage(ktore){
		
	  /////set Background
	  setBackground(Configuration.COLOR_BACKGROUND)
	  
	     __loadingStart=1
			
	    __pages[1]=_mc_main.createEmptyMovieClip("mc_setno",1)
		_mc_main.nr=__nr
		  __loader.loadClip(__url1,__pages[1])
	    			
    	__pages[2]=_next_page.createEmptyMovieClip("mc_setno",1)
		_next_page.nr=(symmetry == -1) ? (__nr+1) : (__nr-1)
		__loader.loadClip(__url2,__pages[2])
		    
        if(symmetry==-1){
        addNumberPageLeft(this.__nr)
        addNumberRight((this.__nr+1))
		}else{
		 addNumberPageLeft(this.__nr)
        addNumberRight((this.__nr-1))
		}
      }

////////////////////////////////////////////////////////////////////////////////////////////

private function addNumberPageLeft(nr_){
	if(Configuration.VISIBLE_NUMBER_PAGE=="true"){
	this.__numberSheet= this._mc_main.attachMovie("NumberSheet","NumberSheet",123123123)
	this.__numberSheet.t.autoSize=true
	this.__numberSheet.t.text="  -  "+nr_+" -  "
	this.__numberSheet.t.textColor=Configuration.COLOR_NUMBER_PAGE
	this.__numberSheet._x=__width/2-this.__numberSheet._width/2
	this.__numberSheet._y=int( (__height-Configuration.FRAME_SHEET/2) - this.__numberSheet.t._height/2+1 )
	}
}

///////////////////////////////////////////////////////////////////////////////////////////

private function addNumberRight(nr_){
	if(Configuration.VISIBLE_NUMBER_PAGE=="true"){
	this.__numberSheet2= this._next_page.attachMovie("NumberSheet","NumberSheet",123123126)
	this.__numberSheet2.t.autoSize=true
	this.__numberSheet2.t.text="  -  "+nr_+"  -  "
	this.__numberSheet2.t.textColor=Configuration.COLOR_NUMBER_PAGE
	this.__numberSheet2._y=int( (__height-Configuration.FRAME_SHEET/2) - this.__numberSheet2.t._height/2+1 )
	this.__numberSheet2._x=__width/2-this.__numberSheet2._width/2
	}
}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////	

function onLoadStart__(){
this._mc_main.preloader=this._mc_main.attachMovie("_preloader_sheet","_preloader_sheet_",1200,{_x:__width/2,_y:__height/2})
this._next_page.preloader=this._next_page.attachMovie("_preloader_sheet","_preloader_sheet_",1200,{_x:__width/2,_y:__height/2})
}

////////////////////////////////////////////////////////////////////////////////////////////

function onLoadStart(mc){
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadProgress(mc:MovieClip){
			
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

private function addNumberLoading(nr_:Number){
	var isset:Boolean=false
	for(var i=0;i<currentPageLoading.length;i++){
		var value=currentPageLoading[i]
		if(value==nr_){
		isset=true;			
	    }
	}
	if(isset==false){
		currentPageLoading.push(nr_)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

private function removeNumberLoading(nr_:Number){
	for(var i=0;i<currentPageLoading.length;i++){
		var value=currentPageLoading[i]
		if(value==nr_){
			currentPageLoading.splice(i,1)			
			return;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadComplete(target:MovieClip){
	var m:BookModel=BookModel(this.getModel())
	target._alpha=0	
	target.model=m
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target){
	var m:BookModel=BookModel(this.getModel())
	target._alpha=0
	
	///////////////position image
	if(target._parent._name=="mc_main"){
	target._x=(__width-Configuration.FRAME_SHEET)-target._width
	target._y=__height/2-target._height/2
	}else{
	target._x=Configuration.FRAME_SHEET
	target._y=__height/2-target._height/2
	}
		
	target.tween_intro=new Tween(target,"_alpha", mx.transitions.easing.Strong.easeOut,0,100,.5,true);
	target.tween_intro.onMotionFinished=Delegate2.create(this,this.onIntroEnd,target)
	
	
	
	__loaded++
	target._parent.preloader.removeMovieClip()
    removeNumberLoading(target._parent.nr)
			
   if(__loaded==2){  ///loaded page (2 dep)
	__loadingEnd=1
	var m:BookModel=BookModel(this.getModel())
					
	///////////////event (page left loaded)
		if(this.__nr==m.__currentLeft.__nr&&m.__blockade==false){
			m.dispatchEvent({target:this,type:"onLoadingLeft"})
		}
		
	////////////event (page right loaded)
		if(this.__nr==m.__currentRight.__nr&&m.__blockade==false){
			m.dispatchEvent({target:this,type:"onLoadingRight"})
		}
	
	
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onIntroEnd(target){
	
	/////////////////////////////change background image (if loaded image)
	changeBackground(target)
	
		 if(__loaded==2){
			 addSheet()  ////addPage
		}
}

//////////////////////////////////////////if onLoad Image//////////////////////////////////////////////////

function changeBackground(target:MovieClip){
		
   if(Configuration.COLOR_BACKGROUND_ONLOADPAGE=="transparent"){
	///target._parent.tweenBackground=new Tween(target._parent.mc_bck,"_alpha", mx.transitions.easing.Strong.easeOut,target._parent.mc_bck._alpha,0,.7,true);
	target._parent.mc_bck._visible=false
	 }else{
		 //target._parent.mc_bck._alpha=100
	target._parent.mc_bck._visible=true
	setBackground(Configuration.COLOR_BACKGROUND_ONLOADPAGE)
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

    public function removeLoading(){
	  if(__symmetry==-1){
	  removeNumberLoading(this.__nr)
	  removeNumberLoading((this.__nr+1))
	  }else{
	  removeNumberLoading(this.__nr)
	  removeNumberLoading((this.__nr-1))
	  }
	}

////////////////////////////////////////////////////////////////////////////////////////////

   public function addSheet(){
	 var m:BookModel=BookModel(this.getModel())
	if(__loadingEnd==1||MULTIPLE_LOADING==true){
		   if(symmetry==-1){
	if(this.__nr-m.__currentRight.__nr<3&&this.__nr>=m.__currentRight.__nr){
        __book.addSheet(__nr+2)
	}
	}else{
		if(m.__currentLeft.__nr-this.__nr<3&&m.__currentLeft.__nr>=this.__nr){
		 __book.addSheet(__nr-2)
		}
	}
	}
   }

////////////////////////////////////////////////////////////////////////////////////////////

  function leftwing(skad_) {
	setDepth()
		
	if(symmetry==__orginal_symmetry){  ///exit
	}
	else{
	}
	 shadows_sheet((this.symmetry))
   }

//////////////////////////////////////////////////////////////////////////////////////////

  function setDepth(){
	__deph=__nr*symmetry
	this.swapDepths(__deph)
  }
	
/////////////////////////////////////////////////////////////////////////////////////////////

   function rightwing(skad_){
	setDepth()
		
	if(symmetry==__orginal_symmetry){
	}else{
  	}
  	shadows_sheet((this.symmetry))
   }

//////////////////////////////////////////////////////////////////////////////////////////////

   private function stopTweny(){
       twen1.stop();twen2.stop();twen3.stop();twen4.stop();twen5.stop();twen6.stop();twen7.stop();twen8.stop();twen9.stop();
    }

////////////////////////////////////////////////////////////////////////////////////////////

  function angle_horm(){return -10+(  (_ymouse/__height)*20 )}

////////////////////////////////////////////////////////////////////////////////////////////

  private function shadows_sheet(symmetry_){
	 
	for(var i in this.__shadows){
		var mc=this.__shadows[i]
		mc.removeMovieClip()
	}
  if(symmetry_==-1){ ////if right sheet
   var cl=_mc_main.attachMovie("__shadow_sheet","shadow_left",15)
  this.__shadows.push(cl)
   cl._height=__height
  var cp=_next_page.attachMovie("__shadow_sheet","shadow_right",16)
  this.__shadows.push(cp)
  cp._height=__height
  cp._xscale*=-1
  cp._x=__width
  }else{ ///if left sheet
  var cp=_mc_main.attachMovie("__shadow_sheet","shadow_right",17)
  this.__shadows.push(cp)
  cp._height=__height
  cp._xscale*=-1
  cp._x=__width
  var cp=_next_page.attachMovie("__shadow_sheet","shadow_right",18)
  this.__shadows.push(cp)
  cp._height=__height
  cp._x=0
 }

}

////////////////////////////////////////////////////////////////////////////////////////////

private function pageExit() {
	stopTweny()
	var __this=this
	var time = .7
	var anim='linearTween'
	
	if(this.symmetry==-1){  ///right page
	
	if (angle_sheet<0) {
		twen1 = new Tween(__shadow, "_x", mx.transitions.easing.Strong.easeOut,__shadow._x,__width, time, true);
		twen2 = new Tween(__shadow, "_y", mx.transitions.easing.Strong.easeOut,__shadow._y,0, time, true);
		twen3 = new Tween(mask_next_page, "_x", mx.transitions.easing.Strong.easeOut,mask_next_page._x,__width, time, true);
		twen4 = new Tween(mask_next_page, "_y", mx.transitions.easing.Strong.easeOut,mask_next_page._y,0, time, true);
		twen5 = new Tween(mask__mc_main, "_x", mx.transitions.easing.Strong.easeOut,mask__mc_main._x,__width, time, true);
		twen6 = new Tween(mask__mc_main, "_y", mx.transitions.easing.Strong.easeOut,mask__mc_main._y,0, time, true);
		twen7 = new Tween(_next_page, "_x", mx.transitions.easing.Strong.easeOut,_next_page._x,__width, time, true);
		twen8 = new Tween(_next_page, "_y", mx.transitions.easing.Strong.easeOut,_next_page._y,0, time, true);
		twen8.onMotionFinished = function() {
		__this.__onTweenPageExit();
		};
	} else {
		var r = Rog(_next_page, 0, __height);
		var delta_x = __width-r.x;
		var delta_y = __height-r.y;
		twen1 = new Tween(__shadow, "_x", mx.transitions.easing.Strong.easeOut,__shadow._x,__width, time, true);
		twen2 = new Tween(__shadow, "_y", mx.transitions.easing.Strong.easeOut,__shadow._y,__height, time, true);
		twen3 = new Tween(mask_next_page, "_x", mx.transitions.easing.Strong.easeOut,mask_next_page._x,__width, time, true);
		twen4 = new Tween(mask_next_page, "_y", mx.transitions.easing.Strong.easeOut,mask_next_page._y,__height, time, true);
		twen5 = new Tween(mask__mc_main, "_x", mx.transitions.easing.Strong.easeOut,mask__mc_main._x,__width, time, true);
		twen6 = new Tween(mask__mc_main, "_y", mx.transitions.easing.Strong.easeOut,mask__mc_main._y,__height, time, true);
		twen7 = new Tween(_next_page, "_x", mx.transitions.easing.Strong.easeOut,_next_page._x,_next_page._x+delta_x, time, true);
		twen8 = new Tween(_next_page, "_y", mx.transitions.easing.Strong.easeOut,_next_page._y,_next_page._y+delta_y, time, true);
		twen8.onMotionFinished = function() {
		__this.__onTweenPageExit();
		};
	}
	
	}else{  ////left page
		
			
     if (angle_sheet<0) {
	    var dpr=Rog(_next_page, __width, __height);
		var delta_x=-__width-dpr.x
		var delta_y=__height-dpr.y
		twen1 = new Tween(__shadow, "_x", mx.transitions.easing.Strong.easeOut,__shadow._x,-__width, time, true);
		twen2 = new Tween(__shadow, "_y", mx.transitions.easing.Strong.easeOut,__shadow._y,__height, time, true);
		twen3 = new Tween(mask_next_page, "_x", mx.transitions.easing.Strong.easeOut,mask_next_page._x,-__width, time, true);
		twen4 = new Tween(mask_next_page, "_y", mx.transitions.easing.Strong.easeOut,mask_next_page._y,__height, time, true);
		twen5 = new Tween(mask__mc_main, "_x", mx.transitions.easing.Strong.easeOut,mask__mc_main._x,-__width, time, true);
		twen6 = new Tween(mask__mc_main, "_y", mx.transitions.easing.Strong.easeOut,mask__mc_main._y,__height, time, true);
		twen7 = new Tween(_next_page, "_x", mx.transitions.easing.Strong.easeOut,_next_page._x,(_next_page._x+delta_x), time, true);
		twen8 = new Tween(_next_page, "_y", mx.transitions.easing.Strong.easeOut,_next_page._y,_next_page._y+delta_y, time, true);
		twen8.onMotionFinished = function() {
		__this.__onTweenPageExit();
		};
      } else {
		var dpr=Rog(_next_page, __width,0);
		var delta_x=-__width-dpr.x
		var delta_y=-dpr.y
		twen1 = new Tween(__shadow, "_x", mx.transitions.easing.Strong.easeOut,__shadow._x,-__width, time, true);
		twen2 = new Tween(__shadow, "_y", mx.transitions.easing.Strong.easeOut,__shadow._y,0, time, true);
		twen3 = new Tween(mask_next_page, "_x", mx.transitions.easing.Strong.easeOut,mask_next_page._x,-__width*1, time, true);
		twen4 = new Tween(mask_next_page, "_y", mx.transitions.easing.Strong.easeOut,mask_next_page._y,0, time, true);
		twen5 = new Tween(mask__mc_main, "_x", mx.transitions.easing.Strong.easeOut,mask__mc_main._x,-__width*1, time, true);
		twen6 = new Tween(mask__mc_main, "_y", mx.transitions.easing.Strong.easeOut,mask__mc_main._y,0, time, true);
		twen7 = new Tween(_next_page, "_x", mx.transitions.easing.Strong.easeOut,_next_page._x,(_next_page._x+delta_x), time, true);
		twen8 = new Tween(_next_page, "_y", mx.transitions.easing.Strong.easeOut,_next_page._y,_next_page._y+delta_y, time, true);
		twen8.onMotionFinished = function() {
		__this.__onTweenPageExit();
		};
	    }
  }

}

////////////////////////////////////////////////////////////////////////////////////////////

    private function AngleMouse(x, y) {
		var angle_ = Math.atan2(y, x);
		return Angles.RadianToStopien(angle_);
   }

////////////////////////////////////////////////////////////////////////////////////////////

	private function getAngleSheet(x, y) {
		return AngleMouse(x, y)*2;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function polMaska(angle_) {
		var dlr = Rog(_next_page, 0, __height);
		var dpr = Rog(_next_page, __width, __height);
		var glr = _next_page._y;
				
		if ((angle_)>6) {
			var obj={x:((__height-dlr.y)/Math.tan(Angles.StopienToRadian(angle_)))+dlr.x, y:__height};
			return obj
			
		} else if (angle_<-6) {
			var obj={x:((glr/Math.tan(Angles.StopienToRadian(Math.abs(angle_))))+_next_page._x), y:0};			
			return obj
		} else {
			var _licznik = dlr.x+__width;
	    	var jedynka = (_licznik/(2*__width));
			var obj={x:(jedynka*__width), y:__height};
			return obj
		}
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////

    private function polMaska2(angle_) {
		var dlr = Rog(_next_page, 0, __height);
		var dpr = Rog(_next_page, __width, __height);
 				
		if ((angle_)>6) {
			var gpr = Rog(_next_page, __width, 0);
			var obj={x:((gpr.x-gpr.y/Math.tan(Angles.StopienToRadian(Math.abs(angle_))))), y:0};			
			return obj
				
		} else if (angle_<-6) {
				
			if(Math.abs(angle_)>45){  ////
			var obj={x:((__height-dlr.y)/Math.tan(Angles.StopienToRadian(angle_)))+dlr.x, y:__height};
			return obj
			}else{  //// plynniej
			var y=__height-dpr.y  
			var obj={x:dpr.x+(y/Math.tan(Angles.StopienToRadian(angle_))), y:__height};
			return obj	
			}
					
		} else {
				
			var _licznik = dlr.x+__width;
	    	var jedynka = -.5+(_licznik/(2*__width));
			var obj={x:(jedynka*__width), y:__height};
			return obj
		}
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function Rog(klip, rog_x, rog_y) {
		return Converter.convert({x:rog_x, y:rog_y}, klip, this);
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function OEF(__x, __y, artificially_) {
		mouse_x0 = Math.min(Math.max(-__width, __x), __width)
		mouse_y0 = __y;
		Rmax();
		currentR();
		delta();
		///
		Rmax2();
		currentR2();
		delta2();
		var roz_x = diff_x2+diff_x;
		var roz_y = diff_y2+diff_y;
		////////////korekte mouse
		mouse_x = mouse_x0-(isNaN(roz_x) ? 0 : roz_x);
		mouse_y = mouse_y0+(isNaN(roz_y) ? 0 : roz_y);
		////throw X and Y
		if(symmetry==-1){
		 var Vx =__width-mouse_x;
		}else{
		 var Vx =__width+mouse_x;
		}
		var Vy = (_sy-mouse_y)*(symmetry*-1)
		angle_sheet = getAngleSheet(Vx,Vy)
		var end = (__width-_xmouse);
		if ( artificially_) {  
			angle_sheet = 0;
			mouse_x = __width;
			mouse_y = _sy;
		}
		/////////rotation (_sx;_sy)
		rotate(_next_page, _sx, _sy, angle_sheet);
		position();
		////point of the joint of the sheet of paper with the bottom edge
		if(symmetry==-1){
		var pos_mask = polMaska(angle_sheet);	
		mask_page_right(pos_mask.x, pos_mask.y, angle_sheet/2);
	
		}else{
		var pos_mask = polMaska2(angle_sheet);	
		
		mask_page_left(pos_mask.x, pos_mask.y, angle_sheet/2);
		}
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function mask_page_right(x, y, angle_) {
		///////////////mask _next_page
		this.mask_next_page= this.attachMovie("_mask", "_mask_next_page_", 300,{_visible:false});
		this.mask_next_page._x = x///Math.max(0, x);
		this.mask_next_page._y = y;
		this.mask_next_page._rotation = angle_;
		_next_page.setMask(this.mask_next_page);
		///////////////dropShadow
		__shadow = this.attachMovie("_shadow", "_shadow_", 301);
		__shadow._x = Math.max(0, x);
		var main_alpha:Number=Math.abs(_next_page.getBounds(this).xMax)
		if(main_alpha<100){
		__shadow._alpha=main_alpha
		}
		__shadow._y = y;
		__shadow._rotation = angle_;
		__shadow.setMask(mask_shadow);
	    ///////////////mask _mc_main
		this.mask__mc_main = this.mask_next_page.duplicateMovieClip("_mask__mc_main_", 3002);
		_mc_main.setMask(mask__mc_main);
		this._next_page._visible=true
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	private function mask_page_left(x, y, angle_) {
		/////////////mask _next_page
		this.mask_next_page= this.attachMovie("_mask", "_mask_next_page_", 300,{_visible:true});
		this.mask_next_page._x =x
		this.mask_next_page._y = y;
		this.mask_next_page._rotation=(angle_+180)
		_next_page.setMask(this.mask_next_page);
   		////////////dropShadow
		__shadow=this.attachMovie("_shadow", "_shadow_", 301);
		__shadow._x =x
		var main_alpha:Number=Math.abs(_next_page.getBounds(this).xMin)
		if(main_alpha<100){
		__shadow._alpha=main_alpha
		}
		__shadow._y = y;
		__shadow._rotation = angle_
		__shadow.setMask(mask_shadow);
		mask_shadow._visible=false
		////////////////mask _mc_main
		this.mask__mc_main = this.mask_next_page.duplicateMovieClip("_mask__mc_main_", 3002);
		_mc_main.setMask(mask__mc_main);
		mask__mc_main._visible=true
	    this._next_page._visible=true
	}
	
////////////////////////////////////////////////////////////////////////////////////

	private function Rmax() {
		rmax = Math.sqrt((__width*__width)+((__height-_sy)*(__height-_sy)));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function Rmax2() {
		rmax2 = Math.sqrt((__width*__width)+((_sy)*(_sy)));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function currentR() {
		rcurrent = Math.sqrt((mouse_x0*mouse_x0)+(__height-mouse_y0)*(__height-mouse_y0));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function currentR2() {
		rcurrent2 = Math.sqrt((mouse_x0*mouse_x0)+(mouse_y0)*(mouse_y0));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function os_x(value_, angle_) {
		return value_*Math.cos(Angles.StopienToRadian(angle_));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function os_y(value_, angle_) {
		return value_*Math.sin(Angles.StopienToRadian(angle_));
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function delta() {
		var dir = 1;
		var diff = Math.max(0, (-rmax+rcurrent)); 
		var angle_ = AngleMouse(mouse_x0, __height-mouse_y0);
		diff_x = os_x(diff, angle_);
		diff_y = os_y(diff, angle_)*dir;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function delta2() {
		var dir = -1;
		var diff = Math.abs(Math.min(0, (rmax2-rcurrent2)));
		var angle_ = AngleMouse(mouse_x0, mouse_y0);
		diff_x2 = os_x(diff, angle_);
		diff_y2 = os_y(diff, angle_)*dir;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function rulez_for_test(x1, y1, x2, y2, dep, kol) {
		var p = dep;
		var l = this.createEmptyMovieClip("line_test"+p, p);
		l.lineStyle(3, kol, 100);
		l.moveTo(x1, y1);
		l.lineTo(x2, y2);
	}
	
///////////////////global xmouse/////////////////////////////////////////////////////////////////////////

	public function get _sxG() {
		return Converter.convert({x:_sx, y:_sy}, _next_page, this).x;
	}
	
////////////////////global ymouse////////////////////////////////////////////////////////////////////////

	public function get _syG() {
		return Converter.convert({x:_sx, y:_sy}, _next_page, this).y;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function rotate(klip, _sx, _sy, angle_) {
		var p = {x:_sx, y:_sy};
		klip.localToGlobal(p);
		klip._rotation = angle_;
		var q = {x:_sx, y:_sy};
		klip.localToGlobal(q);
		klip._x += (p.x-q.x);
		klip._y += (p.y-q.y);
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

	private function position() {
		var center = Converter.convert({x:_sx, y:_sy}, _next_page, this);
		_next_page._x += (mouse_x)-center.x;
		_next_page._y += (mouse_y)-center.y;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////

}


