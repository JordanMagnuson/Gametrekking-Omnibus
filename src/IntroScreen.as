package  
{
	import menu.Global;
	import menu.IntroLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import flash.ui.Mouse;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author ...
	 */
	public class IntroScreen extends World
	{
		public var goto:Class;
		public var returnTo:Class;
		
		public function IntroScreen(backdropSource:*, goto:Class = null, returnTo:Class = null) 
		{
			this.goto = goto;
			this.returnTo = returnTo;
			add(new Entity(0, 0, new Backdrop(backdropSource)));
		}
		
		override public function begin():void
		{
			Mouse.cursor = 'button';			
		}
		
		override public function update():void
		{
			// Click to continue
			if (Input.mousePressed)
			{
				//if (goto != null) FP.world = new goto;
				if (goto != null) Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 				
				
			}
			
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				if (returnTo != null) FP.world = new returnTo;
				else FP.world = new IntroLanding;
			}
			
			super.update();
		}
		
	}

}