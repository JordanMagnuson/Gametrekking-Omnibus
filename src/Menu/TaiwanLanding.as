package menu 
{
	import flash.geom.Rectangle;
	import gum.FlashPunk.UIEntity;
	import gum.UISkin;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import jui.Button;
	import statusquo.GameWorld;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TaiwanLanding extends MenuLanding
	{		
		public var map:Entity;
		
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
			
			add(new Button(188, 448, new Image(Assets.TAIWAN_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(857, 197, new Image(Assets.TAIWAN_STATUS_QUO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(812, 443, new Image(Assets.TAIWAN_KINDNESS_OF_STRANGERS_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
		}
		
		public function gotoStatusQuo():void
		{
			FP.world = new GameWorld;
		}		
		
		override public function begin():void
		{
			super.begin();		
		}
		
	}

}