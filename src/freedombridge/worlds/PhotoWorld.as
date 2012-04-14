package freedombridge.worlds 
{
	import flash.utils.Dictionary;
	import freedombridge.FadeIn;
	import freedombridge.Photo;
	import kindnessofstrangers.Menu;
	import menu.KoreaLanding;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import freedombridge.River
	import menu.Global;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoWorld extends World
	{
		
		public function PhotoWorld() 
		{
			add(new Photo);
		}
		
		override public function begin():void
		{
			trace("photoworld begin");
			FP.camera.x = FP.camera.y = 0;
			add(new FadeIn(Colors.BLACK, 3));
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Clear tweens (eg fading sounds, FP.alarm, etc.)
				FP.tweener.clearTweens();
				
				// Stop all sounds
				for each (var sfx:Sfx in SuperGlobal.soundsPlaying) {
					trace('another sound');
					if (sfx != null) sfx.stop();
				}
				
				// Empty sound tracker
				SuperGlobal.soundsPlaying = new Dictionary();
				
				// Return
				Transition.to(KoreaLanding, new menu.Global.TRANS_OUT(menu.Global.TRANS_OUT_OPTIONS), new menu.Global.TRANS_IN(menu.Global.TRANS_IN_OPTIONS));
			}
			
			super.update();
		}
		
	}

}