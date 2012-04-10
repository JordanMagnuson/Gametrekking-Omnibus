package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Button extends Entity
	{
		public var graphicOn:Graphic;
		public var graphicOff:Graphic;
		public var maskOn:Mask;
		public var maskOff:Mask;
		public var onPress:Function;
		
		public function Button(x:Number = 0, y:Number = 0, graphicOff:Graphic = null, graphicOn:Graphic = null, maskOff:Mask = null, maskOn:Mask = null, onPress:Function = null) 
		{
			this.graphicOn = graphicOn;
			this.graphicOff = graphicOff;
			this.maskOn = maskOn;
			this.maskOff = maskOff;
			this.onPress = onPress;
			
			super(x, y, graphicOff);
		}
		
		override public function update():void
		{
			if (FP.world.frontCollidePoint(FP.world.mouseX, FP.world.mouseY) == this) 
			{
				trace('frontcollidepoint');
				graphic = this.graphicOn;
			}
			else
			{
				trace('nope');
				graphic = this.graphicOn;
			}
			
			super.update();
		}
		
	}

}