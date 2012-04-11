package punk.transition.effects 
{
	import net.flashpunk.Entity;
	
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class Effect extends Entity 
	{
		protected var _onComplete:Function;
				
		public function Effect() 
		{			
			super();
			layer = -1;
			
			// Pause until transition manager tells it to get moving
			active = false;
		}
		
		public function get onComplete():Function 
		{
			return _onComplete;
		}
		
		public function set onComplete(value:Function):void 
		{
			_onComplete = value;
		}		
	}
}