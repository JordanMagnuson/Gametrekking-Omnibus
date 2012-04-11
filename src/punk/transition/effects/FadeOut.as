package punk.transition.effects
{
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class FadeOut extends Fade
	{
		public function FadeOut()
		{
			super();
			_fade.alpha = 1;
		}
		
		override public function render():void
		{
			//fade out			
			_fade.alpha -= 0.05;
			
			if (_fade.alpha <= 0)
			{
				_onComplete();
			}
			super.render();		
		}	
	}
}