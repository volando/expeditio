package  
{
	import org.flixel.*;
	
	public class Door extends FlxSprite
	{
		[Embed(source = "data/bg.png")] private var BlueDoorImage:Class;
			
		public function Door(X:Number, Y:Number)
		{
		super(X, Y); 
		}
		override public function update():void
		{
			/*var player:Player = Core as Player;
			//Basic overlap check
			if( (Core.x + Core.width <= this.x) ||
				(Core.x >= this.x + this.width) ||
				(Core.y >= this.y + this.height) ||
				(Core.y + Core.height <= this.y))
				return;
		}if (this.exists)
			{				
				// check to see from what direction we moved into the block
				var contactFromLeft:Boolean = Core.x + Core.width > this.x && 
					Core.last.x + Core.width <= this.last.x;				
				var contactFromRight:Boolean = Core.x < this.x + this.width &&
					Core.last.x >= this.last.x + this.width;				
				var contactFromBottom:Boolean = Core.y < this.y + this.height && 
					Core.last.y >= this.last.y + this.height;
				var contactFromTop:Boolean = Core.y + Core.height > this.y &&
					Core.last.y + Core.height <= this.last.y;
				
				if (contactFromLeft && Core.hitWall(this))
				{
					Core.x = this.x - Core.width;
					
				}
				
				if (contactFromRight && Core.hitWall(this))
				{
					Core.x = this.x + this.width;	
				}
				
				if (contactFromBottom && Core.hitFloor(this))
				{
					Core.y = this.y + this.height;
				}
				
				if (contactFromTop && Core.hitCeiling(this))
				{
						Core.y = this.y - Core.height;
				}
			}
		}
	}*/
}