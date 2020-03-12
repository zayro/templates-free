

 
 
class Resize {

var __limitWidth:Number  
var __limitHeight:Number  
var __width:Number   
var __height:Number  
//////////////////////////////////////////////////////////

function Resize(limitWidth_,limitHeight_,width_,height_){
__limitWidth=limitWidth_
__limitHeight=limitHeight_
__width=width_
__height=height_
}
///////////////////////////////////////////////
function new_size(scale_:Number){
    
    /////old
	var old_pole:Number=this.__width*this.__height
	/////////new
	var new_width:Number=__width*scale_
	var new_height:Number=__height*scale_
	var new_pole:Number=new_width*new_height
	
	if(new_pole>old_pole){ //powiekszenie
		var typ="+"	
	}else if(new_pole<old_pole){
		var typ="-"	
	}else{
		var typ=undefined
	}
	
	return {w:new_width,h:new_height,typ:typ}  ///typ = + lub - lub undefined
    
}
/////////////////////////////////////////////////////////////
function min(){
	var scale=this.getScale("-")
	return new_size(scale)
}
////////////////////////////////////////////////////////
function max(){
	var scale=this.getScale("+")
	return new_size(scale)
}
////////////////////////////////////////////////////
private function getScale(typ:String){
	var scaleW=this.__limitWidth/this.__width
	var scaleH=this.__limitHeight/this.__height
	if(typ=="+"){
	return Math.max(scaleW,scaleH)
	}else if(typ=="-"){
	return Math.min(scaleW,scaleH)	
	}
}
/////////////////////////////////////////////////////////
}