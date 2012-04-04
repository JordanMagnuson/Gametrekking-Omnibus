package killer.game.plains
{
	import killer.game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Tree extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/plains/tree01.png')] private const SPRITE01:Class;	
		[Embed(source = '../../../../assets/killer/plains/tree02.png')] private const SPRITE02:Class;	
		[Embed(source = '../../../../assets/killer/plains/tree03.png')] private const SPRITE03:Class;			
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02, SPRITE03);
		
		
		public function Tree() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			type = 'tree';
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}