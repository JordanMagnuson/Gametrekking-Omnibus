package Menu 
{
	import net.flashpunk.World;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Intro extends World
	{
		
		public function Intro() 
		{
			trace(Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY); 
		}
		
	}

}