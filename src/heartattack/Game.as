package heartattack  
{
	import flash.geom.Point;
	import menu.VietnamLanding;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Game extends World
	{
		public var quakeInterval:Number = 3 * FP.assignedFrameRate;
		public var quakeDuration:Number = 0.5;
		public var quakeIntensity:Number = 0.5;
		public var quakeAlarm:Alarm = new Alarm(quakeInterval, quakeScreen);
		
		public function Game() 
		{
			// Reset the engine to fixed frame rate
			(FP.engine as Main).reset(640, 480, 60, true);
			
			FP.screen.scale = 1.25;
			FP.screen.smoothing = true;
			
			// Center screen in window
			FP.screen.x = Global.screenX = (SuperGlobal.SCREEN_WIDTH - FP.width * FP.screen.scale) / 2;
			FP.screen.y = Global.screenY = (SuperGlobal.SCREEN_HEIGHT - FP.height * FP.screen.scale) / 2;
			
			resetGlobals();
			
			Mouse.hide();
			
			if (Global.TEST_MODE)
			{
				Global.phase = 0;
				Global.dieTogether = false;
				Global.bothDead = false;
				Global.startPixelating = false;
				Global.startDepixelating = false;
				Global.alphaIncreasing = false;
				Global.quakeScreenOnBeat = true;
				Global.quakeDuration = 0.01;
				Global.quakeIntensity = 0.01;
			}
		}
		
		public function resetGlobals():void
		{
			Global.phase = 0;
			
			// Game over
			Global.gameOver = false;
			Global.dieTogether = false;
			Global.bothDead = false;		
			Global.increaseAlphaAmount = 0.05;		
			
			// Photo pixelation
			Global.startPixelating = false;
			Global.startDepixelating = false;
			Global.pixelatePerPhoto = 0.25;		// 0.3 Once startPixelating is true, how much to increase pixelation with each photo?
			Global.depixelatePerPhoto = 0.5;
			Global.photoCellSize = 1;
			Global.alphaIncreasing = false;
			
			// Screen quake
			Global.quakeScreenOnBeat = false;
			Global.quakeDuration = 0.01;
			Global.quakeIntensity = 0.01;		
			Global.quakeDurationIncreaseBy = 0.01;
			Global.quakeIntensityIncreaseBy = 0.01;				
		}
		
		override public function begin():void
		{
			add(new Ground);
			add(Global.quake = new Quake);
			//add(Global.cheater = new Cheater);
			add(Global.soundController = new SoundController);
			
			//addTween(quakeAlarm, true);
			
			//Global.soundController.flatline.loop(0.5);
			
			// Choose randomly who to put on top
			if (FP.random > 0.5)
			//if (false)
			{
				trace('American on top');
				add(Global.americanController = new AmericanController(true, Global.INPUT_KEY_TOP));
				add(Global.vietController = new VietController(false, Global.INPUT_KEY_BOTTOM));
			}
			else
			{
				trace('Viet on top');
				add(Global.vietController = new VietController(true, Global.INPUT_KEY_TOP));
				add(Global.americanController = new AmericanController(false, Global.INPUT_KEY_BOTTOM));
			}	
			Global.vietController.markedForPause = true;
			
			
			//Global.americanController.markedForPause = true;
			if (!Global.TEST_MODE)
			{
				FP.world.add(new Tutorial(Global.americanController));
				FP.world.add(new Tutorial(Global.vietController));
			}
			//FP.world = new GameOver;
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Stop sounds
				Global.americanController.heartController.heartSoundController.sndBeat01.stop();
				Global.americanController.heartController.heartSoundController.sndBeat02.stop();
				Global.americanController.heartController.heartSoundController.sndBeat03.stop();
				Global.americanController.heartController.heartSoundController.sndBeat04.stop();
				Global.americanController.heartController.heartSoundController.sndMissed.stop();
				Global.americanController.heartController.heartSoundController.beatLoop.stop();
				
				Global.vietController.heartController.heartSoundController.sndBeat01.stop();
				Global.vietController.heartController.heartSoundController.sndBeat02.stop();
				Global.vietController.heartController.heartSoundController.sndBeat03.stop();
				Global.vietController.heartController.heartSoundController.sndBeat04.stop();
				Global.vietController.heartController.heartSoundController.sndMissed.stop();	
				Global.vietController.heartController.heartSoundController.beatLoop.stop();
				
				if (GameOverSequence.music) GameOverSequence.music.stop();
				if (GameOverSequence.sndFlatline) GameOverSequence.sndFlatline.stop();
				heartattack.Global
				
				// Return
				FP.world = new VietnamLanding;
			}					
			
			//trace(Global.phase);
		
			// Deal with death
			if (Global.americanController.dead || Global.vietController.dead)
			{
				if (!Global.gameOver)
				{
					Global.gameOver = true;
					if (Math.abs(Global.americanController.heartController.health - Global.vietController.heartController.health) <= Global.HEALTH_DIF_TO_DIE_TOGETHER)
						Global.bothDead = true;
					if (Global.americanController.dead)
						add(new GameOverSequence(Global.americanController, Global.vietController));
					else 
						add(new GameOverSequence(Global.vietController, Global.americanController));
				}
			}
			
			// Deal with phases
			switch (Global.phase)
			{
				case 0:
				case 2:
					if (Global.americanController.photoController.finished)
					{
						//Global.americanController.photoController.finished = false;
						Global.americanController.fadeOut();
						Global.vietController.fadeIn();
						Global.phase++;
					}				
					break;
				case 1:
				case 3:
					if (Global.vietController.photoController.finished)
					{
						//Global.vietController.photoController.finished = false;
						Global.vietController.fadeOut();
						Global.americanController.fadeIn();
						Global.phase++;
					}			
					break;
				case 5:
					if (Global.americanController.heartController.beatAlarm.percent <= 0.05)
					{
						Global.vietController.fadeIn();
						//Global.dieTogether = true;
						Global.startPixelating = true;
						Global.quakeScreenOnBeat = true;
						Global.phase++;
					}
					break;
					//trace(Global.americanController.heartController.beatAlarm.percent);
					//if (Global.americanController.heartController.beatAlarm.percent <= 0.10)
					//{
						//Global.vietController.fadeIn();
						//Global.phase++;
					//}					
					
				default:
					break;
			}
			super.update();
		}
		
		public function quakeScreen():void
		{
			Global.quake.start(quakeIntensity, quakeDuration);
			quakeAlarm.reset(quakeInterval);				
		}		
		
	}

}