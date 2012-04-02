package menu 
{
	import net.flashpunk.World;
	import flash.system.Capabilities;
	import punk.ui.PunkButton;
	import net.flashpunk.FP;
	import freedombridge.worlds.MyWorld
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Landing extends World
	{
		public var buttonFreedomBridge:PunkButton;
		
		public function Landing() 
		{
			trace(Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY); 
			
			// Freedom Bridge
			buttonFreedomBridge = new PunkButton(0, 0, 200, 100, 'Freedom Bridge', gotoFreedomBridge);
			add(buttonFreedomBridge);
		}
		
		public function gotoFreedomBridge():void
		{
			remove(buttonFreedomBridge);
			FP.world = new MyWorld;
		}
		
	}

}