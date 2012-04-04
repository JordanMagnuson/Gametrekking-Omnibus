package kindnessofstrangers.Objects 
{
	import net.flashpunk.graphics.Image;
	import kindnessofstrangers.Global;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class StrangerUp extends Stranger
	{
		[Embed(source = '../../../assets/kindnessofstrangers/graphics/arrow_up.png')] public const ARROW_UP:Class;	
		
		public function StrangerUp(x:Number, y:Number) 
		{
			super(x, y);
		
			imgArrow = new Image(ARROW_UP);
			imgArrow.color = Global.BG_COLOR;
		}
		
	}

}