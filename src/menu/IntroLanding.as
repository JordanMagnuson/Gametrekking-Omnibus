package menu 
{
	import jui.Button;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	/**
	 * ...
	 * @author ...
	 */
	public class IntroLanding extends MenuLanding 
	{
		public var sndVoiceIntro:Sfx = new Sfx(Assets.SND_VOICE_INTRO);
		public var request:URLRequest;
		public var websiteURL:String = "http://www.gametrekking.com/?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";	
		public var websiteButton:Button;
		
		public function IntroLanding() 
		{
			super();
			Global.navButtonIndex = Global.INTRO_BUTTON_INDEX;
			
			add(new Entity(0, 0, new Backdrop(Assets.INTRO_LANDING, false, false)));	
			
			add(websiteButton = new Button(499, 518, new Image(Assets.WEBSITE_TEXT), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoWebsite));	
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
		
		public function gotoWebsite():void
		{
			request = new URLRequest(websiteURL);
			try {
				navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
				trace("Error occurred!");
			}
		}			
		
	}

}