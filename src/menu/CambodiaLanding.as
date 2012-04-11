package menu 
{
	import briefhistory.Game;
	import jui.Button;
	import killer.rooms.MusicChoice;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;			
	import net.flashpunk.World;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CambodiaLanding extends MenuLanding
	{
		public var map:Entity;
		public var request:URLRequest;
		public var reflectionURL:String = "http://www.gametrekking.com/blog/cambodia-like-no-place-ive-been";			
		
		public function CambodiaLanding() 
		{
			super();
			Global.navButtonIndex = Global.CAMBODIA_BUTTON_INDEX;
			
			// Landing
			//add(new Entity(0, 0, new Backdrop(Assets.CAMBODIA_LANDING, false, false)));
			
			// Map
			add(map = new Entity(117, 39, new Backdrop(Assets.CAMBODIA_MAP, false, false)));		
			//(map.graphic as Backdrop).alpha = 0.5;			
			
			// Buttons
			add(new Button(317, 193, new Image(Assets.CAMBODIA_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(277, 451, new Image(Assets.CAMBODIA_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoReflection));	
			
			add(new Button(798, 208, new Image(Assets.CAMBODIA_KILLER_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoKiller));	
			
			add(new Button(858, 459, new Image(Assets.CAMBODIA_HISTORY_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoBriefHistory));	
		}
		
		public function gotoKiller():void
		{
			//FP.world = new MusicChoice;
			var goto:World = new IntroScreen(Assets.INTRO_KILLER, MusicChoice, CambodiaLanding);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 					
		}		
		
		public function gotoBriefHistory():void
		{
			//FP.world = new Game;
			var goto:World = new IntroScreen(Assets.INTRO_BRIEF_HISTORY, Game, CambodiaLanding);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 			
		}	
		
		public function gotoReflection():void
		{
			request = new URLRequest(reflectionURL);
			try {
				navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
				trace("Error occurred!");
			}
		}			
		
	}

}