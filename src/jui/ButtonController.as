package jui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import jui.Button;
	import net.flashpunk.utils.Input;
	import menu.Global;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ButtonController extends Entity
	{
		public var overButton:Boolean;
		
		public function ButtonController() 
		{
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (Global.inTransition)
			{
				//Mouse.cursor = 'arrow';
				return;
			}
			
			// First, we will create an empty array.
			var buttonList:Array = [];

			// Then, we populate the array with all existing Enemy objects!
			FP.world.getClass(Button, buttonList);

			// Finally, we can loop through the array and call each Enemy's die() function.
			buttonList.sortOn("layer")
			overButton = false;
			for each (var b:Button in buttonList)
			{
				if (b.collidePoint(b.x, b.y, FP.world.mouseX, FP.world.mouseY))
				{
					overButton = true;
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
			
			if (overButton)
			{
				Mouse.cursor = 'button';
			}
			else 
			{
				Mouse.cursor = 'arrow';
			}
		}
		
	}

}