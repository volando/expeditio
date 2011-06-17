package
{
	import org.flixel.*;



	public class PlayState extends FlxState
	{
		
		protected var _player:Player;
		protected var _blocke:Block;
		public var _score:FlxText;
		
		private var screenIndex:Number = -1;
		private var currentScreen:Screen;
		private var ImgMapArray:Array;
		
		override public function create():void
		{
			
			//Background
			FlxState.bgColor = 0xFFFFFFFF;
			
			_player = new Player(100, 100);
			add(_player);
			
			var corX:Array = new Array();// [0]
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

			var corY:Array = new Array();
			
			corY [0] = 0
			corY [1] = 32
			corY [2] = 64
			corY [3] = 96
			corY [4] = 128
			corY [5] = 160
			corY [6] = 192
			corY [7] = 224
			
			for each (var a in corX) 
			{
					var _blocke:Block = new Block(a, corY[7])
					add(_blocke);
				for each (var b in corY) 
				{
					var _blocke:Block = new Block(corX[0], corY[7])
					add(_blocke);
					
					var _blocke:Block = new Block(corX[9], corY[7])
					add(_blocke);
					


					
/*				instance_create(corX[0], corY[7], oBlock)
				instance_create(corX[9],corY[7],oBlock)
				repeat(random (40)) instance_create(corX[choose(1,2,3,4,5,6,7,8)],corY[7],oBlock)
				repeat(random (2)) instance_create(corX[choose(2,3,4,5,6,7,8)],corY[random(7)],oBlock)*/
					
				}
			}
			_score = new FlxText(40, 10, 300);
			_score.setFormat(null,8,0x00000000,null,0)
			_score.text = "coor: " + String(a) +"///" + String(b)  ;
			add(_score);
			
			//nextScreen();
			//previousScreen();

		}
		
		public function nextScreen():void
		{
			screenIndex = screenIndex + 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
				currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex]);
			add(currentScreen);
			_player.x = 20;
		}
		
		public function previousScreen():void
		{
			screenIndex = screenIndex - 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
				currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex] );
			add(currentScreen);
			_player.x = screen.width - 20;
		}
		
		override public function update():void
		{
			super.update();
			collide();	
			
			
		if (_player.x >= screen.width)
			{
			nextScreen();
			}
			
		if (_player.x <= 0)
			{
			previousScreen();
			}
		}
		
	}
}
