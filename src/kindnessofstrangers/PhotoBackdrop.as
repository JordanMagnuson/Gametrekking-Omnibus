package kindnessofstrangers 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoBackdrop extends Entity
	{
		public static const FADE_IN_DURATION:Number = 0.5 * FP.assignedFrameRate;		
		public static const FADE_OUT_DURATION:Number = 0.5 * FP.assignedFrameRate;
		public static const MAX_ALPHA:Number = 0.5;
		
		public static const DISPLAY_DURATION:Number = PhotoController.DISPLAY_TIME;
		
		public var fadeTween:ColorTween;
		public var displayAlarm:Alarm = new Alarm(DISPLAY_DURATION, fadeOut);
		
		public var image:Image;
		public var canvas:Canvas;
		//public var backdrop:Backdrop;
		
		public function PhotoBackdrop(source:*) 
		{
			x = 0;
			y = 0;
			image = new Image(source);
			graphic = image;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			image.alpha = 0;
			image.scale = 1.6;
			image.smooth = true;
			layer = 100;
		}
		
		override public function added():void
		{
			//addTween(displayAlarm, true);
			fadeIn();
		}
		
		override public function update():void
		{
			if (fadeTween) image.alpha = fadeTween.alpha;
			super.update();
		}
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween(fadeInCallback);
			addTween(fadeTween);		
			fadeTween.tween(FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, MAX_ALPHA);			
		}
		
		public function fadeInCallback():void
		{
			trace('fade in callback');
			removeTween(fadeTween);
			fadeTween = null;
		}
		
		public function fadeOut():void
		{
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, image.alpha, 0);				
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
		override public function render():void
		{
			if (PhotoController.show)
				super.render();
		}		
		
	}

}