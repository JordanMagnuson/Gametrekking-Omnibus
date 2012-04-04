package killer.game.forest
{
	import killer.game.Item;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Pinetree extends Item
	{	
		/**
		 * Graphics
		 */
		[Embed(source = '../../../../assets/killer/forest/pine01.png')] private const SPRITE01:Class;	
		[Embed(source = '../../../../assets/killer/forest/pine02.png')] private const SPRITE02:Class;	
		[Embed(source = '../../../../assets/killer/forest/pine03.png')] private const SPRITE03:Class;	
		[Embed(source = '../../../../assets/killer/forest/pine04.png')] private const SPRITE04:Class;			
		public var mySpriteCollection:Array = new Array(SPRITE01, SPRITE02, SPRITE03, SPRITE04);
		
		
		public function Pinetree() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection);			
			super(rawSprite, 'mid', true);
			type = 'pinetree';
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}