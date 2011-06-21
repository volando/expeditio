package
{
	import org.flixel.*;



	public class PlayState extends FlxState
	{
		
		protected var _player:Player
		
		public var _score:FlxText;
		public var _num:FlxText;
		
		
		public static var currentScreen:Screen;
		private static var screenIndex:Number = -1;
		private static var ImgMapArray:Array;
		private var time:int = 60;
		
		override public function create():void
		{
			super.create();
			//Background
			FlxState.bgColor = 0xFFFFFFFF;
			
			_player = new Player(100, 100);
			add(_player);
			
			currentScreen = new Screen(screenIndex);
			FlxG.state.add(currentScreen);
			
			ImgMapArray = new Array();

		}
		
		public static function nextScreen():void
		{
			screenIndex = screenIndex + 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
			currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex]);
			FlxG.state.add(currentScreen);
		}
		
		public static function previousScreen():void
		{
			
			screenIndex = screenIndex - 1;
			if (screenIndex >= ImgMapArray.length)
				return;
			if (screenIndex > 0)
			currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex]);
			FlxG.state.add(currentScreen);
			
			
			
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
			time--;
			
		if (time < 0) {
			time = 60;	
			}
		}
		
	}
}

