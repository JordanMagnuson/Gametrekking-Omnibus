package punk.transition.effects 
{
	import flash.display.Graphics;
	
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class DrawingUtil 
	{
		
		public function DrawingUtil() 
		{
			
		}
		
		private static const POINTS:uint = 5;
		private static const STEP:Number = (Math.PI * 2) / POINTS;
		private static const HALF_STEP:Number = STEP / 2;
		private static var _cosSteps:Array = [];
		private static var _sinSteps:Array = [];
		private static var _cosHalfSteps:Array = [];
		private static var _sinHalfSteps:Array = [];		
		
		private static function initStar():void 
		{
			var n:Number;
			for (n = 1; n <= POINTS; ++n) 
			{
				_cosHalfSteps.push(Math.cos((STEP * n) - HALF_STEP));
				_sinHalfSteps.push(Math.sin((STEP * n) - HALF_STEP));
				_cosSteps.push(Math.cos((STEP * n)));
				_sinSteps.push(Math.sin((STEP * n)));
			}
		}
		
		internal static function drawStar(target:Graphics, x:Number, y:Number, innerRadius:Number, outerRadius:Number) : void {
			if(_cosSteps.length < POINTS) initStar();
			
			target.moveTo( x + outerRadius, y);
			
			var n:Number;
			for (n = 1; n <= POINTS; ++n) 
			{
				target.lineTo(
					x + _cosHalfSteps[n-1] * innerRadius,
					y - _sinHalfSteps[n-1] * innerRadius
				);
				target.lineTo( 
					x + _cosSteps[n-1] * outerRadius,
					y - _sinSteps[n-1] * outerRadius
				);
			}
			
		}
		
	}

}