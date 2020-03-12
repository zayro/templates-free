
class Drawing{

static function rectangle(target,x,y,width_:Number,height_:Number,center_:Array,line_:Array){
      var k=target
	if(line_!=undefined){  k.lineStyle(line_[0],line_[1],line_[2])  }
	if(center_!=undefined) {  k.beginFill(center_[0],center_[1])   }
      k.moveTo(x,y)
	k.lineTo(x+width_,y)
		k.lineTo(x+width_,y+height_)
		k.lineTo(x,y+height_)
		k.lineTo(x,y)
}

////////////////////////////////////////////////////////////////////////////////////////////////////

static function frame(mc:MovieClip,size_:Number,__width:Number,__height:Number,color_alpha_:Array,radius:Number){
	///////frame/////
Drawing.rectangle(mc,0,0,size_,__height,[color_alpha_[0],color_alpha_[1]]);
Drawing.rectangle(mc,__width-size_,0,size_,__height,[color_alpha_[0],color_alpha_[1]]);
Drawing.rectangle(mc,size_,0,__width-(2*size_),size_,[color_alpha_[0],color_alpha_[1]]);
Drawing.rectangle(mc,size_,__height-size_,__width-(2*size_),size_,[color_alpha_[0],color_alpha_[1]]);
	/////frame end


if(radius){  
var corner1=mc.createEmptyMovieClip("corner",1)
corner1.beginFill(color_alpha_[0],color_alpha_[1])
corner1.moveTo(size_,size_)
corner1.lineTo(size_+radius,size_)
corner1.curveTo(size_,size_,size_,size_+radius)
corner1.lineTo(size_,size_)
//////
var corner2=corner1.duplicateMovieClip("corner2",2)
corner2._y=__height
corner2._rotation-=90
/////
var corner3=corner1.duplicateMovieClip("corner3",3)
corner3._x=__width
corner3._rotation+=90
///
var corner4=corner1.duplicateMovieClip("corner4",4)
corner4._x=__width;corner4._y=__height
corner4._rotation-=180
}


}

////////////////////////////////////////////////////////////////////////////////////////////////////

static function curve(target_mc:MovieClip, boxWidth:Number, boxHeight:Number, cornerRadius:Number, fillColor:Number, fillAlpha:Number,size_:Number):Void {
    with (target_mc) {
    if(size_){
      lineStyle(size_,fillColor,fillAlpha)
}else{
	 beginFill(fillColor, fillAlpha);
}
        moveTo(cornerRadius, 0);
        lineTo(boxWidth - cornerRadius, 0);
        curveTo(boxWidth, 0, boxWidth, cornerRadius);
        lineTo(boxWidth, cornerRadius);
        lineTo(boxWidth, boxHeight - cornerRadius);
        curveTo(boxWidth, boxHeight, boxWidth - cornerRadius, boxHeight);
        lineTo(boxWidth - cornerRadius, boxHeight);
        lineTo(cornerRadius, boxHeight);
        curveTo(0, boxHeight, 0, boxHeight - cornerRadius);
        lineTo(0, boxHeight - cornerRadius);
        lineTo(0, cornerRadius);
        curveTo(0, 0, cornerRadius, 0);
        lineTo(cornerRadius, 0);
        endFill();
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////

static function circle(mc_,size_,kolor_l,kolor_b,startAngle, arc, radius, yRadius){
	var x=0
	var y=0
	mc_.clear()
	mc_.lineStyle(size_,kolor_l,100)
mc_.beginFill(kolor_b,100)
	if (arguments.length<5) {
		return;
	}
	
	mc_.moveTo(x, y);
	if (yRadius == undefined) {
		yRadius = radius;
	}
	// Init vars
	var segAngle, theta, angle, angleMid, segs, ax, ay, bx, by, cx, cy;
	if (Math.abs(arc)>360) {
		arc = 360;
	}
    segs = Math.ceil(Math.abs(arc)/45);
	
	segAngle = arc/segs;
	theta = -(segAngle/180)*Math.PI;
	angle = -(startAngle/180)*Math.PI;
	// draw the curve in segments no larger than 45 degrees.
	if (segs>0) {
		// draw a line from the center to the start of the curve
		ax = x+Math.cos(startAngle/180*Math.PI)*radius;
		ay = y+Math.sin(-startAngle/180*Math.PI)*yRadius;
		mc_.lineTo(ax, ay);
		for (var i = 0; i<segs; i++) {
			angle += theta;
			angleMid = angle-(theta/2);
			bx = x+Math.cos(angle)*radius;
			by = y+Math.sin(angle)*yRadius;
			cx = x+Math.cos(angleMid)*(radius/Math.cos(theta/2));
			cy = y+Math.sin(angleMid)*(yRadius/Math.cos(theta/2));
			mc_.curveTo(cx, cy, bx, by);
		}
		mc_.lineTo(x, y);
	}
	return arc
}


////////////////////////////////////////////////////////////////////////////////////////////////////


}