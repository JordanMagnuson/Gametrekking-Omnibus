package punk.transition.effects 
{
	/**
	 * StripeFadeOut effect class. Shorthand for StripeFade(false, LEFT, options).
	 * 
	 * @author azrafe7
	 */
	public class StripeFadeOut extends StripeFade 
	{
		
		public function StripeFadeOut(fadeFrom:int=LEFT, options:Object=null) 
		{
			super(false, fadeFrom, options);
		}
		
	}

}