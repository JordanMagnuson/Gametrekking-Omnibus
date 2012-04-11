package menu 
{
	import jui.ButtonController;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import statusquo.GameWorld;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MenuLanding extends World
	{
		
		public function MenuLanding() 
		{
			// Background
			add(new Entity(0, 0, new Backdrop(Assets.STAMP_BACKGROUND)));
			
			// Google copyright
			var copyright:Entity = new Entity(515, 561, new Image(Assets.GOOGLE_COPYRIGHT));
			copyright.layer = -50;
			add(copyright);
			
			// Navigation bar
			add(new NavigationBar);			
			
			// Button Controller
			add(new ButtonController);
		}
		
	}

}