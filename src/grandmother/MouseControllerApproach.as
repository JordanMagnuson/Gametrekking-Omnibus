package grandmother 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MouseControllerApproach extends Entity
	{
		public var feetIcon:Image = new Image(Assets.FEET_ICON);
		public var magnifyingIcon:Image = new Image(Assets.MAGNIFYING_GLASS_ICON);
		public var cursorIcon:Image = new Image(Assets.CURSOR_ICON);
		
		public function MouseControllerApproach() 
		{
			feetIcon.centerOO();
			magnifyingIcon.centerOO();
			cursorIcon.centerOO();
			type = 'mouse_controller';
			layer = -1000;	
			setHitbox(1, 1, 0, 0);
		}
		
		override public function added():void
		{
			Mouse.hide();
		}		
		
		override public function update():void
		{
			x = FP.world.mouseX;
			y = FP.world.mouseY;
			
			//var overlapClickMask:ClickMask = collide('click_mask', x, y) as ClickMask;
			if (Global.photoController.currentPhoto.clickMask) 
			{
				var overlapClickMask:ClickMask = collideWith(Global.photoController.currentPhoto.clickMask, x, y) as ClickMask;
			}

			if (Global.photoController.currentPhoto.fadeInComplete)
			{
				if (overlapClickMask) 
				{
					if (Global.photoController.currentIndex == 15)
						graphic = magnifyingIcon;
					else 
						graphic = feetIcon;
				}
				else 
				{
					graphic = cursorIcon;	
				}
				visible = true;					
			}
			else
			{
				visible = false;
			}	
			
			// Click - advance
			if (overlapClickMask && Input.mousePressed && Global.photoController.currentPhoto.fadeInComplete)
			{
				Global.photoController.nextPhoto();
			}			
			
			super.update();
		}		
	}

}