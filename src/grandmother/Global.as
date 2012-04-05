package grandmother  
{
	import flash.display.BitmapData;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Global 
	{
		// Settings
		public static const LONG_ENDING:Boolean = true;
		
		// Constants
		public static const PHOTO_FADE_IN_DURATION:Number = 2.5;		// 3
		public static const PHOTO_FADE_OUT_DURATION:Number = 2.5; 	//3
		public static const MIN_SPONGE_SATURATION:Number = 0.4;
		public static const WAIT_TO_DROP_BUCKET:Number = 3;
		public static const WAIT_TO_FADE:Number = 10;
		public static const FADE_OUT_DURATION:Number = 15;
		public static const LONG_ENDING_PHOTO_PAUSE_DURATION:Number = 2;
		
		// Variables
		public static var hasSponge:Boolean = false;
		public static var bucketDropped:Boolean = false;
		public static var startedFade:Boolean = false;
		public static var endingStarted:Boolean = false;
		public static var cleanHeadstone:BitmapData;
		
		// Entities
		public static var SndAmbient:Sfx = new Sfx(Assets.SND_AMBIENT_01);
		public static var photoController:PhotoController;
		public static var mouseController:MouseController;
		public static var dust:Dust;
		public static var sponge:Sponge;
		public static var bucket:Bucket;
		public static var vase:Vase;
		public static var flowers:Flowers;
	}

}