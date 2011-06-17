package
{
	import org.flixel.*;
	
	public class Elevator extends FlxSprite
	{
		[Embed(source="data/elevator.png")] private var ImgElevator:Class;
		
		protected var _y:int;
		protected var _height:int;
		
		public function Elevator(X:Number, Y:Number, Height:Number)
		{
			super(X, Y, ImgElevator);
			width = 48;			//Minor bounding box adjustment
			_y = Y;				//The starting height
			_height = Height;	//How far down to travel
			fixed = true;		//We want the elevator to be "solid" and not shift during collisions
			velocity.y = 40;	//Basic elevator speed
		}
		
		override public function update():void
		{
			//Update the elevator's motion
			super.update();
			
			//Turn around if necessary
			if(y > _y + _height)
			{
				y = _y + _height;
				velocity.y = -velocity.y;
			}
			else if(y < _y)
			{
				y = _y; 
				velocity.y = -velocity.y;
			}
		}
		
					var corX:Array = new Array();
			//add(corX);
			corX[0].push(0);
			corX[1].push(32);
			corX[2].push(64);
			corX[3].push(96);
			corX[4].push(128);
			corX[5].push(160);
			corX[6].push(192);
			corX[7].push(224);
			corX[8].push(256);
			corX[9].push(288);
			
			var corY:Array = new Array();
			//add(corY);
			corY[0].push(0);
			corY[1].push(32);
			corY[2].push(64);
			corY[3].push(96);
			corY[4].push(128);
			corY[5].push(160);
			corY[6].push(192);
			corY[7].push(224);
	}
	
				var level2:Array = new Array([1,0,0,0,1]);
			var level3:Array = new Array([1,0,0,0,1]);
			var level4:Array = new Array([1,0,0,0,1]);
			var level5:Array = new Array([1,1,1,1,1]);
			blocksArray[0].push(level1, level2, level3, level4, level5);
}