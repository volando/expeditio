package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var _spider: Spider;
		//private var _insects: FlxGroup;
		//private var _bullets: FlxGroup;
		//private var _rainy: FlxGroup;
		//private var _spawnTimer: Number;
		//private var _spawnInterval: Number = 2.5;
		//private var _gameOverText:FlxText;
		//private var _scoreText:FlxText;
		//private var _counterText:FlxText;
		//private var _i:Number = 1;

		override public function create():void
		{
			
			bgColor = 0x00000000;
			FlxG.quake.start(0.02);
			
			
			_spider = new Spider();
			add(_spider);
			_spider.kill();
			_spider.dead = true;
			
			_insects = new FlxGroup();
			add(_insects);
			
			_bullets = new FlxGroup();
			add(_bullets);
			
			_rainy = new FlxGroup();
			add(_rainy);
			
			_scoreText = new FlxText(FlxG.width/2, FlxG.height / 2, 280);
			_scoreText.setFormat(null, 300, 0xFFFFFFFF, "left");
			add(_scoreText);
			
			_counterText = new FlxText(50, 50, 280);
			_counterText.setFormat(null, 10, 0xFFFFFFFF, "left");
			add(_counterText);
			
			resetSpawnTimer();
						
			super.create();
		}
		
		
		override public function update():void
		{
			// llama las funciones de colision
			FlxU.overlap(_spider, _insects, overlapSpiderInsect);
			FlxU.overlap(_insects, _bullets, overlapInsectBullet);
			
			//_counterText.text = ((FlxG.elapsed*1000).toString());			
						
			//dispara
			if(FlxG.keys.justPressed("SPACE") && _spider.dead == false)
			{
				spawnBullet(_spider.getBulletSpawnPosition());					
			}
			
			//start the game
			if(FlxG.keys.ENTER && _spider.dead)
			{				
				FlxG.state = new PlayState();
			}
		
			//decrease timer and spawn
			_spawnTimer -= FlxG.elapsed;
			
			
			if(_spawnTimer < 0)
			{
				spawnInsect();
				resetSpawnTimer();
			}
			
			//lluvia background
			spawnRain();
			
			super.update();
			
		}
		
		//timer
		private function resetSpawnTimer():void
		{
			_spawnTimer = _spawnInterval;			
			_spawnInterval *= 0.95;
			if(_spawnInterval < 0.1)
			{
				_spawnInterval = 0.1;
			}
		}
		
		//crea la bala
		private function spawnBullet(p: FlxPoint):void
		{
			var bullet: Bullet = new Bullet(p.x, p.y);
			_bullets.add(bullet);
		}
		
		//spawn insects
		private function spawnInsect():void
		{
			var x: Number = Math.random() * ((FlxG.width) - 100) +50
			var y: Number = -100;//Math.random() * ((FlxG.width - FlxG.width)  - 100) + 50;
			_insects.add(new Insect(x,y));
		}
		
		//spawn lluvia
		private function spawnRain():void
		{
		var rain:Rain = new Rain();
		_rainy.add(rain);
		}
		
		//collision insecto bullet
		private function overlapInsectBullet(insect: Insect, bullet: Bullet):void
		{
			var emitter:FlxEmitter = createEmitter();
			emitter.at(insect);
			insect.kill();
			bullet.kill();	
			FlxG.score += 1;
			_scoreText.text = FlxG.score.toString();	
		}
		
		//collision spider insecto
		private function overlapSpiderInsect(spider: Spider, insect: Insect):void
		{
			FlxG.quake.start(0.08);
			var emitter:FlxEmitter = createEmitter();
			emitter.at(spider);
			spider.kill();
			insect.velocity.x = -insect.velocity.x
				
			_gameOverText = new FlxText (0, FlxG.height / 2, FlxG.width, "YO SPACE\nPRESS ENTER TO PLAY");					
			_gameOverText.setFormat(null, 32, 0xFFFFFFFF, "center");
			add(_gameOverText);
		}
		
		//explosion
		private function createEmitter():FlxEmitter
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.delay = 1;
			emitter.gravity = 10;
			emitter.maxRotation = 0;
			emitter.setXSpeed(-500, 500);
			emitter.setYSpeed(-500, 500);		
			var particles: int = 10;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxSprite = new FlxSprite();
				particle.createGraphic(2, 2, 0xFFFFFFFF);
				particle.exists = false;
				emitter.add(particle);
			}
			emitter.start();
			add(emitter);
			return emitter;		
		}
	}
		
}

