package menu 
{
	import net.flashpunk.World;
	import flash.system.Capabilities;
	import punk.ui.PunkButton;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Intro extends World
	{
		public var buttonFreedomBridge:PunkButton;
		
		public function Intro() 
		{
			trace(Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY); 
			
			// Freedom Bridge
			buttonFreedomBridge = new PunkButton(0, 0, 200, 100, 'Freedom Bridge', gotoFreedomBridge);
			add(buttonFreedomBridge);
		}
		
		public function gotoFreedomBridge():void
		{
			FP.world = new Tutorial;
		}
		
	}

}