package menu 
{
	import loneliness.rooms.MainWorld;
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
		public var freedomBridgeButton:PunkButton;
		public var lonelinessButton:PunkButton;
		
		public function Landing() 
		{
			trace(Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY); 
			
			// Freedom Bridge
			freedomBridgeButton = new PunkButton(0, 0, 200, 100, 'Freedom Bridge', gotoFreedomBridge);
			add(freedomBridgeButton);
			
			// Loneliness
			lonelinessButton = new PunkButton(0, 200, 200, 100, 'Loneliness', gotoLoneliness);
			add(lonelinessButton);			
		}
		
		public function gotoFreedomBridge():void
		{
			remove(freedomBridgeButton);
			FP.world = new MyWorld;
		}
		
		public function gotoLoneliness():void
		{
			remove(lonelinessButton);
			FP.world = new MainWorld;
		}		
		
	}

}