package killer.game.jungle 
{
	import killer.game.Item;
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class JungleTree extends Item
	{
		
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/jungle/tree01.png')] private const SPRITE01:Class;
		[Embed(source = '../../../../assets/killer/jungle/tree02.png')] private const SPRITE02:Class;	
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02);			
		
		public function JungleTree() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			type = 'tree';				
		}
		
	}

}