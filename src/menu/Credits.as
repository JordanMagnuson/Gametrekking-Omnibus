package menu 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import net.flashpunk.utils.Input;
	import punk.transition.Transition;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Credits extends World
	{
		public static var DEFAULT_SCROLL_SPEED:Number = 2;
		public static var SCROLL_ADJUST_SPEED:Number = 0.2;
		
		public var scrollSpeed:Number = DEFAULT_SCROLL_SPEED;
		public var finished:Boolean = false;
		public var motionTween:LinearMotion;
		
		public var creditsEntity:Entity;
		public var creditsCanvas:Canvas;
		public var creditsBitmapData:BitmapData;
		
		public function Credits() 
		{
			// Prep credits canvas
			creditsBitmapData = FP.getBitmap(Assets.CREDITS_FULL);
			creditsCanvas = new Canvas(FP.width, creditsBitmapData.height);
			creditsCanvas.draw(0, 0, creditsBitmapData);
			
			// Add stuff
			add(creditsEntity = new Entity(0, 0, creditsCanvas));
			//motionTween = new LinearMotion(finishedCallback);
			//addTween(motionTween, false);
			
			// Define keys
			Input.define('speedUp', Key.UP);
			Input.define('slowDown', Key.DOWN);
		}
		
		override public function begin():void
		{
			Mouse.hide();
			//motionTween.setMotionSpeed(creditsEntity.x, creditsEntity.y, 0, -creditsCanvas.height, scrollSpeed);
		}
		
		public function finishedCallback():void
		{
			Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
				return;
			}		
			
			// Finished
			if (!finished && creditsEntity.y <= -creditsCanvas.height)
			{
				finished = true;
				Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
			}
			
			// Update scroll speed
			if (Input.check('speedUp'))
			{
				scrollSpeed += SCROLL_ADJUST_SPEED;
			}
			else if (Input.check('slowDown'))
			{
				scrollSpeed -= SCROLL_ADJUST_SPEED;
			}
			
			//Motion
			creditsEntity.y -= scrollSpeed;
			//creditsEntity. y = motionTween.y;
			
			if (creditsEntity.y > 0) 
			{
				scrollSpeed = DEFAULT_SCROLL_SPEED;
				creditsEntity.y = 0;
			}
			
			super.update();
		}
		
	}

}