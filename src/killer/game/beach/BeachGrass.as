package killer.game.beach
{
	import killer.game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BeachGrass extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/beach/grass01.png')] private const SPRITE01:Class;	
		[Embed(source = '../../../../assets/killer/beach/grass02.png')] private const SPRITE02:Class;	
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02);
		
		
		public function BeachGrass() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			type = 'beach_grass';
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}