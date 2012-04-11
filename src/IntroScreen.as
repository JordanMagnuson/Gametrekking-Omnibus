package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import flash.ui.Mouse;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class IntroScreen extends World
	{
		public var goto:Class;
		
		public function IntroScreen(backdropSource:*, goto:Class = null) 
		{
			this.goto = goto;
			add(new Entity(0, 0, new Backdrop(backdropSource)));
			Mouse.cursor = 'button';
		}
		
		override public function update():void
		{
			// Click to continue
			if (Input.mousePressed)
			{
				if (goto != null) FP.world = new goto;
			}
			
			super.update();
		}
		
	}

}