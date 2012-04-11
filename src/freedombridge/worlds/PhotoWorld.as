package freedombridge.worlds 
{
	import freedombridge.FadeIn;
	import freedombridge.Photo;
	import menu.KoreaLanding;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import freedombridge.River
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoWorld extends World
	{
		
		public function PhotoWorld() 
		{
			add(new Photo);
		}
		
		override public function begin():void
		{
			trace("photoworld begin");
			FP.camera.x = FP.camera.y = 0;
			add(new FadeIn(Colors.BLACK, 3));
		}
		
		override public function update():void
		{
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				River.sndRiver.stop();
				FP.world = new KoreaLanding;
			}			
		}
		
	}

}