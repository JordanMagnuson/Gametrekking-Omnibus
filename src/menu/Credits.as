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
		
		public var scrollSpeed:Number = DEFAULT_SCROLL_SPEED;
		public var finished:Boolean = false;
		
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
			//motionTween = new LinearMotion(finished);
			//addTween(motionTween, false);
			
			// Define keys
			Input.define('speedUp', Key.UP);
			Input.define('slowDown', Key.DOWN);
		}
		
		override public function begin():void
		{
			Mouse.hide();
			//motionTween.setMotionSpeed(creditsEntity.x, creditsEntity.y, 0, -creditsCanvas.height, SCROLL_SPEED);
		}
		
		//public function finished():void
		//{
			//Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
		//}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
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
				scrollSpeed += 0.5;
			}
			else if (Input.check('slowDown'))
			{
				scrollSpeed -= 0.5;
			}
			
			//Motion
			creditsEntity.y -= scrollSpeed;
			
			if (creditsEntity.y > 0) 
			{
				scrollSpeed = DEFAULT_SCROLL_SPEED;
				creditsEntity.y = 0;
			}
			
			super.update();
		}
		
	}

}