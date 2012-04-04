package killer.game.jungle 
{
	import killer.game.Item;
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Bush extends Item
	{
		
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/jungle/bush01.png')] private const SPRITE01:Class;
		[Embed(source = '../../../../assets/killer/jungle/bush02.png')] private const SPRITE02:Class;	
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02);			
		
		public function Bush() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			type = 'bush';			
		}
		
	}

}