package punk.transition.effects
{
	import flash.display.*;
	import flash.geom.Rectangle;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import punk.transition.Transition;
	
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class Circle extends Effect
	{
		protected var _distance:Number;
		protected var _graphic:Image;		
		protected var _r:Rectangle;
		protected var _scale:Number;
		protected var _speed:Number;
		protected var _starBm:BitmapData;
		protected var _startX:Number;
		protected var _startY:Number;		
		protected var _tempSprite:Sprite = new Sprite();		
				
		public function Circle(startX:Number, startY:Number, speed:Number = 10)
		{
			super();
			layer = -1;
			
			// Pause until transition manager tells it to get moving
			active = false;
			
			// Store arguments
			_speed = speed;
			_startX = startX;
			_startY = startY;
			
						
			// Find the longest distance from the start to any corner,
			// used to track if the animation is done
			var distances:Array = [
			FP.distance(_startX, _startY, 0, 0),
				FP.distance(_startX, _startY, FP.width, 0),
				FP.distance(_startX, _startY, FP.width, FP.height),
				FP.distance(_startX, _startY, 0, FP.height)
			];
			distances.sort();
			_distance = distances[distances.length-1];
			
			// Image Data
			_r = new Rectangle(0, 0, FP.width, FP.height);
			_starBm = new BitmapData(FP.width, FP.height, true, 0xFF003300);
			_graphic = new Image(_starBm);			
			graphic = _graphic;			
		}		
		
		override public function render():void
		{
			_tempSprite.graphics.clear();
			
			// Draw Star
			_tempSprite.graphics.beginFill(0xFF0000, 1);
			if(Transition.tracked != "" && FP.world.hasOwnProperty(Transition.tracked) && FP.world[Transition.tracked] != null)
			{
				_tempSprite.graphics.drawCircle(FP.world[Transition.tracked].x, FP.world[Transition.tracked].y, _scale);
			}			
			else
			{
				_tempSprite.graphics.drawCircle(_startX, _startY, _scale);
			}
			
			// Draw bg
			_starBm.fillRect(_r, 0xFF000000);
			_starBm.draw(_tempSprite, null, null, BlendMode.ERASE);
			_graphic.updateBuffer();
			
			super.render();
		}
	}
}