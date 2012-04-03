package
{
	import flash.events.Event;
	import loneliness.rooms.MainWorld;
	import loneliness.rooms.MessageScreen;
	import menu.Landing;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import freedombridge.worlds.MyWorld;
	import Colors;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.display.StageDisplayState;
	import flash.events.FullScreenEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	[SWF(width='1024',height='600',backgroundColor='#000000',frameRate='60')]
	
	public class Main extends Engine
	{
		public function Main() 
		{
			super(1024, 600, 60);
			FP.screen.color = Colors.BLACK;
			//FP.screen.color = Colors.WHITE;
			
			// Console for debugging
			FP.console.enable();		
			
			FP.world = new Landing;
			
			//Mouse.hide();
		}
		
		override public function init():void
		{
			// Full screen set up
			FP.stage.scaleMode = StageScaleMode.SHOW_ALL;
			FP.stage.fullScreenSourceRect= new Rectangle(0, 0, FP.width, FP.height);
			FP.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;	
			
			// Listen for Esc key, prevent exiting full screen
			FP.stage.addEventListener(KeyboardEvent.KEY_DOWN, preventEsc);
			super.init();
		}			

		/**
		 * Prevent escape key from exiting full screen
		 * Only works in air app (not swf).
		 * @param	e
		 */
		private function preventEsc(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.ESCAPE)
			{
				e.preventDefault();
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}