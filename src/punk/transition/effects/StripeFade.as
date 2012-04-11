package punk.transition.effects 
{
	import flash.utils.getTimer;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;

	/**
	 * StripeFade effect class.
	 * 
	 * @author azrafe7
	 */
	public class StripeFade extends Effect 
	{
		protected var _startTime:int;
		
		protected var _fadeImages:Vector.<Image> = new Vector.<Image>;

		// main options
		protected var _fadeIn:Boolean;
		protected var _fadeFrom:int;
		
		// extra options (with default values)
		protected var _duration:Number = 2;
		protected var _ease:Function = null;	// null => linear;
		protected var _numStripes:int = 18;
		protected var _color:int = 0xFF000000;
		protected var _stripeEase:Function = Ease.sineIn;
		protected var _stripeDuration:Number = .8;

		// starting side constants
		public static const LEFT:int = 0;
		public static const TOP:int = 1;
		public static const RIGHT:int = 2;
		public static const BOTTOM:int = 3;
		
		
		/**
		 * StripeFade effect constructor.
		 * @param	fadeIn		If true the stripes will fade in. Defaults to false.
		 * @param	fadeFrom	On which side the fade will start. Possible values are StripeFade.LEFT, StripeFade.TOP, StripeFade.RIGHT, StripeFade.BOTTOM. Defaults to LEFT.
		 * @param	options		An object containing key/value pairs of the following optional parameters:
		 * 						duration		Optional number indicating the time (in seconds) the effect will last (approximately). Defaults to 2.
		 * 						ease			Optional easer function. Defaults to linear.
		 * 						numStripes		Optional number of stripes composing the effect. Defaults to 18.
		 * 						color			Optional color of stripes. Defaults to black.
		 * 						stripeDuration	Optional number indicating the time (in seconds) each stripe will last (approximately). Defaults to 0.8.
		 * 						stripeEase		Optional easer function for the single stripes. Defaults to Ease.sineIn.
		 * 
		 * Example: new StripeFade(true, StripeFade.BOTTOM, { ease:Ease.bounceIn, numStripes:32, stripeDuration:1.5, color:0xFF3366});
		 */
		public function StripeFade(fadeIn:Boolean=false, fadeFrom:int=LEFT, options:Object=null) 
		{
			super();
			
			if (options) {
				if (options.hasOwnProperty("duration")) _duration = options.duration;
				if (options.hasOwnProperty("ease")) _ease = options.ease;
				if (options.hasOwnProperty("numStripes")) _numStripes = options.numStripes;
				if (options.hasOwnProperty("color")) _color = options.color;
				if (options.hasOwnProperty("stripeDuration")) _stripeDuration = options.stripeDuration;
				if (options.hasOwnProperty("stripeEase")) _stripeEase = options.stripeEase;
			}
			
			_fadeIn = fadeIn;
			_fadeFrom = fadeFrom;
			_duration -= _stripeDuration;
			
			var vertStripes:Boolean = (_fadeFrom % 2 == 0);
			var stripeW:Number = vertStripes ? Math.ceil(FP.width/_numStripes) : FP.screen.width;
			var stripeH:Number = vertStripes ? FP.height : Math.ceil(FP.height/_numStripes);
			
			for (var i:int = 0; i < _numStripes; i++) {
				var img:Image = Image.createRect(stripeW, stripeH, _color);
				
				img.alpha = fadeIn ? 1 : 0;
				img.x = (vertStripes ? i * stripeW : 0);
				img.y = (vertStripes ? 0 : i * stripeH);
				img.scrollX = img.scrollY = 0;
				addGraphic(img);
			}
		}
		
		// called once the effect gets added to the world
		override public function added():void 
		{
			super.added();
			
			var t:Number = 1 / _numStripes;
			var stripeTime:Number = _stripeDuration;
			var destAlpha:Number = _fadeIn ? 0 : 1;
			var images:Vector.<Graphic> = (graphic as Graphiclist).children;
			
			for (var i:int = 0; i < _numStripes; i++) {
				var idx:int = _fadeFrom < 2 ? i : _numStripes - i - 1;
				var img:Image = images[idx] as Image;
				var options:Object = new Object();
				if (i > 0) {
					options.delay = _duration * (_ease != null ? _ease(i * t) : i * t);
				}
				options.ease = _stripeEase;
				if (i == _numStripes - 1) options.complete = _onComplete;	// completeTime
				FP.tween(img, { alpha:destAlpha }, stripeTime, options);
			}
			
			//_startTime = getTimer();
		}
		
		/*
		public function completeTime():Function 
		{
			var elapsed:Number = (getTimer()-_startTime)/1000;
			trace(elapsed.toFixed(2), "secs /", (_duration + _stripeDuration).toFixed(2), "secs");
			return super._onComplete();
		}*/
		
	}

}