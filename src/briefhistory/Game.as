package briefhistory  
{
	import menu.CambodiaLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Game extends World
	{
		public static var sndWaves:Sfx = new Sfx(Assets.SND_WAVES);
		
		public function Game() 
		{
		}
		
		override public function begin():void
		{
			// Fade In
			add(new FadeIn(Colors.BLACK, 10, 5));
			
			// Background
			add(new Background);
			
			// Mouse controller
			add(Global.mouseController = new MouseController);
			
			// Waves
			addWaveController();
			FP.alarm(1, addWaveController);
			FP.alarm(2, addWaveController);
			FP.alarm(3, addWaveController);
			add(Global.floatController = new FloatController);
			
			// Place people
			placePeople();
			
			// Sound
			sndWaves.loop();
			add(Global.ambientController = new AmbientController);
			
			// Blood overlay
			add(Global.bloodOverlay = new BloodOverlay);
		}
		
		override public function update():void
		{
			//Global.t += FP.elapsed;
			
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Stop sounds
				sndWaves.stop();
				if (Global.ambientController.currentSound) Global.ambientController.currentSound.stop();
				if (Global.ambientController.lastSound) Global.ambientController.lastSound.stop();				
				Global.ambientController.sndHell01.stop();
				Global.ambientController.sndHell02.stop();
				Global.ambientController.sndHell03.stop();
				
				// Return
				FP.world = new CambodiaLanding;
			}		
			
			super.update();
		}
		
		public function placePeople():void
		{
			var phaseDelay:Number = 0;
			var xPosArray:Array = new Array();
			for (var i:Number = 1; i <= Global.NUMBER_OF_PEOPLE; i++)
			{ 
				xPosArray.push(FP.random * FP.width);
			}	
			xPosArray.sort();
			for each (var xPos:Number in xPosArray)
			{ 
				var yPos:Number = Global.WATER_LINE + FP.random * Global.FLOAT_LEVEL_VARIATION;
				phaseDelay = xPos / Global.PHASE_DELAY_DIVIDER;
				trace('game add personFloating');
				add(new PersonFloating(xPos, yPos, phaseDelay));
				
			}			
			
		}
		
		public function addWaveController():void
		{
			add(new WaveController);
		}
		
	}

}