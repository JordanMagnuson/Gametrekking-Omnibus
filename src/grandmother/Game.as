package grandmother  
{
	import kindnessofstrangers.Menu;
	import menu.VietnamLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import net.flashpunk.utils.Input;
	import punk.transition.effects.FadeIn;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Game extends World
	{	
		
		public function Game() 
		{
			Global.startedFade = false;
			FP.screen.scale = 1.6;
			
			// Center screen in window
			FP.screen.y = -(768 - SuperGlobal.SCREEN_HEIGHT) / 2;
			//FP.screen.x = (SuperGlobal.SCREEN_WIDTH - FP.width) / 2;
			//FP.screen.y = (SuperGlobal.SCREEN_HEIGHT - FP.height) / 2;				
		}
		
		override public function update():void
		{
			//Mouse.hide();
			
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Stop sounds
				Global.SndAmbient.stop();

				var backdropList:Array = [];
				getClass(PhotoBackdrop, backdropList);
				for each (var pb:PhotoBackdrop in backdropList)
				{
					if (pb.sound.playing)
					{
						pb.sound.stop();
					}
				}				
				
				// Return
				FP.world = new VietnamLanding;
			}				
			
			if (Global.dust.cleaned && Global.mouseController.lastPressCounter >= Global.WAIT_TO_DROP_BUCKET && !Global.bucketDropped)
			{
				trace('dust cleaned, preparing bucket drop');
				dropBucket();
			}
			
			if (Global.bucketDropped && Global.vase.filled && !Global.endingStarted)
			{
				Global.endingStarted = true;
				//Global.mouseController.fadeOut(Global.WAIT_TO_FADE);
				Global.mouseController.destroy();
				if (Global.LONG_ENDING)
				{
					FP.alarm(Global.WAIT_TO_FADE, startLongEnding);
				}
				else
				{
					FP.alarm(Global.WAIT_TO_FADE, fadeOut);
				}
			}
			
			super.update();
		}
		
		override public function begin():void
		{
			trace('game begin');
			add(new Entity(0, 0, new Backdrop(Assets.HEADSTONE)));
			add(Global.mouseController = new MouseController);
			add(Global.dust = new Dust(208, 45));
			add(Global.vase = new Vase(482, 339));
			add(Global.bucket = new Bucket);
			add(Global.sponge = new Sponge);
			//fadeOut();
		}
		
		public function dropBucket():void
		{
			Global.bucketDropped = true;
			Global.hasSponge = false;
			Global.bucket.drop();
			//remove(Global.sponge);
		}
		
		public function fadeOut():void
		{
			//Transition.to(GameOver, new punk.transition.effects.FadeOut({duration: 5} ), new punk.transition.effects.FadeIn( {duration: 5} )); 				
			if (!Global.startedFade)
			{
				add(new FadeOut(GameOver, Colors.BLACK, Global.FADE_OUT_DURATION));
				Global.startedFade = true;
			}
		}
		
		public function startLongEnding():void
		{
			Global.cleanHeadstone = FP.buffer;
			FP.world = new Leaving;
		}
	}

}