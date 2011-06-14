package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		
		[Embed(source="data/bg.png")] private var ImgBG:Class;
		[Embed(source = "data/gibs.png")] private var ImgGibs:Class;
		
		[Embed(source = "data/map.png")] private var ImgMap1:Class;
		[Embed(source = "data/map2.png")] private var ImgMap2:Class;
		[Embed(source = "data/map3.png")] private var ImgMap3:Class;
		[Embed(source = "data/map4.png")] private var ImgMap4:Class;
		
		
		
		protected var _fps:FlxText;
		protected var _player:Player;
		//protected var _elevator:FlxSprite;
		//protected var _decoration:FlxSprite;
		public var _screen:FlxTilemap; //1
		public var _screenArray :Array;// array para pantallas
		//public var _screen2:FlxTilemap;//2
		
		private var screenIndex:Number = -1;
		private var currentScreen:Screen;
		private var ImgMapArray:Array;
		
		//public var exit:Exit;
		//public var door: FlxSprite;

		
		
		override public function create():void
		{
			
			//Background
			FlxState.bgColor = 0xffacbcd7;
			
			ImgMapArray = new Array();
			ImgMapArray.push(ImgMap1);
			ImgMapArray.push(ImgMap2);
			ImgMapArray.push(ImgMap3);
			ImgMapArray.push(ImgMap4);
			
			
			_player = new Player(800, 100);
			add(_player);
			nextScreen();
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
			//if (screenIndex >= ImgMapArray.length)
				//return;
			//if (screenIndex > 0)
				currentScreen.kill();
			currentScreen = new Screen(ImgMapArray[screenIndex] );
			add(currentScreen);
			_player.x = screen.width - 20;
		}
		
		override public function update():void
		{
			//_fps.text = screenIndex +" fps";
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
