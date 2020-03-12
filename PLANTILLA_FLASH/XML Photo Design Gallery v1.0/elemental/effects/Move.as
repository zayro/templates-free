﻿/*

Class for scripted movement tweening

*/


package elemental.effects
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.DisplayObject;
	
	public class Move
	{
		private static var moveList: Array =  new Array();
		
		private static var timer: Timer = new Timer(33);
		timer.start();
		timer.addEventListener(TimerEvent.TIMER, runMove);
		
		// this is the function used to start the tween, such as Move.to(this, 100, 100, 6);
		// that will move to 100, 100
		public static function to(obj:DisplayObject, x:Number, y:Number, ease:int = 10) : void
		{			
			removeDuplicates(obj);
			
			moveList.push(new Array(obj, [x,y], ease));
		}
		
		// if there is an active tween on the object, this will kill it
		public static function killMove(obj: DisplayObject) : void
		{
			removeDuplicates(obj);
		}
		
		private static function runMove(event:TimerEvent) : void
		{
			var removeList: Array = new Array();
			
			var total:int = moveList.length;
			for (var i: int = 0; i < total; i++)
			{
				var obj:DisplayObject = moveList[i][0];
				var goalx:Number = moveList[i][1][0];
				var goaly:Number = moveList[i][1][1];

				var ease:int = moveList[i][2];
				var currentx:Number = obj.x;
				var currenty:Number = obj.y;

				
				if (currentx > goalx-1 && currentx < goalx+1 &&
					currenty > goaly-1 && currenty < goaly+1)
				{
					removeList.push(i);
					continue;
				}
				
				var x: Number = currentx - ((currentx - goalx) / ease);
				var y: Number = currenty - ((currenty - goaly) / ease);

				
				obj.x = x;
				obj.y = y;
			}
			
			total = removeList.length;
			removeList.sort(Array.NUMERIC);
			removeList.reverse();
			for (i = 0; i < total; i++)
				moveList.splice(removeList[i], 1);
		}
		
		private static function removeDuplicates(obj:DisplayObject) : void
		{
			var total:int = moveList.length;
			for (var i: int = 0; i < total; i++)
			{
				if (moveList[i][0] as DisplayObject == obj)
				{
					moveList.splice(i, 1);
					break;
				}
			}
		}
	}
}

/*

Copyright under the MIT open-source license to Bryan Grezeszak,
therefore cannot be re-sold, etc. But you may use it in your projects,
as long as you leave the commenting, and credits.

This class by Bryan Grezeszak | madbunny.us | bryan@madbunny.us

(\___/)
(='.'=) <------ Mad Bunny Skills
(")_(")

*/