package menu 
{
	import gallery.Gallery;
	import grandmother.Approach;
	import heartattack.Game;
	import jui.Button;
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
	public class VietnamLanding extends MenuLanding
	{
		public var map:Entity;
		public var request:URLRequest;
		public var reflectionURL:String = "http://www.gametrekking.com/blog/vietnam-yin-and-yang?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";	
		public var morePhotosURL:String = "http://www.gametrekking.com/blog/vietnam-journey-in-review?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";
		
		public function VietnamLanding() 
		{
			super();
			Global.navButtonIndex = Global.VIETNAM_BUTTON_INDEX;
			
			// Landing
			//add(new Entity(0, 0, new Backdrop(Assets.VIETNAM_LANDING, false, false)));				
			
			// Map
			add(map = new Entity(87, 0, new Backdrop(Assets.VIETNAM_MAP, false, false)));
			//(map.graphic as Backdrop).alpha = 0.5;
			
			// Buttons
			add(new Button(281, 204, new Image(Assets.VIETNAM_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoPhotos));	
			
			add(new Button(266, 461, new Image(Assets.VIETNAM_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoReflection));	
			
			add(new Button(806, 214, new Image(Assets.VIETNAM_HEART_ATTACK_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoHeartAttack));	
			
			add(new Button(763, 451, new Image(Assets.VIETNAM_GRANDMOTHER_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoGrandmother));	
		}
		
		public function gotoPhotos():void
		{
			var goto:World = new Gallery(gallery.Assets.VIETNAM_PHOTO_ARRAY, VietnamLanding, morePhotosURL);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
		}						
		
		public function gotoHeartAttack():void
		{
			//FP.world = new Game;
			var goto:World = new IntroScreen(Assets.INTRO_HEART_ATTACK, Game, VietnamLanding);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 				
		}		
		
		public function gotoGrandmother():void
		{
			//FP.world = new Approach;
			var goto:World = new IntroScreen(Assets.INTRO_GRANDMOTHER, Approach, VietnamLanding);
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