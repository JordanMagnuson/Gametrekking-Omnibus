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
			//add(new Entity(0, 0, new Backdrop(Assets.STAMP_BACKGROUND)));
			
			// Navigation bar
			add(new NavigationBar);			
			
			// Button Controller
			add(new ButtonController);
		}
		
	}

}