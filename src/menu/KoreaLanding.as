package menu 
{
	import flash.net.URLRequest;
	import freedombridge.worlds.MyWorld;
	import loneliness.rooms.MainWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import jui.Button;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import flash.net.navigateToURL;
	
	/**
	 * ...
	 * @author ...
	 */
	public class KoreaLanding extends MenuLanding
	{
		public var request:URLRequest;
		public var reflectionURL:String = "http://chasingdonguri.com/blog-from-beginning?field_country_value_many_to_one=Korea";	
		public var beingThereURL:String = "http://www.gametrekking.com/the-games/korea/being-there";
		
		public function KoreaLanding() 
		{
			super();
			Global.navButtonIndex = Global.KOREA_BUTTON_INDEX;
			
			// Map
			add(new Entity(173, 0, new Backdrop(Assets.KOREA_MAP, false, false)));
			
			// Buttons
			add(new Button(207, 200, new Image(Assets.KOREA_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));		
			
			add(new Button(234, 460, new Image(Assets.KOREA_REFLECTION_BUTTON), new Image(Assets.KOREA_REFLECTION_BUTTON_HOVER), 1, null, null, true, gotoReflection));	
			
			add(new Button(854, 177, new Image(Assets.KOREA_FREEDOM_BRIDGE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoFreedomBridge));	
			
			add(new Button(645, 361, new Image(Assets.KOREA_LONELINESS_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoLoneliness));	
			
			add(new Button(910, 437, new Image(Assets.KOREA_BEING_THERE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoBeingThere));	
		}
		
		public function gotoFreedomBridge():void
		{
			FP.world = new MyWorld;
		}		
		
		public function gotoLoneliness():void
		{
			FP.world = new MainWorld;
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