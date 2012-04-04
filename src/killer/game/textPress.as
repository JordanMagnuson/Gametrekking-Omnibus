package killer.game 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.ColorTween;
	
	public class textPress extends Entity
	{		
		public static const FADE_IN_DURATION:Number = 3;
		public static const FADE_OUT_DURATION:Number = 3;

		public static var text:Text;
		public static var fadeTween:ColorTween;
		
		public static var nextTextAlarm:Alarm;
		
		public static var started:Boolean = false;
		
		public function textPress() 
		{
			text = new Text("Hold space to start walking.");
			text.size = 8;
			text.alpha = 0;
			graphic = text;			
			x = 20;
			y = 130;
			fadeTween = new ColorTween();
			fadeTween.alpha = 1;
			nextTextAlarm = new Alarm(2, fadeOut);
		}	
		
		override public function added():void
		{
			fadeIn();
		}
		
		override public function update():void
		{
			super.update();
			text.alpha = fadeTween.alpha;
			
			if (Global.player.walking && started == false)
			{
				started = true;
				FP.world.addTween(nextTextAlarm);
				nextTextAlarm.start();
			}
		}
		
		public function nextText():void
		{
			FP.world.add(new textLetGo(this));
		}
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween();
			addTween(fadeTween);		
			fadeTween.tween(FADE_IN_DURATION, Colors.WHITE, Colors.WHITE, 0, 1);
		}				
		
		public function fadeOut():void
		{
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, 1, 0);				
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}