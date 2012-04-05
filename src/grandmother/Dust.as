package grandmother  
{
	import flash.geom.ColorTransform;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Dust extends Entity
	{
		public var whiteboard:Whiteboard = new Whiteboard(Assets.DUST, Assets.SPONGE_MASK);
		public var cleaned:Boolean = false;
		
		public function Dust(x:Number = 0, y:Number = 0) 
		{
			super(x, y, whiteboard);
			type = 'dust';
			width = whiteboard.width;
			height = whiteboard.height;
		}	
		
		override public function added():void
		{
			FP.alarm(1, checkCleaned, 1);
		}
		
		public function clean(px:Number = 0, py:Number = 0):void
		{
			whiteboard.erase(px - x, py - y, Global.sponge.saturation);
			//whiteboard.erase(px - x, py - y, 1);
			//trace('clean');
			//var blow:Image = Image.createCircle(bRad, 0xFFFFFF, 0.1); //create circle image
			//var blow:Image = new Image(Assets.SPONGE_MASK);
			//blow.alpha = Global.sponge.saturation;
			//blow.blend = BlendMode.ERASE; //we will cut holes :)
				//
			//canvas.drawGraphic(bx - blow.width / 2 - x, by - blow.height / 2 - y, blow);  //add hole to image
		}			
		
		public function checkCleaned():void
		{
			if (whiteboard.checkOpaquePixels(0.50) < 150)
			{
				cleaned = true;
			}
			trace('dust check cleaned: ' + cleaned);
		}
		
	}

}