package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import flash.desktop.NativeApplication;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class SoundNotice extends World
	{
		
		public function SoundNotice() 
		{
		}
		
		override public function begin():void
		{
			add(new Entity(0, 0, new Backdrop(Assets.SOUND_NOTICE_SCREEN, false, false)));	
			Mouse.cursor = 'button';
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.mousePressed || Input.pressed(Key.ESCAPE)) 
			{
				FP.world = new IntroLanding;
			}			
			else if (Input.pressed(Key.Q)) 
			{
				NativeApplication.nativeApplication.exit();
			}
		}
		
	}

}