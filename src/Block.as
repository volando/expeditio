package  
{
	import org.flixel.*;

	public class Block extends FlxSprite
	{
		[Embed(source ="data/sprBlock.png")] private var ImgBlock:Class;
		
		
		public function Block(X:Number,Y:Number) 
		{
			super(X, Y); 
			loadGraphic(ImgBlock, true);
			_fixed = true;
			//createGraphic(14, 16, 0xff3f3f3f);
			//loadGraphic(ImgBlock, false, false, 32, 32, false);	
			//makeGraphic(32, 32, 0xffffffff, false, null);
			
		}
		override public function update():void
		{
			super.update();
			//collide();
		}
		
	}

}