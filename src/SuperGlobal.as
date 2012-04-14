package  
{
	import flash.utils.Dictionary;
	import net.flashpunk.utils.Key;
	import punk.transition.effects.BlurOut;
	import punk.transition.effects.Effect;
	import punk.transition.effects.BlurIn;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SuperGlobal 
	{
		public static const SCREEN_WIDTH:Number = 1024;
		public static const SCREEN_HEIGHT:Number = 600;
		
		public static const RETURN_KEY:int = Key.ESCAPE;
		public static const FULLSCREEN_KEY:int = Key.F;
		
		public static const TRANS_OUT:Class = BlurOut;
		public static const TRANS_IN:Class = BlurIn;
		public static const TRANS_OUT_OPTIONS:Object = { duration: 0.5 }
		public static const TRANS_IN_OPTIONS:Object = { duration: 0.5 }			
		
		public static var soundsPlaying:Dictionary = new Dictionary();
		
	}

}