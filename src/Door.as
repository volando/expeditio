package  
{
	import org.flixel.*;
	
	public class Door extends FlxSprite
	{
		[Embed(source = "data/bg.png")] private var BlueDoorImage:Class;
			
		public function Door(X:int, Y:int)
		{
		super(X, Y); 
		}
		override public function update():void
		{
/*		private function transfer(player: FlxSprite,screen1:FlxTilemap):void 
		{
			FlxG.state = new PlayState2();
		}*/
			}
		}
	}
