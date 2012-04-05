package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.misc.ColorTween;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Flowers extends Entity
	{
		public var image:Image = new Image(Assets.FLOWERS);
		public var shouldFadeIn:Boolean;
		public var fadeTween:ColorTween;		
		public var fadeInDuration:Number = 3;
		public var sndRoses:Sfx = new Sfx(Assets.SND_ROSES);
		
		public function Flowers(x:Number = 0, y:Number = 0, shouldFadeIn:Boolean = true, fadeInDuration:Number = 3) 
		{
			super(x, y, image);
			if (shouldFadeIn)
			{
				this.shouldFadeIn = shouldFadeIn;
				this.fadeInDuration = fadeInDuration;
				image.alpha = 0;
			}
			
		}
		
		override public function added():void
		{
			sndRoses.play();
			if (shouldFadeIn)
				fadeIn(fadeInDuration);
		}
		
		override public function update():void
		{
			if (fadeTween && shouldFadeIn)
				image.alpha = fadeTween.alpha;
		}
		
		public function fadeIn(duration:Number = 3):void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(duration, Colors.WHITE, Colors.WHITE, 0, 1);				
		}
		
	}

}