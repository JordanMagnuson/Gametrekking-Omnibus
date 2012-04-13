package gallery 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.World;
	import gallery.Gallery;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import flash.display.BitmapData
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Photo extends Entity
	{
		public const DEFAULT_FADE_IN_DURATION:Number = 3;
		public const DEFAULT_FADE_OUT_DURATION:Number = 3;
		
		public const CAPTION_LOCATION:Point = new Point(100, 100);
		public const CAPTION_MARGIN_HORIZONTAL:Number = 20;
		public const CAPTION_MARGIN_VERTICAL:Number = 20;
		
		public var canvas:Canvas;
		public var caption:Text;
		public var captionPoint:Point = new Point();
		public var captionBackground:Rectangle;
		
		public var fadeInComplete:Boolean = false;
		public var fadeTween:ColorTween;		
		public var motionTween:LinearMotion;
		
		[Embed(source = "../../assets/CasualEncounter.ttf", embedAsCFF = "false", fontFamily = 'Casual Encounter')] public static const CASUAL_ENCOUNTER:Class;
		[Embed(source = "../../assets/Verdana.ttf", embedAsCFF = "false", fontFamily = 'Verdana')] public static const VERDANA:Class;
		[Embed(source = "../../assets/SPECIALELITE.TTF", embedAsCFF = "false", fontFamily = 'Special Elite')] public static const SPECIAL_ELITE:Class;
		
		public function Photo(x:Number = 0, y:Number = 0, backdropSource:* = null, captionString:String = null) 
		{
			canvas = new Canvas(FP.width, FP.height);
			canvas.draw(0, 0, FP.getBitmap(backdropSource));
			
			// Caption
			if (captionString != null)
			{
				caption = new Text(captionString, 0, 0, { color: Colors.BLACK, font: 'Special Elite', width: FP.width - 2 * CAPTION_MARGIN_HORIZONTAL, wordWrap: true } );
				caption.leading = 10;
				captionBackground = new Rectangle(x, FP.height - caption.textHeight - 2 * CAPTION_MARGIN_VERTICAL, FP.width, caption.textHeight + 2 * CAPTION_MARGIN_VERTICAL);
			
				// Draw to canvas
				canvas.drawRect(captionBackground, Colors.WHITE, 0.5);
				canvas.drawGraphic(captionBackground.x + CAPTION_MARGIN_HORIZONTAL, captionBackground.y + CAPTION_MARGIN_VERTICAL, caption);
			}
			
			// Super
			super(x, y, canvas);
			layer = 100;	
			
			// Tweens
			//motionTween = new LinearMotion(destroy);
			//addTween(motionTween);
		}
		
		public function fadeIn(duration:Number = DEFAULT_FADE_IN_DURATION):void
		{
			//x = FP.width;
			//y = 0;
			//motionTween = new LinearMotion(fadeInCallback);
			//addTween(motionTween);			
			//motionTween.setMotion(x, y, 0, 0, duration, Ease.bounceOut);	
			
			canvas.alpha = 0;
			fadeTween = new ColorTween(fadeInCallback);
			addTween(fadeTween);
			fadeTween.tween(duration, Colors.WHITE, Colors.WHITE, canvas.alpha, 1, Ease.quadOut);			
		}
		
		public function fadeOut(duration:Number = DEFAULT_FADE_OUT_DURATION):void
		{
			//motionTween = new LinearMotion(destroy);
			//addTween(motionTween);			
			//motionTween.setMotion(x, y, x - FP.width, y, duration, Ease.bounceOut);
			
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);
			fadeTween.tween(duration, Colors.WHITE, Colors.WHITE, canvas.alpha, 0, Ease.quadOut);
		}
		
		override public function update():void
		{
			if (motionTween) 
			{
				x = motionTween.x;
				y = motionTween.y;
			}
			if (fadeTween)
			{
				canvas.alpha = fadeTween.alpha;
			}
			super.update();
		}
		
		public function fadeInCallback():void
		{
			fadeInComplete = true;
		}		
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}