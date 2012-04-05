package grandmother 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MouseController extends Entity
	{
		public var handIcon:Image = new Image(Assets.HAND_ICON);
		public var cursorIcon:Image = new Image(Assets.CURSOR_ICON);
		public var lastPressCounter:Number = 0;
		
		public var alphaTween:ColorTween;
		
		public function MouseController() 
		{
			handIcon.centerOO();
			type = 'mouse_controller';
			layer = -1000;	
		}
		
		override public function added():void
		{
			Mouse.hide();
		}			
		
		override public function update():void
		{
			
			if (alphaTween)
				(graphic as Image).alpha = alphaTween.alpha;
			
			if (Input.mouseDown)
				lastPressCounter = 0;
			else
				lastPressCounter += FP.elapsed;
				
			//trace('last mouse press: ' + lastPressCounter);
			
			x = FP.world.mouseX;
			y = FP.world.mouseY;

			var overlapBucket:Bucket = collide('bucket', x, y) as Bucket;
			var overlapVase:Vase = collide('vase', x, y) as Vase;
			
			if (overlapVase && !Global.vase.filled)
			{
				Global.sponge.visible = false;
				graphic = handIcon;
				visible = true;				
				//Mouse.hide();
			}
			else if (Global.hasSponge)
			{
				Global.sponge.visible = true;
				visible = false;
				//Mouse.hide();
			}
			else if (overlapBucket)
			{
				Global.sponge.visible = false;
				graphic = handIcon;
				visible = true;
				//Mouse.hide();
				
				if (Input.mousePressed && !Global.hasSponge)
				{
					Global.hasSponge = true;
				}
			}			
			else
			{
				Global.sponge.visible = false;
				graphic = cursorIcon;
				visible = true;				
				//Mouse.hide();
			}
			
			super.update();
		}		
		
		public function fadeOut(duration:Number):void
		{
			addTween(alphaTween = new ColorTween(destroy));
			alphaTween.tween(duration, Colors.WHITE, Colors.WHITE, 1, 0);
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}