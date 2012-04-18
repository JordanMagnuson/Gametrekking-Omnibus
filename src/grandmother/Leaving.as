package grandmother  
{
	import flash.utils.Dictionary;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import punk.transition.Transition;
	import menu.VietnamLanding;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Leaving extends World
	{
		public var background:Entity;
		public var photoArray:Array = new Array(Assets.PHOTO_01, Assets.PHOTO_02, Assets.PHOTO_03, Assets.LEAVING_04, Assets.PHOTO_05, Assets.PHOTO_06, Assets.PHOTO_07, Assets.PHOTO_08, Assets.PHOTO_09, Assets.PHOTO_10, Assets.PHOTO_11, Assets.LEAVING_12, Assets.LEAVING_13, Assets.PHOTO_14, Assets.LEAVING_15, Global.cleanHeadstone);
		public var soundArray:Array = new Array(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, Assets.SND_DOOR_SQUEAK);					
		public var photoController:PhotoControllerLeaving;
		
		public function Leaving() 
		{
			photoArray.reverse();			
		}
		
		override public function begin():void
		{
			//background = new Entity(0, 0, new Backdrop(Assets.HEADSTONE_CLEANED));
			//background.layer = 100;
			//add(background);
			if (!Global.SndAmbient.playing)
				Global.SndAmbient.loop();
			add(photoController = new PhotoControllerLeaving(photoArray, soundArray, Global.LONG_ENDING_PHOTO_PAUSE_DURATION));
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
				punk.transition.Transition.to(VietnamLanding, new SuperGlobal.TRANS_OUT(SuperGlobal.TRANS_OUT_OPTIONS), new SuperGlobal.TRANS_IN(SuperGlobal.TRANS_IN_OPTIONS));
				//FP.world = new VietnamLanding;
			}				
			
			if (photoController.currentIndex == photoArray.length && photoController.currentPhoto.fadeInComplete)
			{
				fadeOut();
			}			
			
			super.update();
		}
		
		public function fadeOut():void
		{
			if (!Global.startedFade)
			{
				var sfxFader:SfxFader = new SfxFader(Global.SndAmbient);
				addTween(sfxFader);
				sfxFader.fadeTo(0, Global.FADE_OUT_DURATION);
				add(new FadeOut(GameOver, Colors.BLACK, Global.FADE_OUT_DURATION));
				Global.startedFade = true;
			}
		}		
		
	}

}