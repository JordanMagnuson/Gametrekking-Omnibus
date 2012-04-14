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
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Credits extends World
	{
		public static var SCROLL_SPEED:Number = 100;
		
		//public var scrollSpeed:Number = 100;
		
		public var motionTween:LinearMotion;
		
		public var creditsEntity:Entity;
		//public var creditsImage:Image = new Image(Assets.CREDITS_FULL);
		//public var creditsBackdrop:Backdrop = new Backdrop(Assets.CREDITS_FULL);
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
			motionTween = new LinearMotion(finished);
			addTween(motionTween, false);
		}
		
		override public function begin():void
		{
			Mouse.hide();
			motionTween.setMotionSpeed(creditsEntity.x, creditsEntity.y, 0, -creditsCanvas.height, SCROLL_SPEED);
		}
		
		public function finished():void
		{
			Transition.to(IntroLanding, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				FP.world = new IntroLanding;
			}			
			
			//Motion
			creditsEntity.x = motionTween.x;
			creditsEntity.y = motionTween.y;
			
			super.update();
		}
		
	}

}