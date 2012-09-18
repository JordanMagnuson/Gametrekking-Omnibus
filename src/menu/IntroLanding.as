package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author ...
	 */
	public class IntroLanding extends MenuLanding 
	{
		public var sndVoiceIntro:Sfx = new Sfx(Assets.SND_VOICE_INTRO);
		
		public function IntroLanding() 
		{
			super();
			Global.navButtonIndex = Global.INTRO_BUTTON_INDEX;
			
			add(new Entity(0, 0, new Backdrop(Assets.INTRO_LANDING, false, false)));	
			remove(copyright);
		}
		
		override public function begin():void
		{
			super.begin();
			if (Global.voiceIntroPlayed != true) 
			{
				FP.alarm(0.75, playVoiceIntro);
			}
		}
		
		public function playVoiceIntro():void
		{
			sndVoiceIntro.play(0.7);
			Global.voiceIntroPlayed = true;			
		}
		
	}

}