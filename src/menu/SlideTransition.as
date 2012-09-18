package menu 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SlideTransition extends Entity
	{
		public static const DEFAULT_EASE_FUNCTION:Function = Ease.quadInOut;
		
		public var destX:Number;
		public var destY:Number;
		public var direction:String;
		public var duration:Number;
		public var goto:Class;
		public var motionTween:LinearMotion;
		public var ease:Function;
		
		public var sndSwoosh:Sfx = new Sfx(Assets.SND_SWOOSH);
		
		public function SlideTransition(graphic:Graphic = null, color:uint = 0x000000, direction:String = 'left', duration:Number = 1, goto:Class = null, ease:Function = null, layer:Number = -60) 
		{
			if (ease == null) 
			{
				ease = DEFAULT_EASE_FUNCTION;
			}
			this.ease = ease;
			
			if (graphic != null)
			{
				this.graphic = graphic;
			}
			else
			{
				var canvas:Canvas = new Canvas(FP.width, FP.height);
				canvas.fill(new Rectangle(0, 0, FP.width, FP.height), color, 1);
				this.graphic = canvas;
			}
			this.direction = direction;
			this.duration = duration;
			this.goto = goto;
			this.ease = ease;
			destX = 0;
			destY = 0;
			switch(direction)
			{
				case 'left':
					x = FP.width;
					y = 0;
					break;
				case 'right':
					x = -FP.width;
					y = 0;
					break;
				case 'up':
					x = 0;
					y = FP.height;
					break;
				case 'down':
					x = 0;
					y = -FP.height;
					break;
			}
			super(x, y, graphic);
			
			this.layer = layer;
			//(graphic as Backdrop).alpha = 0.5;
			
			motionTween = new LinearMotion(switchWorlds);
		}
		
		override public function added():void
		{
			addTween(motionTween);
			motionTween.setMotion(x, y, destX, destY, duration, ease);
			super.added();
			sndSwoosh.play(0.5);
		}
		
		override public function update():void
		{
			x = motionTween.x;
			y = motionTween.y;
			
			
			//if (direction == 1)
			//{
				//x -= speed;
				//if (x < 0)
				//{
					//x = 0;
					//switchWorlds();
				//}
				//
			//}
			//else 
			//{
				//x += speed;
				//if (x > FP.width)
				//{
					//x = FP.width;
					//switchWorlds();
				//}
			//}
			super.update();
		}
		
		public function switchWorlds():void
		{
			//Global.inTransition = false;
			if (goto) FP.world = new goto;
			FP.world.remove(this);
		}
		
	}

}