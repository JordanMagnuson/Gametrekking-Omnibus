package punk.transition.effects 
{
	import flash.display.BitmapData;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.utils.getTimer;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	
	/**
	 * Blur effect class.
	 * 
	 * @author azrafe7
	 */
	public class Blur extends Effect 
	{

		protected var _startTime:int;

		protected var _blurInfo:Object = {x:0, y:0};	// blur info used by the tween function
		protected var _blurredImg:Image;
		protected var _blurredBMD:BitmapData;
		protected var _filter:BlurFilter = new BlurFilter();
		protected const _MAX_BLUR:Number = 255;	// default maximum blur factor
		
		protected var _blurIn:Boolean;	// "direction" of effect

		// options
		protected var _ease:Function = null;	// null => linear
		protected var _duration:Number = 2.5;
		protected var _blur:Number = 25;
		protected var _blurX:Number = NaN;
		protected var _blurY:Number = NaN;
		protected var _quality:Number = BitmapFilterQuality.LOW;
		

		/**
		 * Blur effect constructor.
		 * @param	blurIn	If true the image will blur in. Defaults to false.
		 * @param	options		An object containing key/value pairs of the following optional parameters:
		 * 						duration		Optional number indicating the time (in seconds) the effect will last (approximately). Defaults to 2.5.
		 * 						ease			Optional easer function. Defaults to linear.
		 * 						blurX			Optional number [1-255] indicating the max blurX factor of the effect. Defaults to 25.
		 * 						blurY			Optional number [1-255] indicating the max blurY factor of the effect. Defaults to 25.
		 * 						blur			Optional number [1-255] that gets assigned to both blurX and blurY. Defaults to 25.
		 * 						quality			Optional number (see BitmapFilterQuality) indicating the quality of the filter. Defaults to BitmapFilterQuality.LOW.
		 * 
		 * Example: new Blur(true, { ease:Ease.quadIn, blurX:32, blurY:5, quality:BitmapFilterQuality.HIGH });
		 * Example: new Blur(true, { blur:99, duration: 5.5 });
		 */
		public function Blur(blurIn:Boolean=false, options:Object=null) 
		{
			_blurIn = blurIn;

			if (options) {
				if (options.hasOwnProperty("duration")) _duration = options.duration;
				if (options.hasOwnProperty("ease")) _ease = options.ease;
				if (options.hasOwnProperty("blurX")) _blurX = FP.clamp(options.blurX, 1, _MAX_BLUR);
				if (options.hasOwnProperty("blurY")) _blurY = FP.clamp(options.blurY, 1, _MAX_BLUR);
				if (options.hasOwnProperty("blur")) _blur = FP.clamp(options.blur, 1, _MAX_BLUR);
				if (options.hasOwnProperty("quality")) _quality = FP.clamp(options.smoothing, BitmapFilterQuality.LOW, BitmapFilterQuality.HIGH);
			}
			
			_blurX = _blurX || _blur;
			_blurY = _blurY || _blur;
			_blurredBMD = new BitmapData(FP.width, FP.height, false, 0);
			_blurredImg = new Image(_blurredBMD);
			_blurredImg.scrollX = _blurredImg.scrollY = 0;
			_filter.quality = _quality;
			
			if (blurIn) {
				_blurInfo.x = _blurX;
				_blurInfo.y = _blurY;
			} else {
				_blurInfo.x = 0;
				_blurInfo.y = 0;
			}
			
			graphic = _blurredImg;
		}
		
		// called once the effect gets added to the world
		override public function added():void 
		{
			super.added();
			
			var finalBlurX:Number = _blurIn ? 1 : _blurX;
			var finalBlurY:Number = _blurIn ? 1 : _blurY;
			
			FP.tween(_blurInfo, { x:finalBlurX, y:finalBlurY }, _duration, { ease:_ease, complete:_onComplete } );	// completeTime
			
			//_startTime = getTimer();
		}
		
		override public function render():void 
		{
			_blurredBMD.copyPixels(FP.buffer, FP.buffer.rect, FP.zero);
			
			_filter.blurX = _blurInfo.x;
			_filter.blurY = _blurInfo.y;
			_blurredBMD.applyFilter(_blurredBMD, _blurredBMD.rect, FP.zero, _filter);
			
			_blurredImg.updateBuffer();

			super.render();
		}
		
		/*
		public function completeTime():Function 
		{
			var elapsed:Number = (getTimer()-_startTime)/1000;
			trace(elapsed.toFixed(2), "secs /", (_duration).toFixed(2), "secs");
			return super._onComplete();
		}*/
	}

}