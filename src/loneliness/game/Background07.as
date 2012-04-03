package loneliness.game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import loneliness.rooms.MainWorld;
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Background07 extends Entity
	{
		
		/**
		 * Background textures
		 */
		[Embed(source='../../../assets/loneliness/gfx/bg07.jpg')] private const BG:Class;
		public var image:Backdrop = new Backdrop(BG, false, false); 		
		
		public function Background07() 
		{
			type = 'background';
			layer = 100;
			graphic = image;
			x = 0;
			y = 2000;
		}
		
	}

}