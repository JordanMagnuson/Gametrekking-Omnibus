package statusquo  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class TextEntity extends Entity
	{
		public var text:Text;
		public var bg:Image;
		
		//[Embed(source = '../../assets/statusquo/CasualEncounter.ttf', embedAsCFF = "false", fontFamily = 'CasualEncounter')] private var CasualEncounter:Class;
		[Embed(source = '../../assets/verdana.ttf', embedAsCFF="false", fontFamily = 'verdana')] private var Verdana:Class;		
		
		public function TextEntity(textString:String, x:Number = 0, y:Number = 0, centered:Boolean = true, size:int = 8, color:uint = 0xFFFFFFFF, fillBG:Boolean = false, bgColor:uint = 0xFF000000) 
		{
			super(x, y);
			layer = -100;
			this.x = 0;
			this.y = 0;					
			// Initialize text rendering
			if (centered)
			{			
				text = new Text(textString, 0, y, {align: "center", width: FP.width});
			}
			else 
			{				
				text = new Text(textString, x, y);
			}
			text.font = 'verdana';
			text.size = 14;
			text.color = color;
			
			// Initialize background rendering
			if (fillBG)
			{
				bg = Image.createRect(text.width, text.height, bgColor);
				bg.originX = bg.width / 2;
				bg.originY = bg.height / 2;
				bg.x = -bg.originX;
				bg.y = -bg.originY;				
			}
			
			setHitbox(text.width, text.height, text.originX, text.originY);		
			graphic = text;						
		}
		
		override public function render():void
		{
			if (bg)
				Draw.graphic(bg, x, y);
			super.render();
		}
		
		public function fadeIn():void
		{
			
		}
		
		public function fadeOut():void
		{
			
		}
		
	}

}