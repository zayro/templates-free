
class RandomNumber {
    
  var __firstNumber:Number=0  
  var __lastNumber:Number=3  
  var __arrayTemplate:Array  
  var __array:Array
  var __currentValue:Number
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    function RandomNumber(firstNumber_,lastNumber_){
       __firstNumber=firstNumber_
        __lastNumber=lastNumber_
          
        createArrayTemplate()        
    }
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    function createArrayTemplate(){
        this.__arrayTemplate=[]
        for(var i=this.__firstNumber;i<=__lastNumber;i++){
        this.__arrayTemplate.push(i)                
        }
    }
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    function getRandomNumber(){
	var value=getRandom()
	if(value==this.__currentValue){
	var value=getRandom()
	}
	this.__currentValue=value
    return this.__currentValue;
	}
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
	private function getRandom(){
		   if(this.__array.length==0||this.__array==undefined){
          this.__array=this.__arrayTemplate.slice()
        }
       var length:Number=this.__array.length
       var _nrPosition=random(length)
       var value=this.__array[_nrPosition]
       this.__array.splice(_nrPosition,1)    
	  
       return value
		
		
	}
	
//////////////////////////////////////////////////////////////////
  
}