package punk.transition.effects
{
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class CircleIn extends Circle
	{
		public function CircleIn(x:Number = 0, y:Number = 0, speed:Number = 10)
		{
			super(x, y, speed);
			_scale = _distance;	
		}
		
		override public function render():void
		{
			super.render();	
			_scale -= _speed;			
			if(_scale < _speed)
			{
				_onComplete();
			}	
		}	
	}
}