package menu 
{
	import punk.transition.effects.BlurOut;
	import punk.transition.effects.Effect;
	import punk.transition.effects.BlurIn;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Global 
	{
		public static const INTRO_BUTTON_INDEX:Number = 0;
		public static const KOREA_BUTTON_INDEX:Number = 1;
		public static const TAIWAN_BUTTON_INDEX:Number = 2;
		public static const VIETNAM_BUTTON_INDEX:Number = 3;
		public static const CAMBODIA_BUTTON_INDEX:Number = 4;
		public static const CREDITS_BUTTON_INDEX:Number = 5;
		public static const QUIT_BUTTON_INDEX:Number = 6;
		
		public static const BUTTON_HOVER_SCALE:Number = 1.05;
		public static const NAV_HOVER_SCALE:Number = 1;
		
		public static const TRANS_OUT:Class = BlurOut;
		public static const TRANS_IN:Class = BlurIn;
		public static const TRANS_OUT_OPTIONS:Object = { duration: 0.5 }
		public static const TRANS_IN_OPTIONS:Object = { duration: 0.5 }		
		
		public static var navButtonIndex;
		public static var inTransition:Boolean = false;
		public static var voiceIntroPlayed:Boolean = false;
		
	}

}