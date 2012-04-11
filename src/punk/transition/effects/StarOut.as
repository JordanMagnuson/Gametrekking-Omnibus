package punk.transition.effects
{
	import net.flashpunk.Entity;
	
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com 
	 */
	public class StarOut extends Star
	{
		public function StarOut(x:Number = 0, y:Number = 0, speed:Number = 10, track:Entity = null)
		{
			super(x, y, speed, track);			
			_scale = 10;
		}
		
		override public function render():void
		{
			super.render();
			_scale += _speed;			
			if(_scale > _distance)
			{
				_onComplete();
			}
		}
	}
}