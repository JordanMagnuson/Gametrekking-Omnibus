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
	public class CambodiaLanding extends MenuLanding
	{
		public var map:Entity;
		
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
			
			add(new Button(277, 451, new Image(Assets.CAMBODIA_REFLECTION_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(798, 208, new Image(Assets.CAMBODIA_KILLER_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
			
			add(new Button(858, 459, new Image(Assets.CAMBODIA_HISTORY_BUTTON), null, Global.BUTTON_HOVER_SCALE, null, null, true, null));	
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