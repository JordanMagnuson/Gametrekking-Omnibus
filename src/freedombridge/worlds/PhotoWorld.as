package freedombridge.worlds 
{
	import freedombridge.FadeIn;
	import freedombridge.Photo;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
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
		
	}

}