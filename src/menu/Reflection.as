package menu 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import punk.transition.Transition;
	import net.flashpunk.utils.Key;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Reflection extends World
	{
		public const SCROLL_SPEED:Number = 8;
		public const SCROLL_ARROW_HEIGHT:Number = 40;
		
		public var canvas:Canvas;
		public var bitmapData:BitmapData;	
		public var reflection:Entity;
		public var arrowDownImage:Image = new Image(Assets.REFLECTION_SCROLL_ARROW);
		public var arrowUpImage:Image = new Image(Assets.REFLECTION_SCROLL_ARROW);
		public var scrollUpArrow:Entity;
		public var scrollDownArrow:Entity;
		public var returnTo:Class;
		
		public var scrollDownMouseY:Number;
		public var scrollUpMouseY:Number;
		
		public function Reflection(source:*, returnTo:Class) 
		{
			FP.screen.color = Colors.WHITE;
			this.returnTo = returnTo;
			
			// Prep credits canvas
			bitmapData = FP.getBitmap(source);
			canvas = new Canvas(FP.width, bitmapData.height);
			canvas.draw(0, 0, bitmapData);
			
			var xVal:Number = (FP.width - bitmapData.width) / 2;
			
			// Add stuff
			add(reflection = new Entity(xVal, 0, canvas));
			
			// Scroll arrows
			add(scrollDownArrow = new Entity(0, (FP.height - arrowDownImage.height), arrowDownImage));
			scrollDownArrow.visible = false;
			
			arrowUpImage.scaleY = -1;
			add(scrollUpArrow = new Entity(0, arrowUpImage.height, arrowUpImage));
			scrollUpArrow.visible = false;
			
			
			this.scrollDownMouseY = FP.height - SCROLL_ARROW_HEIGHT;
			this.scrollUpMouseY = SCROLL_ARROW_HEIGHT;	
		}
		
		override public function begin():void
		{
			super.begin();
			Mouse.cursor = 'arrow';			
		}
		
		override public function update():void
		{
			super.update();
			
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				Transition.to(new returnTo, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS));
				return;
			}	
			
			// Scroll down
			if (Input.check(Key.DOWN) || FP.screen.mouseY > scrollDownMouseY)
			{
				scrollDownArrow.visible = true;
				reflection.y -= SCROLL_SPEED;
			}		
			// Scroll up
			else if (Input.check(Key.UP)|| FP.screen.mouseY < scrollUpMouseY)
			{
				scrollUpArrow.visible = true;
				reflection.y += SCROLL_SPEED;
			}	
			else 
			{
				scrollDownArrow.visible = false;				
				scrollUpArrow.visible = false;
			}
			
			// Boundaries
			if (reflection.y > 0) 
			{
				reflection.y = 0;
			}			
			else if (reflection.y < (-bitmapData.height + FP.height)) 
			{
				reflection.y = -bitmapData.height + FP.height;
			}				
		}
	}

}