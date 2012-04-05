package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoBackdrop extends Entity
	{
		public var backdrop:Backdrop;
		public var clickMask:ClickMask;
		public var sound:Sfx;
		
		
		public var fadeInDuration:Number;
		public var fadeOutDuration:Number;
		public var fadeInComplete:Boolean = false;
		public var fadeTween:ColorTween;		
		
		public function PhotoBackdrop(backdropSource:* = null, soundSource:* = null, fadeInDuration:Number = 3, fadeOutDuration:Number = 3, clickMaskSource:* = null) 
		{
			backdrop = new Backdrop(backdropSource);
			if (clickMaskSource) clickMask = new ClickMask(0, 0, clickMaskSource);
			if (soundSource) sound = new Sfx(soundSource);
			super(0, 0, backdrop);
			this.fadeInDuration = fadeInDuration;
			this.fadeOutDuration = fadeOutDuration;
			layer = 100;	
		}
		
		override public function added():void
		{
			if (clickMask) FP.world.add(clickMask);
			if (fadeInDuration > 0)
			{
				backdrop.alpha = 0;
				fadeIn();
			}
			else
			{
				backdrop.alpha = 1;
				fadeTween = new ColorTween;
				fadeTween.alpha = 1;
			}
		}		
		
		override public function update():void
		{
			if (backdrop) backdrop.alpha = fadeTween.alpha;
			super.update();
		}		
		
		//override public function render():void
		//{
			//super.render();
			//if (clickMask) clickMask.render(FP.buffer, FP.point, FP.camera);
		//}
		
		public function fadeIn():void
		{
			trace('fade in');
			if (sound) sound.play();
			fadeTween = new ColorTween(fadeInCallback);
			addTween(fadeTween);		
			fadeTween.tween(fadeInDuration, Colors.WHITE, Colors.WHITE, 0, 1);			
		}
		
		public function fadeInCallback():void
		{
			fadeInComplete = true;
		}
		
		public function fadeOut():void
		{
			if (fadeOutDuration > 0)
			{
				fadeTween = new ColorTween(destroy);
				addTween(fadeTween);		
				fadeTween.tween(fadeOutDuration, Colors.WHITE, Colors.WHITE, backdrop.alpha, 0);		
			}
			else
			{
				destroy();
			}
		}		
		
		public function destroy():void
		{
			if (this.clickMask) FP.world.remove(this.clickMask);
			FP.world.remove(this);
		}		
		
	}

}