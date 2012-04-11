package menu 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SlideTransition extends Entity
	{
		public var destX:Number;
		public var direction:Number;
		public var duration:Number;
		public var goto:Class;
		public var motionTween:LinearMotion;
		public var ease:Function;
		
		public function SlideTransition(graphic:Graphic = null, color:uint = 0x000000, direction:Number = 1, duration:Number = 1, goto:Class = null, ease:Function = null) 
		{
			ease = Ease.quadInOut;
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
			y = 0;
			destX = 0;
			if (direction == 1)
			{
				x = FP.width;
			}
			else 
			{
				x = -FP.width;
			}
			super(x, y, graphic);
			
			layer = -60;
			//(graphic as Backdrop).alpha = 0.5;
			
			motionTween = new LinearMotion(switchWorlds);
		}
		
		override public function added():void
		{
			addTween(motionTween);
			motionTween.setMotion(x, y, destX, y, duration, ease);
			super.added();
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
			if (goto) FP.world = new goto;
			FP.world.remove(this);
		}
		
	}

}