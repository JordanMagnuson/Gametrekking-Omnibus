package menu 
{
	import jui.Button;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class VietnamLanding extends MenuLanding
	{
		public var map:Entity;
		
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
			add(new Button(281, 204, new Image(Assets.VIETNAM_PHOTO_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(266, 461, new Image(Assets.VIETNAM_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(806, 214, new Image(Assets.VIETNAM_HEART_ATTACK_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(763, 451, new Image(Assets.VIETNAM_GRANDMOTHER_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
		}
		
		//public function gotoStatusQuo():void
		//{
			//FP.world = new GameWorld;
		//}		
		//
		//override public function begin():void
		//{
			//super.begin();		
		//}
		
	}

}