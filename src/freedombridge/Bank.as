package freedombridge  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Bank extends Entity
	{
		/**
		 * Embedded river graphic.
		 */
		[Embed(source = '../../assets/freedombridge/bank.png')] private static const S_BANK:Class;
		[Embed(source = '../../assets/freedombridge/bank_mask.png')] private static const S_MASK:Class;
		
		public var image:Image = new Image(S_BANK);
		
		/**
		 * Constructor.
		 */		
		public function Bank() 
		{
			type = "solid"

			graphic = image;
			
			//image.originX = image.width / 2;
			//image.originY = 0;
			//image.x = -image.originX;
			//image.y = 0				
			
			image.originX = image.width / 2;
			mask = new Pixelmask(S_MASK, -image.originX, -image.originY);
			
			layer = 90;			
		}
			
		
	}

}