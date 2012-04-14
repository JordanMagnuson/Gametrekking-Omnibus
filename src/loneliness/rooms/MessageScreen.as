package loneliness.rooms 
{
	import loneliness.game.ChildrenAndText;
	import menu.KoreaLanding;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Screen;
	import flash.geom.Rectangle;
	import net.flashpunk.utils.Input;
	import menu.Global;
	import punk.transition.Transition;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MessageScreen extends World
	{
		
		public function MessageScreen() 
		{
			
		}
		
		override public function begin():void
		{
			// Change screen size for this room, instead of upscaling, for clearer text
			//FP.width = 600;
			//FP.height = 450;
			//FP.screen = new Screen();	
			FP.screen.color = Colors.BLACK;
			//FP.bounds = new Rectangle(0, 0, FP.width, FP.height);
			FP.camera.x = 0;
			FP.camera.y = 0;			
			
			// Text
			add(new ChildrenAndText);
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Clear tweens (eg fading sounds, FP.alarm, etc.)
				FP.tweener.clearTweens();
				
				// Stop all sounds
				for each (var sfx:Sfx in SuperGlobal.soundsPlaying) {
					trace('another sound');
					if (sfx != null) sfx.stop();
				}
				
				// Empty sound tracker
				SuperGlobal.soundsPlaying = new Dictionary();
				
				// Return
				Transition.to(KoreaLanding, new menu.Global.TRANS_OUT(menu.Global.TRANS_OUT_OPTIONS), new menu.Global.TRANS_IN(menu.Global.TRANS_IN_OPTIONS));
			}			
			
			super.update();
		}
		
	}

}