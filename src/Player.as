package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source="data/player.png")] private var ImgPlayer:Class;
		
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);
			loadGraphic(ImgPlayer,true);
			maxVelocity.x = 100;			//walking speed
			acceleration.y = 300;			//gravity
			drag.x = maxVelocity.x*8;		//deceleration (sliding to a stop)
			
			//tweak the bounding box for better feel
			width = 32;
			height = 30;
			offset.x = 0;
			offset.y = 0;
			//solid = true;
			
			addAnimation("idle",[0],0,false);
			addAnimation("walk",[1,2,3,0],10,true);
			addAnimation("walk_back",[3,2,1,0],10,true);
			addAnimation("flail",[1,2,3,0],18,true);
			addAnimation("jump",[4],0,false);
		}
		
		override public function update():void
		{
			//Smooth slidey walking controls
			acceleration.x = 10;
			if(FlxG.keys.LEFT)
				acceleration.x -= drag.x;
			if(FlxG.keys.RIGHT)
				acceleration.x += drag.x;
				
			if (x >= FlxG.width)
			{
			//nextScreen();
			x = 2
			}
			
			if (x <= 0)
			{
			x = FlxG.width - 2;
			PlayState.previousScreen();
			}
			
			if(onFloor)
			{
				//Jump controls
				if(FlxG.keys.justPressed("SPACE"))
				{
					velocity.y = -acceleration.y*0.51;
					play("jump");
				}
			}
			
			//Default object physics update
			super.update();
		}

	}
}