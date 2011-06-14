package 
{
	import org.flixel.*;

	public class Screen extends FlxTilemap
	{
		//[Embed(source="data/map.png")] private var ImgMap:Class;
		[Embed(source = "data/tiles.png")] private var ImgTiles:Class;
		
		public function Screen(ImgMap:Class)
		{
			super();
			//Basic level structure
			//var t:FlxTilemap = new FlxTilemap();
			auto = FlxTilemap.ALT;
			loadMap(FlxTilemap.pngToCSV(ImgMap, false, 2), ImgTiles);
			collideIndex = 1;
			

		}
		
	}

	}
	
	// constructor vacio (). --> funcion