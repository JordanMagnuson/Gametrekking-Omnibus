package jui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Button extends Entity
	{
		public var imageOff:Image;
		public var imageHover:Image;
		public var hoverScale:Number;
		public var maskOff:Mask;
		public var maskHover:Mask;		
		public var onPress:Function;
		
		public var hover:Boolean = false;
		
		public function Button(x:Number = 0, y:Number = 0, imageOff:Image = null, imageHover:Image = null, hoverScale:Number = 1,  maskOff:Mask = null, maskHover:Mask = null, centered:Boolean = true, onPress:Function = null) 
		{
			this.imageOff = imageOff;
			this.imageHover = imageHover;
			this.hoverScale = hoverScale;
			this.maskOff = maskOff;
			this.maskHover = maskHover;			
			this.onPress = onPress;
			
			if (centered)
			{
				this.imageOff.centerOO();
				if (imageHover != null) this.imageHover.centerOO();
			}
			
			//if (maskOff != null) 
				//this.mask = maskOff;
			
			super(x, y, imageOff, maskOff);
			//this.imageOff.smooth = true;
			//imageOff.alpha = 0.5;
			this.setHitbox(imageOff.width, imageOff.height, imageOff.originX, imageOff.originY);
		}
		
		override public function update():void
		{
			//if (FP.world.frontCollidePoint(FP.world.mouseX, FP.world.mouseY) == this) 
			//{
				//trace('frontcollidepoint');
				//graphic = this.graphicOn;
			//}
			//else
			//{
				//trace('nope');
				//graphic = this.graphicOn;
			//}
			
			super.update();
		}
		
		public function onHover():void
		{
			trace('onHover');
			if (this.imageHover != null) 
			{
				graphic = this.imageHover;
			}
			this.imageOff.scale = hoverScale;
			//Mouse.cursor = 'button';
			this.hover = true;
		}
		
		public function onExit():void
		{
			trace('onExit');
			graphic = this.imageOff;
			if (this.imageOff.scale != 1)
				this.imageOff.scale = 1;
			//Mouse.cursor = 'arrow';
			this.hover = false;
		}		
		
	}

}