package grandmother  
{
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Approach extends World
	{
		public var photoArray:Array = new Array(Assets.PHOTO_01, Assets.PHOTO_02, Assets.PHOTO_03, Assets.PHOTO_04, Assets.PHOTO_05, Assets.PHOTO_06, Assets.PHOTO_07, Assets.PHOTO_08, Assets.PHOTO_09, Assets.PHOTO_10, Assets.PHOTO_11, Assets.PHOTO_12, Assets.PHOTO_13, Assets.PHOTO_14, Assets.PHOTO_15, Assets.PHOTO_16);
		public var soundArray:Array = new Array(Assets.SND_DOOR_SQUEAK, Assets.SND_WALKING_01, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_02, Assets.SND_WALKING_05, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_06, Assets.SND_TILES_01, Assets.SND_TILES_02, Assets.SND_TILES_03, Assets.SND_TILES_04, Assets.SND_WALKING_01, Assets.SND_WALKING_06, Assets.SND_TILES_05);						
		public var clickMaskArray:Array = new Array(Assets.CLICK_MASK_01, Assets.CLICK_MASK_02, Assets.CLICK_MASK_03, Assets.CLICK_MASK_04, Assets.CLICK_MASK_05, Assets.CLICK_MASK_06, Assets.CLICK_MASK_07, Assets.CLICK_MASK_08, Assets.CLICK_MASK_09, Assets.CLICK_MASK_10, Assets.CLICK_MASK_11, Assets.CLICK_MASK_12, Assets.CLICK_MASK_13, Assets.CLICK_MASK_14, Assets.CLICK_MASK_15, null);						
		
		public function Approach() 
		{
			FP.screen.scale = 1.6;
			
			// Center screen in window
			FP.screen.y = -(768 - SuperGlobal.SCREEN_HEIGHT) / 2;
			//FP.screen.x = (SuperGlobal.SCREEN_WIDTH - FP.width) / 2;
			//FP.screen.y = (SuperGlobal.SCREEN_HEIGHT - FP.height) / 2;			
		}
		
		override public function begin():void
		{
			add(Global.photoController = new PhotoController(photoArray, soundArray, clickMaskArray));
			Global.SndAmbient.loop();
			add(new MouseControllerApproach);
		}
		
	}

}