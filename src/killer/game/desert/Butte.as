package killer.game.desert
{
	import killer.game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Butte extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/desert/butte01.png')] private const SPRITE01:Class;	
		[Embed(source = '../../../../assets/killer/desert/butte02.png')] private const SPRITE02:Class;
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02);
		
		public function Butte() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', false);
			type = 'butte';
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}