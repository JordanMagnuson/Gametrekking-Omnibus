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
			(FP.engine as Main).reset(SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT, 60, false);	
			//if (FP.fixed == true || FP.screen.width != SuperGlobal.SCREEN_WIDTH || FP.screen.height != SuperGlobal.SCREEN_HEIGHT)
			//{
				//(FP.engine as Main).reset(SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT, 60, false);	
			//}
			//FP.screen.scale = 1;
			//FP.screen.smoothing = false;
			//FP.screen.x = 0;
			//FP.screen.y = 0;
			//FP.width = SuperGlobal.SCREEN_WIDTH;
			//FP.height = SuperGlobal.SCREEN_HEIGHT;		
			//FP.rate = 1;
			
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
		
		override public function begin():void
		{
			Global.inTransition = false;	
			//FP.tweener.clearTweens();
		}
		
	}

}