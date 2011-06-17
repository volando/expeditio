package 
{
	import org.flixel.*;
	//import flash.*;

	public class Screen extends FlxTilemap
	{
		
		//var _blocke:Block;
		//var _blocksArray:Array;
		[Embed(source ="data/sprBlock.png")] private var ImgBlock:Class;
		
		
		
		public function Screen()
		{
			super();
			var blocksArray:Array = new Array();
			blocksArray.push(new Array());
			var level1:Array = new Array([1,1,1,1,1]);
			var level2:Array = new Array([1,0,0,0,1]);
			var level3:Array = new Array([1,0,0,0,1]);
			var level4:Array = new Array([1,0,0,0,1]);
			var level5:Array = new Array([1,1,1,1,1]);
			blocksArray[0].push(level1, level2, level3, level4, level5);

			var wall:int = 1;
			var path:int = 0;

			var tileWidth:int = 32;
			var tileHeight:int = 32;
			var tileSpacing:int = 1;

			for (var k in blocksArray[0]) //This will make the map loop through it's 5 levels or rows, so the following code will run 5 times, once for each row.
			{
				for (var i in blocksArray[0][k][0]) //This will make the map loop through each column, remember this is already in the loop that goes to each row, so at this point every tile in the map will be looped through.
				{
					var _blocke:Block = new Block(32,0,ImgBlock)
					
				}
			}
		}
					/*if (BlocksArray[0][k][0][i] == path)
					{
						square.graphics.beginFill(0x9CD55E);
						square.graphics.drawRect(0, 0, tileWidth, tileHeight);
						square.graphics.endFill();

					}
					else if (myMap[0][k][0][i] == wall)
					{
						square.graphics.beginFill(0x000000);
						square.graphics.drawRect(0, 0, tileWidth, tileHeight);
						square.graphics.endFill();
					}
					squareMC.addChild(square);
					squareMC.x = (i * (tileWidth + tileSpacing + tileSpacing)) + tileSpacing;
					squareMC.y = (k * (tileHeight + tileSpacing + tileSpacing)) + tileSpacing;
					addChild(squareMC);
					
				}
			}*/
	
	
			
			
			//Basic level structure
			//var t:FlxTilemap = new FlxTilemap();
			//auto = FlxTilemap.ALT;
			//loadMap(FlxTilemap.pngToCSV(ImgMap, false, 2), ImgTiles);
			//collideIndex = 1;
			

		}
/*		function Blockin ():void
		{
			corX [0] = 0
			corX [1] = 32
			corX [2] = 64
			corX [3] = 96
			corX [4] = 128
			corX [5] = 160
			corX [6] = 192
			corX [7] = 224
			corX [8] = 256
			corX [9] = 288

			corY [0] = 0
			corY [1] = 32
			corY [2] = 64
			corY [3] = 96
			corY [4] = 128
			corY [5] = 160
			corY [6] = 192
			corY [7] = 224
		}*/
}
	


	