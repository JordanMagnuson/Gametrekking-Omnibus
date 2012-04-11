package jui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import jui.Button;
	import net.flashpunk.utils.Input;
	import menu.Global;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ButtonController extends Entity
	{
		
		public function ButtonController() 
		{
			
		}
		
		override public function update():void
		{
			if (Global.inTransition)
				return;
			
			// First, we will create an empty array.
			var buttonList:Array = [];

			// Then, we populate the array with all existing Enemy objects!
			FP.world.getClass(Button, buttonList);

			// Finally, we can loop through the array and call each Enemy's die() function.
			buttonList.sortOn("layer")
			for each (var b:Button in buttonList)
			{
				if (b.collidePoint(b.x, b.y, FP.world.mouseX, FP.world.mouseY))
				{
					if (Input.mousePressed)
					{
						if (b.onPress != null) b.onPress();
					}
					if (!b.hover)
					{
						b.onHover();
						break;
					}
				}
				else if (b.hover)
				{
					b.onExit();
					//break;
				}
			}			
		}
		
	}

}