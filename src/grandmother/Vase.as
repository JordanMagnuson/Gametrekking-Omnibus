package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Vase extends Entity
	{
		public var filled:Boolean = false;
		
		public function Vase(x:Number, y:Number) 
		{
			super(x, y);
			type = 'vase';
			width = 80;
			height = 140;
		}
		
		override public function update():void
		{
			if (!filled && Input.mousePressed && collidePoint(x, y, world.mouseX, world.mouseY))
			{
				filled = true;
				FP.world.add(Global.flowers = new Flowers(457, 0, true, 2));
				//graphic = new Image(Assets.FLOWERS);
				//y = 0;
				//x = 457;
				Global.hasSponge = false;
			};
			super.update();
		}
		
	}

}