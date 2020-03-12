import templateBook.mvctemplate.*
import templateBook.mvc.*
import templateBook.I.*
import flash.display.BitmapData
import templateBook.util.Observable
import templateBook.Configuration
import mx.transitions.Tween
import flash.filters.GlowFilter;
 
class templateBook.mvctemplate.BookView extends AbstractView {

var __width:Number    /////width sheet
var __height:Number   ////height sheet
var __blockade:Boolean=false
var __pages:Array   ////array sheet

////////////////////////////////////////////////////////////////////////////////////////////

function BookView(){
__width = Configuration.PAGE_WIDTH+Configuration.FRAME_SHEET*2
__height = Configuration.PAGE_HEIGHT+Configuration.FRAME_SHEET*2
}

///////////////////////////////////////////////////////////////////////////////////////////

function onLoad(){
   this._alpha=0
}

////////////////////////////////events model////////////////////////////////////////////////////////////

function onLoadBackground(){
new Tween(this, "_alpha", mx.transitions.easing.Strong.easeOut,0,100,1,true);
}

////////////////////////////////////////////////////////////////////////////////////////////

function onResize(){
	var m:BookModel=BookModel(this.getModel())
	this._x=m.__width/2
	this._y = m.__height/2-( Configuration.PAGE_HEIGHT/2 +Configuration.FRAME_SHEET)
	
}

//////////////////////////////////////////////////////////////////////////////////////////////

function create_glow() {
	var m:BookModel = BookModel(this.getModel())
	var pageWidth:Number = Configuration.PAGE_WIDTH + 2 * Configuration.FRAME_SHEET 
	var pageHeight:Number=Configuration.PAGE_HEIGHT+2*Configuration.FRAME_SHEET 
	
	var mc_glow:MovieClip = this.createEmptyMovieClip("mcGlow", -12312312)
	mc_glow._x = - pageWidth
	
	Drawing.rectangle(mc_glow, 0, 0, pageWidth * 2, pageHeight, [Configuration.COLOR_FRAME,100])
	
	 var filter:GlowFilter = new GlowFilter(0x000000,.5, 16, 16, 1, 3, false, false);
     var filterArray:Array = new Array();
     filterArray.push(filter);
     mc_glow.filters = filterArray;
	
	
}

/////////////////////////////////////////////////////////////////////////////////////////////

function shov(){
	this._visible=true
}

////////////////////////////////////////////////////////////////////////////////////////////

function hide(){
	this._visible=false
}

////////////////////////////////////////////////////////////////////////////////////////////

public function addSheet(nr:Number):SheetView{  
  var m:BookModel=BookModel(this.getModel())
  var symmetry=getSymetria(nr)  ////if symmetry=-1 ==> page right ; if symmetry=1 ==> page left
  var dep=symmetry*nr 
  
  //trace("addSheet = "+nr)
  
  if(__pages[nr].thumb!=undefined&&this.getInstanceAtDepth(dep)==undefined&&nr>=1){
  var linkage=(symmetry==-1) ? "_sheet_left" : "_sheet_right"
  var _sheet:SheetView=SheetView(this.attachMovie(linkage,"_sheet"+dep,dep))
  m.__pages[nr].sheet=_sheet
   _sheet.symmetry=symmetry
  _sheet.__book=this
  _sheet.setModel(m)
  _sheet.cacheAsBitmap=true
  /*
  _sheet.mc_main.mcBackground._width=__width
  _sheet.mc_main.mcBackground._height=__height
  _sheet._next_page.mcBackground._width=__width
  _sheet._next_page.mcBackground._height=__height
  /*/
  _sheet.__deph=dep
  _sheet.__nr=nr
  _sheet.onTweenPageEnd=Delegate2.create(this,onTweenPageEnd,_sheet)
  _sheet.onTweenPageExit=Delegate2.create(this,onTweenPageExit,_sheet)
  
  if(_sheet.symmetry==-1){ ///if right page
    _sheet.rightwing()
	_sheet._mc_main._x=0
    _sheet._mc_main._y=0
    _sheet._next_page._x=__width
  }else{  ///left
	_sheet.leftwing()
	_sheet._mc_main._x=-__width
    _sheet._mc_main._y=0
    _sheet._next_page._x=-__width
	_sheet._next_page._y=__height
  }
  _sheet._next_page._visible=false
  }else{
	this.getInstanceAtDepth(dep)._visible=true
  }
 _sheet.__shadow._visible=false
  setCurent()
 _sheet.ini();
 return _sheet 
}

////////////////////////////////////////////////////////////////////////////////////////////

 function setCurent(){
	////right
	var m:BookModel=BookModel(this.getModel())
	var target=this
	var max=target.getNextHighestDepth()-1  ///max deph
	var left:SheetView=target.getInstanceAtDepth(max) 
	m.__currentLeft=left
	/////////////////////////left
	max+=1
	max*=-1
	if(max==0){ ////if first page
		max=-1
		m.__currentLeft=undefined
	}
	var right:SheetView=target.getInstanceAtDepth(max)
	m.__currentRight=right
	
}

////////////////////////////////////////////////////////////////////////////////////////////

function removeAll(flaga:Boolean){
	var m:BookModel=BookModel(this.getModel())
	for(var i in this){
		var sheet:SheetView=SheetView(this[i])
		sheet.removeLoading()
	    sheet.swapDepths(100)
		sheet.removeMovieClip()
	}
	m.dispatchEvent({target:this,type:"onRemoveAll"})
}

////////////////////////////////////////////////////////////////////////////////////////////

function remove(mc:MovieClip){
    mc.swapDepths(1000)
	mc.removeMovieClip()
	removeMovieClip(mc)
}

////////////////////////////////////////////////////////////////////////////////////////////

function onTweenPageExit(mc:MovieClip){
   var m:BookModel=BookModel(this.getModel())
   mc.__sheetPosition="down"
   m.__blockade=false
   mc.setDepth()
   setCurent()
   m.dispatchEvent({target:this,type:"onTweenPageExit"})
}

////////////////////////////////////////////////////////////////////////////////////////////

private function addMaxSheet(strona){
	var tab=[]
	for(var i in this){
		var sheet:SheetView=this[i]
		if(typeof(sheet)=="movieclip"){
		var obj=new Object()
		obj.sheet=sheet
		tab.push(obj)
		}
	}
	tab.sortOn("page",Array.NUMERIC)
	if(strona=="R"){
	   var value=tab[tab.length-1]
	}else{
	   var value=tab[0]
	}
	var sheet:SheetView=value.sheet
	sheet.addSheet()
	return sheet
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

function onTweenPageEnd(sheet_:SheetView){
  var m:BookModel=BookModel(this.getModel())	
  sheet_.__sheetPosition="down"
  if(sheet_.symmetry==-1){  ////rotate right - left
    sheet_.symmetry=1
    sheet_.__nr++
    sheet_.leftwing()
  }else{ ///left-rigt
    sheet_.symmetry=-1
    sheet_.__nr--
    sheet_.rightwing()
  }
  setCurent()
  cleaning()
  sheet_.__shadow._visible=false
  addMaxSheet("R")
  addMaxSheet("L")
  m.__blockade=false
  if(m.__currentLeft.__loadingEnd==1){
	m.__currentLeft.checkLoaded()
  }
  if(m.__currentRight.__loadingEnd==1){
	m.__currentRight.checkLoaded()
  }
  m.dispatchEvent({target:this,type:"onTweenPageEnd"})
}

////////////////////////////////////////////////////////////////////////////////////////////

   private function cleaning(){
     var m:BookModel=BookModel(this.getModel())
     var gr_right=m.__currentRight.__nr
     var gr_left=m.__currentLeft.__nr	
     for(var i in this){
	    var sheet:SheetView=this[i]
	    var strona=sheet.__nr
	    if(strona>gr_right+7||strona<gr_left-7){
	     if(sheet.__loadingEnd==undefined&&sheet.__loadingStart==1){		///loading start and not loading
	 		 sheet.removeLoading()
	    }
	   // sheet.swapDepths(6000)
	    // sheet.removeMovieClip()
	   }
     }
   }
	
////////////////////////////////////////////////////////////////////////////////////////////

   private function getSymetria(nr:Number){if(nr%2==0){return 1;}else{ return -1;}}

////////////////////////////////////////////////////////////////////////////////////////////

   public function onSetPage(obj:Object){
	  var m:BookModel=BookModel(this.getModel())
	  
	  if(m.__blockade==false){
	  __pages=m.__pages
      this.gotoPage(m.__nr)
	  
	  }
	  
	  
   }

////////////////////////////////////////////////////////////////////////////////////////////

	private function gotoPage(nr:Number){
		  var m:BookModel=BookModel(this.getModel())
		removeAll()
		nr=Number(nr)
		if(nr>__pages.length-1){nr=__pages.length-1}
		if(nr<1){nr=1}
		
		if(nr==1||nr==__pages.length-1){
		    var a:SheetView=addSheet(nr)
		}else{
			if( (nr%2)==0){
				var a:SheetView=addSheet(nr)
				var a:SheetView=addSheet(nr+1)
			}else{
				var a:SheetView=addSheet(nr)
				var a:SheetView=addSheet(nr-1)
			}
				
		}
		m.dispatchEvent({target:this,type:"onGotoPage"})
	}
	
//////////////////////////////////////////////////////////////////////////////////////////

}

