package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Tween;
	import net.flashpunk.Tweener;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NavigationUnderline extends Entity
	{
		public const HEIGHT:Number = 3;
		public const Y_VALUE:Number = 36;
		
		public var destX:Number;
		public var destWidth:Number;
		
		public var motionTweener:LinearMotion;
		public var widthTweener:NumTween;
		
		public function NavigationUnderline(entity:Entity) 
		{
			x = entity.x;
			trace('entity.x: ' + entity.x);
			width = entity.width;
			y = Y_VALUE;
			layer = -100;
			
			motionTweener = new LinearMotion;
			motionTweener.x = x;
			
			widthTweener = new NumTween;
			widthTweener.value = width;
		}
		
		override public function added():void
		{
			addTween(motionTweener);
			addTween(widthTweener);
		}
		
		override public function update():void
		{
			x = motionTweener.x;
			width = widthTweener.value;
			super.update();
		}
		
		public function goto(entity:Entity, duration:Number):void
		{
			motionTweener.setMotion(x, y, entity.x, y, duration, Ease.quadInOut);
			widthTweener.tween(width, entity.width, duration, Ease.quadInOut);
		}
		
		override public function render():void
		{
			Draw.rect(x, y, widthTweener.value, HEIGHT, Colors.MENU_BLUE);
			//super.render();
		}		
		
	}

}