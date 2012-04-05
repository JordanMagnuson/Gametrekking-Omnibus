package grandmother
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.ColorTween;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class FadeOut extends Entity
	{
		private const BLACK:uint = 0xFF000000;
		
		// use ColorTween to control the alpha fading
		private var _alphaTween:ColorTween;
		private var _duration:Number;
		private var _color:uint;
		private var _buffer:Number;
		private var _goto:Class;
		
		/**
		 * Constructor. Can be used to set the time and time for the fade out.
		 * @param	goto		The world to go to after the fade finishes.		
		 * @param	color		The color to fade out to.		
		 * @param	time		The number of seconds to fade over.
		 * @param 	buffer		The number of seconds to wait after the fade, before switching worlds.
		 */		
		public function FadeOut(goto:Class, color:uint = BLACK, duration:Number = 3, buffer:Number = 0) 
		{
			_duration = duration;
			_color = color;
			_buffer = buffer;
			_goto = goto;
			
			// create a rectangle the size of the screen.
			graphic = Image.createRect(FP.width, FP.height, color);
			(graphic as Image).alpha = 0;
			layer = -10000;
			type = 'fade_out';
			
			_alphaTween = new ColorTween(startBuffer);
		}
		
		override public function added():void
		{
			addTween(_alphaTween);	
			_alphaTween.tween(_duration, 0x000000, _color, 0, 1);
		}
		
		/**
		 * Update the fade.
		 */		
		override public function update():void 
		{		
			super.update();
	
			// update our alpha.
			(graphic as Image).alpha = _alphaTween.alpha;			
		}
		
		/**
		 * Start Buffer
		 */
		public function startBuffer():void
		{
			if (_buffer > 0)
			{
				FP.alarm(_buffer, switchWorlds);
			}
			else	
				switchWorlds();
		}
		
		/**
		 * Switch worlds
		 */
		public function switchWorlds():void
		{		
			trace('switch worlds');
			FP.world = new _goto;
		}
	}
}