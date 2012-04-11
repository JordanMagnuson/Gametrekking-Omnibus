package loneliness.rooms 
{
	import loneliness.game.ChildrenAndText;
	import menu.KoreaLanding;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Screen;
	import flash.geom.Rectangle;
	import net.flashpunk.utils.Input;
	
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
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				MainWorld.music.stop();
				FP.world = new KoreaLanding;
			}			
			super.update();
		}
		
	}

}