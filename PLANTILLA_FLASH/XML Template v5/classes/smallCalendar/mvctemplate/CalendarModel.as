import smallCalendar.mvctemplate.*;
import smallCalendar.I.*
import smallCalendar.util.Observable
import flash.display.BitmapData
import mx.utils.Delegate
import smallCalendar.Configuration
class smallCalendar.mvctemplate.CalendarModel extends Observable{
 	

	
var __date:Date        ////object Data
var __dayWeek:Array=[{index:0,label:"Su"},{index:1,label:"Mo"},{index:2,label:"Tu"},{index:3,label:"We"},{index:4,label:"Th"},{index:5,label:"Fr"},{index:6,label:"Sa"}]	
var __month:Array
var __events:Array


/////////////////////////////////////////////////configuration calendar
var __firstDayWeek:Number=0
var __width:Number=20  ////width Number
var __height:Number=20  ////height Number
var __spaceX:Number=5   ///spaceX Number
var __spaceY:Number=5   ///spaceY Number
var __numberSize:Number=16
var __maxColumns:Number=6

//////today's date (data dzisiejsza)
var today_year:Number
var today_month:Number
var today_day:Number
var today_dayWeek:Number

////////////////////////////////
var __target:Calendar



////////////////////////////////////////////////////////////////////////////////////////////////

function CalendarModel(calendar_:Calendar){
	
__width=Number(Configuration.WIDTH_BACKGROUND_NUMBER)
__height=Number(Configuration.HEIGHT_BACKGROUND_NUMBER)
__spaceX=Number(Configuration.SPACE_X_NUMBER)
__spaceY=Number(Configuration.SPACE_y_NUMBER)
__numberSize=Number(Configuration.SIZE_NUMBER)
	
	
	this.__target=calendar_
	
__firstDayWeek=Configuration.FIRSTDAYWEEK	
this.__date=new Date()
this.today_year=this.__date.getFullYear()
this.today_month=this.__date.getMonth()
this.today_day=this.__date.getDate()
this.today_dayWeek=this.__date.getDay()

createDayWeekArray()
createMonthArray()

}

///////////////////////////////////////////////////////////////////////////////////////////////

function setEvents(xml_:XML){
	var xml=xml_
	__events=[]
	
	for(var i=0;i<xml.firstChild.childNodes.length;i++){
		var node:XMLNode=xml.firstChild.childNodes[i]
		this.__events.push(node)
	}
	
	
}

//////////////////////////////////////////////////////////////////////////////////////////////

public function getEvents(year_,month_,day_):XMLNode{
		
	for(var i=0;i<this.__events.length;i++){
		var node:XMLNode=this.__events[i]
		var year=Number(node.attributes.year)
		var month=Number(node.attributes.month)
		var day=Number(node.attributes.day)
		
			
		if(isNaN(year)){
			year=year_
		}
		
		if(isNaN(month)){
			month=month_
		}
		
		if(isNaN(day)){
			day=day_
		}
		
		if(  year==year_&&month==month_&&day==day_    ){
		return node
		}
	}
	
}

///////////////////////////////////////////////////////////////////////////////////////////////

private function createMonthArray(){
	this.__month=[]
	
	for(var i=0;i<12;i++){
		switch (i) {
    case 0:
        this.__month[i]=Configuration.JANUARY
        break;
    case 1:
         this.__month[i]=Configuration.FEBRUAY
        break;
    case 2:
        this.__month[i]=Configuration.MARCH
        break;
     case 3:
        this.__month[i]=Configuration.APRIL
        break;
	 case 4:
        this.__month[i]=Configuration.MAY
        break;
	 case 5:
      this.__month[i]=Configuration.JUNE
        break;
	 case 6:
        this.__month[i]=Configuration.JULY
        break;
	 case 7:
        this.__month[i]=Configuration.AUGUST
        break;
	 case 8:
        this.__month[i]=Configuration.SEPTEMBER
        break;
	 case 9:
        this.__month[i]=Configuration.OCTOBER
        break;
	 case 10:
        this.__month[i]=Configuration.NOVEMBER
        break;
	 case 11:
        this.__month[i]=Configuration.DECEMBER
        break;
}
		
	}
	
}

///////////////////////////////////////////////////////////////////////////////////////////////

private function createDayWeekArray(){
var left= __dayWeek.slice(0,__firstDayWeek)
var right=__dayWeek.slice(__firstDayWeek)
__dayWeek=right.concat(left)	
for(var i=0;i<this.__dayWeek.length;i++){
	var index=this.__dayWeek[i].index
	
	
switch (index) {
    case 0:
        this.__dayWeek[i].label=Configuration.SU
        break;
    case 1:
         this.__dayWeek[i].label=Configuration.MO
        break;
    case 2:
        this.__dayWeek[i].label=Configuration.TU
        break;
     case 3:
        this.__dayWeek[i].label=Configuration.WE
        break;
	 case 4:
        this.__dayWeek[i].label=Configuration.TH
        break;
	 case 5:
       this.__dayWeek[i].label=Configuration.FR
        break;
	 case 6:
        this.__dayWeek[i].label=Configuration.SA
        break;
}


	
	

}

}

///////////////////////////////////////////////////////////////////////////////////////////////

function getColumnsFirstDayWeek(){
	var dayWeek=(new Date(this.year,this.month,1)).getDay()
	for(var i=0;i<this.__dayWeek.length;i++){
		var index:Number=Number(this.__dayWeek[i].index)
		if(index==dayWeek){
			return i;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////

function setCurrentDate(){
	///this.year=this.today_year
	//this.month=this.today_month
	///this.day=this.today_day
	this.__date.setFullYear(this.today_year)
	this.__date.setMonth(this.today_month)
	this.__date.setDate(this.today_day)
	this.dispatchEvent({target:this,type:"onUpdate"})
}

///////////////////////////////MONTH/////////////////////////////////////////////////////////////////

function set month(month_){
	this.__date.setMonth(month_)
	this.dispatchEvent({target:this,type:"onUpdate"})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function get month(){
	return this.__date.getMonth()
}

/////////////////////////////////YEAR///////////////////////////////////////////////////////////////

function set year(year_){
	this.__date.setFullYear(year_)
	this.dispatchEvent({target:this,type:"onUpdate"})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function get year(){
	return this.__date.getFullYear()
}

//////////////////////////////////////DAY//////////////////////////////////////////////////////////

function set day(data_){
	this.__date.setDate(data_)
	this.dispatchEvent({target:this,type:"onUpdate"})
}

////////////////////////////////////////////////////////////////////////////////////////////////

function get day(){
	return this.__date.getDate()
}

//////////////////////////////////////////////DAY WEEK//////////////////////////////////////////////////

function get dayWeek(){
	return this.__date.getDay()
}

/////////////////////////////////////////////////////////////////////////dayWeek 1 Month

public function nextMonth(){
	this.__date.setMonth(this.__date.getMonth()+1)
	this.dispatchEvent({target:this,type:"onUpdate"})
	
}

////////////////////////////////////////////////////////////////////////////////////////////////

public function prevMonth(){
	this.__date.setMonth(this.__date.getMonth()-1)
	this.dispatchEvent({target:this,type:"onUpdate"})	
}

//////////////////////////////////////////////////////////////////////////////////////////////////

public function format_number(nr_:Number){
	var str_:String=String(nr_)
	if(str_.length==1){
		return "0"+str_
	}else{
		return str_
	}
}

//////////////////////////////////////////////////////////////////



}