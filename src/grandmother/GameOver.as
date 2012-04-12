package grandmother  
{
	import menu.VietnamLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author ...
	 */
	public class GameOver extends World
	{
		
		public function GameOver() 
		{
			FP.screen.smoothing = false;
			FP.screen.scale = 1;
			FP.screen.y = 0	
			
			add(new Entity(0, 0, new Backdrop(Assets.GAME_OVER_SCREEN)));
			add(new FadeIn(Colors.BLACK, Global.FADE_OUT_DURATION));
		}
		
		override public function begin():void
		{
			trace('now in game over');
			
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Stop sounds
				Global.SndAmbient.stop();

				var backdropList:Array = [];
				getClass(PhotoBackdrop, backdropList);
				for each (var pb:PhotoBackdrop in backdropList)
				{
					if (pb.sound.playing)
					{
						pb.sound.stop();
					}
				}				
				
				// Return
				FP.world = new VietnamLanding;
			}
			
			super.update();
		}
		
	}

}