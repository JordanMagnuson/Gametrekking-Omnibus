package punk.transition.effects
{
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class CircleOut extends Circle
	{
		public function CircleOut(x:Number = 0, y:Number = 0, speed:Number = 10)
		{
			super(x, y, speed);			
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