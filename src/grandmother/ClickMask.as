package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author ...
	 */
	public class ClickMask extends Entity
	{
		public var image:Image;
		public var pixelMask:Pixelmask;
		
		public function ClickMask(x:Number = 0, y:Number = 0, source:* = null) 
		{
			image = new Image(source);
			pixelMask = new Pixelmask(source);
			super(x, y, image, pixelMask);
			type = 'click_mask';
			visible = false;
			//this.mask = new Pixelmask(source);
			//setHitboxTo(image);
		}
		
	}

}