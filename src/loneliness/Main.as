package loneliness 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import net.flashpunk.Engine;
	import loneliness.rooms.MainWorld;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Main extends Engine 
	{
		
		public function Main()
		{
			// Initiate the game with a 400x300 screen.
			super(400, 300, 60, false);
			
			// Scale by 150%, resulting in a 600x450 display.
			FP.screen.scale = 1.5;		
			FP.screen.color = Colors.WHITE;
			
			// Console for debugging
			//FP.console.enable();					
			
			FP.world = new MainWorld;
			Mouse.hide();
		}
		
		override public function init():void
		{
			super.init();
		}
		
		//override public function update():void
		//{
			//super.update();
			//handleKeys(Event);
		//}
		//
		//protected function handleKeys(event:KeyboardEvent):void
		//{
			//event.preventDefault();
			//if( event.keyCode == Keyboard.ESCAPE )
			//{
				//btn_fullScreen.label = "Nope, escape won't work. Try pushing the Enter Key";
			//}
			//if( event.keyCode == Keyboard.ENTER )
			//{
				//stage.displayState = StageDisplayState.NORMAL;
				//btn_fullScreen.label = "Go Full Screen!";
			//} 
		//}
 		
		
		//private function handleKeys(event:KeyboardEvent):void
		//{
			//if (event.keyCode == Keyboard.BACK)
			//{         
				//event.preventDefault();         
				//event.stopImmediatePropagation();
				//then add code to handle the event
			//}
		//}		
		
	}
	
}