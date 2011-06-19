package
{
	import org.flixel.*;



	public class PlayState extends FlxState
	{
		
		protected var _player:Player;
		//protected var _blocke:Block;
		
		public var _score:FlxText;
		public var _num:FlxText;
		
		
		public var currentScreen:Screen;
		private var screenIndex:Number = 0;
		private var ImgMapArray:Array;
		
		override public function create():void
		{
			
			//Background
			FlxState.bgColor = 0xFFFFFFFF;
			
			_player = new Player(100, 100);
			add(_player);
			
			currentScreen = new Screen(screenIndex);
			add(currentScreen);
			
			ImgMapArray = new Array();
			
			
			
			
/*			_score = new FlxText(40, 10, 300);
			_score.setFormat(null,8,0x00000000,null,0)
			_score.text = "coor: " + String(currentScreen.a) +"///" + String(currentScreen.b)  ;
			add(_score);*/
			

			
			//nextScreen();
			//previousScreen();

		}
		
		public function nextScreen():void
		{
			_player.x = 20;
			screenIndex = screenIndex + 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
			currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex]);
			add(currentScreen);
			
			
		}
		
		public function previousScreen():void
		{
			screenIndex = screenIndex - 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
			currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex]);
			add(currentScreen);
			_player.x = screen.width - 20;
		}
		
		function text():void
		{
			
			_num = new FlxText(40, 30, 300);
			_num.setFormat(null, 8, 0x00000000, null, 0);
			//_num.kill();
			_num.text = "coor: " + String(screenIndex) + "|" + String(currentScreen) + "|" + String(ImgMapArray.length) ; 
			FlxG.state.add(_num);
			
		}
	
		
		override public function update():void
		{
			super.update();
			collide();	
			text();
			
		if (_player.x >= FlxG.width)
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
