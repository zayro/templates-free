import mx.transitions.Tween
import mx.transitions.easing.*
import templateGallery.mvcgallery.*
import templateGallery.mvc.AbstractView
import templateGallery.Configuration


class templateGallery.mvcgallery.NetworkView extends AbstractView {
	var setTimeout:Function
	static var __instance
	var autoLengthColumnsAndRows:Boolean=true
 	var __maxColumns:Number=7 //length columns
	var __maxRows:Number=5////length rows
	var ArrowVisible=true //////////////////visibility arrow
	var __array3:Array  ///////array thymb
	////space
	var __spaceX:Number=40 ///space X
	var __spaceY:Number=17  ///space Y
	var __spaceArrow:Number=30
	///////////////////
	var __loadingAll:Boolean=true
	var __step:Number
	var __encore:Number=0  ////naddatek (if __loadingAll=false)
	var __mouseMove:Boolean=false
	////////////
	var __width:Number  ///width thumb
	var __height:Number ///height thumb
	var __orient:String="H"
	////////////////////////////
	var __array2:Array
	var __currentRows:Number=1
	var __current:Number=1   
	var __motion:Boolean=false ////
	//////////////////
	var __tweenY
	var paski:MovieClip
	var __thumb:ThumbView
	var __content:MovieClip
	var __array:Array
	var __arrowUp:MovieClip
	var __arrowDown:MovieClip
	var __mask:MovieClip
	var addEventListener:Function
	var dispatchEvent:Function
	var tween
	var __mouse:Number
	var __xmouse:Number
	var __ymouse:Number
	var tweenAlpha:Tween
	var backgroundThumb:MovieClip
////////////////////////////////////////////////////////////////////////////////////////////////////////
	
function NetworkView() {
	__spaceX = Configuration.SPACE_X_THUMB
	__spaceY = Configuration.SPACE_Y_THUMB
	
	
__array3=[""]
__instance=this

if(this.__mouseMove){
	this.onEnterFrame=Delegate2.create(this,this.onMouseMoveNetwork)
}

ThumbView.__oldThumb=undefined

}

///////////////////////////////////////////////////////////////////////////////////////////////////////

function onMouseMoveNetwork(){
		
var margin:Number=25
var margin_mouse_x:Number=ThumbView.getWidth()
var margin_mouse_y:Number=ThumbView.getHeight()

var m:GalleryModel=GalleryModel(this.getModel())

if(hasPortion()&&m.__slide!=true&&isHitTest()){

	if(__orient=="V"){ ////vertical
	  	if(_xmouse>-margin&&_xmouse<this.getWidthNetwork()+margin){
		__ymouse=( (_ymouse-margin_mouse_y)/(this.getHeightNetwork()-margin_mouse_y*2))
	    }
	  	var s:Number=this.__content.getBounds(this.__content).yMax-this.getHeightNetwork()
		var new_y:Number=(__ymouse*s)*-1	
		new_y=Math.max(-this.__content.getBounds(this.__content).yMax+this.getHeightNetwork(),Math.min(new_y,0))
		this.__content._y+=(new_y-this.__content._y)/5
	}else{ /////horizontal
	
	   if(_ymouse>-margin&&_ymouse<this.getHeightNetwork()+margin){
		__xmouse=( (_xmouse-margin_mouse_x)/(getWidthNetwork()-margin_mouse_x*2))
		}
	   	var s:Number=this.__content.getBounds(this.__content).xMax-this.getWidthNetwork()
		var new_x:Number=(__xmouse*s)*-1	
		new_x=Math.max(-this.__content.getBounds(this.__content).xMax+this.getWidthNetwork(),Math.min(new_x,0))
		this.__content._x+=(new_x-this.__content._x)/5
	}
	
}
	
}

/////////////////////xmouse hitTest Network////////////////////////////////////////////////////////////////////////////////

function isHitTest(){
	var margin:Number=10

    if(_xmouse>-margin&&_xmouse<this.getWidthNetwork()+margin&&_ymouse>-margin&&_ymouse<this.getHeightNetwork()+margin){
        return true;	
    }else{
     return false;
     }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

function hasPortion(){
	var len=(this.__array.length-1)
	var row_all=Math.ceil(len/this.__maxColumns)
	if(row_all>this.__maxRows){	
		return true;
	}else{
		return false;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	function ini(array_:Array){

	this.__width=ThumbView.getWidth()
	this.__height=ThumbView.getHeight()
				
		reset()
		__content=this.createEmptyMovieClip("container",1)
		__array=array_
	 	
	    ////enabled navi
		
		
		
		if(hasPortion()){
		
		if(!__mouseMove){
		create_navi()
		}
		create_mask()
		
		}else { ///not portion
			
		create_mask(false)
		__arrowUp.removeMovieClip()
		__arrowDown.removeMovieClip()
		__arrowDown=undefined
		__arrowUp=undefined
		}
				
		if(this.__loadingAll==true){///jesli wszystkie miniatyurki ladujemy jednoczesnie
		createThumb(1,this.__array.length)
		}else{
		
		createThumb(1,(this.__maxColumns*this.__maxRows)+this.__encore)
		}
		
		 
		//create_background()
}

//////////////////////////////////////////////////////////////////////////////////////////////////

function onResize(){
	//ThumbView.__oldThumb = undefined
	
	var m:GalleryModel=GalleryModel(this.getModel())
	__array3=[""]
	this.__width=ThumbView.getWidth()
	this.__height=ThumbView.getHeight()
		

	if(autoLengthColumnsAndRows){
	var widthNetwork:Number=m.width-Configuration.MARGIN_HORIZONTAL_THUMB   /////area width network
	var heightNetwork:Number=m.height-Configuration.MARGIN_VERTICAL_THUMB ////area height network
	if(this.__orient=="H"){
	this.__maxRows=Math.floor(  (widthNetwork/(ThumbView.getWidth()+this.__spaceX)) )
	this.__maxColumns=Math.floor(  (heightNetwork/(ThumbView.getHeight()+this.__spaceY)) )
	}else{
	this.__maxColumns=Math.floor(  (widthNetwork/(ThumbView.getWidth()+this.__spaceX)) )
	this.__maxRows=Math.floor(  (heightNetwork/(ThumbView.getHeight()+this.__spaceY)) )
	}
    }	
	
	if (Configuration.COLUMNS_LENGTH != undefined) {
		__maxRows=Configuration.COLUMNS_LENGTH
	}
	
	if (Configuration.ROWS_LENGTH != undefined) {
		__maxColumns=Configuration.ROWS_LENGTH
	}
	
	
	
	///////step
	if(__loadingAll==false){
	__step=1	
	}else{
	__step=__maxRows		
	}
	
	
	ini(m.__array)
	
		
	this._x = m.width/2-getWidthNetwork()/2
	this._y = m.height/2-this.getHeightNetwork()/2
	
	if (Configuration.POSITION_NETWORK_X != undefined) {
		this._x=Configuration.POSITION_NETWORK_X
	}
	
	if (Configuration.POSITION_NETWORK_Y != undefined) {
		this._y=Configuration.POSITION_NETWORK_Y
	}
	
	
	m.dispatchEvent({target:this,type:"onChangePositionNetwork"})
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadImage() {
	var m:GalleryModel=GalleryModel(this.getModel())
		if(m.getAttributes().url!=undefined){
		this.hide()
		
		}
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onPressClose(){
	//this._visible=true
	
	this.shov()
	
	///this.__mask._yscale=0
	//this.__mask.tween('_yscale',100,1,'easeInOutCubic',0)
	//var xMask=this.__mask._x
	//this.__mask._x+=this.__mask._width
	///this.__mask.tween('_x',xMask,1,'easeInOutCubic',0)
	
	
	
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function getWidthNetwork(){
		var _row=this.__maxRows
		var _columns=__maxColumns
		if(this.__orient=="H"){ ////horizontal
		var w=_row*(this.__width+this.__spaceX)-this.__spaceX
		}else{
		var w=_columns*(this.__width+this.__spaceX)-this.__spaceX
		}
		
		if(this.hasPortion()){
		return w;
		}else{
		return this.__content._width	
		}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function getHeightNetwork(){
		var _row=this.__maxRows
		var _columns=__maxColumns
		if(this.__orient=="H"){ ////horizontal
		var h=_columns*(this.__height+this.__spaceY)-this.__spaceY
		}else{
		var h=_row*(this.__height+this.__spaceY)-this.__spaceY
		}
		
		if(this.hasPortion()){
		return h
		}else {
			
		return this.__content.getBounds(__content).yMax
		}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	function onLoadThumb(){
         this.onResize()
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	function onChangedPortion(){
		var m:GalleryModel=GalleryModel(this.getModel())
		
		var thumb_model:ThumbModel=ThumbModel(m.__thumbModel)
		thumb_model.__portionLength=this.__maxRows*__maxColumns
		var current=thumb_model.getCurrent()
		
		this.setPorcja(current)
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	function shov(){
		this._visible=true
		this._alpha = 0
		
		tweenAlpha.stop()
		tweenAlpha = new Tween(this, '_alpha', Strong.easeOut, 0, 100, 2, 1)
		
	this.__arrowDown._alpha=0
	this.__arrowUp._alpha=0
	
	this.__arrowDown.tween('_alpha',100,1,'easeInOutCubic',1)
	this.__arrowUp.tween('_alpha',100,1,'easeInOutCubic',1)
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function hide() {
		var m:GalleryModel = GalleryModel(this.getModel())
		///this._visible = false	
		
		tweenAlpha.stop()
		tweenAlpha = new Tween(this, '_alpha', Strong.easeOut, this._alpha, 0, .5, 1)
		tweenAlpha.onMotionFinished=Delegate2.create(this,this.onEndAlphaZero)
			
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

function onEndAlphaZero() {
	this._visible=false	
}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function onChangedIndex(){
		this.hide()
		
	var m:GalleryModel=GalleryModel(this.getModel())
	
	//if(!isHitTest()){	
	var thumb_model:ThumbModel=ThumbModel(m.__thumbModel)
	thumb_model.__portionLength=this.__maxRows*__maxColumns
	var nr=thumb_model.getNumer(m.index)  ///nr portion
	this.setPorcja(nr)
	//}
	
	/////////////////////////////////////nr image
	var index=m.index
	this.__array3[index].onPress(false)
	}
		
///////////////////////////////////////////////////////////////////////////////////////////////////	

////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	static function getInstance(){
		return __instance
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	function next(){
		//if(this.__array2.length==0&&this.__motion==false){
		if(this.__motion==false){
		this.__currentRows+=this.__step
		changeY()
		}
	}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function prev(){
		///if(this.__array2.length==0&&this.__motion==false){
		if(this.__motion==false){
		this.__currentRows-=this.__step
		changeY()
		}
	}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	   function getPortionLength(){
      return Math.ceil(  (this.__array.length-1)/((this.__maxColumns)*(this.__maxRows)))
        
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////

    function setPorcja(nr_:Number){
		this.__currentRows=((nr_*this.__maxRows)-this.__maxRows)+1
        this.changeY()
    }        
	
////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
function changeY(){
		//if(this.__motion==false){
		this.__motion=true
		
		/////////////////////////////
		if(__loadingAll==false){
		remove()
		}
		
		////////////////arrow Up enabled/disabled arrow up
		if(this.__currentRows<=1){
			this.__arrowUp.onRollOut()
			this.__arrowUp._visible=false
		}else{
			this.__arrowUp._visible=true
		}
		/////////////////enabled/disabled arrow up
		var len=(this.__array.length-1)-((this.__maxColumns)*(this.__maxRows-1))
		var row_all=Math.ceil(len/this.__maxColumns)
		if(this.__currentRows>=row_all){
			this.__arrowDown.onRollOut()
			this.__arrowDown._visible=false
		}else{
			this.__arrowDown._visible=true
		}
		////////////////
		
		if(this.__orient=="V"){
		var value=-(this.__spaceY+this.__height)*(this.__currentRows-1)
		__tweenY=new Tween(__content,'_y',Strong.easeInOut,__content._y,value,1,1)
		}else{
		var value=-(this.__spaceX+this.__width)*(this.__currentRows-1)
		__tweenY=new Tween(__content,'_x',Strong.easeInOut,__content._x,value,1,1)	
		}
		__tweenY.onMotionFinished=Delegate2.create(this,this.onEndTween)
			
	//	}
		}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function onEndTween(){
		if(this.__orient=="V"){
		var p= ((this.__currentRows-1)*this.__maxColumns)+1
		var k=p+(  (this.__maxColumns*this.__maxRows)-1 )+__encore
		}
		else{  //gdy poziome
		var p= ((this.__currentRows-1)*this.__maxColumns)+1
		var k=p+(  (this.__maxColumns*this.__maxRows)-1 )+__encore
			
		}
		
		if(this.__loadingAll!=true){////ta linia nie potrzebna jesli ladujemy wszytskie miniaturki jednoczesnie
		createThumb(p,k)  
		}
		this.__motion=false
	
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function reset(){
		__tweenY.stop()
		this.__motion=false
		delete this.__array
		delete this.__array2
		this.__content.removeMovieClip()	
		__currentRows=1
		this.__current=1
	}
	
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

function create_navi(){
	
	if(this.ArrowVisible==true){
		if(this.__orient=="V"){  //vertical
		////up
		__arrowUp=this.attachMovie("_arrow","arrowUp",11)
		__arrowUp._x=getWidthNetwork()/2-__arrowUp._width/2
		__arrowUp._y=-__arrowUp._height-this.__spaceArrow
		__arrowUp._visible=false
		////down	
		__arrowDown=this.attachMovie("_arrow","arrowDown",10)
		__arrowDown._yscale=-100
		__arrowDown._x=this.getWidthNetwork()/2-__arrowUp._width/2
		__arrowDown._y=this.getHeightNetwork()+this.__spaceArrow+__arrowDown._height
		
		}else{ ///horizontal
		__arrowUp=this.attachMovie("_arrow","arrowUp",11)
		__arrowUp._rotation-=90
		__arrowUp._x=-__arrowUp._width-this.__spaceArrow
		__arrowUp._y=this.__maxColumns/2*(this.__height+this.__spaceY)-this.__spaceY/2-__arrowUp._height/2+__arrowUp._height
		__arrowUp._visible=false
		
		__arrowDown=this.attachMovie("_arrow","arrowDown",10)
		__arrowDown._rotation=90
		__arrowDown._x=this.__maxRows*(this.__width+this.__spaceX)+this.__spaceArrow-this.__spaceX+__arrowDown._width
		__arrowDown._y=__arrowUp._y-__arrowDown._height
		}
        //events
		__arrowUp.onPress=Delegate2.create(this,prev)
		__arrowUp.onRollOver=Delegate2.create(this,onRollOverArrow,__arrowUp)
		__arrowUp.onRollOut=Delegate2.create(this,onRollOutArrow,__arrowUp)
		this.onRollOutArrow(this.__arrowUp)
		
		__arrowDown.onPress=Delegate2.create(this,next)
		__arrowDown.onRollOver=Delegate2.create(this,onRollOverArrow,__arrowDown)
		__arrowDown.onRollOut=Delegate2.create(this,onRollOutArrow,__arrowDown)
			this.onRollOutArrow(this.__arrowDown)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onRollOverArrow(mc:MovieClip){
	mc.arrow.gotoAndStop(2)
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onRollOutArrow(mc:MovieClip){
	mc.arrow.gotoAndStop(1)
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function onLoadInit(target:MovieClip){
		
		if(this.__array2.length==0){
		////loaded thumb
		}
	
	//this.loading()
}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function getRowsNormal(nr){   //////////////return rows (vartical)
		return Math.ceil(nr/this.__maxColumns)
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function getColumnsNormal(nr){//// //////////////return columns (vertical)
		return nr-(   (Math.ceil(nr/this.__maxColumns)-1) *this.__maxColumns  )
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

	function getRows(nr){  ///////////return nr rows (horizontal and vertical)
		if(this.__orient=="V"){
		return getRowsNormal(nr)
		}else{
			return getColumnsNormal(nr)
			
		}
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

	function getColumns(nr){ ////return nr columns (vertical and horizontal)
			if(this.__orient=="V"){
		return getColumnsNormal(nr)
			}else{
			return getRowsNormal(nr)
			}
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	function remove(){
		for(var i in this.__content){
			var mc:ThumbView=this.__content[i]
			if(mc.__rows<this.__currentRows||mc.__rows>(this.__currentRows+(this.__maxRows-1))){
			mc.removeMovieClip()
	}}}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////	

	function createThumb(p,k){
		
		if(k>0&&typeof(k)=="number"){
	       this.__current=p
	       this.__array2=[]
		   for(var i=p;i<=k;i++){
			 var prop=__array[i]
			 addThumbs(prop,i)			
		   }
		   loading()
	    }
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

	private function addThumbs(property,i){
		var columns=this.getColumns(__current)
		var rows = this.getRows(__current)
					
		var x=(columns-1)*(__width+this.__spaceX)
		var y=(rows-1)*(__height+this.__spaceY)
		
	     var p=i
		 var name="thumb"+p
		 var isset=this.__content[name]
		
		 if(!isset&&property.picsmall){
		__thumb = ThumbView(__content.attachMovie("thumb", name, p))
		
	
		
		__thumb.__network=this
		
		__thumb.setModel(this.getModel())
				
		__thumb.__index=i
		__array2.push(__thumb)
		this.__array3.push(__thumb)
				
		__thumb.__columns=(this.__orient=="V") ? this.getColumns(__current) : this.getColumnsNormal(__current)
		__thumb.__rows=(this.__orient=="V") ? this.getRows(__current) : this.getRowsNormal(__current)
			
			this.__thumb._x=x
			this.__thumb._y=y
						
	    __thumb.__property=property
		__thumb.onLoad()
	     ///__thumb.__loader.addListener(this)
		 }
			 
		__current++	
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////	

	function loading(){
		var thumb:ThumbView=ThumbView(this.__array2.shift())
		thumb.laduj()
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

    function dispatchPress(property_:Object){
		dispatchEvent({type:"onPressThumb",target:this,property:property_})
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////

	function create_mask(boolean_:Boolean){
		this.__mask=this.createEmptyMovieClip("mc_maska",142)
		Drawing.rectangle(this.__mask,0,0,getWidthNetwork(),this.getHeightNetwork(),["0xFF0000",50])
		if(boolean_!=false){
		this.__mask._visible=true
		this.__content.setMask(this.__mask)
		}else{
		this.__mask._visible=false
		}
		
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////

function create_background() {
	//trace("create background!")
	var marginX:Number = 70
	var marginY:Number = 70
	
	backgroundThumb = this.createEmptyMovieClip("mc_background_thumb", -122)
	backgroundThumb._x = -marginX
	backgroundThumb._y = -marginY
	
	var w:Number = getWidthNetwork() 
	var h:Number = getHeightNetwork()
	
	if(w!=undefined){
	var widthBcg:Number = w + marginX * 2
	}else {
	var widthBcg:Number=0	
	}
	if(h!=undefined){
	var heightBcg:Number = h + marginY * 2
	}else {
	var heightBcg:Number = 0	
	}
	 
	if(w>0&&h>0){
	Drawing.rectangle(backgroundThumb, 0, 0, widthBcg, heightBcg, ["0x000000", 70])
	}
		

	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}

