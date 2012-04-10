package menu 
{
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
			
			// Navigation bar
			add(new NavigationBar);			
			
			// Logo
			add(new Entity(0, 0, new Backdrop(Assets.NAV_LOGO, false, false)));			
			//add(new Entity(200, 200, new Text("The Gametrekking Omnibus", 0, 0, { font: "Casual Encounter", size: 14 } )));
		}
		
		public function gotoStatusQuo():void
		{
			FP.world = new GameWorld;
		}
		
	}

}