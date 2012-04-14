package menu 
{
	import flash.net.URLRequest;
	import freedombridge.worlds.MyWorld;
	import gallery.Gallery;
	import loneliness.rooms.MainWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import jui.Button;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import flash.net.navigateToURL;
	import net.flashpunk.World;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author ...
	 */
	public class KoreaLanding extends MenuLanding
	{
		public var map:Entity;
		public var request:URLRequest;
		public var reflectionURL:String = "http://chasingdonguri.com/blog-from-beginning?field_country_value_many_to_one=Korea&utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";	
		public var beingThereURL:String = "http://www.gametrekking.com/the-games/korea/being-there?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";
		public var morePhotosURL:String = "http://www.flickr.com/photos/chasingdonguri/collections/72157613775330015/";
		
		public function KoreaLanding() 
		{
			super();
			Global.navButtonIndex = Global.KOREA_BUTTON_INDEX;
			
			// Landing
			//add(new Entity(0, 0, new Backdrop(Assets.KOREA_LANDING, false, false)));					
			
			// Map
			add(map = new Entity(212, 0, new Backdrop(Assets.KOREA_MAP, false, false)));
			//(map.graphic as Backdrop).alpha = 0.5;
			
			// Buttons
			add(new Button(207, 200, new Image(Assets.KOREA_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoPhotos));		
			
			add(new Button(219, 460, new Image(Assets.KOREA_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoReflection));	
			
			add(new Button(854, 177, new Image(Assets.KOREA_FREEDOM_BRIDGE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoFreedomBridge));	
			
			add(new Button(628, 385, new Image(Assets.KOREA_LONELINESS_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoLoneliness));	
			
			add(new Button(911, 438, new Image(Assets.KOREA_BEING_THERE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoBeingThere));	
		}
		
		public function gotoFreedomBridge():void
		{
			//FP.world = new IntroScreen(Assets.INTRO_FREEDOM_BRIDGE, MyWorld);
			var goto:World = new IntroScreen(Assets.INTRO_FREEDOM_BRIDGE, MyWorld, KoreaLanding);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 				
		}		
		
		public function gotoLoneliness():void
		{
			//FP.world = new MainWorld;
			//FP.world = new IntroScreen(Assets.INTRO_LONELINESS, MainWorld, KoreaLanding);
			var goto:World = new IntroScreen(Assets.INTRO_LONELINESS, MainWorld, KoreaLanding);
			Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 			
		}	
		
		public function gotoPhotos():void
		{
			var goto:World = new Gallery(gallery.Assets.KOREA_PHOTO_ARRAY, KoreaLanding, morePhotosURL);
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
		
		public function gotoBeingThere():void
		{
			request = new URLRequest(beingThereURL);
			try {
				navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
				trace("Error occurred!");
			}
		}			
		
	}

}