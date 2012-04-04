package killer.game.snow
{
	import killer.game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Igloo extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/snow/igloo.png')] private const SPRITE01:Class;				
		
		public function Igloo() 
		{	
			super(SPRITE01, 'mid', false);
			type = 'igloo';		
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}