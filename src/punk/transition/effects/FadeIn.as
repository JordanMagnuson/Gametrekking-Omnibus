package punk.transition.effects
{
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class FadeIn extends Fade
	{
		public function FadeIn()
		{
			super();
			_fade.alpha = 0;
		}
		
		override public function render():void
		{
			//fade out			
			_fade.alpha += 0.05;
			
			if (_fade.alpha >= 1)
			{
				_onComplete();
			}
			super.render();		
		}	
	}
}