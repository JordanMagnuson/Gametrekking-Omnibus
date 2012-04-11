package loneliness.rooms 
{
	import loneliness.game.Background01;
	import loneliness.game.Background02;
	import loneliness.game.Background03;
	import loneliness.game.Background04;
	import loneliness.game.Background05;
	import loneliness.game.Background06;
	import loneliness.game.Background07;
	import loneliness.game.Background08;
	import loneliness.game.Jumper;
	import loneliness.game.Marcher;
	import loneliness.game.Mixer;
	import loneliness.game.MixerCenter;
	import loneliness.game.Orbiter;
	import loneliness.game.OrbiterCenter;
	import loneliness.game.Other;
	import loneliness.game.Player;
	import loneliness.game.Sitter;
	import menu.KoreaLanding;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	
	public class MainWorld extends World
	{
		/**
		 * Size of the level (so it knows where to keep the player + camera in).
		 */
		public static var width:uint;
		public static var height:uint;		
		
		public static var player:Player;	
		
		public var bg01:Background01 = new Background01;
		public var bg02:Background02 = new Background02;
		public var bg03:Background03 = new Background03;
		public var bg04:Background04 = new Background04;
		public var bg05:Background05 = new Background05;
		public var bg06:Background06 = new Background06;
		public var bg07:Background07 = new Background07;
		public var bg08:Background08 = new Background08;
		public var backgroundAlarm:Alarm;
		
		/**
		 * The loading XML file.
		 */
		public var level:XML;		
		
		/**
		 * Level XML.
		 */
		[Embed(source='../../../assets/loneliness/levels/MainLevel2.oel', mimeType='application/octet-stream')] private static const LEVEL:Class;		
		
		/**
		 * Camera following information.
		 */
		public const FOLLOW_TRAIL:Number = 0;
		public const FOLLOW_RATE:Number = 1;	
		
		/**
		 * Sound
		 */
		[Embed(source='../../../assets/loneliness/sound/Sounds.swf', symbol='blue_paint_loop.mp3')] public static const MUSIC:Class;
		public static var music:Sfx = new Sfx(MUSIC);			
		
		public function MainWorld() 
		{			
			width = FP.width;
			height = 16000;	
			loadLevel(LEVEL);		
			backgroundAlarm = new Alarm(1, updateBackground);
		}
		
		override public function begin():void
		{
			add(bg01);
			add(player = new Player);
			addTween(backgroundAlarm, true);
			
			music.loop();
			
			//alarm to update background
			//FP.alarm(1, updateBackground);
			
			//player.y = FP.height - FP.screen.height * 5;
		}
		
		/**
		 * Update the world.
		 */
		override public function update():void 
		{			
			// update entities
			super.update();
			
			//updateBackground();
			
			// Camera
			cameraFollow();
			
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				music.stop();
				FP.world = new KoreaLanding;
			}			
			
			// Background
			//updateBackground();
			
			// camera following
			//if (classCount(Player) > 0)
			//{
				//trace('not finished');
				//cameraFollow();
			//}
			//else
				//trace('finished');
		}		
		
		public function updateBackground():void
		{
			// Alarm
			backgroundAlarm.reset(1);
			
			// Background 01
			if (player.y > 12000) 
			{
				if (classCount(Background01) == 0) 
				{
					add(bg01);
					trace('bg 1 added');
				}
			}
			else 
			{
				if (classCount(Background01) > 0) remove(bg01);
			}		
			
			// Background 02
			if (player.y > 10000) 
			{
				if (classCount(Background02) == 0) 
				{
					add(bg02);
					trace('bg 2 added');
				}
			}
			else 
			{
				if (classCount(Background02) > 0) remove(bg02);
			}	
			
			// Background 03
			if (player.y > 8000 && player.y < 14000) 
			{
				if (classCount(Background03) == 0) add(bg03);
				trace('bg 3 added');
			}
			else 
			{
				if (classCount(Background03) > 0) remove(bg03);
			}		
			
			// Background 04
			if (player.y > 6000 && player.y < 12000) 
			{
				if (classCount(Background04) == 0) add(bg04);
				trace('bg 4 added');
			}
			else 
			{
				if (classCount(Background04) > 0) remove(bg04);
			}		
			
			// Background 05
			if (player.y > 4000 && player.y < 10000) 
			{
				if (classCount(Background05) == 0) add(bg05);
				trace('bg 5 added');
			}
			else 
			{
				if (classCount(Background05) > 0) remove(bg05);
			}	
			
			// Background 06
			if (player.y > 2000 && player.y < 8000) 
			{
				if (classCount(Background06) == 0) add(bg06);
				trace('bg 6 added');
			}
			else 
			{
				if (classCount(Background06) > 0) remove(bg06);
			}	
			
			// Background 07
			if (player.y < 6000) 
			{
				if (classCount(Background07) == 0) add(bg07);
				trace('bg 7 added');
			}
			else 
			{
				if (classCount(Background07) > 0) remove(bg07);
			}	
			
			// Background 08
			if (player.y < 4000) 
			{
				if (classCount(Background08) == 0) add(bg08);
				trace('bg 8 added');
			}
			else 
			{
				if (classCount(Background08) > 0) remove(bg08);
			}				
		}
		
		/**
		 * Render the world.
		 */
		override public function render():void 
		{
			// render the backdrops
			//FP.buffer.draw(BG);
			
			// render the world
			super.render();
		}				
		
		/**
		 * Makes the camera follow the player object.
		 */
		private function cameraFollow():void
		{
			// make camera follow the player
			FP.point.x = FP.camera.x - targetX;
			FP.point.y = FP.camera.y - targetY;
			var dist:Number = FP.point.length;
			if (dist > FOLLOW_TRAIL) dist = FOLLOW_TRAIL;
			FP.point.normalize(dist * FOLLOW_RATE);
			FP.camera.x = int(targetX + FP.point.x);
			FP.camera.y = int(targetY + FP.point.y);
			
			// keep camera in room bounds
			FP.camera.x = FP.clamp(FP.camera.x, 0, width - FP.width);
			FP.camera.y = FP.clamp(FP.camera.y, 0, height - FP.height);
		}
		
		/**
		 * Getter functions used to get the position to place the camera when following the player.
		 */
		private function get targetX():Number { return player.x - FP.width / 2; }
		private function get targetY():Number { return player.y - FP.height / 2 - 100; }		
		
		
		public function loadLevel(file:Class):void
		{
			// load the level xml
			var bytes:ByteArray = new file;
			level = new XML(bytes.readUTFBytes(bytes.length));

			// load level information
			//width = level.width;
			//height = level.height;

			// load sitters
			for each (var o:XML in level.actors.sitter)
				add(new Sitter(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));
				
			// load mixers
			for each (o in level.actors.mixer_center)
				add(new MixerCenter(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));				
			for each (o in level.actors.mixer)
				add(new Mixer(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));			
				
			// load orbiters
			for each (o in level.actors.orbiter_center)
				add(new OrbiterCenter(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));				
			for each (o in level.actors.orbiter)
				add(new Orbiter(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));		
				
			// load jumpers			
			for each (o in level.actors.jumper)
				add(new Jumper(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));
				
			// load marchers			
			for each (o in level.actors.marcher)
				add(new Marcher(FP.scale(o.@x, 0, level.width, 0, width), FP.scale(o.@y, 0, level.height, 0, height)));					
		}
		
	}

}