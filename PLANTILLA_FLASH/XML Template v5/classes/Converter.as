

class Converter {

	static function convert(pt:Object, mc1:MovieClip, mc2:MovieClip):Object{      
      mc1.localToGlobal(pt)
      if(mc2) mc2.globalToLocal(pt)
      return pt
  	}

}