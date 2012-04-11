package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author ...
	 */
	public class IntroLanding extends MenuLanding 
	{
		
		public function IntroLanding() 
		{
			super();
			Global.navButtonIndex = Global.INTRO_BUTTON_INDEX;
			
			add(new Entity(0, 0, new Backdrop(Assets.INTRO_LANDING, false, false)));	
			remove(copyright);
		}
		
	}

}