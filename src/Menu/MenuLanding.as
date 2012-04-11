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
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MenuLanding extends World
	{
		public var copyright:Entity;
		
		public function MenuLanding() 
		{
			// Reset the engine and screen
			if (FP.width != SuperGlobal.SCREEN_WIDTH || FP.height != SuperGlobal.SCREEN_HEIGHT || FP.fixed == true || FP.screen.scale != 1)
			{
				(FP.engine as Main).reset(SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT, 60, false);	
			}
			
			// Background
			add(new Entity(0, 0, new Backdrop(Assets.STAMP_BACKGROUND)));
			
			// Google copyright
			copyright = new Entity(515, 561, new Image(Assets.GOOGLE_COPYRIGHT));
			copyright.layer = -50;
			add(copyright);
			
			// Navigation bar
			add(new NavigationBar);			
			
			// Button Controller
			add(new ButtonController);
			
			Mouse.show();
		}
		
	}

}