package heartattack 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import Colors;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoBackdrop extends Entity
	{
		//public static const FADE_IN_DURATION:Number = 2 * FP.assignedFrameRate;		
		//public static const FADE_OUT_DURATION:Number = 2 * FP.assignedFrameRate;
		//public static const MAX_ALPHA:Number = 0.5;
		
		public var fadeInDuration:Number;
		public var fadeOutDuration:Number;
		public var maxAlpha:Number;
		
		public var shouldFadeIn:Boolean;
		public var backdrop:MosaicImage;
		public var fadeTween:ColorTween;
		
		public function PhotoBackdrop(source:* = null, x:Number = 0, y:Number = 0, shouldFadeIn:Boolean = true, fadeInDuration:Number = 120, fadeOutDuration:Number = 120, maxAlpha:Number = 0.5, flipped:Boolean = false, cellSize:int = 1) 
		{
			if (source)
				reset(source, x, y, shouldFadeIn, fadeInDuration, fadeOutDuration, maxAlpha, flipped, cellSize);
		}
		
		override public function added():void
		{
			if (shouldFadeIn)
				fadeIn();
			else
			{
				fadeTween = new ColorTween();
				fadeTween.alpha = maxAlpha;
			}
		}
		
		public function reset(source:* = null, x:Number = 0, y:Number = 0, shouldFadeIn:Boolean = true, fadeInDuration:Number = 120, fadeOutDuration:Number = 120, maxAlpha:Number = 0.5, flipped:Boolean = false, cellSize:int = 1):void
		{
			this.x = x;
			this.y = y;
			this.shouldFadeIn = shouldFadeIn;
			this.fadeInDuration = fadeInDuration;
			this.fadeOutDuration = fadeOutDuration;
			this.maxAlpha = maxAlpha;
			backdrop = new MosaicImage(source, null, cellSize);
			if (flipped)
				backdrop.flipped = true;
			graphic = backdrop;
			layer = 100;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			if (shouldFadeIn)
				backdrop.alpha = 0;	
			else
				backdrop.alpha = maxAlpha;
			//this.active = true;
		}
		
		override public function update():void
		{
			if (backdrop) backdrop.alpha = fadeTween.alpha;
			super.update();
		}
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(fadeInDuration, Colors.WHITE, Colors.WHITE, 0, maxAlpha);			
		}
		
		public function fadeOut():void
		{
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(fadeOutDuration, Colors.WHITE, Colors.WHITE, (graphic as MosaicImage).alpha, 0);				
		}
		
		public function destroy():void
		{
			trace('photobackdrop destroy');
			//this.active = false;
			FP.world.remove(this);
		}
		
		override public function removed():void
		{
			this.backdrop = null;
		}
		
		override public function render():void
		{
			super.render();
		}		
		
	}

}