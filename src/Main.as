package
{
	import flash.events.Event;
	import gallery.Assets;
	import gallery.Gallery;
	import grandmother.Approach;
	import killer.rooms.GameOver;
	import killer.rooms.MusicChoice;
	import kindnessofstrangers.Game;
	import kindnessofstrangers.Menu;
	import loneliness.rooms.MainWorld;
	import loneliness.rooms.MessageScreen;
	import menu.GumTest;
	import menu.IntroLanding;
	import menu.KoreaLanding;
	import menu.Landing;
	import menu.TaiwanLanding;
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
	import statusquo.GameOverWorld;
	import statusquo.GameWorld;
	import net.flashpunk.Screen
	import net.flashpunk.World;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.Entity;
	import flash.display.StageScaleMode;
	import heartattack.Game;
	import killer.rooms.MyWorld;
	import killer.rooms.GameOver;
	import grandmother.Game;
	import briefhistory.Game;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	[SWF(width='1024',height='600',backgroundColor='#000000',frameRate='60')]
	
	public class Main extends Engine
	{
		public function Main() 
		{
			super(SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT, 60);
			FP.screen.color = Colors.BLACK;
			//FP.screen.color = Colors.WHITE;
			
			// Console for debugging
			//FP.console.enable();		
			
			FP.world = new IntroLanding;
			
			//Mouse.hide();
		}
		
		public function reset(width:uint, height:uint, frameRate:Number = 60, fixed:Boolean = false):void
		{
			// First, black out current screen
			//FP.screen = new Screen;
		
			// See net.flashpunk.Engine constructor
			
			// global game properties
			FP.width = width;
			FP.height = height;
			FP.halfWidth = width/2;
			FP.halfHeight = height/2;
			FP.assignedFrameRate = frameRate;
			FP.fixed = fixed;
			FP.timeInFrames = fixed;
			
			// global game objects
			//FP.engine = this;
			//FP.screen = new Screen;
			//FP.bounds = new Rectangle(0, 0, width, height);
			//FP._world = new World;
			//FP.camera = FP._world.camera;
			//Draw.resetTarget();
			
			// miscellaneous startup stuff
			//if (FP.randomSeed == 0) FP.randomizeSeed();
			//FP.entity = new Entity;
			//FP._time = getTimer();
			
			// Additional touches that are not part of engine constructor
			FP.screen.color = Colors.BLACK;
			FP.screen.x = 0;
			FP.screen.y = 0;
			FP.screen.scale = 1;
			FP.rate = 1;
			FP.screen.smoothing = false;
		
		}
		
		override public function init():void
		{
			// Full screen
			FP.stage.scaleMode = StageScaleMode.SHOW_ALL;
			FP.stage.fullScreenSourceRect = new Rectangle(0, 0, SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT);
			//FP.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;	
			
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
			// Toggle fullscreen
			//if (Input.pressed(SuperGlobal.FULLSCREEN_KEY))
			if (Input.check(Key.CONTROL) && Input.pressed(SuperGlobal.FULLSCREEN_KEY) ||
				Input.check(Keyboard.ALTERNATE) && Input.pressed(Key.ENTER) ||
				Input.pressed(Key.F11))
			{
				if (FP.stage.displayState == StageDisplayState.NORMAL)
				{
					FP.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				}
				else 
				{
					FP.stage.displayState = StageDisplayState.NORMAL;
				}
					
			}
			
			super.update();
		}
	}
}