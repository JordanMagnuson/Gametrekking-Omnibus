package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import jui.Button;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NavigationBar extends Entity
	{
		public var background:Image = Image.createRect(SuperGlobal.SCREEN_WIDTH, 46, Colors.MENU_CREAM, 0.5);
		
		public function NavigationBar() 
		{
			super();
			graphic = background;		
		}
		
		override public function added():void
		{
			// Intro
			FP.world.add(new Button(388, 0, new Image(Assets.NAV_INTRO), null, null, null, false, null));	
			
			// Korea
			FP.world.add(new Button(475, 0, new Image(Assets.NAV_KOREA), null, null, null, false, null));	
			
			// Taiwan
			FP.world.add(new Button(562, 0, new Image(Assets.NAV_TAIWAN), null, null, null, false, null));				
		}
		
	}

}