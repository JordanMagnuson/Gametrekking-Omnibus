package menu 
{
	import freedombridge.worlds.MyWorld;
	import loneliness.rooms.MainWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import jui.Button;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class KoreaLanding extends MenuLanding
	{
		
		public function KoreaLanding() 
		{
			super();
			Global.navButtonIndex = Global.KOREA_BUTTON_INDEX;
			add(new Entity(173, 0, new Backdrop(Assets.KOREA_MAP, false, false)));
			
			//add(new Button(100, 100, new Text('Booya'), new Text('Heya'), null, null, true, null));
			
			// Buttons
			add(new Button(206, 199, new Image(Assets.KOREA_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));		
			
			add(new Button(234, 460, new Image(Assets.KOREA_REFLECTION_BUTTON), new Image(Assets.KOREA_REFLECTION_BUTTON_HOVER), 1, null, null, true, null));	
			
			add(new Button(854, 177, new Image(Assets.KOREA_FREEDOM_BRIDGE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoFreedomBridge));	
			
			add(new Button(645, 361, new Image(Assets.KOREA_LONELINESS_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, gotoLoneliness));	
			
			add(new Button(910, 437, new Image(Assets.KOREA_BEING_THERE_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
		}
		
		public function gotoFreedomBridge():void
		{
			FP.world = new MyWorld;
		}		
		
		public function gotoLoneliness():void
		{
			FP.world = new MainWorld;
		}					
		
	}

}