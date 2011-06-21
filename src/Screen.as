package 
{
	import org.flixel.*;

	public class Screen extends FlxSprite
	{
		public var blockPositions:Vector.<FlxPoint> = new Vector.<FlxPoint>();
		public var floorWidth: int = 10
		public var floorHeight: int = 7
		public var randomBlocks: int = 5
		public var stageWidth: int = 320
		public var stageHeight: int = 288
		public var thisPoint:FlxPoint;
	
	
	public function Screen(screenIndex:Number)
	{
		super(screenIndex);
		
		//floor
		
		for (var f:int = 0; f < floorWidth; f++)
		{
			thisPoint = new FlxPoint(f * 32, floorHeight * 32);
			blockPositions.push(thisPoint);
		}

		for (var r:int = 0; r < randomBlocks; r++)
		{
			thisPoint = new FlxPoint(Math.floor(FlxU.random() * floorWidth) * 32, Math.floor(FlxU.random() * floorHeight) * 32);
			blockPositions.push(thisPoint);
		}

		for (var l:int = 0; l < blockPositions.length; l++)
		{
/*			var point:FlxPoint = new FlxPoint(0, 0);
			point = blockPositions[l];*/
			
			var thisBlock:Block = new Block(blockPositions[l].x, blockPositions[l].y);
			FlxG.state.add(thisBlock);
		}
	}
	}
}
	
	


	
	
	
	
	
	
/*private var corX:Array = new Array();
		private var corY:Array = new Array();
		
		public function Screen(screenIndex:Number)
		{
			
			
			super(screenIndex);
			var corX:Array = new Array();
			corX [0] = 0//var mypoint:FlxPoint = new FlxPoint(3,4);
			corX [1] = 32
			corX [2] = 64
			corX [3] = 96
			corX [4] = 128
			corX [5] = 160
			corX [6] = 192
			corX [7] = 224
			corX [8] = 256
			corX [9] = 288

			var corY:Array = new Array();
			
			corY [0] = 0
			corY [1] = 32
			corY [2] = 64
			corY [3] = 96
			corY [4] = 128
			corY [5] = 160
			corY [6] = 192
			corY [7] = 224
			
			
			
			for each (var  a:int in corX) 
			{
				var thisBlock:FlxSprite = new Block (a, corY [7]);//(i * 32, j * 32);
				FlxG.state.add(thisBlock);
				for each (var b:int in corY) 
				{
					var thisBlocke:FlxSprite = new Block (corX[randomMinMax(3,8)],corY[randomMinMax(6,7)]);//corX[randomMinMax(1,8)],corY[randomMinMax(0,7)
					FlxG.state.add(thisBlocke);
					}
					
				}
			}
			private function randomMinMax( min:Number, max:Number ):Number
			{
			return Math.round(min + (max - min) * Math.random());*/

		


	