package menu 
{
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import gum.FlashPunk.UIEntity;
	import gum.UISkin;
	import kindnessofstrangers.Game;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import jui.Button;
	import statusquo.GameWorld;
	import flash.net.navigateToURL;	
	
	/**
	 * ...
	 * @author ...
	 */
	public class TaiwanLanding extends MenuLanding
	{		
		public var map:Entity;
		public var request:URLRequest;
		public var reflectionURL:String = "http://www.gametrekking.com/blog/taiwan-touch-your-heart";		
		
		public function TaiwanLanding() 
		{
			super();
			Global.navButtonIndex = Global.TAIWAN_BUTTON_INDEX;
			
			// Landing
			//add(new Entity(0, 0, new Backdrop(Assets.TAIWAN_LANDING, false, false)));			
			
			// Map
			add(map = new Entity(235, 0, new Backdrop(Assets.TAIWAN_MAP, false, false)));		
			//(map.graphic as Backdrop).alpha = 0.5;
			
			// Buttons
			add(new Button(194, 193, new Image(Assets.TAIWAN_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(188, 448, new Image(Assets.TAIWAN_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoReflection));	
			
			add(new Button(857, 197, new Image(Assets.TAIWAN_STATUS_QUO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoStatusQuo));	
			
			add(new Button(812, 443, new Image(Assets.TAIWAN_KINDNESS_OF_STRANGERS_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoKindness));	
		}
		
		public function gotoStatusQuo():void
		{
			//FP.world = new GameWorld;
			FP.world = new IntroScreen(Assets.INTRO_STATUS_QUO, GameWorld);
		}	
		
		public function gotoKindness():void
		{
			FP.world = new Game;
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